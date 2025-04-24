-- Run Aurora Service in DEV and get SQL query from knex
SELECT "analysis"."sample_analysis".* FROM "analysis"."sample_analysis"
 WHERE (
  (
    aurora_status IN (
      'SampleDataReceived',
      'SampleChangeReceived',
      'SampleAnalysisCompleted',
      'AutoCommCompleted',
      'CommentProcessingCompleted',
      'EvaluationCompleted',
      'ReanalysisRequested',
      'ReanalysisPrepCompleted',
      'ReportingCompleted',
      'BaselineTemplateGenerated'
    )
  )
  OR
  (
    sample_processor = 'Aurora'
    AND
    aurora_status IN (
      'DataAnalystCompleted',
      'SystemCompleted'
    )
    AND
   (
     is_rush = true
     OR
     aurora_status_updated_at < now() - interval '1 hour'
   )
  )
) and "superseded_by" is NULL
ORDER BY sample_date ASC NULLS FIRST,
        (sample_data ->> 'componentTime')::NUMERIC ASC NULLS FIRST,
        (sample_data ->> 'sampleId')::NUMERIC ASC NULLS FIRST 
LIMIT 5;