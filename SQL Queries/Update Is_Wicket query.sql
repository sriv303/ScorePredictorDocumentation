
alter table odi_match_data2
add column is_wicket integer;


update match_data set Is_Wicket = 0 where wicket_type is null;

update match_data set Is_Wicket= 1 where wicket_type is not null;