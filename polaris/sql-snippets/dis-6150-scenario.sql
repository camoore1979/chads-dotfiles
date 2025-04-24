
-- Find duplicate sample analyses:
SELECT 
       count(1) AS "count"
     , concat(sa.lab_location, '-', sa.lab_number, ' ', sa.sample_processor) AS "same_sample"
     , sa.sample_data->>'sampleId' AS "sample_id"
--       sa.lab_location
--     , sa.lab_number
--     , sa.sample_processor
--     , sa.sample_data->>'sampleId' AS "sample_id" 
FROM analysis.sample_analysis sa
WHERE TRUE 
    AND sa.superseded_by IS NULL
--  AND sa.sample_processor = 'Aurora'
--  AND sa.created_at > '2024/05/01'
GROUP BY same_sample, "sample_id"
ORDER BY "count" DESC
LIMIT 500
;

-- query for testing inserts
INSERT INTO analysis.sample_analysis
(lab_location, lab_number, superseded_by, sample_processor, sample_status, created_at, updated_at, sample_severity, aurora_status, sample_data, rush_charge, assigned_to, is_virtual, is_reliability_testing)
VALUES('H', '999999', null, 'Aurora', 3, '2024-06-19 12:57:39.605', '2024-06-19 12:58:35.633', NULL, 'ReportingCompleted', '{"assetId": 269209, "fluidId": 59320, "sampleId": 26017465, "fluidAdded": 0, "componentId": 7982149, "dateSampled": "2024-06-11T04:00:00.000Z", "fluidTypeId": "17d9c310-9137-4ecb-84f4-539a1e8eeb79", "dateReceived": "2024-06-13T04:00:00.000Z", "fluidChanged": "NO", "fluidGradeId": 214, "accountNumber": "LUB06400270072", "componentTime": 76860, "filterChanged": "NO", "fluidAddedUnit": "GALLONS", "componentTypeId": 237, "componentModelId": 6537, "componentTimeUnit": "HOURS", "fluidManufacturerId": 469, "parentComponentTypeId": 237, "componentManufacturerId": 538, "hydraulicSystemPressure": 0, "visibleDebrisSeverityLevel": "N"}'::jsonb, 'N', NULL, false, false);

-- query to add sls record to match QA
INSERT INTO analysis.sample_launch_schedule
(created_at_end, created_at_start, fluid_type_ids, id, is_beta, lab_locations, launch_date, parent_component_type_ids)
VALUES(NULL, '2022-11-18 12:43:00.000', '{17d9c310-9137-4ecb-84f4-539a1e8eeb79}', 'fdc1af66-8c0a-42f9-b43a-df416b2102c2'::uuid, false, '{Z,H}', '2022-12-08 15:00:00.000', '{100,113,237,299,340,346,458,494,4003,4004,4005,100000,100001,100004}');

-- select all samples that were duped
SELECT 
       sa.id
     , sa.sample_data->>'sampleId' AS "sample_id" 
     , sa.lab_location
     , sa.lab_number
     , sa.superseded_by
     , sa.sample_processor
     , sa.sample_status
     , sa.created_at
     , sa.updated_at
     , sa.sample_severity
     , sa.aurora_status
     , sa.sample_data
--     , sa.sample_data->>'filterId' AS "filter_id"
     , sa.rush_charge
     , sa.assigned_to
     , sa.is_virtual
     , sa.is_reliability_testing
     , sa.sample_comment_block_id
     , sa.sample_date
     , sa.deleted_at
     , sa."version"
--     , sa.sample_analysis_history_sequence_number     
--     , sa.last_evaluated_by
--     , sa.last_reviewed_by
FROM analysis.sample_analysis sa
WHERE TRUE
        AND sa.sample_data->>'sampleId' IN ('25944898',
'25944897',
'25944815',
'25939914',
'26017465',
'26017467',
'26017463',
'26017469',
'26017470',
'26017471',
'26017456',
'26017468',
'26017462',
'25944817',
'26017475',
'26017474',
'26017466',
'26017458',
'26017461',
'26017457',
'26017472',
'26017455',
'26017477',
'26017473',
'26017476',
'26017464',
'25992721'
);