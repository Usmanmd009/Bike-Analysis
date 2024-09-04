SELECT * FROM bike.bike_dataset;

-- What is the total number of female residents in North America whose income is greater than $10,000
select gender , count(*) Num_female_residents
from bike_dataset
where gender = "Female" and Region = "North America" and Income >  "$10,000";

-- Do clerical workers in pacific has more cars than professionals?
select * from (select Occupation,Region,count(cars) Num_Cars,
dense_rank() over (order by count(cars)desc) ranking
from bike_dataset
where  Region = "pacific"
 group by Occupation)subquery;

-- What is the total number of males in Europe. done
select gender ,count(*) num_males
from bike_dataset
where gender = "male" and Region = "Europe";

-- What is the total number of home owners in Europe. done
select Home_Owner ,count(*) num_home_Owners_in_Europe
from bike_dataset
where Home_Owner = "yes" and Region = "Europe";

-- Count the total number of male home owners in Europe that has bicycle and at least one car.
select gender, count(*) Num_male_home_owners
from bike_dataset 
where home_owner = "yes" and region = "Europe" 
and cars > 0  and Purchased_Bike = "yes" and gender = "Male"
group by gender;

-- Between car owners and bike owners, who cover the highest distance in pacific.
select cars,Purchased_Bike, sum(Commute_Distance)
from bike_dataset
where Region = "pacific"
group by cars , Purchased_Bike;

use bike;

-- Which region boast the highest number of cars owned by individuals over the age of 70.
select region, sum(cars) num_cars_Owners
from bike_dataset
where cars  > 0 and age > 70
group by region 
order by num_cars_Owners desc;

-- How many high school students in pacific has at least one car and a bicycle.
select Education, count(*)
from bike_dataset
where Education = "high school" and region = "pacific" 
and cars > 0 and Purchased_Bike = "yes";

 select region, sum(Commute_Distance) Total_miles
From bike_dataset
Where Cars > 0 AND Region = "Pacific"
group by region
order by sum(Commute_Distance);