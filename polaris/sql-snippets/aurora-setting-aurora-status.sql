

SELECT count(1)
     , sa.sample_processor
     , sa.aurora_status
  FROM analysis.sample_analysis sa
 GROUP BY sa.sample_processor, sa.aurora_status  
 ;

BEGIN;
UPDATE analysis.sample_analysis
   SET aurora_status = 'EvaluationParked'
 WHERE sample_processor = 'Beta'
   AND aurora_status NOT IN ('EvaluationParked', 'SystemCompleted')
;
COMMIT;
ROLLBACK;