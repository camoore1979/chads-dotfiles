DROP FUNCTION generate_rule_template_name(uuid, uuid);

CREATE OR REPLACE FUNCTION generate_rule_template_name(rule_template_archetype_id uuid, rule_template_category_id uuid)
RETURNS varchar(255) AS $$
DECLARE
  rtc_name TEXT;
  rta_name TEXT;
  rta_limit_type TEXT;
  rta_locate_type TEXT;
  rtc_name_prefix TEXT;
  rta_limit_type_prefix TEXT;
  rta_locate_type_prefix TEXT;
  next_rule_template_sequence INTEGER;
BEGIN

  SELECT rta.locate_type INTO rta_locate_type
    FROM analysis.rule_template_archetype rta
   WHERE rta.id = rule_template_archetype_id;
 
  SELECT rta.limit_type INTO rta_limit_type
    FROM analysis.rule_template_archetype rta
   WHERE rta.id = rule_template_archetype_id;

  SELECT rtc.name INTO rtc_name
    FROM analysis.rule_template_category rtc
   WHERE rtc.id = rule_template_category_id;
 
  rtc_name_prefix := 
    CASE
      WHEN rtc_name = 'Customer' THEN 'C'
      WHEN rtc_name = 'POLARIS' THEN 'P'
      WHEN rtc_name = 'Manufacturer' THEN 'M'
    END;

  rta_limit_type_prefix := 
    CASE
      WHEN rta_limit_type = 'flagging' THEN 'F'
      WHEN rta_limit_type = 'flagging' THEN 'S'
    END;

  rta_locate_type_prefix := 
    CASE
      WHEN rta_locate_type = 'Baseline Reference' THEN 'BR'
      WHEN rta_locate_type = 'Component' THEN 'C'
      WHEN rta_locate_type = 'Component Type' THEN 'CT'
      WHEN rta_locate_type = 'Coolant' THEN 'COOL'
      WHEN rta_locate_type = 'Fuel' THEN 'FUEL'
      WHEN rta_locate_type = 'Parent Component Type' THEN 'PCT'
      WHEN rta_locate_type = 'Particle Count' THEN 'PC'
      WHEN rta_locate_type = 'Product' THEN 'P'
      WHEN rta_locate_type = 'Universal' THEN 'U'
      WHEN rta_locate_type = 'Viscosity' THEN 'V'
    END;
  
  next_rule_template_sequence := 
    CASE
      WHEN rta_locate_type = 'Baseline Reference' THEN (SELECT nextval('rule_template_name_baseline_reference_sequence'))
      WHEN rta_locate_type = 'Component' THEN (SELECT nextval('rule_template_name_component_sequence'))
      WHEN rta_locate_type = 'Component Type' THEN (SELECT nextval('rule_template_name_component_type_sequence'))
      WHEN rta_locate_type = 'Coolant' THEN (SELECT nextval('rule_template_name_coolant_sequence'))
      WHEN rta_locate_type = 'Fuel' THEN (SELECT nextval('rule_template_name_fuel_sequence'))
      WHEN rta_locate_type = 'Parent Component Type' THEN (SELECT nextval('rule_template_name_parent_component_type_sequence'))
      WHEN rta_locate_type = 'Particle Count' THEN (SELECT nextval('rule_template_name_particle_count_sequence'))
      WHEN rta_locate_type = 'Product' THEN (SELECT nextval('rule_template_name_product_sequence'))
      WHEN rta_locate_type = 'Universal' THEN (SELECT nextval('rule_template_name_universal_sequence'))
      WHEN rta_locate_type = 'Viscosity' THEN (SELECT nextval('rule_template_name_viscosity_sequence'))
    END;

  RETURN rtc_name_prefix || '-' || 
         rta_limit_type_prefix || '-' || 
         rta_locate_type_prefix || '-' || 
         CAST(next_rule_template_sequence AS TEXT);
END;
$$ LANGUAGE plpgsql;






SELECT nextval('foo_sequence');
SELECT generate_rule_template_name('8d0e0f2f-7a28-46fe-9e9e-fd808bd886f0', '489037d5-3553-4496-a698-f8b6e6721462');