--insert into players(id, name,country,isBatsman,isBowler)
select distinct null,striker,batting_team,1,0 
from odi_match_data2 
where batting_team not in ('Papua New Guinea',
'United Arab Emirates',
'United Arab Emirates',
'Oman',
'United States of America')
group by striker,batting_team having sum(runs_off_bat)>300 


--insert into players(id, name,country,isBatsman,isBowler)
select distinct null,bowler,bowling_team,0,1
from odi_match_data 
where bowling_team not in 
('Papua New Guinea',
'United Arab Emirates',
'United Arab Emirates',
'Oman',
'United States of America')
and wicket_type  is not null and wicket_type not in ('run out','retired hurt','hit wicket', 'obstructing the field')
group by bowler,bowling_team having count(wicket_type)>20

--update dupllicate records before removing
update players set isBatsman = 1, isBowler = 1 where name in(
select  name from players group by name having count(*)>1
)

--reseed identity 
--DELETE FROM SQLITE_-SEQUENCE WHERE NAME = 'players';

--delete duplicates
DELETE FROM players
 WHERE id NOT IN
(
  SELECT MIN(id) id
    FROM players
   GROUP BY name
)