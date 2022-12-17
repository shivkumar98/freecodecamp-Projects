CREATE DATABASE first_database;
CREATE DATABASE second_database;
        
/* I connected to the second database:
  
        \c second_database;
*/
ALTER TABLE second_table ADD COLUMN first_column INT;
ALTER TABLE second_table ADD COLUMN id INT;

/*
- Displaying the second table:

        Table "public.second_table"
        +--------------+---------+-----------+----------+---------+
        |    Column    |  Type   | Collation | Nullable | Default |
        +--------------+---------+-----------+----------+---------+
        | first_column | integer |           |          |         |
        | id           | integer |           |          |         |
        +--------------+---------+-----------+----------+---------+
*/

-- I dropped the first_column:

ALTER TABLE second_table DROP COLUMN first_column;

-- VARCHAR is used to declare a type of string with a max length specified

-- I added a new column called name:

ALTER TABLE second_table ADD COLUMN name VARCHAR(30);

/* I displayed the table:
        
        Table "public.second_table"
        +--------+-----------------------+-----------+----------+---------+
        | Column |         Type          | Collation | Nullable | Default |
        +--------+-----------------------+-----------+----------+---------+
        | id     | integer               |           |          |         |
        | name   | character varying(30) |           |          |         |
        +--------+-----------------------+-----------+----------+---------+
*/

-- The column name was renamed:

ALTER TABLE second_table RENAME COLUMN name TO username;

-- Inserted row into second table:#

INSERT INTO second_table(id,username) VALUES (1,'Samus');

SELECT * FROM second_table;

 /*
    +----+----------+
    | id | username |
    +----+----------+
    |  1 | Samus    |
    +----+----------+
*/

-- Inserted more rows:
     
INSERT INTO second_table(id, username) VALUES (2, 'Mario');
INSERT INTO second_table(id, username) VALUES (3, 'Luigi');

-- Deleted all rows:

DELETE FROM second_table WHERE username = 'Luigi';
DELETE FROM second_table WHERE username = 'Mario';
DELETE FROM second_table WHERE username = 'Samus';
    
-- NOTE: double quotations (") can not be used.

-- Dropped all columns:
ALTER TABLE second_table DROP COLUMN username;
ALTER TABLE second_table DROP COLUMN id;

-- Displaying tables:

/*
        +--------+--------------+-------+--------------+
        | Schema |     Name     | Type  |    Owner     |
        +--------+--------------+-------+--------------+
        | public | first_table  | table | freecodecamp |
        | public | second_table | table | freecodecamp |
        +--------+--------------+-------+--------------+
*/

-- Dropped all tables from second_datbase:
DROP TABLE second_table;
DROP TABLE first_table;

/*
        +-----------------+--------------+----------+---------+---------+-----------------------+
        |      Name       |    Owner     | Encoding | Collate |  Ctype  |   Access privileges   |
        +-----------------+--------------+----------+---------+---------+-----------------------+
        | first_database  | freecodecamp | UTF8     | C.UTF-8 | C.UTF-8 |                       |
        | postgres        | postgres     | UTF8     | C.UTF-8 | C.UTF-8 |                       |
        | second_database | freecodecamp | UTF8     | C.UTF-8 | C.UTF-8 |                       |
        | template0       | postgres     | UTF8     | C.UTF-8 | C.UTF-8 | =c/postgres          +|
        |                 |              |          |         |         | postgres=CTc/postgres |
        | template1       | postgres     | UTF8     | C.UTF-8 | C.UTF-8 | =c/postgres          +|
        |                 |              |          |         |         | postgres=CTc/postgres |
        +-----------------+--------------+----------+---------+---------+-----------------------+
*/

ALTER DATABASE first_database RENAME TO mario_database;
/*
        +-----------------+--------------+----------+---------+---------+-----------------------+
        |      Name       |    Owner     | Encoding | Collate |  Ctype  |   Access privileges   |
        +-----------------+--------------+----------+---------+---------+-----------------------+
        | mario_database  | freecodecamp | UTF8     | C.UTF-8 | C.UTF-8 |                       |
        | postgres        | postgres     | UTF8     | C.UTF-8 | C.UTF-8 |                       |
        | second_database | freecodecamp | UTF8     | C.UTF-8 | C.UTF-8 |                       |
        | template0       | postgres     | UTF8     | C.UTF-8 | C.UTF-8 | =c/postgres          +|
        |                 |              |          |         |         | postgres=CTc/postgres |
        | template1       | postgres     | UTF8     | C.UTF-8 | C.UTF-8 | =c/postgres          +|
        |                 |              |          |         |         | postgres=CTc/postgres |
        +-----------------+--------------+----------+---------+---------+-----------------------+
*/

-- **\c mario_database**

DROP DATABASE second_database;

CREATE TABLE characters();

-- Added a character_id column in table:
-- The SERIAL type will only accept non-null ints;
ALTER TABLE characters ADD COLUMN character_id SERIAL;
    

-- Displaying table:
/*
        +--------------+---------+-----------+----------+--------------------------------------------------+
        |    Column    |  Type   | Collation | Nullable |                     Default                      |
        +--------------+---------+-----------+----------+--------------------------------------------------+
        | character_id | integer |           | not null | nextval('characters_character_id_seq'::regclass) |
        +--------------+---------+-----------+----------+--------------------------------------------------+
*/

-- Added non-null column:

ALTER TABLE characters ADD COLUMN name VARCHAR(30) NOT NULL;

-- Added homeland column:
    
ALTER TABLE characters ADD COLUMN homeland VARCHAR(60);

-- Added favorite_color column:
        
ALTER TABLE characters ADD COLUMN favorite_color VARCHAR(30);

-- Displaying table:
/*
        +----------------+-----------------------+-----------+----------+--------------------------------------------------+
        |     Column     |         Type          | Collation | Nullable |                     Default                      |
        +----------------+-----------------------+-----------+----------+--------------------------------------------------+
        | character_id   | integer               |           | not null | nextval('characters_character_id_seq'::regclass) |
        | name           | character varying(30) |           | not null |                                                  |
        | homeland       | character varying(60) |           |          |                                                  |
        | favorite_color | character varying(30) |           |          |                                                  |
        +----------------+-----------------------+-----------+----------+--------------------------------------------------+
*/
-- Added Mario:
INSERT INTO characters( name, homeland, favorite_color) VALUES ('Mario', 'Mushroom Kingdom', 'Red');

-- Inserted Luigi:
INSERT INTO characters (name, homeland, favorite_color) VALUES ('Luigi', 'Mushroom Kingdom', 'Green');

-- Displaying all columns:
 /*   
        +--------------+-------+------------------+----------------+
        | character_id | name  |     homeland     | favorite_color |
        +--------------+-------+------------------+----------------+
        |            1 | Mario | Mushroom Kingdom | Red            |
        |            2 | Luigi | Mushroom Kingdom | Green          |
        +--------------+-------+------------------+----------------+
*/

-- Inserting more characters:
INSERT INTO characters (name, homeland, favorite_color) VALUES ('Peach', 'Mushroom Kingdom', 'Pink');
INSERT INTO characters (name, homeland, favorite_color) VALUES ('Toadstool', 'Mushroom Kingdom', 'Red'), ('Bowser', 'Mushroom Kingdom', 'Green');
INSERT INTO characters (name, homeland, favorite_color) VALUES ('Daisy', 'Sarasaland', 'Yellow'), ('Yoshi', 'Dinosaur Land', 'Green');

-- Displaying all columns:
/*
        +--------------+-----------+------------------+----------------+
        | character_id |   name    |     homeland     | favorite_color |
        +--------------+-----------+------------------+----------------+
        |            1 | Mario     | Mushroom Kingdom | Red            |
        |            2 | Luigi     | Mushroom Kingdom | Green          |
        |            3 | Peach     | Mushroom Kingdom | Pink           |
        |            5 | Bowser    | Mushroom Kingdom | Green          |
        |            4 | Toadstool | Mushroom Kingdom | Red            |
        |            6 | Daisy     | Sarasaland       | Yellow         |
        |            7 | Yoshi     | Dinosaur Land    | Green          |
        +--------------+-----------+------------------+----------------+
*/


-- Updated favourite color:
UPDATE characters SET favorite_color = 'Orange' WHERE name='Daisy';


/*
       +--------------+-----------+------------------+----------------+
        | character_id |   name    |     homeland     | favorite_color |
        +--------------+-----------+------------------+----------------+
        |            1 | Mario     | Mushroom Kingdom | Red            |
        |            2 | Luigi     | Mushroom Kingdom | Green          |
        |            3 | Peach     | Mushroom Kingdom | Pink           |
        |            5 | Bowser    | Mushroom Kingdom | Green          |
        |            4 | Toadstool | Mushroom Kingdom | Red            |
        |            7 | Yoshi     | Dinosaur Land    | Green          |
        |            6 | Daisy     | Sarasaland       | Orange         |
        +--------------+-----------+------------------+----------------+
*/

UPDATE characters SET name='Toad' WHERE favorite_color='Red';
-- Two rows were modified:
/*
            +--------------+--------+------------------+----------------+
            | character_id |  name  |     homeland     | favorite_color |
            +--------------+--------+------------------+----------------+
            |            2 | Luigi  | Mushroom Kingdom | Green          |
            |            3 | Peach  | Mushroom Kingdom | Pink           |
            |            5 | Bowser | Mushroom Kingdom | Green          |
            |            7 | Yoshi  | Dinosaur Land    | Green          |
            |            6 | Daisy  | Sarasaland       | Orange         |
            |            1 | Toad   | Mushroom Kingdom | Red            |
            |            4 | Toad   | Mushroom Kingdom | Red            |
            +--------------+--------+------------------+----------------+
*/

-- Corrected Mario row:
UPDATE characters SET name='Mario' WHERE character_id=1;

-- Corrected Toad row:
UPDATE characters SET favorite_color='Blue' WHERE character_id=4;

-- Updated Bowser row:
UPDATE characters SET favorite_color='Yellow' WHERE character_id=5;
UPDATE characters SET homeland='Koopa Kingdom' WHERE character_id=5;

-- Displaying data by character_id:
SELECT * FROM characters ORDER BY character_id;

-- Added primary key using name column:
ALTER TABLE characters ADD PRIMARY KEY(name);

-- Showing characters table information:
/*
        +----------------+-----------------------+-----------+----------+--------------------------------------------------+
        |     Column     |         Type          | Collation | Nullable |                     Default                      |
        +----------------+-----------------------+-----------+----------+--------------------------------------------------+
        | character_id   | integer               |           | not null | nextval('characters_character_id_seq'::regclass) |
        | name           | character varying(30) |           | not null |                                                  |
        | homeland       | character varying(60) |           |          |                                                  |
        | favorite_color | character varying(30) |           |          |                                                  |
        +----------------+-----------------------+-----------+----------+--------------------------------------------------+
        Indexes:
            "characters_pkey" PRIMARY KEY, btree (name)
*/

-- Dropped the constraint which was created:
ALTER TABLE characters DROP CONSTRAINT characters_pkey;

-- Using character_id as primary key:
ALTER TABLE characters ADD PRIMARY KEY(character_id);

-- Displaying characters table information:
/*
        +----------------+-----------------------+-----------+----------+--------------------------------------------------+
        |     Column     |         Type          | Collation | Nullable |                     Default                      |
        +----------------+-----------------------+-----------+----------+--------------------------------------------------+
        | character_id   | integer               |           | not null | nextval('characters_character_id_seq'::regclass) |
        | name           | character varying(30) |           | not null |                                                  |
        | homeland       | character varying(60) |           |          |                                                  |
        | favorite_color | character varying(30) |           |          |                                                  |
        +----------------+-----------------------+-----------+----------+--------------------------------------------------+
*/

-- Created more_info table:
CREATE TABLE more_info();

-- Displaying characters table, we can see the default value for character_id:
/*
        +----------------+-----------------------+-----------+----------+--------------------------------------------------+
        |     Column     |         Type          | Collation | Nullable |                     Default                      |
        +----------------+-----------------------+-----------+----------+--------------------------------------------------+
        | character_id   | integer               |           | not null | nextval('characters_character_id_seq'::regclass) |
        | name           | character varying(30) |           | not null |                                                  |
        | homeland       | character varying(60) |           |          |                                                  |
        | favorite_color | character varying(30) |           |          |                                                  |
        +----------------+-----------------------+-----------+----------+--------------------------------------------------+
        Indexes:
            "characters_pkey" PRIMARY KEY, btree (character_id)
*/

-- Added a column to the more_info table:
ALTER TABLE more_info ADD COLUMN more_info_id  SERIAL;

-- Added primary key:
ALTER TABLE more_info ADD PRIMARY KEY(more_info_id);

-- Displaying tables:
/*
        +--------+-----------------------------+----------+--------------+
        | Schema |            Name             |   Type   |    Owner     |
        +--------+-----------------------------+----------+--------------+
        | public | characters                  | table    | freecodecamp |
        | public | characters_character_id_seq | sequence | freecodecamp |
        | public | more_info                   | table    | freecodecamp |
        | public | more_info_more_info_id_seq  | sequence | freecodecamp |
        +--------+-----------------------------+----------+--------------+
*/

-- Added birthday and height column:
ALTER TABLE more_info ADD COLUMN birthday DATE;
ALTER TABLE more_info ADD COLUMN height INT;

-- Added weight column with type numeric(4,1) which is a 4 digit value and 1 digit after decimal.
ALTER TABLE more_info ADD COLUMN height INT;

ALTER TABLE more_info ADD COLUMN weight numeric(4,1);

-- Displaying more_info table:
/*
        +--------------+--------------+-----------+----------+-------------------------------------------------+
        |    Column    |     Type     | Collation | Nullable |                     Default                     |
        +--------------+--------------+-----------+----------+-------------------------------------------------+
        | more_info_id | integer      |           | not null | nextval('more_info_more_info_id_seq'::regclass) |
        | birthday     | date         |           |          |                                                 |
        | height       | integer      |           |          |                                                 |
        | weight       | numeric(4,1) |           |          |                                                 |
        +--------------+--------------+-----------+----------+-------------------------------------------------+
        Indexes:
            "more_info_pkey" PRIMARY KEY, btree (more_info_id)

*/

-- To create a relationship with the characters table, we need to set a foreign key. I will add a character_id column to the more_info table which references the primary key of the characters table:
ALTER TABLE more_info ADD COLUMN character_id INT REFERENCES characters(character_id);

-- These tables now have a one-to-one relationship. One row in characters will correspond with one row in more_info.
-- We can enforce that each character_id in more_info will be unique:
ALTER TABLE more_info ADD UNIQUE(character_id);

-- We can also ensure the value is not null:
ALTER TABLE more_info ALTER COLUMN character_id SET NOT NULL;

-- Displaying more_info table:
/*
        +--------------+--------------+-----------+----------+-------------------------------------------------+
        |    Column    |     Type     | Collation | Nullable |                     Default                     |
        +--------------+--------------+-----------+----------+-------------------------------------------------+
        | more_info_id | integer      |           | not null | nextval('more_info_more_info_id_seq'::regclass) |
        | birthday     | date         |           |          |                                                 |
        | height       | integer      |           |          |                                                 |
        | weight       | numeric(4,1) |           |          |                                                 |
        | character_id | integer      |           | not null |                                                 |
        +--------------+--------------+-----------+----------+-------------------------------------------------+
        Indexes:
            "more_info_pkey" PRIMARY KEY, btree (more_info_id)
            "more_info_character_id_key" UNIQUE CONSTRAINT, btree (character_id)
        Foreign-key constraints:
            "more_info_character_id_fkey" FOREIGN KEY (character_id) REFERENCES characters(character_id)
*/

/***** Adding rows to more_info table:**********/

-- Displaying character_id from characters:
/*
        +--------------+--------+
        | character_id |  name  |
        +--------------+--------+
        |            2 | Luigi  |
        |            3 | Peach  |
        |            7 | Yoshi  |
        |            6 | Daisy  |
        |            1 | Mario  |
        |            4 | Toad   |
        |            5 | Bowser |
        +--------------+--------+
*/

-- I will now add information for Mario:
INSERT INTO more_info(birthday, height, weight, character_id) VALUES ('1981-07-09', 155, 64.5, 1);
INSERT INTO more_info(birthday, height, weight, character_id) VALUES ('1983-07-14', 175, 48.8, 2);
INSERT INTO more_info(birthday, height, weight, character_id) VALUES ('1985-10-18', 173, 52.2, 3);
INSERT INTO more_info(birthday, height, weight, character_id) VALUES ('1950-01-10',66,35.6, 4); 
INSERT INTO more_info(birthday , height, weight, character_id) VALUES ('1990-10-29', 258, 300, 5);
INSERT INTO more_info(birthday, height, weight, character_id) VALUES ('1989,07-31', NULL, NULL, 6);
INSERT INTO more_info(birthday, height, weight, character_id) VALUES ('1990,04-13',162,59.1, 7);

-- Result:
/*
        +--------------+------------+--------+--------+--------------+
        | more_info_id |  birthday  | height | weight | character_id |
        +--------------+------------+--------+--------+--------------+
        |            1 | 1981-07-09 |    155 |   64.5 |            1 |
        |            2 | 1983-07-14 |    175 |   48.8 |            2 |
        |            3 | 1985-10-18 |    173 |   52.2 |            3 |
        |            4 | 1950-01-10 |     66 |   35.6 |            4 |
        |            5 | 1990-10-29 |    258 |  300.0 |            5 |
        |            6 | 1989-07-31 |        |        |            6 |
        |            7 | 1990-04-13 |    162 |   59.1 |            7 |
        +--------------+------------+--------+--------+--------------+
*/

-- I renamed columns:
ALTER TABLE more_info RENAME COLUMN height TO height_in_cm;


/********* Creating sound table: **************/
-- Created new table for sounds:
CREATE TABLE sounds(sound_id SERIAL PRIMARY KEY);

/*
                +--------+-----------------------------+----------+--------------+
                | Schema |            Name             |   Type   |    Owner     |
                +--------+-----------------------------+----------+--------------+
                | public | characters                  | table    | freecodecamp |
                | public | characters_character_id_seq | sequence | freecodecamp |
                | public | more_info                   | table    | freecodecamp |
                | public | more_info_more_info_id_seq  | sequence | freecodecamp |
                | public | sounds                      | table    | freecodecamp |
                | public | sounds_sound_id_seq         | sequence | freecodecamp |
                +--------+-----------------------------+----------+--------------+
*/

ALTER TABLE sounds ADD COLUMN filename VARCHAR(40) UNIQUE NOT NULL;

-- Created a foreign key constraint so each character can have multiple sounds but a sound can not correspond to multiple characters:
ALTER TABLE sounds ADD COLUMN character_id INT NOT NULL REFERENCES characters(character_id);

/*
                +--------------+-----------------------+-----------+----------+------------------------------------------+
                |    Column    |         Type          | Collation | Nullable |                 Default                  |
                +--------------+-----------------------+-----------+----------+------------------------------------------+
                | sound_id     | integer               |           | not null | nextval('sounds_sound_id_seq'::regclass) |
                | filename     | character varying(40) |           | not null |                                          |
                | character_id | integer               |           | not null |                                          |
                +--------------+-----------------------+-----------+----------+------------------------------------------+
                Indexes:
                "sounds_pkey" PRIMARY KEY, btree (sound_id)
                "sounds_filename_key" UNIQUE CONSTRAINT, btree (filename)
                Foreign-key constraints:
                "sounds_character_id_fkey" FOREIGN KEY (character_id) REFERENCES characters(character_id)
*/

--Added rows for Mario, Luigi and Peach:
INSERT INTO sounds(filename, character_id) VALUES ('its-a-me.wav', 1);
INSERT INTO sounds(filename, character_id) VALUES ('yippee.wav', 1);
INSERT INTO sounds(filename, character_id) VALUES ('ha-ha.wav', 2);
INSERT INTO sounds(filename, character_id) VALUES ('oh-yeah.wav', 2);
INSERT INTO sounds(filename, character_id) VALUES ('yay.wav', 3),('woo-hoo.wav',3);
INSERT INTO sounds(filename, character_id) VALUES ('yahoo.wav', 1),('mm-hmm.wav',3);

-- Displaying the table:
/*
                +----------+--------------+--------------+
                | sound_id |   filename   | character_id |
                +----------+--------------+--------------+
                |        1 | its-a-me.wav |            1 |
                |        2 | yippee.wav   |            1 |
                |        3 | ha-ha.wav    |            2 |
                |        4 | oh-yeah.wav  |            2 |
                |        5 | yay.wav      |            3 |
                |        6 | woo-hoo.wav  |            3 |
                |        7 | yahoo.wav    |            1 |
                |        8 | mm-hmm.wav   |            3 |
                +----------+--------------+--------------+
*/

/******* Creating actions Table: **********/

-- Created action table:
CREATE TABLE actions(action_id SERIAL PRIMARY KEY);

-- Added column:
ALTER TABLE actions ADD COLUMN action VARCHAR(20) UNIQUE NOT NULL;

-- There will be a many-to-many relationship between characters and actions, i.e. a single character can have multiple actions and a single action can be used by multiple characters.

-- **A many-to-many relationship does not require a constraint**


INSERT INTO actions(action) VALUES ('run');
INSERT INTO actions(action) VALUES ('jump');
INSERT INTO actions(action) VALUES ('duck');

-- Many-to-many relationships usually use a **junction** table to link two tables together, forming "one-to-many" relationships. We will link the characters and actions table using a junction table called character_actions:

 CREATE TABLE character_actions();

-- This table will use primary keys from the characters and actions tables as foreign keys.

-- Adding character_id column and foreign key:
ALTER TABLE character_actions ADD COLUMN character_ID INT NOT NULL;
ALTER TABLE character_actions ADD FOREIGN KEY(character_id) REFERENCES characters(character_id);

-- Adding character_action column and setting foreign key:
ALTER TABLE character_actions ADD COLUMN action_id INT NOT NULL;
ALTER TABLE character_actions ADD FOREIGN KEY (action_id) REFERENCES actions(action_id);

-- Displaying table:
/*
                +--------------+---------+-----------+----------+---------+
                |    Column    |  Type   | Collation | Nullable | Default |
                +--------------+---------+-----------+----------+---------+
                | character_id | integer |           | not null |         |
                | action_id    | integer |           | not null |         |
                +--------------+---------+-----------+----------+---------+
                Foreign-key constraints:
                "character_actions_action_id_fkey" FOREIGN KEY (action_id) REFERENCES actions(action_id)
                "character_actions_character_id_fkey" FOREIGN KEY (character_id) REFERENCES characters(character_id)
*/

-- We shall creatge a **composite primary key** for the character_actions table:
ALTER TABLE character_actions ADD PRIMARY KEY(character_id, action_id);

-- Displaying table:
/*
                +--------------+---------+-----------+----------+---------+
                |    Column    |  Type   | Collation | Nullable | Default |
                +--------------+---------+-----------+----------+---------+
                | character_id | integer |           | not null |         |
                | action_id    | integer |           | not null |         |
                +--------------+---------+-----------+----------+---------+
                Indexes:
                "character_actions_pkey" PRIMARY KEY, btree (character_id, action_id)
                Foreign-key constraints:
                "character_actions_action_id_fkey" FOREIGN KEY (action_id) REFERENCES actions(action_id)
                "character_actions_character_id_fkey" FOREIGN KEY (character_id) REFERENCES characters(character_id)
*/

-- Creating actions for yoshi
INSERT INTO character_actions(character_id,action_id) VALUES (7,1),(7,2),(7,3);

-- Inserting rows for Daisy:
INSERT INTO character_actions(character_id,action_id) VALUES (6,1),(6,2),(6,3);

-- Inserting rows for Bowser:
INSERT INTO character_actions(character_id,action_id) VALUES (5,1),(5,2),(5,3);

-- Inserting rows for Toad:
INSERT INTO character_actions(character_id,action_id) VALUES (4,1),(4,2),(4,3);

-- Inserting rows for Peach:
INSERT INTO character_actions(character_id,action_id) VALUES (3,1),(3,2),(3,3);

-- Luigi:
INSERT INTO character_actions(character_id,action_id) VALUES (2,1),(2,2),(2,3);

-- Mario:
INSERT INTO character_actions(character_id,action_id) VALUES (1,1),(1,2),(1,3);


-- Displaying character_actions table:
/*
                +--------------+-----------+
                | character_id | action_id |
                +--------------+-----------+
                |            7 |         1 |
                |            7 |         2 |
                |            7 |         3 |
                |            6 |         1 |
                |            6 |         2 |
                |            6 |         3 |
                |            5 |         1 |
                |            5 |         2 |
                |            5 |         3 |
                |            4 |         1 |
                |            4 |         2 |
                |            4 |         3 |
                |            3 |         1 |
                |            3 |         2 |
                |            3 |         3 |
                |            2 |         1 |
                |            2 |         2 |
                |            2 |         3 |
                |            1 |         1 |
                |            1 |         2 |
                |            1 |         3 |
                +--------------+-----------+

+--------------+--------+------------------+----------------+
| character_id |  name  |     homeland     | favorite_color |
+--------------+--------+------------------+----------------+
|            1 | Mario  | Mushroom Kingdom | Red            |
|            2 | Luigi  | Mushroom Kingdom | Green          |
|            3 | Peach  | Mushroom Kingdom | Pink           |
|            4 | Toad   | Mushroom Kingdom | Blue           |
|            5 | Bowser | Koopa Kingdom    | Yellow         |
|            6 | Daisy  | Sarasaland       | Orange         |
|            7 | Yoshi  | Dinosaur Land    | Green          |
+--------------+--------+------------------+----------------+
*/

-- Using a FULL JOIN statement using:
SELECT * FROM characters FULL JOIN more_info ON characters.character_id = more_info.character_id;

--This displays the following results illustrating the one-to-one relationship:
/*
                +--------------+--------+------------------+----------------+--------------+------------+--------------+--------------+--------------+
                | character_id |  name  |     homeland     | favorite_color | more_info_id |  birthday  | height_in_cm | weight_in_kg | character_id |
                +--------------+--------+------------------+----------------+--------------+------------+--------------+--------------+--------------+
                |            2 | Luigi  | Mushroom Kingdom | Green          |            2 | 1983-07-14 |          175 |         48.8 |            2 |
                |            3 | Peach  | Mushroom Kingdom | Pink           |            3 | 1985-10-18 |          173 |         52.2 |            3 |
                |            7 | Yoshi  | Dinosaur Land    | Green          |            7 | 1990-04-13 |          162 |         59.1 |            7 |
                |            6 | Daisy  | Sarasaland       | Orange         |            6 | 1989-07-31 |              |              |            6 |
                |            1 | Mario  | Mushroom Kingdom | Red            |            1 | 1981-07-09 |          155 |         64.5 |            1 |
                |            4 | Toad   | Mushroom Kingdom | Blue           |            4 | 1950-01-10 |           66 |         35.6 |            4 |
                |            5 | Bowser | Koopa Kingdom    | Yellow         |            5 | 1990-10-29 |          258 |        300.0 |            5 |
                +--------------+--------+------------------+----------------+--------------+------------+--------------+--------------+--------------+
*/

-- Displaying a FULL JOIN for the characters and sound tables:
SELECT * FROM characters FULL JOIN sounds ON characters.character_id = sounds.character_id;

-- Displaying the tables illustrates the one-to-many relationship between characters and sounds:
/*
                +--------------+--------+------------------+----------------+----------+--------------+--------------+
                | character_id |  name  |     homeland     | favorite_color | sound_id |   filename   | character_id |
                +--------------+--------+------------------+----------------+----------+--------------+--------------+
                |            1 | Mario  | Mushroom Kingdom | Red            |        1 | its-a-me.wav |            1 |
                |            1 | Mario  | Mushroom Kingdom | Red            |        2 | yippee.wav   |            1 |
                |            2 | Luigi  | Mushroom Kingdom | Green          |        3 | ha-ha.wav    |            2 |
                |            2 | Luigi  | Mushroom Kingdom | Green          |        4 | oh-yeah.wav  |            2 |
                |            3 | Peach  | Mushroom Kingdom | Pink           |        5 | yay.wav      |            3 |
                |            3 | Peach  | Mushroom Kingdom | Pink           |        6 | woo-hoo.wav  |            3 |
                |            3 | Peach  | Mushroom Kingdom | Pink           |        7 | mm-hmm.wav   |            3 |
                |            1 | Mario  | Mushroom Kingdom | Red            |        8 | yahoo.wav    |            1 |
                |            5 | Bowser | Koopa Kingdom    | Yellow         |          |              |              |
                |            6 | Daisy  | Sarasaland       | Orange         |          |              |              |
                |            4 | Toad   | Mushroom Kingdom | Blue           |          |              |              |
                |            7 | Yoshi  | Dinosaur Land    | Green          |          |              |              |
                +--------------+--------+------------------+----------------+----------+--------------+--------------+
*/

-- A FULL JOIN between characters,actions, character_actions:
SELECT * FROM characters 
FULL JOIN character_actions
ON characters.character_id=character_actions.character_id
FULL JOIN actions 
ON actions.action_id=character_actions.action_id;

-- The above join illustrates the many-to-many relationship:
/*
                +--------------+--------+------------------+----------------+--------------+-----------+-----------+--------+
                | character_id |  name  |     homeland     | favorite_color | character_id | action_id | action_id | action |
                +--------------+--------+------------------+----------------+--------------+-----------+-----------+--------+
                |            7 | Yoshi  | Dinosaur Land    | Green          |            7 |         1 |         1 | run    |
                |            7 | Yoshi  | Dinosaur Land    | Green          |            7 |         2 |         2 | jump   |
                |            7 | Yoshi  | Dinosaur Land    | Green          |            7 |         3 |         3 | duck   |
                |            6 | Daisy  | Sarasaland       | Orange         |            6 |         1 |         1 | run    |
                |            6 | Daisy  | Sarasaland       | Orange         |            6 |         2 |         2 | jump   |
                |            6 | Daisy  | Sarasaland       | Orange         |            6 |         3 |         3 | duck   |
                |            5 | Bowser | Koopa Kingdom    | Yellow         |            5 |         1 |         1 | run    |
                |            5 | Bowser | Koopa Kingdom    | Yellow         |            5 |         2 |         2 | jump   |
                |            5 | Bowser | Koopa Kingdom    | Yellow         |            5 |         3 |         3 | duck   |
                |            4 | Toad   | Mushroom Kingdom | Blue           |            4 |         1 |         1 | run    |
                |            4 | Toad   | Mushroom Kingdom | Blue           |            4 |         2 |         2 | jump   |
                |            4 | Toad   | Mushroom Kingdom | Blue           |            4 |         3 |         3 | duck   |
                |            3 | Peach  | Mushroom Kingdom | Pink           |            3 |         1 |         1 | run    |
                |            3 | Peach  | Mushroom Kingdom | Pink           |            3 |         2 |         2 | jump   |
                |            3 | Peach  | Mushroom Kingdom | Pink           |            3 |         3 |         3 | duck   |
                |            2 | Luigi  | Mushroom Kingdom | Green          |            2 |         1 |         1 | run    |
                |            2 | Luigi  | Mushroom Kingdom | Green          |            2 |         2 |         2 | jump   |
                |            2 | Luigi  | Mushroom Kingdom | Green          |            2 |         3 |         3 | duck   |
                |            1 | Mario  | Mushroom Kingdom | Red            |            1 |         1 |         1 | run    |
                |            1 | Mario  | Mushroom Kingdom | Red            |            1 |         2 |         2 | jump   |
                |            1 | Mario  | Mushroom Kingdom | Red            |            1 |         3 |         3 | duck   |
                +--------------+--------+------------------+----------------+--------------+-----------+-----------+--------+
*/