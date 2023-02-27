show databases;
use world;

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

select *
from city 
join country on city.Countrycode = country.code -- 데이터베이스 내의 여러 테이블에서 가져온 레코드를 조합하여 하나의 테이블이나 결과 집합으로 표현
join countrylanguage on city.countrycode = countrylanguage.Countrycode; 

select length("asdasdwax"); -- 전달받은 문자열의 길이를 반환함

select concat("My", "sql op", "en source"),
concat("MySQL", NULL, "OpenSource"); -- 문자열을 합쳐줌, 하나라도 NULL 값이 있으면 NULL로 반환함.

select locate("abc", "abcabcabcabsabcabc"); -- 문자열 내에서 찾는 문자열이 처음으로 나타나는 위치를 찾아서 해당 위치를 반환

select left("MySQL is an open source relational database management system", 5), -- 문자열의 왼쪽부터 지정한 개수만큼의 문자를 반환
right("MySQL is an open source relational database management system", 5); -- 문자열의 오른쪽부터 지정한 개수만큼의 문자를 반환

select
lower("MySQL is an open source relational database management system"), -- 문자열의 문자를 모두 소문자로 변경
upper("MySQL is an open source relational database management system"); -- 문자열의 문자를 모두 대문자로 변경

select replace("MSSQL", "MS", "My"); -- 문자열에서 특정 문자열을 대체 문자열로 교체

select trim("               MySQL             "),
trim(leading "#" from "###MySQL###"),
trim(trailing "#" from "###MySQL###"); -- 문자열의 앞이나 뒤, 또는 양쪽 모두에 있는 특정 문자를 제거, trim() 함수에서 사용할 수 있는 지정자; 1. BOTH, 2. LEADING, 3. TRAILING

select format(123123123123.123123123, 3); -- 숫자 타입의 데이터를 세 자리마다 쉼표(,)를 사용하는 "#,###,###.##" 형식으로 변환, 반환되는 데이터의 형식은 문자열 타입, 두 번째 인수는 반올림할 소수 부분의 자릿수
select format(123123123123.123123123, 6);

select floor(10.95), ceil(10.95), round(10.95); -- floor(): 내림, ceil(): 올림, round(): 반올림 

select sqrt(4), pow(2, 3), exp(3), log(3); -- sqrt(): 양의 제곱근, pow(): 첫 번째 인수로는 밑수를 전달하고, 두 번째 인수로는 지수를 전달하여 거듭제곱 계산, exp(): 인수로 지수를 전달받아, e의 거듭제곱을 계산, log(): 자연로그 값을 계산 

select sin(pi()/2), cos(pi()), tan(pi()/4); -- sin(): 사인값 반환, 챈(): 코사인값 반환, tan(): 탄젠트 값 반환 , pi() 함수도 있음.

select abs(-3), rand(), round(rand() * 100, 0); -- abs(X): 절댓값을 반환, rand(): 0.0보다 크고 1.0보다 작은 하나의 실수를 무작위로 생성

select now(), -- now():현재 날짜와 시간을 반환, 반환되는 값은 "YYYY-MM-HH:MM:SS" 또는 YYYYMMDD 형태로 반환 
curdate(), -- curdate(): 현재 날짜를 반환, 이때 반환되는 값은 "YYYY-MM-DD" 또는 YYYYMMDD 형태로 반환 
curtime(); -- curtime(): 현재 시각을 반환, 이때 반환되는 값은 "HH:MM:SS" 또는 HHMMSS 형태로 반환 

select now(),
date(now()), -- 전달받은 값에 해당하는 날짜 정보를 반환 
month(now()), -- 월에 해당하는 값을 반환하며 0부터 12 사이의 값을 가짐 
day(now()), -- 일에 해당하는 값을 반환하며, 0부터 31 사이의 값을 가짐
hour(now()), -- 시간에 해당하는 값을 반환하며, 0부터 23 사이의 값을 가짐
minute(now()), -- 분에 해당하는 값을 반환하며, 0부터 59 사이의 값을 가짐
second(now()); -- 초에 해당하는 값을 반환하며, 0부터 59 사이의 값을 가짐

select now(),
monthname(now()), -- 월에 해당하는 이름을 반환
dayname(now()); -- 요일에 해당하는 이름을 반환

select now(), 
dayofweek(now()), -- 일자가 해당 주에서 몇 번째 날인지를 반환, 1부터 7 사이의 값을 반환(일요일=1, 토요일=7)
dayofmonth(now()), -- 일자가 해당 월에서 몇 번째 날인지를 반환, 0부터 31 사이의 값을 반환, 0부터 31 사이의 값을 반환 
dayofyear(now()); -- 일자가 해당 연도에서 몇 번째 날인지를 반환, 1부터 366 사이의 값을 반환

select
date_format(now(), "%D %y %a %d %m %n %j"); -- 전달받은 형식에 맞춰 날짜와 시간 정보를 문자열로 반환 

