/*

Your company is planning to expand internationally very soon. You have been tasked with preparing a report 
on foreign markets and potential competitors.

After some investigation, you've created a database containing a foreignCompetitors table, which has the following 
structure:

competitor: the name of the competitor;
country: the country in which the competitor is operating.
In your report, you need to include the number of competitors per country and an additional row at the bottom that 
contains a summary: ("Total:", total_number_of_competitors)

Given the foreignCompetitors table, compose the resulting table with two columns: country and competitors. 
The first column should contain the country name, and the second column should contain the number of competitors in 
this country. The table should be sorted by the country names in ascending order. In addition, it should have an extra 
row at the bottom with the summary, as described above.

*/

CREATE PROCEDURE marketReport()
BEGIN

	(select country, count(country) as competitors 
    from foreignCompetitors
    group by country
    order by country)
    union all
    (select "Total:" as country,count(country) as competitors 
    from foreignCompetitors)
    order by case when country="Total:" THEN 1 ELSE 0 end, country;
    
END