--insert into players
select distinct null,striker,batting_team,0,1 
from odi_match_data 
where batting_team not in ('Papua New Guinea',
'United Arab Emirates',
'United Arab Emirates',
'Oman',
'United States of America')
group by striker,batting_team having sum(runs_off_bat)>500 

--insert into players
select distinct null,bowler,bowling_team,1,0
from odi_match_data 
where bowling_team not in 
('Papua New Guinea',
'United Arab Emirates',
'United Arab Emirates',
'Oman',
'United States of America')
and wicket_type  is not null and wicket_type not in ('run out','retired hurt','hit wicket', 'obstructing the field')
group by bowler,bowling_team having count(wicket_type)>25 

--select distinct wicket_type from odi_match_data