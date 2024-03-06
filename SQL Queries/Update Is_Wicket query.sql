update odi_match_data2 set Is_Wicket = 0 where wicket_type is null;

update odi_match_data2 set Is_Wicket= 1 where wicket_type is not null;