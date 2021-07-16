-- 1)Find the players who have placed for World XI and have more than 150 games
select *
from `icc test statistics`
where player LIKE "%(ICC%"
AND Mat>150;


-- 2)Display the top runscorers of each country in descending order
select I.Runs, C.Country, C.Player AS GOAT
from `icc test statistics` I
LEFT JOIN countries C ON I.Player=C.Player
group by C.Country
order by I.Runs desc;


-- 3)Find the players with an average greater than 50 and who have less than 15 ducks and also high score less than 200 and have batted atleast 80 innings
select *
from `icc test statistics`
where Avg>50 and Ducks<15 and HS<200 AND Inn>80;


-- 4)Find all the indian players who started their careers in this century
select I.Player,I.Span,C.Country
FROM `icc test statistics` I
LEFT JOIN countries C ON I.Player=C.Player
WHERE Span LIKE '200%' AND C.Country='INDIA'
ORDER BY Span ASC;


-- 5)Find the players having conversion rate greater than 1 having played a minimum of 100 matches
select Player, Mat, Hundreds/Fifties as Conversion_rate
from `icc test statistics`
where Mat>100 and Hundreds/Fifties>1.0
order by Conversion_rate desc;


-- 6)Compare the runs and averages of the Indian and Pakistani players 90s onwards
select sum(runs) as Total_runs, avg(Avg) as Total_avg, Country
from `icc test statistics`
left join countries on `icc test statistics`.Player=countries.Player
WHERE Span like '199%' 
group by Country
having Country IN ('INDIA','PAK')



