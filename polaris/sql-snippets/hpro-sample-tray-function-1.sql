DO $$
DECLARE
  _contents JSONB;
  _lab_code TEXT;
  _lab_number TEXT;
  _sample RECORD;
  _sample_sample_tray_id UUID;
  _sample_tray_contents JSONB;
  _result TEXT; -- temp for testing
BEGIN
  SELECT datereceived, labnumber, status INTO _sample FROM assetmgmt.sample 
    WHERE id = 3456844 -- NEW.sample_id
  ;

  IF _sample.status IN ('COMPLETE', 'LOGGED_FRUSTRATED') THEN
    _result = 'NULL (status)' -- RETURN NULL
  ;
  END IF;

  _lab_code = SUBSTRING(_sample.labnumber FROM 1 FOR 1);
  _lab_number = SUBSTRING(_sample.labnumber FROM 3 FOR 6);

-- TODO: Check sample lab number to see if valid/proper, if not, do nothing
  -- i.e. NOT a virtual sample, on-hold, archived/rolled-over sample...      
  -- first, the lab number must be six digits (fully numeric, no alpha characters)
  IF SUBSTRING(_sample.labnumber FROM 3 FOR 6) !~ '^\d{6}$' THEN
    _result = 'NULL (labnumber)'; -- RETURN NULL
  END IF;
  -- second, the lab code should not be a 'C' (virtual lab code)
  IF SUBSTRING(_sample.labnumber FROM 1 FOR 1) = 'C' THEN
    _result = 'NULL (labcode)'; -- RETURN NULL
  END IF;

  -- TODO: search for any sample_tray_file records where the lab number is in the contents JSONB array,
  --       limit search on sample_tray_file with a CTE where stf.created_at >= (_sample.datereceived - 7)
  SELECT stf.id stf_id, * 
      FROM assetmgmt.sample_tray_file stf,
        jsonb_array_elements(stf.contents->'sampleTraySamples') sample_tray_samples
      WHERE TRUE
        AND sample_tray_samples->>'labCode' = _lab_code
        AND sample_tray_samples->>'labNumber' = _lab_number;

  -- TODO: now verify the sample_sample_tray table includes a relation for each sample_tray_id from the list of sample_tray_file
  --       records relating to the _sample.id in question.


  -- TODO: if a sample_sample_tray record is missing for a particular sample_tray_id and sample_id, create that relationship


  -- TODO: if inserting sample_sample_tray records was necessary, raise notice for each inserted record with sample id / sample tray id.
  RAISE NOTICE 'The sample is: %', _sample;
  RAISE NOTICE 'The lab_code is: %', _lab_code;
  RAISE NOTICE 'The lab_number is: %', _lab_number;
  RAISE NOTICE 'The sample_status is: %', _sample.status;
  RAISE NOTICE 'The result is: %', _result;
END $$;