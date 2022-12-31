CREATE EXTENSION postgis;
CREATE EXTENSION postgis_topology;

CREATE TABLE USC_COORDINATES(name varchar,geom geometry);

INSERT INTO USC_COORDINATES VALUES ('Parkside Dining', 'POINT(-118.29096983397301 34.019397183231604)'),
       ('Mc Kays', 'POINT(-118.28111398315038 34.01963969050971)'),
       ('Taco Bell', 'POINT(-118.29184754657533 34.022239206993085)'),
       ('Prentiss Fountain', 'POINT(-118.2852122751279 34.02021438996374)'),
       ('Leavey Pool', 'POINT(-118.28288277325902 34.02141548130285)'),
       ('Founders Fountain', 'POINT(-118.28386854740893 34.022550302325136)'),
       ('Wilson library', 'POINT(-118.2859943 34.02373)'),
       ('Hoose library', 'POINT(-118.28662211019558 34.0186749830308)'),
       ('Gaughan T library', 'POINT(-118.28257745542992 34.01875100402558)'),
       ('Watt way entrance', 'POINT(-118.28537233673038 34.02410138831853)'),
       ('McCarthy Way entrance', 'POINT(-118.28110998708495 34.02048749203505)'),
       ('McClintock Ave entrance', 'POINT(-118.28713229421383 34.02494373601582)'),
       ('Home', 'POINT(-118.279506 34.0280564)');

SELECT name, ST_AsText(geom) FROM USC_COORDINATES;

SELECT ST_AsText(ST_ConvexHull(ST_Collect(geom))) FROM USC_COORDINATES;

SELECT name, ST_Astext(geom) as location, ST_Distance(geom, 'POINT(-118.279506 34.0280564)') as distance
FROM USC_COORDINATES
WHERE name!='Home'
ORDER BY ST_Distance(geom, 'POINT(-118.279506 34.0280564)')
LIMIT 4;