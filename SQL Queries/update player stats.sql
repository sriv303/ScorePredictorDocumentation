

--sets number of runs scored per ball for batsmnen

update players set runsScoredPerBall = 
(
select round(cast(sum(runs_off_bat) as real) /count(1), 4) from match_data where striker=players.name
)


--sets number of dismissed per ball for batsmen


update players set dismissedPerBall =
(select dsp from 
	(
	select a.striker, b.player_dismissed, round(cast(b.timesDismissed as real)/cast(a.ballsfaced as real),4) as dsp
	FROM
	(select striker,count(1) ballsfaced from  match_data group by striker ) as a 
	inner join 
	(select player_dismissed,count(1) timesDismissed from  match_data group by player_dismissed) as b on a.striker = b.player_dismissed
	) as 
src where  src.striker= players.name)


--sets number of wickets per ball for bowlers

update players set wicketsPerBall = 
(
select wicketsPerBall FROM
(
	select match_data.bowler as bwlr, round(cast(sum(is_wicket) as real)/cast(totalballs.ballsbowled as real), 4) as wicketsPerBall  from match_data 
	inner join 
	(select bowler, count(1) as ballsbowled from match_data group by bowler ) as totalballs on totalballs.bowler = match_data.bowler where wicket_type not in ('retired hurt', 'run out') group by match_data.bowler
) as wkts where players.name= wkts.bwlr)



--sets number of runs conceded per ball for bowlers

update players set runsConcededPerBall = 
(
select round(cast(sum(runs_off_bat) as real) /count(1), 4) from match_data where bowler=players.name
)