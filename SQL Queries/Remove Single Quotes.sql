select name, replace(name,"'","") from players where name like '%''%'  or name like 'MP%'

update players set name=replace(name,"'","") where name like '%''%'

update match_data set striker=replace(striker,"'","") where striker like '%''%'

update match_data set non_striker=replace(non_striker,"'","") where non_striker like '%''%'

update match_data set bowler=replace(bowler,"'","") where bowler like '%''%'