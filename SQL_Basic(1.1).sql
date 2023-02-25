-- "kor" 국가 코드를 가진 도시 중 인구가 많은 순으로 정렬하는 쿼리
SELECT *
FROM city
WHERE countrycode = "kor"
ORDER BY population DESC;

-- 면적이 큰 순서대로 국가를 정렬하는 쿼리
SELECT *
FROM country
ORDER BY SurfaceArea DESC;

-- 도시를 인구가 많은 순으로 정렬하는 쿼리
SELECT *
FROM city
ORDER BY population DESC;

-- 각 국가별 평균 인구를 계산하는 쿼리
SELECT countrycode, AVG(population) AS "average"
FROM city
GROUP BY countrycode;

-- 모든 도시의 평균 인구를 계산하는 쿼리
SELECT AVG(population)
FROM city;

-- 각 국가별로 최대 인구가 8000000 이상인 경우만 선택하는 쿼리
SELECT countrycode, Name, MAX(population)
FROM city
GROUP BY countrycode, Name
HAVING MAX(population) > 8000000;

-- 국가별 도시 인구의 총합과 중간 합계를 구하는 쿼리
SELECT countrycode, Name, SUM(population)
FROM city
GROUP BY countrycode, Name WITH ROLLUP;

-- 각각의 쿼리에서 사용된 테이블은 다음과 같습니다.


--  1. city 테이블
--  2. country 테이블
--  3. city 테이블
--  4. city 테이블
--  5. city 테이블
--  6. city 테이블
--  7. city 테이블

