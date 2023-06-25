CREATE TABLE teams 
(id NUMBER(3) CONSTRAINT team_id_pk PRIMARY KEY, 
name VARCHAR2(50) CONSTRAINT team_name_nn NOT NULL, 
city VARCHAR2(50) CONSTRAINT team_city_nn NOT NULL, 
state VARCHAR2(2) CONSTRAINT team_state_nn NOT NULL)
Table created.
Statement 2
CREATE TABLE players 
(id NUMBER(3) CONSTRAINT players_id_pk PRIMARY KEY, 
jersey NUMBER(2) CONSTRAINT players_jersey_nn NOT NULL, 
fname VARCHAR2(50) CONSTRAINT players_fname_nn NOT NULL, 
lname VARCHAR2(50) CONSTRAINT players_lname_nn NOT NULL, 
height VARCHAR2(5) CONSTRAINT players_height_nn NOT NULL, 
weight NUMBER(3) CONSTRAINT players_weight_nn NOT NULL, 
dob DATE CONSTRAINT players_dob_nn NOT NULL, 
position VARCHAR2(20) CONSTRAINT players_position_nn NOT NULL 
CONSTRAINT players_position_ck CHECK (position IN ('Pitcher', 'Catcher', 'Infielder', 'Outfielder', 'Designated Hitter')), 
team_id NUMBER(3) CONSTRAINT players_team_id_fk REFERENCES teams(id), 
CONSTRAINT players_jersey_team_id_uk UNIQUE(jersey, team_id))
Table created.
Statement 3
INSERT INTO teams VALUES(1, 'Royals', 'Kansas City', 'MO')
1 row(s) inserted.
Statement 4
INSERT INTO teams VALUES(2, 'Giants', 'San Francisco', 'CA')
1 row(s) inserted.
Statement 5
INSERT INTO players VALUES (1, 62, 'Aaron', 'Brooks', '6-4', 220, '27/Apr/1990', 'Pitcher', 1)
1 row(s) inserted.
Statement 6
INSERT INTO players VALUES (2, 67, 'Francisley', 'Bueno', '5-11', 205, '5/Mar/1981', 'Pitcher', 1)
1 row(s) inserted.
Statement 7
INSERT INTO players VALUES (3, 25, 'Casey', 'Coleman', '6-0', 185, '3/Jul/1987', 'Pitcher', 1)
1 row(s) inserted.
Statement 8
INSERT INTO players VALUES (4, 31, 'Louis', 'Coleman', '6-4', 205, '4/Apr/1986', 'Pitcher', 1)
1 row(s) inserted.
Statement 9
INSERT INTO players VALUES (5, 55, 'Tim', 'Collins', '5-7', 170, '21/Aug/1989', 'Pitcher', 1)
1 row(s) inserted.
Statement 10
INSERT INTO players VALUES (6, 43, 'Aaron', 'Crow', '6-3', 195, '10/Nov/1986', 'Pitcher', 1)
1 row(s) inserted.
Statement 11
INSERT INTO players VALUES (7, 17, 'Wade', 'Davis', '6-5', 220, '7/Sep/1985', 'Pitcher', 1)
1 row(s) inserted.
Statement 12
INSERT INTO players VALUES (8, 37, 'Scott', 'Downs', '6-2', 220, '17/Mar/1976', 'Pitcher', 1)
1 row(s) inserted.
Statement 13
INSERT INTO players VALUES (9, 41, 'Danny', 'Duffy', '6-3', 205, '21/Dec/1988', 'Pitcher', 1)
1 row(s) inserted.
Statement 14
INSERT INTO players VALUES (10, 27, 'Brandon', 'Finnegan', '5-11', 185, '14/Apr/1993', 'Pitcher', 1)
1 row(s) inserted.
Statement 15
INSERT INTO players VALUES (11, 54, 'Jason', 'Frasor', '5-9', 180, '9/Aug/1977', 'Pitcher', 1)
1 row(s) inserted.
Statement 16
INSERT INTO players VALUES (12, 11, 'Jeremy', 'Guthrie', '6-1', 205, '8/Apr/1979', 'Pitcher', 1)
1 row(s) inserted.
Statement 17
INSERT INTO players VALUES (13, 40, 'Kelvin', 'Herrara', '5-10', 200, '31/Dec/1989', 'Pitcher', 1)
1 row(s) inserted.
Statement 18
INSERT INTO players VALUES (14, 44, 'Luke', 'Hochevar', '6-5', 225, '15/Sep/1983', 'Pitcher', 1)
1 row(s) inserted.
Statement 19
INSERT INTO players VALUES (15, 56, 'Greg', 'Holland', '5-10', 205, '20/Nov/1985', 'Pitcher', 1)
1 row(s) inserted.
Statement 20
INSERT INTO players VALUES (16, 38, 'John', 'Lamb', '6-4', 205, '10/Jul/1990', 'Pitcher', 1)
1 row(s) inserted.
Statement 21
INSERT INTO players VALUES (17, 48, 'Michael', 'Mariot', '6-0', 190, '20/Oct/1988', 'Pitcher', 1)
1 row(s) inserted.
Statement 22
INSERT INTO players VALUES (18, 33, 'James', 'Shields', '6-3', 215, '20/Dec/1981', 'Pitcher', 1)
1 row(s) inserted.
Statement 23
INSERT INTO players VALUES (19, 51, 'Jason', 'Vargas', '6-0', 215, '2/Feb/1983', 'Pitcher', 1)
1 row(s) inserted.
Statement 24
INSERT INTO players VALUES (20, 30, 'Yordano', 'Ventura', '6-0', 180, '3/Jun/1991', 'Pitcher', 1)
1 row(s) inserted.
Statement 25
INSERT INTO players VALUES (21, 19, 'Erik', 'Kratz', '6-4', 240, '15/Jun/1980', 'Catcher', 1)
1 row(s) inserted.
Statement 26
INSERT INTO players VALUES (22, 26, 'Francisco', 'Pena', '6-2', 230, '12/Oct/1989', 'Catcher', 1)
1 row(s) inserted.
Statement 27
INSERT INTO players VALUES (23, 13, 'Salvador', 'Perez', '6-3', 240, '10/May/1990', 'Catcher', 1)
1 row(s) inserted.
Statement 28
INSERT INTO players VALUES (24, 24, 'Christian', 'Colon', '5-10', 190, '14/May/1989', 'Infielder', 1)
1 row(s) inserted.
Statement 29
INSERT INTO players VALUES (25, 61, 'Cheslor', 'Cuthbert', '6-1', 190, '16/Nov/1992', 'Infielder', 1)
1 row(s) inserted.
Statement 30
INSERT INTO players VALUES (26, 2, 'Alcides', 'Escobar', '6-1', 185, '16/Dec/1986', 'Infielder', 1)
1 row(s) inserted.
Statement 31
INSERT INTO players VALUES (27, 9, 'Johnny', 'Giavotella', '5-8', 185, '10/Jul/1987', 'Infielder', 1)
1 row(s) inserted.
Statement 32
INSERT INTO players VALUES (28, 35, 'Eric', 'Hosmer', '6-4', 225, '24/Oct/1989', 'Infielder', 1)
1 row(s) inserted.
Statement 33
INSERT INTO players VALUES (29, 14, 'Omar', 'Infante', '5-11', 195, '26/Dec/1981', 'Infielder', 1)
1 row(s) inserted.
Statement 34
INSERT INTO players VALUES (30, 8, 'Mike', 'Moustakas', '6-0', 195, '11/Sep/1988', 'Infielder', 1)
1 row(s) inserted.
Statement 35
INSERT INTO players VALUES (31, 12, 'Jayson', 'Nix', '5-11', 195, '26/Aug/1982', 'Infielder', 1)
1 row(s) inserted.
Statement 36
INSERT INTO players VALUES (32, 45, 'Lane', 'Adams', '6-4', 190, '13/Nov/1989', 'Outfielder', 1)
1 row(s) inserted.
Statement 37
INSERT INTO players VALUES (33, 23, 'Nori', 'Aoki', '5-9', 180, '5/Jan/1982', 'Outfielder', 1)
1 row(s) inserted.
Statement 38
INSERT INTO players VALUES (34, 6, 'Lorenzo', 'Cain', '6-2', 205, '13/Apr/1986', 'Outfielder', 1)
1 row(s) inserted.
Statement 39
INSERT INTO players VALUES (35, 1, 'Jarrod', 'Dyson', '5-10', 160, '15/Aug/1995', 'Outfielder', 1)
1 row(s) inserted.
Statement 40
INSERT INTO players VALUES (36, 4, 'Alex', 'Gordon', '6-1', 220, '10/Feb/1984', 'Outfielder', 1)
1 row(s) inserted.
Statement 41
INSERT INTO players VALUES (37, 0, 'Terrance', 'Gore', '5-7', 165, '8/Jun/1991', 'Outfielder', 1)
1 row(s) inserted.
Statement 42
INSERT INTO players VALUES (38, 18, 'Raul', 'Ibanez', '6-2', 225, '2/Jun/1972', 'Outfielder', 1)
1 row(s) inserted.
Statement 43
INSERT INTO players VALUES (39, 34, 'Carlos', 'Peguero', '6-5', 250, '22/Feb/1987', 'Outfielder', 1)
1 row(s) inserted.
Statement 44
INSERT INTO players VALUES (40, 99, 'Moises', 'Sierra', '6-1', 220, '24/Sep/1988', 'Outfielder', 1)
1 row(s) inserted.
Statement 45
INSERT INTO players VALUES (41, 7, 'Josh', 'Willingham', '6-2', 230, '17/Feb/1979', 'Outfielder', 1)
1 row(s) inserted.
Statement 46
INSERT INTO players VALUES (42, 16, 'Billy', 'Butler', '6-1', 240, '18/Apr/1986', 'Designated Hitter', 1)
1 row(s) inserted.
Statement 47
INSERT INTO players VALUES (43, 41, 'Jeremy', 'Affeldt', '6-4', 225, '6/Jun/1979', 'Pitcher', 2)
1 row(s) inserted.
Statement 48
INSERT INTO players VALUES (44, 43, 'Brett', 'Bochy', '6-2', 200, '27/Aug/1987', 'Pitcher', 2)
1 row(s) inserted.
Statement 49
INSERT INTO players VALUES (45, 40, 'Madison', 'Bumgarner', '6-5', 235, '1/Aug/1989', 'Pitcher', 2)
1 row(s) inserted.
Statement 50
INSERT INTO players VALUES (46, 18, 'Matt', 'Cain', '6-3', 230, '1/Oct/1984', 'Pitcher', 2)
1 row(s) inserted.
Statement 51
INSERT INTO players VALUES (47, 46, 'Santiago', 'Casilla', '6-0', 210, '25/Jul/1980', 'Pitcher', 2)
1 row(s) inserted.
Statement 52
INSERT INTO players VALUES (48, 51, 'Erik', 'Cordier', '6-4', 250, '25/Feb/1986', 'Pitcher', 2)
1 row(s) inserted.
Statement 53
INSERT INTO players VALUES (49, 86, 'Kendry', 'Flores', '6-2', 175, '24/Nov/1991', 'Pitcher', 2)
1 row(s) inserted.
Statement 54
INSERT INTO players VALUES (50, 57, 'Juan', 'Gutierrez', '6-3', 245, '14/Jul/1983', 'Pitcher', 2)
1 row(s) inserted.
Statement 55
INSERT INTO players VALUES (51, 53, 'Chris', 'Heston', '6-3', 195, '10/Apr/1988', 'Pitcher', 2)
1 row(s) inserted.
Statement 56
INSERT INTO players VALUES (52, 17, 'Tim', 'Hudson', '6-1', 175, '14/Jul/1975', 'Pitcher', 2)
1 row(s) inserted.
Statement 57
INSERT INTO players VALUES (53, 59, 'Mike', 'Kickham', '6-4', 220, '12/Dec/1988', 'Pitcher', 2)
1 row(s) inserted.
Statement 58
INSERT INTO players VALUES (54, 70, 'George', 'Kontos', '6-3', 215, '12/Jun/1985', 'Pitcher', 2)
1 row(s) inserted.
Statement 59
INSERT INTO players VALUES (55, 55, 'Tim', 'Lincecum', '5-11', 170, '15/Jun/1984', 'Pitcher', 2)
1 row(s) inserted.
Statement 60
INSERT INTO players VALUES (56, 49, 'Javier', 'Lopez', '6-4', 220, '11/Jul/1977', 'Pitcher', 2)
1 row(s) inserted.
Statement 61
INSERT INTO players VALUES (57, 63, 'Jean', 'Machi', '6-0', 255, '1/Feb/1982', 'Pitcher', 2)
1 row(s) inserted.
Statement 62
INSERT INTO players VALUES (58, 22, 'Jake', 'Peavy', '6-1', 195, '31/May/1981', 'Pitcher', 2)
1 row(s) inserted.
Statement 63
INSERT INTO players VALUES (59, 52, 'Yusmeiro', 'Petit', '6-1', 250, '22/Nov/1984', 'Pitcher', 2)
1 row(s) inserted.
Statement 64
INSERT INTO players VALUES (60, 54, 'Sergio', 'Romo', '5-10', 185, '4/Mar/1983', 'Pitcher', 2)
1 row(s) inserted.
Statement 65
INSERT INTO players VALUES (61, 60, 'Hunter', 'Strickland', '6-4', 220, '24/Sep/1988', 'Pitcher', 2)
1 row(s) inserted.
Statement 66
INSERT INTO players VALUES (62, 32, 'Ryan', 'Vogelsong', '6-4', 215, '22/Jul/1977', 'Pitcher', 2)
1 row(s) inserted.
Statement 67
INSERT INTO players VALUES (63, 28, 'Buster', 'Posey', '6-1', 215, '27/Mar/1987', 'Catcher', 2)
1 row(s) inserted.
Statement 68
INSERT INTO players VALUES (64, 14, 'Guillermo', 'Quiroz', '6-1', 230, '29/Nov/1981', 'Catcher', 2)
1 row(s) inserted.
Statement 69
INSERT INTO players VALUES (65, 29, 'Hector', 'Sanchez', '6-0', 235, '17/Nov/1989', 'Catcher', 2)
1 row(s) inserted.
Statement 70
INSERT INTO players VALUES (66, 34, 'Andrew', 'Susac', '6-1', 215, '22/Mar/1990', 'Catcher', 2)
1 row(s) inserted.
Statement 71
INSERT INTO players VALUES (67, 6, 'Ehire', 'Adrianza', '6-1', 170, '21/Aug/1989', 'Infielder', 2)
1 row(s) inserted.
Statement 72
INSERT INTO players VALUES (68, 13, 'Joaquin', 'Arias', '6-1', 165, '21/Sep/1984', 'Infielder', 2)
1 row(s) inserted.
Statement 73
INSERT INTO players VALUES (69, 9, 'Brandon', 'Belt', '6-5', 220, '20/Apr/1988', 'Infielder', 2)
1 row(s) inserted.
Statement 74
INSERT INTO players VALUES (70, 35, 'Brandon', 'Crawford', '6-2', 215, '21/Jan/1987', 'Infielder', 2)
1 row(s) inserted.
Statement 75
INSERT INTO players VALUES (71, 50, 'Matt', 'Duffy', '6-2', 170, '15/Jan/1991', 'Infielder', 2)
1 row(s) inserted.
Statement 76
INSERT INTO players VALUES (72, 37, 'Adam', 'Duvall', '6-1', 205, '4/Sep/1988', 'Infielder', 2)
1 row(s) inserted.
Statement 77
INSERT INTO players VALUES (73, 12, 'Joe', 'Panik', '6-1', 190, '30/Oct/1990', 'Infielder', 2)
1 row(s) inserted.
Statement 78
INSERT INTO players VALUES (74, 48, 'Pablo', 'Sandoval', '5-11', 245, '11/Aug/1986', 'Infielder', 2)
1 row(s) inserted.
Statement 79
INSERT INTO players VALUES (75, 19, 'Marco', 'Scutaro', '5-10', 185, '30/Oct/1975', 'Infielder', 2)
1 row(s) inserted.
Statement 80
INSERT INTO players VALUES (76, 74, 'Angel', 'Villalona', '6-3', 255, '13/Aug/1990', 'Infielder', 2)
1 row(s) inserted.
Statement 81
INSERT INTO players VALUES (77, 7, 'Gregor', 'Bianco', '5-11', 175, '24/Dec/1983', 'Outfielder', 2)
1 row(s) inserted.
Statement 82
INSERT INTO players VALUES (78, 56, 'Gary', 'Brown', '6-1', 190, '28/Sep/1988', 'Outfielder', 2)
1 row(s) inserted.
Statement 83
INSERT INTO players VALUES (79, 99, 'Daniel', 'Carbonell', '6-3', 196, '29/Mar/1991', 'Outfielder', 2)
1 row(s) inserted.
Statement 84
INSERT INTO players VALUES (80, 10, 'Chris', 'Dominguez', '6-4', 235, '22/Nov/1986', 'Outfielder', 2)
1 row(s) inserted.
Statement 85
INSERT INTO players VALUES (81, 45, 'Travis', 'Ishikawa', '6-3', 220, '24/Sep/1983', 'Outfielder', 2)
1 row(s) inserted.
Statement 86
INSERT INTO players VALUES (82, 38, 'Michael', 'Morse', '6-5', 245, '22/Mar/1982', 'Outfielder', 2)
1 row(s) inserted.
Statement 87
INSERT INTO players VALUES (83, 16, 'Angel', 'Pagan', '6-2', 200, '2/Jul/1981', 'Outfielder', 2)
1 row(s) inserted.
Statement 88
INSERT INTO players VALUES (84, 47, 'Jarrett', 'Parker', '6-4', 210, '1/Jan/1989', 'Outfielder', 2)
1 row(s) inserted.
Statement 89
INSERT INTO players VALUES (85, 8, 'Hunter', 'Pence', '6-4', 220, '13/Apr/1983', 'Outfielder', 2)
1 row(s) inserted.
Statement 90
INSERT INTO players VALUES (86, 2, 'Juan', 'Perez', '5-11', 185, '13/Nov/1986', 'Outfielder', 2)
1 row(s) inserted.