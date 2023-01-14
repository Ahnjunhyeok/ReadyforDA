select *
From city
where countrycode = "kor"
order by population desc;

select * 
From country
order by SurfaceArea desc;

select *
from city
order by population desc;

select countrycode, avg(population) as "average" --  집계함수를 함께 사용
from city
group by countrycode; -- 그룹으로 묶어주는 역할

select avg(population)
from city;

select countrycode, max(population)
from city
group by countrycode
having max(population) > 8000000; -- having 절은 반드시 group by 절 다음에 나와야 함

select countrycode, Name, sum(population)
from city
group by countrycode, name with rollup; -- 총합 또는 중간합계가 필요할 경우 사용, group by 절과 함께 with rollup문 사용