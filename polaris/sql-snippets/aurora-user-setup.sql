SELECT *
  FROM analysis."user" u
;

SELECT u.id AS "user_id"
     , u.email
     , u.hpro_auth_id
     , u.active
     , up.permission_level
     , pct.code AS "parent_component_type_code"
     , up.id AS "user_permission_id"
  FROM analysis."user_permission" up
  JOIN analysis."user" u
    ON u.id = up.user_id 
  JOIN analysis.parent_component_type pct
    ON pct.id = up.parent_component_type_id 
 WHERE u.email = 'cmoore@polarislabs.com'
 ;

INSERT INTO analysis."user"
(email, hpro_auth_id)
VALUES('cmoore@polarislabs.com', 51);

SELECT * FROM analysis.parent_component_type pct; 


DROP TABLE public.temp_user_perms;
CREATE TABLE public.temp_user_perms (
  parent_component_type_id uuid,
  permission_level text NULL,
  user_id uuid
);
INSERT INTO public.temp_user_perms
  SELECT id AS parent_component_type_id
    FROM analysis.parent_component_type 
;
SELECT * FROM public.temp_user_perms;
UPDATE public.temp_user_perms
   SET permission_level = '4',
       user_id = (SELECT id FROM analysis."user" WHERE email = 'cmoore@polarislabs.com')
;

-- analysis.user_permission foreign keys
ALTER TABLE analysis.user_permission ADD CONSTRAINT user_permission_foreign_user_id FOREIGN KEY (user_id) REFERENCES analysis."user"(id);
ALTER TABLE analysis.user_permission ADD CONSTRAINT userpermission_componenttypeparentid_foreign FOREIGN KEY (parent_component_type_id) REFERENCES analysis.parent_component_type(id);

INSERT INTO analysis.user_permission
(parent_component_type_id, permission_level, user_id)
SELECT parent_component_type_id, permission_level, user_id FROM public.temp_user_perms
;