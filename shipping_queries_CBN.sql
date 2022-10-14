USE shipping;

#1. List the ship name, captain name, and crew number for all ships
#sorted by crew number in descending order.
SELECT shipName, captName, crew
FROM ship
ORDER BY crew DESC;

#2. List all ships with a home port of Orange
SELECT shipName
FROM ship
WHERE portName = 'Orange';

#3. List the average displacement of ships grouped by the year they were built
#(Aggregate query with grouping)
SELECT builtYear, AVG(displacement) AS average
FROM ship
GROUP BY builtYear
ORDER BY builtYear;

#4. List the container ID and weight of containers on the ship
#captained by Thomas Graham
#(Subquery)
SELECT containerID, weight
FROM container
WHERE shipName = (SELECT shipName
FROM ship
WHERE captName = 'Thomas Graham');

#5. List the volume of the containers on the ship named Kate
#(Calculating the volume of a container or a group of containers)
SELECT containerID, length, height, width, length*height*width AS volume
FROM container
WHERE shipName = 'Kate';

#6. List the names of captains with ships that have a home port in Belgium
#(Multi-table JOIN 1)
SELECT captName
FROM ship s, port p
WHERE (s.portName, s.city) = (p.portName, p.city) AND country = 'Belgium';

#7. List the total number of crew members on ships that 
#have a home port in the United States
#(Multi-table JOIN 2)
SELECT SUM(crew)
FROM ship s, port p
WHERE (s.portName, s.city) = (p.portName, p.city) AND country = 'United States';

#8. List the average weight of containers on ships with home ports in Shanghai
#(Multi-table JOIN 3)
SELECT AVG(weight)
FROM container c, ship s
WHERE c.shipName = s.shipName AND city = 'Shanghai';

#9. List all containers on a ship built before 2020
#(Multi-table JOIN 4)
SELECT containerID, c.shipName, builtYear
FROM container c, ship s
WHERE c.shipName = s.shipName AND builtYear < 2020;

#10. List the number of containers in China
#(Multi-table JOIN 5)
SELECT COUNT(containerID) AS count
FROM container c, ship s, port p
WHERE c.shipName = s.shipName AND (s.portName, s.city) = (p.portName, p.city) AND country = 'China';
