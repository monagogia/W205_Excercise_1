#! /bin/bash

wget -O Hospital_Revised_Flatfiles.zip "https://data.medicare.gov/views/bg9k-emty/files/Nqcy71p9Ss2RSBWDmP77H1DQXcyacr2khotGbDHHW_s?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip"

unzip -p ./Hospital_Revised_Flatfiles.zip  Hospital\ General\ Information.csv > temp_hospitals.csv
unzip -p ./Hospital_Revised_Flatfiles.zip  Timely\ and\ Effective\ Care\ -\ Hospital.csv > temp_effective_care.csv
unzip -p ./Hospital_Revised_Flatfiles.zip  Readmissions\ and\ Deaths\ -\ Hospital.csv > temp_readmissions.csv
unzip -p ./Hospital_Revised_Flatfiles.zip  Measure\ Dates.csv > temp_Measures.csv
unzip -p ./Hospital_Revised_Flatfiles.zip  hvbp_hcahps_05_28_2015.csv > temp_surveys_responses.csv

tail -n+2 temp_hospitals.csv > hospitals.csv
tail -n+2 temp_effective_care.csv > effective_care.csv
tail -n+2 temp_readmissions.csv > readmissions.csv
tail -n+2 temp_Measures.csv > Measures.csv
tail -n+2 temp_surveys_responses.csv > surveys_responses.csv

rm temp*.csv

#Create root folder hospital_compare

hdfs dfs -mkdir /user/w205/hospital_compare

#Create folders for each of the data files. It will be easier to run the ddl statement/

hdfs dfs -mkdir /user/w205/hospital_compare/hospitals
hdfs dfs -mkdir /user/w205/hospital_compare/effective_care
hdfs dfs -mkdir /user/w205/hospital_compare/readmissions
hdfs dfs -mkdir /user/w205/hospital_compare/measures
hdfs dfs -mkdir /user/w205/hospital_compare/survey_responses

#Copy the csv files in HDFS

hdfs dfs -put hospitals.csv /user/w205/hospital_compare/hospitals
hdfs dfs -put effective_care.csv /user/w205/hospital_compare/effective_care
hdfs dfs -put readmissions.csv /user/w205/hospital_compare/readmissions
hdfs dfs -put Measures.csv /user/w205/hospital_compare/measures
hdfs dfs -put surveys_responses.csv /user/w205/hospital_compare/survey_responses



