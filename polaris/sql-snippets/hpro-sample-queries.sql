
SELECT *
  FROM assetmgmt.sample_sample_tray sst 
 WHERE sst.id IN ('7946e3b4-4247-40e0-87dd-dd7dbc33db1d', '1d88994d-b756-4512-8281-b6efe4c7763e')
;

SELECT count(1),
       s.rushCharge
  FROM assetmgmt.sample s
 GROUP BY s.rushCharge
;


DELETE FROM assetmgmt.sample_sample_tray
 WHERE id IN (
   SELECT sst.id
     FROM assetmgmt.sample_sample_tray sst 
     JOIN assetmgmt.sample s
       ON s.id = sst.sample_id
    WHERE TRUE
      AND s.labnumber = 'B-231654'
);

SELECT sst.*
  FROM assetmgmt.sample_sample_tray sst 
  JOIN assetmgmt.sample s
    ON s.id = sst.sample_id
 WHERE TRUE
    AND s.labnumber = 'B-231654'
;

SELECT *
FROM assetmgmt.sample_tray_file stf
WHERE stf.contents->'sampleTraySamples' @> '[{"labCode": "B", "labNumber": "231654"}]';

SELECT 
        st.id AS "Sample Tray ID"
      , stf.id AS "Sample Tray File ID"
      , stf.created_at AS "Created At"
      , substring(stf.contents->>'dateReceived' FROM 0 FOR 11) AS "Date Samples Received"
      , st.location_code AS "Location"
      , st.tray_number 
      , st.tray_type
      , stf."type"
      , st.tray_color AS "Color"
      , stf.file_name   AS "File Name"
      , stf.request_number AS "Request No."
      , CASE WHEN stf.contents->>'rushFlag' IS NULL THEN ''
             ELSE stf.contents->>'rushFlag'
        END AS "Rush"
      , st.file_output_name
      , stf.contents AS "Contents"
  FROM assetmgmt.sample_tray st 
  JOIN assetmgmt.sample_tray_file stf 
    ON stf.sample_tray_id = st.id 
  LEFT JOIN assetmgmt.sample_sample_tray sst 
    ON sst.sample_tray_id = st.id
  LEFT JOIN assetmgmt.sample s
    ON s.id = sst.sample_id
 WHERE TRUE
   AND stf.id IN ('5f7267f2-a4f9-4c1e-bd8c-b5f22670747b', '4e0e3530-ace6-4ca6-af48-42797489e55a')
--   AND stf.file_name = 'B231654WA20250314.csv'
--   AND s.id = 26665286
--    AND s.labnumber = 'B-231654'
--    AND s.labnumber = 'I-624732'
 ORDER BY stf.created_at ASC
 LIMIT 100
;

-- Query to find all sst records with dupes of sample_id+sample_tray_id
 SELECT sample_id, sst.sample_tray_id , count(*)
  FROM assetmgmt.sample_sample_tray sst
  GROUP BY sample_id, sst.sample_tray_id
  HAVING COUNT(*) > 1;

-- Query to find all sample records with dupes on sst. sample_id+sample_tray_id
WITH dupe_sample_sample_tray_recs AS (
  SELECT sample_id, sst.sample_tray_id , count(*)
  FROM assetmgmt.sample_sample_tray sst
  GROUP BY sample_id, sst.sample_tray_id
  HAVING COUNT(*) > 1
)
SELECT 
       s.id
     , s.labnumber
     , s.datereceived
  FROM assetmgmt.sample s
  JOIN dupe_sample_sample_tray_recs dsstr
    ON dsstr.sample_id = s.id
 ORDER BY s.datereceived DESC
;


