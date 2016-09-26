-- Recreate hospitals table

DROP TABLE hospitals;
CREATE EXTERNAL TABLE hospitals
(
	provider_id string,
	hospital_name string,
	address string,
	city string,
	state string,
	zip_code string,
	county_name string,
	phone_number string,
	hospital_type string,
	hospital_owner string,
	emergency_services boolean
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES(
	"separatorChar" = ",",
	"quoteChar" = '"',
	"escapeChar" =  '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/hospitals';

-- Recreate effective_care table

DROP TABLE effective_care;
CREATE EXTERNAL TABLE effective_care
(
	provider_id string,
        hospital_name string,
        address string,
        city string,
        state string,
        zip_code string,
        county_name string,
        phone_number string,
	condition string,
	measure_id string,
	measure_name string,
	score int,
	sample int,
	footnote string,
	measure_start date,
	measure_end date
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES(
        "separatorChar" = ",",
        "quoteChar" = '"',
        "escapeChar" =  '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/effective_care';


-- Recreate readmissions table

DROP TABLE readmissions;
CREATE EXTERNAL TABLE readmissions
(
	provider_id string,
        hospital_name string,
        address string,
        city string,
        state string,
        zip_code string,
        county_name string,
        phone_number string,
	measure_name string,
	measure_id string,
	comp_to_national string,
	denominator int,
	score int,
	lower_est int,
	higher_est int,
	footnote string,
	measure_start date,
	measure_end date
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES(
        "separatorChar" = ",",
        "quoteChar" = '"',
        "escapeChar" =  '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/readmissions';

-- Recreate measures  table

DROP TABLE measures;
CREATE EXTERNAL TABLE measures
(
	measure_name string,
	measure_id string,
	measure_start_quart string,
	measure_start date,
	measure_end_quart string,
	measure_end date
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES(
        "separatorChar" = ",",
        "quoteChar" = '"',
        "escapeChar" =  '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/measures';

-- Recreate survey_responses table

DROP TABLE survey_responses;
CREATE EXTERNAL TABLE survey_responses
(
	provider_id string,
        hospital_name string,
        address string,
        city string,
        state string,
        zip_code string,
        county_name string,
	nurse_achieve_pts int,
	nurse_improve_pts int,
	nurse_dimen_score int,
	doc_achieve_pts int,
	doc_improve_pts int,
	doc_dimen_score int,
	staff_achieve_pts int,
	staff_improve_pts int,
	staff_dimen_score int,
	pain_achieve_pts int,
	pain_improve_pts int,
	pain_dimen_score int,
	med_achieve_pts int,
	med_improve_pts int,
	med_dimen_score int,
	clean_quiet_achieve_pts int,
	clean_quiet_improve_pts int,
	clean_quiet_dimen_score int,
	discharge_achieve_pts int,
	discharge_improve_pts int,
	discharge_dimen_score int,
	overall_achieve_pts int,
	overall_improve_pts int,
	overall_dimen_score int,
	hcahps_base_score int,
	hcahps_consist_score int
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES(
        "separatorChar" = ",",
        "quoteChar" = '"',
        "escapeChar" =  '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/survey_responses';

