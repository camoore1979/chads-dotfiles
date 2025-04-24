
ALTER TABLE assetmgmt.sample DISABLE TRIGGER aud_sample_trig;
ALTER TABLE assetmgmt.sample DISABLE TRIGGER countrows;
ALTER TABLE assetmgmt.sample DISABLE TRIGGER version_trigger;

ALTER TABLE assetmgmt.sample ENABLE TRIGGER aud_sample_trig;
ALTER TABLE assetmgmt.sample ENABLE TRIGGER countrows;
ALTER TABLE assetmgmt.sample ENABLE TRIGGER version_trigger;

--EXPLAIN ANALYZE
UPDATE assetmgmt.sample
   SET testpricecurrencycode = j.currencycode, 
       testprice = j.price
  FROM assetmgmt.sample s
  JOIN assetmgmt.jarlabel j 
    ON s.jarlabelid = j.id
 WHERE j.type = 'PRE_PAID'
   AND s.datecompleted >= '2023-01-01'
   AND (
      s.testpricecurrencycode IS NULL
      OR s.testprice IS NULL
    );

WITH filtered_samples AS (
  SELECT s.id AS sample_id,
         j."type" AS jarlabel_type,
         j.price AS jarlabel_price,
         j.currencycode AS jarlabel_currencycode
    FROM assetmgmt.sample s 
    JOIN assetmgmt.jarlabel j
      ON j.id = s.jarlabelid
   WHERE s.datecompleted >= '2023-01-01'
     AND (s.testpricecurrencycode IS NULL OR s.testprice IS NULL)
)
UPDATE assetmgmt.sample
   SET testpricecurrencycode = filtered_samples.jarlabel_currencycode, 
       testprice = filtered_samples.jarlabel_price
  FROM filtered_samples     
 WHERE id = filtered_samples.sample_id
   AND filtered_samples.jarlabel_type = 'PRE_PAID'
;

-- 6,184
WITH filtered_samples AS (
  SELECT s.id AS sample_id,
         j."type" AS jarlabel_type,
         j.price AS jarlabel_price,
         j.currencycode AS jarlabel_currencycode
    FROM assetmgmt.sample s 
    JOIN assetmgmt.jarlabel j
      ON j.id = s.jarlabelid
   WHERE s.datecompleted >= '2023-01-01'
     AND s.billed = false
)
UPDATE assetmgmt.sample
   SET billed = true
  FROM filtered_samples     
 WHERE id = filtered_samples.sample_id
;
  
-- ANALYSIS of the SELECT BASIC for the UPDATE
EXPLAIN  
SELECT s.*
  FROM assetmgmt.sample s
  JOIN assetmgmt.jarlabel j 
    ON s.jarlabelid = j.id 
 where j.type = 'PRE_PAID'
   and s.datecompleted >= '2023-01-01'
   and (s.testpricecurrencycode is null or s.testprice is null);

 
SELECT count(1)
  FROM assetmgmt.sample s
  JOIN assetmgmt.jarlabel j 
    ON s.jarlabelid = j.id 
 where j.type = 'PRE_PAID'
   and s.datecompleted >= '2023-01-01'
   and (s.testpricecurrencycode is null or s.testprice is null);

 
-- ALTERNATE APPROACH - SAME ANALYSIS RESULTS   
EXPLAIN ANALYZE 
WITH filtered_samples AS (
  SELECT s.id AS sample_id,
         j."type" AS jarlabel_type
    FROM assetmgmt.sample s 
    JOIN assetmgmt.jarlabel j
      ON j.id = s.jarlabelid
   WHERE s.datecompleted >= '2023-01-01'
     AND (s.testpricecurrencycode IS NULL OR s.testprice IS NULL)
)
SELECT *
  FROM filtered_samples
;

WITH filtered_samples AS (
  SELECT s.id AS sample_id,
         j."type" AS jarlabel_type,
         j.price AS jarlabel_price,
         j.currencycode AS jarlabel_currencycode,
         s.testprice,
         s.testpricecurrencycode
    FROM assetmgmt.sample s 
    JOIN assetmgmt.jarlabel j
      ON j.id = s.jarlabelid
   WHERE s.datecompleted >= '2023-01-01'
     AND (s.testpricecurrencycode IS NULL OR s.testprice IS NULL)
)
SELECT 
       *
  FROM filtered_samples
 WHERE jarlabel_type = 'PRE_PAID'
;


WITH filtered_samples AS (
  SELECT s.id AS sample_id,
         j."type" AS jarlabel_type,
         j.price AS jarlabel_price,
         j.currencycode AS jarlabel_currencycode
    FROM assetmgmt.sample s 
    JOIN assetmgmt.jarlabel j
      ON j.id = s.jarlabelid
   WHERE s.datecompleted >= '2023-01-01'
     AND s.billed = false
)
SELECT count(1) 
  FROM filtered_samples
;

-- SUBQUERY ANALYSIS
SET enable_seqscan = on;
EXPLAIN ANALYZE SELECT id,
         jarlabelid,
         testpricecurrencycode,
         testprice
    FROM assetmgmt.sample s 
   WHERE s.datecompleted >= '2023-01-01';
   
 