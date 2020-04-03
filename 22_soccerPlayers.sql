/*

You have a table soccer_team that contains information about the players in your favorite soccer team. 
This table has the following structure:

id: the unique ID of the player;
first_name: the first name of the player;
surname: the last name of the player;
player_number: the number that the player wears (the number is guaranteed to be unique).
Create a semicolon-separated list of all the players, sorted by their numbers, and put this list in a
table under a column called players. The information about each player should have the following format: 
first_name surname #number.

*/

SELECT group_concat(conncat separator "; ") as players 
from soccer_team
inner join
(select player_number, concat(first_name," ",surname," ","#",player_number) as conncat
from soccer_team
ORDER BY player_number asc) as pl
on soccer_team.player_number = pl.player_number;
   
END