SELECT "analysis"."sample_analysis".* FROM "analysis"."sample_analysis"
 WHERE id IN (
  WITH possible_statuses AS (
   SELECT * FROM analysis.sample_analysis sa
    WHERE aurora_status IN ('SampleDataReceived',
      'SampleChangeReceived',
      'SampleAnalysisCompleted',
      'AutoCommCompleted',
      'CommentProcessingCompleted',
      'EvaluationCompleted',
      'ReanalysisRequested',
      'ReanalysisPrepCompleted',
      'ReportingCompleted',
      'BaselineTemplateGenerated',
      'DataAnalystCompleted',
      'SystemCompleted'
    ) and superseded_by IS NULL
         ), without_delay AS ( 
    SELECT * FROM possible_statuses 
    WHERE aurora_status IN ('SampleDataReceived',
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
         ), possible_delay AS (
    SELECT * FROM possible_statuses 
    WHERE sample_processor = 'Aurora'
      AND aurora_status IN ('DataAnalystCompleted', 'SystemCompleted')
      AND (is_rush = true OR aurora_status_updated_at < now() - interval '1 hour')
         ), combined AS (
         SELECT * FROM without_delay
         UNION
         SELECT * FROM possible_delay
         )
         SELECT id FROM combined
       ) 
  AND "superseded_by" is NULL
ORDER BY sample_date ASC NULLS FIRST,
        (sample_data ->> 'componentTime')::NUMERIC ASC NULLS FIRST,
        (sample_data ->> 'sampleId')::NUMERIC ASC NULLS FIRST
LIMIT 5;