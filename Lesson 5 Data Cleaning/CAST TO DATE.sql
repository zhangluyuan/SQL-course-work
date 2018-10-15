1. write a query to change the date mm/dd/year into correct SQL date format,
year-mm-dd. You will need to use at least substr and concat to perform this operation

SELECT date orig_date,
      (SUBSTR(date, 7, 4) || '-' || LEFT(date, 2) || '-' || SUBSTR(date, 4, 2)) new_date
FROM sf_crime_data;

2. then use cast or :: to convert this to date

SELECT date orig_date,
      (SUBSTR(date, 7, 4) || '-' || LEFT(date, 2) || '-' || SUBSTR(date, 4, 2))::DATE new_date
FROM sf_crime_data;
