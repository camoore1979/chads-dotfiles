DROP SCHEMA audit_assetmgmt CASCADE;
DROP SCHEMA audit_reference CASCADE;
DROP SCHEMA assetmgmt CASCADE;
DROP SCHEMA reference CASCADE;
DROP SCHEMA labreference CASCADE;
DROP SCHEMA pricelist CASCADE;
DROP SCHEMA reporting CASCADE;
DROP SCHEMA data_tools CASCADE;
DROP SCHEMA reports CASCADE;


DROP SCHEMA lims CASCADE;
DROP SCHEMA logging CASCADE;
DROP SCHEMA quoting CASCADE;
DROP SCHEMA service CASCADE;
DROP SCHEMA shipping CASCADE;

DO $$
DECLARE
    r RECORD;
BEGIN
    FOR r IN
        SELECT tablename
        FROM pg_tables
        WHERE schemaname = 'public'
          AND tablename NOT IN ('knex_migrations', 'knex_migrations_lock')
    LOOP
        EXECUTE format('DROP TABLE IF EXISTS %I.%I CASCADE;', 'public', r.tablename);
    END LOOP;
END $$;


-- List all tables in given schema
SELECT string_agg(schemaname || '.' || tablename, ', ')
  FROM pg_tables
  WHERE schemaname = 'assetmgmt'
;

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname = 'aurora' AND pid <> pg_backend_pid();
COMMIT;

-- 
ALTER DATABASE aurora RENAME TO enterprise;
COMMIT;


SELECT * FROM public.knex_migrations;
SELECT * FROM public.knex_migrations_lock;

-- clear out knex_migrations table
TRUNCATE TABLE public.knex_migrations RESTART IDENTITY;
COMMIT;

DELETE FROM public.knex_migrations_lock kml WHERE kml.index <> 0;
COMMIT;

-- insert new rows into knex_migrations table to match new contents of database/migrations/ folder
INSERT INTO public.knex_migrations (name, batch, migration_time)
VALUES
  ('20250220000100_create-extensions.ts', 1, NOW()),
  ('20250220000200_create-db-structure.ts', 1, NOW()),
  ('20250220000350_account-mask-constraint-to-support-rule-applies-to-changes.ts', 1, NOW()),
  ('20250220000400_constraint-rule-template-versions-prevent-overlap.ts', 1, NOW()),
  ('20250220000500_populate-comment-rules.ts', 1, NOW());

