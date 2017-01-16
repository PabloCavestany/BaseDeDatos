-- select CountryCode, Language from countrylanguage where
--	Language = 'Swedish' order by 1 desc;

-- select Name from city order by 1 limit 10;

-- select CountryCode, Language from countrylanguage where Language='Chinese' order by 1 desc limit 2;

select * from country where GNP > GNPold order by Name limit 3\G

