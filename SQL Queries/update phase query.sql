update match_data set phase = 
case 
when ball <=10 then 1
when ball >10 and ball <=20 then 2
when ball > 20 and ball <=30 then 3
when ball >30 and ball <=40 then 4
when ball >40 then 5
end