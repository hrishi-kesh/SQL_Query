CREATE TABLE Continents 
( 
    ContID NUMBER(5), 
    Continent VARCHAR2(15), 
    CONSTRAINT continent_id_pk PRIMARY KEY(ContID) 
)
Table created.
Statement 2
CREATE TABLE Countries 
( 
    CountryID NUMBER(5), 
    CountryName VARCHAR2(20), 
    Continent NUMBER(5), 
    CONSTRAINT country_continent_id_fk FOREIGN KEY(Continent) REFERENCES Continents(ContID), 
    CONSTRAINT country_id_pk PRIMARY KEY(CountryID) 
)
Table created.
Statement 3
CREATE TABLE Car_Makers 
( 
    ID NUMBER(5), 
    Maker VARCHAR2(15), 
    FullName VARCHAR2(25), 
    Country NUMBER(5), 
    CONSTRAINT car_maker_country_id_fk FOREIGN KEY(Country) REFERENCES Countries(CountryID), 
    CONSTRAINT car_maker_id PRIMARY KEY(ID) 
)
Table created.
Statement 4
CREATE TABLE Model_Details 
( 
    ModelID NUMBER(5), 
    Maker NUMBER(5), 
    Model VARCHAR2(25), 
    CONSTRAINT model_unique UNIQUE(Model), 
    CONSTRAINT model_details_id_pk PRIMARY KEY(ModelID), 
    CONSTRAINT model_maker_fk FOREIGN KEY(Maker) REFERENCES Car_Makers(ID) 
)
Table created.
Statement 5
CREATE TABLE Car_Names 
( 
    ID NUMBER(5), 
    Model VARCHAR2(25), 
    Descr VARCHAR2(40), 
    CONSTRAINT car_names_id_pk PRIMARY KEY(ID), 
    CONSTRAINT car_names_model_fk FOREIGN KEY(Model) REFERENCES Model_Details(Model) 
)
Table created.
Statement 6
CREATE TABLE Car_Details 
( 
    ID NUMBER(5), 
    mpg NUMBER(5,2), 
    cylinders NUMBER(5), 
    edispl NUMBER(10), 
    horsepower NUMBER(10), 
    weight NUMBER(10), 
    accel NUMBER(10,2), 
    year NUMBER(10), 
    CONSTRAINT car_details_id_pk PRIMARY KEY(ID), 
    CONSTRAINT car_details_id_fk FOREIGN KEY(ID) REFERENCES Car_Names(ID) 
)
Table created.
Statement 7
INSERT INTO CONTINENTS VALUES(1,'america')
1 row(s) inserted.
Statement 8
INSERT INTO CONTINENTS VALUES(2,'europe')
1 row(s) inserted.
Statement 9
INSERT INTO CONTINENTS VALUES(3,'asia')
1 row(s) inserted.
Statement 10
INSERT INTO CONTINENTS VALUES(4,'africa')
1 row(s) inserted.
Statement 11
INSERT INTO CONTINENTS VALUES(5,'australia')
1 row(s) inserted.
Statement 12
INSERT INTO COUNTRIES VALUES(1,'usa',1)
1 row(s) inserted.
Statement 13
INSERT INTO COUNTRIES VALUES(2,'germany',2)
1 row(s) inserted.
Statement 14
INSERT INTO COUNTRIES VALUES(3,'france',2)
1 row(s) inserted.
Statement 15
INSERT INTO COUNTRIES VALUES(4,'japan',3)
1 row(s) inserted.
Statement 16
INSERT INTO COUNTRIES VALUES(5,'italy',2)
1 row(s) inserted.
Statement 17
INSERT INTO COUNTRIES VALUES(6,'sweden',2)
1 row(s) inserted.
Statement 18
INSERT INTO COUNTRIES VALUES(7,'uk',2)
1 row(s) inserted.
Statement 19
INSERT INTO COUNTRIES VALUES(8,'korea',3)
1 row(s) inserted.
Statement 20
INSERT INTO COUNTRIES VALUES(9,'russia',2)
1 row(s) inserted.
Statement 21
INSERT INTO COUNTRIES VALUES(10,'nigeria',4)
1 row(s) inserted.
Statement 22
INSERT INTO COUNTRIES VALUES(11,'australia',5)
1 row(s) inserted.
Statement 23
INSERT INTO COUNTRIES VALUES(12,'new zealand',5)
1 row(s) inserted.
Statement 24
INSERT INTO COUNTRIES VALUES(13,'egypt',4)
1 row(s) inserted.
Statement 25
INSERT INTO COUNTRIES VALUES(14,'mexico',1)
1 row(s) inserted.
Statement 26
INSERT INTO COUNTRIES VALUES(15,'brazil',1)
1 row(s) inserted.
Statement 27
INSERT INTO CAR_MAKERS VALUES(1,'amc','American Motor Company',1)
1 row(s) inserted.
Statement 28
INSERT INTO CAR_MAKERS VALUES(2,'volkswagen','Volkswagen',2)
1 row(s) inserted.
Statement 29
INSERT INTO CAR_MAKERS VALUES(3,'bmw','BMW',2)
1 row(s) inserted.
Statement 30
INSERT INTO CAR_MAKERS VALUES(4,'gm','General Motors',1)
1 row(s) inserted.
Statement 31
INSERT INTO CAR_MAKERS VALUES(5,'ford','Ford Motor Company',1)
1 row(s) inserted.
Statement 32
INSERT INTO CAR_MAKERS VALUES(6,'chrysler','Chrysler',1)
1 row(s) inserted.
Statement 33
INSERT INTO CAR_MAKERS VALUES(7,'citroen','Citroen',3)
1 row(s) inserted.
Statement 34
INSERT INTO CAR_MAKERS VALUES(8,'nissan','Nissan Motors',4)
1 row(s) inserted.
Statement 35
INSERT INTO CAR_MAKERS VALUES(9,'fiat','Fiat',5)
1 row(s) inserted.
Statement 36
INSERT INTO CAR_MAKERS VALUES(10,'hi','hi',null)
1 row(s) inserted.
Statement 37
INSERT INTO CAR_MAKERS VALUES(11,'honda','Honda',4)
1 row(s) inserted.
Statement 38
INSERT INTO CAR_MAKERS VALUES(12,'mazda','Mazda',4)
1 row(s) inserted.
Statement 39
INSERT INTO CAR_MAKERS VALUES(13,'daimler benz','Daimler Benz',2)
1 row(s) inserted.
Statement 40
INSERT INTO CAR_MAKERS VALUES(14,'opel','Opel',2)
1 row(s) inserted.
Statement 41
INSERT INTO CAR_MAKERS VALUES(15,'peugeaut','Peugeaut',3)
1 row(s) inserted.
Statement 42
INSERT INTO CAR_MAKERS VALUES(16,'renault','Renault',3)
1 row(s) inserted.
Statement 43
INSERT INTO CAR_MAKERS VALUES(17,'saab','Saab',6)
1 row(s) inserted.
Statement 44
INSERT INTO CAR_MAKERS VALUES(18,'subaru','Subaru',4)
1 row(s) inserted.
Statement 45
INSERT INTO CAR_MAKERS VALUES(19,'toyota','Toyota',4)
1 row(s) inserted.
Statement 46
INSERT INTO CAR_MAKERS VALUES(20,'triumph','Triumph',7)
1 row(s) inserted.
Statement 47
INSERT INTO CAR_MAKERS VALUES(21,'volvo','Volvo',6)
1 row(s) inserted.
Statement 48
INSERT INTO CAR_MAKERS VALUES(22,'kia','Kia Motors',8)
1 row(s) inserted.
Statement 49
INSERT INTO CAR_MAKERS VALUES(23,'hyundai','Hyundai',8)
1 row(s) inserted.
Statement 50
INSERT INTO MODEL_DETAILS VALUES(1,1,'amc')
1 row(s) inserted.
Statement 51
INSERT INTO MODEL_DETAILS VALUES(2,2,'audi')
1 row(s) inserted.
Statement 52
INSERT INTO MODEL_DETAILS VALUES(3,3,'bmw')
1 row(s) inserted.
Statement 53
INSERT INTO MODEL_DETAILS VALUES(4,4,'buick')
1 row(s) inserted.
Statement 54
INSERT INTO MODEL_DETAILS VALUES(5,4,'cadillac')
1 row(s) inserted.
Statement 55
INSERT INTO MODEL_DETAILS VALUES(6,5,'capri')
1 row(s) inserted.
Statement 56
INSERT INTO MODEL_DETAILS VALUES(7,4,'chevrolet')
1 row(s) inserted.
Statement 57
INSERT INTO MODEL_DETAILS VALUES(8,6,'chrysler')
1 row(s) inserted.
Statement 58
INSERT INTO MODEL_DETAILS VALUES(9,7,'citroen')
1 row(s) inserted.
Statement 59
INSERT INTO MODEL_DETAILS VALUES(10,8,'datsun')
1 row(s) inserted.
Statement 60
INSERT INTO MODEL_DETAILS VALUES(11,6,'dodge')
1 row(s) inserted.
Statement 61
INSERT INTO MODEL_DETAILS VALUES(12,9,'fiat')
1 row(s) inserted.
Statement 62
INSERT INTO MODEL_DETAILS VALUES(13,5,'ford')
1 row(s) inserted.
Statement 63
INSERT INTO MODEL_DETAILS VALUES(14,10,'hi')
1 row(s) inserted.
Statement 64
INSERT INTO MODEL_DETAILS VALUES(15,11,'honda')
1 row(s) inserted.
Statement 65
INSERT INTO MODEL_DETAILS VALUES(16,12,'mazda')
1 row(s) inserted.
Statement 66
INSERT INTO MODEL_DETAILS VALUES(17,13,'mercedes')
1 row(s) inserted.
Statement 67
INSERT INTO MODEL_DETAILS VALUES(18,13,'mercedes-benz')
1 row(s) inserted.
Statement 68
INSERT INTO MODEL_DETAILS VALUES(19,5,'mercury')
1 row(s) inserted.
Statement 69
INSERT INTO MODEL_DETAILS VALUES(20,8,'nissan')
1 row(s) inserted.
Statement 70
INSERT INTO MODEL_DETAILS VALUES(21,4,'oldsmobile')
1 row(s) inserted.
Statement 71
INSERT INTO MODEL_DETAILS VALUES(22,14,'opel')
1 row(s) inserted.
Statement 72
INSERT INTO MODEL_DETAILS VALUES(23,15,'peugeot')
1 row(s) inserted.
Statement 73
INSERT INTO MODEL_DETAILS VALUES(24,6,'plymouth')
1 row(s) inserted.
Statement 74
INSERT INTO MODEL_DETAILS VALUES(25,4,'pontiac')
1 row(s) inserted.
Statement 75
INSERT INTO MODEL_DETAILS VALUES(26,16,'renault')
1 row(s) inserted.
Statement 76
INSERT INTO MODEL_DETAILS VALUES(27,17,'saab')
1 row(s) inserted.
Statement 77
INSERT INTO MODEL_DETAILS VALUES(28,18,'subaru')
1 row(s) inserted.
Statement 78
INSERT INTO MODEL_DETAILS VALUES(29,19,'toyota')
1 row(s) inserted.
Statement 79
INSERT INTO MODEL_DETAILS VALUES(30,20,'triumph')
1 row(s) inserted.
Statement 80
INSERT INTO MODEL_DETAILS VALUES(31,2,'volkswagen')
1 row(s) inserted.
Statement 81
INSERT INTO MODEL_DETAILS VALUES(32,21,'volvo')
1 row(s) inserted.
Statement 82
INSERT INTO MODEL_DETAILS VALUES(33,22,'kia')
1 row(s) inserted.
Statement 83
INSERT INTO MODEL_DETAILS VALUES(34,23,'hyundai')
1 row(s) inserted.
Statement 84
INSERT INTO MODEL_DETAILS VALUES(35,6,'jeep')
1 row(s) inserted.
Statement 85
INSERT INTO MODEL_DETAILS VALUES(36,19,'scion')
1 row(s) inserted.
Statement 86
INSERT INTO CAR_NAMES VALUES(1,'chevrolet','chevrolet chevelle malibu')
1 row(s) inserted.
Statement 87
INSERT INTO CAR_NAMES VALUES(2,'buick','buick skylark 320')
1 row(s) inserted.
Statement 88
INSERT INTO CAR_NAMES VALUES(3,'plymouth','plymouth satellite')
1 row(s) inserted.
Statement 89
INSERT INTO CAR_NAMES VALUES(4,'amc','amc rebel sst')
1 row(s) inserted.
Statement 90
INSERT INTO CAR_NAMES VALUES(5,'ford','ford torino')
1 row(s) inserted.
Statement 91
INSERT INTO CAR_NAMES VALUES(6,'ford','ford galaxie 500')
1 row(s) inserted.
Statement 92
INSERT INTO CAR_NAMES VALUES(7,'chevrolet','chevrolet impala')
1 row(s) inserted.
Statement 93
INSERT INTO CAR_NAMES VALUES(8,'plymouth','plymouth fury iii')
1 row(s) inserted.
Statement 94
INSERT INTO CAR_NAMES VALUES(9,'pontiac','pontiac catalina')
1 row(s) inserted.
Statement 95
INSERT INTO CAR_NAMES VALUES(10,'amc','amc ambassador dpl')
1 row(s) inserted.
Statement 96
INSERT INTO CAR_NAMES VALUES(11,'citroen','citroen ds-21 pallas')
1 row(s) inserted.
Statement 97
INSERT INTO CAR_NAMES VALUES(12,'chevrolet','chevrolet chevelle concours (sw)')
1 row(s) inserted.
Statement 98
INSERT INTO CAR_NAMES VALUES(13,'ford','ford torino (sw)')
1 row(s) inserted.
Statement 99
INSERT INTO CAR_NAMES VALUES(14,'plymouth','plymouth satellite (sw)')
1 row(s) inserted.
Statement 100
INSERT INTO CAR_NAMES VALUES(15,'amc','amc rebel sst (sw)')
1 row(s) inserted.
Statement 101
INSERT INTO CAR_NAMES VALUES(16,'dodge','dodge challenger se')
1 row(s) inserted.
Statement 102
INSERT INTO CAR_NAMES VALUES(17,'plymouth','plymouth cuda 340')
1 row(s) inserted.
Statement 103
INSERT INTO CAR_NAMES VALUES(18,'ford','ford mustang boss 302')
1 row(s) inserted.
Statement 104
INSERT INTO CAR_NAMES VALUES(19,'chevrolet','chevrolet monte carlo')
1 row(s) inserted.
Statement 105
INSERT INTO CAR_NAMES VALUES(20,'buick','buick estate wagon (sw)')
1 row(s) inserted.
Statement 106
INSERT INTO CAR_NAMES VALUES(21,'toyota','toyota corona mark ii')
1 row(s) inserted.
Statement 107
INSERT INTO CAR_NAMES VALUES(22,'plymouth','plymouth duster')
1 row(s) inserted.
Statement 108
INSERT INTO CAR_NAMES VALUES(23,'amc','amc hornet')
1 row(s) inserted.
Statement 109
INSERT INTO CAR_NAMES VALUES(24,'ford','ford maverick')
1 row(s) inserted.
Statement 110
INSERT INTO CAR_NAMES VALUES(25,'datsun','datsun pl510')
1 row(s) inserted.
Statement 111
INSERT INTO CAR_NAMES VALUES(26,'volkswagen','volkswagen 1131 deluxe sedan')
1 row(s) inserted.
Statement 112
INSERT INTO CAR_NAMES VALUES(27,'peugeot','peugeot 504')
1 row(s) inserted.
Statement 113
INSERT INTO CAR_NAMES VALUES(28,'audi','audi 100 ls')
1 row(s) inserted.
Statement 114
INSERT INTO CAR_NAMES VALUES(29,'saab','saab 99e')
1 row(s) inserted.
Statement 115
INSERT INTO CAR_NAMES VALUES(30,'bmw','bmw 2002')
1 row(s) inserted.
Statement 116
INSERT INTO CAR_NAMES VALUES(31,'amc','amc gremlin')
1 row(s) inserted.
Statement 117
INSERT INTO CAR_NAMES VALUES(32,'ford','ford f250')
1 row(s) inserted.
Statement 118
INSERT INTO CAR_NAMES VALUES(33,'chevrolet','chevy c20')
1 row(s) inserted.
Statement 119
INSERT INTO CAR_NAMES VALUES(34,'dodge','dodge d200')
1 row(s) inserted.
Statement 120
INSERT INTO CAR_NAMES VALUES(35,'hi','hi 1200d')
1 row(s) inserted.
Statement 121
INSERT INTO CAR_NAMES VALUES(36,'datsun','datsun pl510')
1 row(s) inserted.
Statement 122
INSERT INTO CAR_NAMES VALUES(37,'chevrolet','chevrolet vega 2300')
1 row(s) inserted.
Statement 123
INSERT INTO CAR_NAMES VALUES(38,'toyota','toyota corona')
1 row(s) inserted.
Statement 124
INSERT INTO CAR_NAMES VALUES(39,'ford','ford pinto')
1 row(s) inserted.
Statement 125
INSERT INTO CAR_NAMES VALUES(40,'volkswagen','volkswagen super beetle 117')
1 row(s) inserted.
Statement 126
INSERT INTO CAR_NAMES VALUES(41,'amc','amc gremlin')
1 row(s) inserted.
Statement 127
INSERT INTO CAR_NAMES VALUES(42,'plymouth','plymouth satellite custom')
1 row(s) inserted.
Statement 128
INSERT INTO CAR_NAMES VALUES(43,'chevrolet','chevrolet chevelle malibu')
1 row(s) inserted.
Statement 129
INSERT INTO CAR_NAMES VALUES(44,'ford','ford torino 500')
1 row(s) inserted.
Statement 130
INSERT INTO CAR_NAMES VALUES(45,'amc','amc matador')
1 row(s) inserted.
Statement 131
INSERT INTO CAR_NAMES VALUES(46,'chevrolet','chevrolet impala')
1 row(s) inserted.
Statement 132
INSERT INTO CAR_NAMES VALUES(47,'pontiac','pontiac catalina brougham')
1 row(s) inserted.
Statement 133
INSERT INTO CAR_NAMES VALUES(48,'ford','ford galaxie 500')
1 row(s) inserted.
Statement 134
INSERT INTO CAR_NAMES VALUES(49,'plymouth','plymouth fury iii')
1 row(s) inserted.
Statement 135
INSERT INTO CAR_NAMES VALUES(50,'dodge','dodge monaco (sw)')
1 row(s) inserted.
Statement 136
INSERT INTO CAR_NAMES VALUES(51,'ford','ford country squire (sw)')
1 row(s) inserted.
Statement 137
INSERT INTO CAR_NAMES VALUES(52,'pontiac','pontiac safari (sw)')
1 row(s) inserted.
Statement 138
INSERT INTO CAR_NAMES VALUES(53,'amc','amc hornet sportabout (sw)')
1 row(s) inserted.
Statement 139
INSERT INTO CAR_NAMES VALUES(54,'chevrolet','chevrolet vega (sw)')
1 row(s) inserted.
Statement 140
INSERT INTO CAR_NAMES VALUES(55,'pontiac','pontiac firebird')
1 row(s) inserted.
Statement 141
INSERT INTO CAR_NAMES VALUES(56,'ford','ford mustang')
1 row(s) inserted.
Statement 142
INSERT INTO CAR_NAMES VALUES(57,'mercury','mercury capri 2000')
1 row(s) inserted.
Statement 143
INSERT INTO CAR_NAMES VALUES(58,'opel','opel 1900')
1 row(s) inserted.
Statement 144
INSERT INTO CAR_NAMES VALUES(59,'peugeot','peugeot 304')
1 row(s) inserted.
Statement 145
INSERT INTO CAR_NAMES VALUES(60,'fiat','fiat 124b')
1 row(s) inserted.
Statement 146
INSERT INTO CAR_NAMES VALUES(61,'toyota','toyota corolla 1200')
1 row(s) inserted.
Statement 147
INSERT INTO CAR_NAMES VALUES(62,'datsun','datsun 1200')
1 row(s) inserted.
Statement 148
INSERT INTO CAR_NAMES VALUES(63,'volkswagen','volkswagen model 111')
1 row(s) inserted.
Statement 149
INSERT INTO CAR_NAMES VALUES(64,'plymouth','plymouth cricket')
1 row(s) inserted.
Statement 150
INSERT INTO CAR_NAMES VALUES(65,'toyota','toyota corona hardtop')
1 row(s) inserted.
Statement 151
INSERT INTO CAR_NAMES VALUES(66,'dodge','dodge colt hardtop')
1 row(s) inserted.
Statement 152
INSERT INTO CAR_NAMES VALUES(67,'volkswagen','volkswagen type 3')
1 row(s) inserted.
Statement 153
INSERT INTO CAR_NAMES VALUES(68,'chevrolet','chevrolet vega')
1 row(s) inserted.
Statement 154
INSERT INTO CAR_NAMES VALUES(69,'ford','ford pinto runabout')
1 row(s) inserted.
Statement 155
INSERT INTO CAR_NAMES VALUES(70,'chevrolet','chevrolet impala')
1 row(s) inserted.
Statement 156
INSERT INTO CAR_NAMES VALUES(71,'pontiac','pontiac catalina')
1 row(s) inserted.
Statement 157
INSERT INTO CAR_NAMES VALUES(72,'plymouth','plymouth fury iii')
1 row(s) inserted.
Statement 158
INSERT INTO CAR_NAMES VALUES(73,'ford','ford galaxie 500')
1 row(s) inserted.
Statement 159
INSERT INTO CAR_NAMES VALUES(74,'amc','amc ambassador sst')
1 row(s) inserted.
Statement 160
INSERT INTO CAR_NAMES VALUES(75,'mercury','mercury marquis')
1 row(s) inserted.
Statement 161
INSERT INTO CAR_NAMES VALUES(76,'buick','buick lesabre custom')
1 row(s) inserted.
Statement 162
INSERT INTO CAR_NAMES VALUES(77,'oldsmobile','oldsmobile delta 88 royale')
1 row(s) inserted.
Statement 163
INSERT INTO CAR_NAMES VALUES(78,'chrysler','chrysler newport royal')
1 row(s) inserted.
Statement 164
INSERT INTO CAR_NAMES VALUES(79,'mazda','mazda rx2 coupe')
1 row(s) inserted.
Statement 165
INSERT INTO CAR_NAMES VALUES(80,'amc','amc matador (sw)')
1 row(s) inserted.
Statement 166
INSERT INTO CAR_NAMES VALUES(81,'chevrolet','chevrolet chevelle concours (sw)')
1 row(s) inserted.
Statement 167
INSERT INTO CAR_NAMES VALUES(82,'ford','ford gran torino (sw)')
1 row(s) inserted.
Statement 168
INSERT INTO CAR_NAMES VALUES(83,'plymouth','plymouth satellite custom (sw)')
1 row(s) inserted.
Statement 169
INSERT INTO CAR_NAMES VALUES(84,'volvo','volvo 145e (sw)')
1 row(s) inserted.
Statement 170
INSERT INTO CAR_NAMES VALUES(85,'volkswagen','volkswagen 411 (sw)')
1 row(s) inserted.
Statement 171
INSERT INTO CAR_NAMES VALUES(86,'peugeot','peugeot 504 (sw)')
1 row(s) inserted.
Statement 172
INSERT INTO CAR_NAMES VALUES(87,'renault','renault 12 (sw)')
1 row(s) inserted.
Statement 173
INSERT INTO CAR_NAMES VALUES(88,'ford','ford pinto (sw)')
1 row(s) inserted.
Statement 174
INSERT INTO CAR_NAMES VALUES(89,'datsun','datsun 510 (sw)')
1 row(s) inserted.
Statement 175
INSERT INTO CAR_NAMES VALUES(90,'toyota','toyota corona mark ii (sw)')
1 row(s) inserted.
Statement 176
INSERT INTO CAR_NAMES VALUES(91,'dodge','dodge colt (sw)')
1 row(s) inserted.
Statement 177
INSERT INTO CAR_NAMES VALUES(92,'toyota','toyota corolla 1600 (sw)')
1 row(s) inserted.
Statement 178
INSERT INTO CAR_NAMES VALUES(93,'buick','buick century 350')
1 row(s) inserted.
Statement 179
INSERT INTO CAR_NAMES VALUES(94,'amc','amc matador')
1 row(s) inserted.
Statement 180
INSERT INTO CAR_NAMES VALUES(95,'chevrolet','chevrolet malibu')
1 row(s) inserted.
Statement 181
INSERT INTO CAR_NAMES VALUES(96,'ford','ford gran torino')
1 row(s) inserted.
Statement 182
INSERT INTO CAR_NAMES VALUES(97,'dodge','dodge coronet custom')
1 row(s) inserted.
Statement 183
INSERT INTO CAR_NAMES VALUES(98,'mercury','mercury marquis brougham')
1 row(s) inserted.
Statement 184
INSERT INTO CAR_NAMES VALUES(99,'chevrolet','chevrolet caprice classic')
1 row(s) inserted.
Statement 185
INSERT INTO CAR_NAMES VALUES(100,'ford','ford ltd')
1 row(s) inserted.
Statement 186
INSERT INTO CAR_NAMES VALUES(101,'plymouth','plymouth fury gran sedan')
1 row(s) inserted.
Statement 187
INSERT INTO CAR_NAMES VALUES(102,'chrysler','chrysler new yorker brougham')
1 row(s) inserted.
Statement 188
INSERT INTO CAR_NAMES VALUES(103,'buick','buick electra 225 custom')
1 row(s) inserted.
Statement 189
INSERT INTO CAR_NAMES VALUES(104,'amc','amc ambassador brougham')
1 row(s) inserted.
Statement 190
INSERT INTO CAR_NAMES VALUES(105,'plymouth','plymouth valiant')
1 row(s) inserted.
Statement 191
INSERT INTO CAR_NAMES VALUES(106,'chevrolet','chevrolet nova custom')
1 row(s) inserted.
Statement 192
INSERT INTO CAR_NAMES VALUES(107,'amc','amc hornet')
1 row(s) inserted.
Statement 193
INSERT INTO CAR_NAMES VALUES(108,'ford','ford maverick')
1 row(s) inserted.
Statement 194
INSERT INTO CAR_NAMES VALUES(109,'plymouth','plymouth duster')
1 row(s) inserted.
Statement 195
INSERT INTO CAR_NAMES VALUES(110,'volkswagen','volkswagen super beetle')
1 row(s) inserted.
Statement 196
INSERT INTO CAR_NAMES VALUES(111,'chevrolet','chevrolet impala')
1 row(s) inserted.
Statement 197
INSERT INTO CAR_NAMES VALUES(112,'ford','ford country')
1 row(s) inserted.
Statement 198
INSERT INTO CAR_NAMES VALUES(113,'plymouth','plymouth custom suburb')
1 row(s) inserted.
Statement 199
INSERT INTO CAR_NAMES VALUES(114,'oldsmobile','oldsmobile vista cruiser')
1 row(s) inserted.
Statement 200
INSERT INTO CAR_NAMES VALUES(115,'amc','amc gremlin')
1 row(s) inserted.
Statement 201
INSERT INTO CAR_NAMES VALUES(116,'toyota','toyota carina')
1 row(s) inserted.
Statement 202
INSERT INTO CAR_NAMES VALUES(117,'chevrolet','chevrolet vega')
1 row(s) inserted.
Statement 203
INSERT INTO CAR_NAMES VALUES(118,'datsun','datsun 610')
1 row(s) inserted.
Statement 204
INSERT INTO CAR_NAMES VALUES(119,'mazda','mazda rx3')
1 row(s) inserted.
Statement 205
INSERT INTO CAR_NAMES VALUES(120,'ford','ford pinto')
1 row(s) inserted.
Statement 206
INSERT INTO CAR_NAMES VALUES(121,'mercury','mercury capri v6')
1 row(s) inserted.
Statement 207
INSERT INTO CAR_NAMES VALUES(122,'fiat','fiat 124 sport coupe')
1 row(s) inserted.
Statement 208
INSERT INTO CAR_NAMES VALUES(123,'chevrolet','chevrolet monte carlo s')
1 row(s) inserted.
Statement 209
INSERT INTO CAR_NAMES VALUES(124,'pontiac','pontiac grand prix')
1 row(s) inserted.
Statement 210
INSERT INTO CAR_NAMES VALUES(125,'fiat','fiat 128')
1 row(s) inserted.
Statement 211
INSERT INTO CAR_NAMES VALUES(126,'opel','opel manta')
1 row(s) inserted.
Statement 212
INSERT INTO CAR_NAMES VALUES(127,'audi','audi 100ls')
1 row(s) inserted.
Statement 213
INSERT INTO CAR_NAMES VALUES(128,'volvo','volvo 144ea')
1 row(s) inserted.
Statement 214
INSERT INTO CAR_NAMES VALUES(129,'dodge','dodge dart custom')
1 row(s) inserted.
Statement 215
INSERT INTO CAR_NAMES VALUES(130,'saab','saab 99le')
1 row(s) inserted.
Statement 216
INSERT INTO CAR_NAMES VALUES(131,'toyota','toyota mark ii')
1 row(s) inserted.
Statement 217
INSERT INTO CAR_NAMES VALUES(132,'oldsmobile','oldsmobile omega')
1 row(s) inserted.
Statement 218
INSERT INTO CAR_NAMES VALUES(133,'plymouth','plymouth duster')
1 row(s) inserted.
Statement 219
INSERT INTO CAR_NAMES VALUES(134,'ford','ford maverick')
1 row(s) inserted.
Statement 220
INSERT INTO CAR_NAMES VALUES(135,'amc','amc hornet')
1 row(s) inserted.
Statement 221
INSERT INTO CAR_NAMES VALUES(136,'chevrolet','chevrolet nova')
1 row(s) inserted.
Statement 222
INSERT INTO CAR_NAMES VALUES(137,'datsun','datsun b210')
1 row(s) inserted.
Statement 223
INSERT INTO CAR_NAMES VALUES(138,'ford','ford pinto')
1 row(s) inserted.
Statement 224
INSERT INTO CAR_NAMES VALUES(139,'toyota','toyota corolla 1200')
1 row(s) inserted.
Statement 225
INSERT INTO CAR_NAMES VALUES(140,'chevrolet','chevrolet vega')
1 row(s) inserted.
Statement 226
INSERT INTO CAR_NAMES VALUES(141,'chevrolet','chevrolet chevelle malibu classic')
1 row(s) inserted.
Statement 227
INSERT INTO CAR_NAMES VALUES(142,'amc','amc matador')
1 row(s) inserted.
Statement 228
INSERT INTO CAR_NAMES VALUES(143,'plymouth','plymouth satellite sebring')
1 row(s) inserted.
Statement 229
INSERT INTO CAR_NAMES VALUES(144,'ford','ford gran torino')
1 row(s) inserted.
Statement 230
INSERT INTO CAR_NAMES VALUES(145,'buick','buick century luxus (sw)')
1 row(s) inserted.
Statement 231
INSERT INTO CAR_NAMES VALUES(146,'dodge','dodge coronet custom (sw)')
1 row(s) inserted.
Statement 232
INSERT INTO CAR_NAMES VALUES(147,'ford','ford gran torino (sw)')
1 row(s) inserted.
Statement 233
INSERT INTO CAR_NAMES VALUES(148,'amc','amc matador (sw)')
1 row(s) inserted.
Statement 234
INSERT INTO CAR_NAMES VALUES(149,'audi','audi fox')
1 row(s) inserted.
Statement 235
INSERT INTO CAR_NAMES VALUES(150,'volkswagen','volkswagen dasher')
1 row(s) inserted.
Statement 236
INSERT INTO CAR_NAMES VALUES(151,'opel','opel manta')
1 row(s) inserted.
Statement 237
INSERT INTO CAR_NAMES VALUES(152,'toyota','toyota corona')
1 row(s) inserted.
Statement 238
INSERT INTO CAR_NAMES VALUES(153,'datsun','datsun 710')
1 row(s) inserted.
Statement 239
INSERT INTO CAR_NAMES VALUES(154,'dodge','dodge colt')
1 row(s) inserted.
Statement 240
INSERT INTO CAR_NAMES VALUES(155,'fiat','fiat 128')
1 row(s) inserted.
Statement 241
INSERT INTO CAR_NAMES VALUES(156,'fiat','fiat 124 tc')
1 row(s) inserted.
Statement 242
INSERT INTO CAR_NAMES VALUES(157,'honda','honda civic')
1 row(s) inserted.
Statement 243
INSERT INTO CAR_NAMES VALUES(158,'subaru','subaru')
1 row(s) inserted.
Statement 244
INSERT INTO CAR_NAMES VALUES(159,'fiat','fiat x1.9')
1 row(s) inserted.
Statement 245
INSERT INTO CAR_NAMES VALUES(160,'plymouth','plymouth valiant custom')
1 row(s) inserted.
Statement 246
INSERT INTO CAR_NAMES VALUES(161,'chevrolet','chevrolet nova')
1 row(s) inserted.
Statement 247
INSERT INTO CAR_NAMES VALUES(162,'mercury','mercury monarch')
1 row(s) inserted.
Statement 248
INSERT INTO CAR_NAMES VALUES(163,'ford','ford maverick')
1 row(s) inserted.
Statement 249
INSERT INTO CAR_NAMES VALUES(164,'pontiac','pontiac catalina')
1 row(s) inserted.
Statement 250
INSERT INTO CAR_NAMES VALUES(165,'chevrolet','chevrolet bel air')
1 row(s) inserted.
Statement 251
INSERT INTO CAR_NAMES VALUES(166,'plymouth','plymouth grand fury')
1 row(s) inserted.
Statement 252
INSERT INTO CAR_NAMES VALUES(167,'ford','ford ltd')
1 row(s) inserted.
Statement 253
INSERT INTO CAR_NAMES VALUES(168,'buick','buick century')
1 row(s) inserted.
Statement 254
INSERT INTO CAR_NAMES VALUES(169,'chevrolet','chevrolet chevelle malibu')
1 row(s) inserted.
Statement 255
INSERT INTO CAR_NAMES VALUES(170,'amc','amc matador')
1 row(s) inserted.
Statement 256
INSERT INTO CAR_NAMES VALUES(171,'plymouth','plymouth fury')
1 row(s) inserted.
Statement 257
INSERT INTO CAR_NAMES VALUES(172,'buick','buick skyhawk')
1 row(s) inserted.
Statement 258
INSERT INTO CAR_NAMES VALUES(173,'chevrolet','chevrolet monza 2+2')
1 row(s) inserted.
Statement 259
INSERT INTO CAR_NAMES VALUES(174,'ford','ford mustang ii')
1 row(s) inserted.
Statement 260
INSERT INTO CAR_NAMES VALUES(175,'toyota','toyota corolla')
1 row(s) inserted.
Statement 261
INSERT INTO CAR_NAMES VALUES(176,'ford','ford pinto')
1 row(s) inserted.
Statement 262
INSERT INTO CAR_NAMES VALUES(177,'amc','amc gremlin')
1 row(s) inserted.
Statement 263
INSERT INTO CAR_NAMES VALUES(178,'pontiac','pontiac astro')
1 row(s) inserted.
Statement 264
INSERT INTO CAR_NAMES VALUES(179,'toyota','toyota corona')
1 row(s) inserted.
Statement 265
INSERT INTO CAR_NAMES VALUES(180,'volkswagen','volkswagen dasher')
1 row(s) inserted.
Statement 266
INSERT INTO CAR_NAMES VALUES(181,'datsun','datsun 710')
1 row(s) inserted.
Statement 267
INSERT INTO CAR_NAMES VALUES(182,'ford','ford pinto')
1 row(s) inserted.
Statement 268
INSERT INTO CAR_NAMES VALUES(183,'volkswagen','volkswagen rabbit')
1 row(s) inserted.
Statement 269
INSERT INTO CAR_NAMES VALUES(184,'amc','amc pacer')
1 row(s) inserted.
Statement 270
INSERT INTO CAR_NAMES VALUES(185,'audi','audi 100ls')
1 row(s) inserted.
Statement 271
INSERT INTO CAR_NAMES VALUES(186,'peugeot','peugeot 504')
1 row(s) inserted.
Statement 272
INSERT INTO CAR_NAMES VALUES(187,'volvo','volvo 244dl')
1 row(s) inserted.
Statement 273
INSERT INTO CAR_NAMES VALUES(188,'saab','saab 99le')
1 row(s) inserted.
Statement 274
INSERT INTO CAR_NAMES VALUES(189,'honda','honda civic cvcc')
1 row(s) inserted.
Statement 275
INSERT INTO CAR_NAMES VALUES(190,'fiat','fiat 131')
1 row(s) inserted.
Statement 276
INSERT INTO CAR_NAMES VALUES(191,'opel','opel 1900')
1 row(s) inserted.
Statement 277
INSERT INTO CAR_NAMES VALUES(192,'capri','capri ii')
1 row(s) inserted.
Statement 278
INSERT INTO CAR_NAMES VALUES(193,'dodge','dodge colt')
1 row(s) inserted.
Statement 279
INSERT INTO CAR_NAMES VALUES(194,'renault','renault 12tl')
1 row(s) inserted.
Statement 280
INSERT INTO CAR_NAMES VALUES(195,'chevrolet','chevrolet chevelle malibu classic')
1 row(s) inserted.
Statement 281
INSERT INTO CAR_NAMES VALUES(196,'dodge','dodge coronet brougham')
1 row(s) inserted.
Statement 282
INSERT INTO CAR_NAMES VALUES(197,'amc','amc matador')
1 row(s) inserted.
Statement 283
INSERT INTO CAR_NAMES VALUES(198,'ford','ford gran torino')
1 row(s) inserted.
Statement 284
INSERT INTO CAR_NAMES VALUES(199,'plymouth','plymouth valiant')
1 row(s) inserted.
Statement 285
INSERT INTO CAR_NAMES VALUES(200,'chevrolet','chevrolet nova')
1 row(s) inserted.
Statement 286
INSERT INTO CAR_NAMES VALUES(201,'ford','ford maverick')
1 row(s) inserted.
Statement 287
INSERT INTO CAR_NAMES VALUES(202,'amc','amc hornet')
1 row(s) inserted.
Statement 288
INSERT INTO CAR_NAMES VALUES(203,'chevrolet','chevrolet chevette')
1 row(s) inserted.
Statement 289
INSERT INTO CAR_NAMES VALUES(204,'chevrolet','chevrolet woody')
1 row(s) inserted.
Statement 290
INSERT INTO CAR_NAMES VALUES(205,'volkswagen','vw rabbit')
1 row(s) inserted.
Statement 291
INSERT INTO CAR_NAMES VALUES(206,'honda','honda civic')
1 row(s) inserted.
Statement 292
INSERT INTO CAR_NAMES VALUES(207,'dodge','dodge aspen se')
1 row(s) inserted.
Statement 293
INSERT INTO CAR_NAMES VALUES(208,'ford','ford granada ghia')
1 row(s) inserted.
Statement 294
INSERT INTO CAR_NAMES VALUES(209,'pontiac','pontiac ventura sj')
1 row(s) inserted.
Statement 295
INSERT INTO CAR_NAMES VALUES(210,'amc','amc pacer d/l')
1 row(s) inserted.
Statement 296
INSERT INTO CAR_NAMES VALUES(211,'volkswagen','volkswagen rabbit')
1 row(s) inserted.
Statement 297
INSERT INTO CAR_NAMES VALUES(212,'datsun','datsun b-210')
1 row(s) inserted.
Statement 298
INSERT INTO CAR_NAMES VALUES(213,'toyota','toyota corolla')
1 row(s) inserted.
Statement 299
INSERT INTO CAR_NAMES VALUES(214,'ford','ford pinto')
1 row(s) inserted.
Statement 300
INSERT INTO CAR_NAMES VALUES(215,'volvo','volvo 245')
1 row(s) inserted.
Statement 301
INSERT INTO CAR_NAMES VALUES(216,'plymouth','plymouth volare premier v8')
1 row(s) inserted.
Statement 302
INSERT INTO CAR_NAMES VALUES(217,'peugeot','peugeot 504')
1 row(s) inserted.
Statement 303
INSERT INTO CAR_NAMES VALUES(218,'toyota','toyota mark ii')
1 row(s) inserted.
Statement 304
INSERT INTO CAR_NAMES VALUES(219,'mercedes-benz','mercedes-benz 280s')
1 row(s) inserted.
Statement 305
INSERT INTO CAR_NAMES VALUES(220,'cadillac','cadillac seville')
1 row(s) inserted.
Statement 306
INSERT INTO CAR_NAMES VALUES(221,'chevrolet','chevy c10')
1 row(s) inserted.
Statement 307
INSERT INTO CAR_NAMES VALUES(222,'ford','ford f108')
1 row(s) inserted.
Statement 308
INSERT INTO CAR_NAMES VALUES(223,'dodge','dodge d100')
1 row(s) inserted.
Statement 309
INSERT INTO CAR_NAMES VALUES(224,'honda','honda accord cvcc')
1 row(s) inserted.
Statement 310
INSERT INTO CAR_NAMES VALUES(225,'buick','buick opel isuzu deluxe')
1 row(s) inserted.
Statement 311
INSERT INTO CAR_NAMES VALUES(226,'renault','renault 5 gtl')
1 row(s) inserted.
Statement 312
INSERT INTO CAR_NAMES VALUES(227,'plymouth','plymouth arrow gs')
1 row(s) inserted.
Statement 313
INSERT INTO CAR_NAMES VALUES(228,'datsun','datsun f-10 hatchback')
1 row(s) inserted.
Statement 314
INSERT INTO CAR_NAMES VALUES(229,'chevrolet','chevrolet caprice classic')
1 row(s) inserted.
Statement 315
INSERT INTO CAR_NAMES VALUES(230,'oldsmobile','oldsmobile cutlass supreme')
1 row(s) inserted.
Statement 316
INSERT INTO CAR_NAMES VALUES(231,'dodge','dodge monaco brougham')
1 row(s) inserted.
Statement 317
INSERT INTO CAR_NAMES VALUES(232,'mercury','mercury cougar brougham')
1 row(s) inserted.
Statement 318
INSERT INTO CAR_NAMES VALUES(233,'chevrolet','chevrolet concours')
1 row(s) inserted.
Statement 319
INSERT INTO CAR_NAMES VALUES(234,'buick','buick skylark')
1 row(s) inserted.
Statement 320
INSERT INTO CAR_NAMES VALUES(235,'plymouth','plymouth volare custom')
1 row(s) inserted.
Statement 321
INSERT INTO CAR_NAMES VALUES(236,'ford','ford granada')
1 row(s) inserted.
Statement 322
INSERT INTO CAR_NAMES VALUES(237,'pontiac','pontiac grand prix lj')
1 row(s) inserted.
Statement 323
INSERT INTO CAR_NAMES VALUES(238,'chevrolet','chevrolet monte carlo landau')
1 row(s) inserted.
Statement 324
INSERT INTO CAR_NAMES VALUES(239,'chrysler','chrysler cordoba')
1 row(s) inserted.
Statement 325
INSERT INTO CAR_NAMES VALUES(240,'ford','ford thunderbird')
1 row(s) inserted.
Statement 326
INSERT INTO CAR_NAMES VALUES(241,'volkswagen','volkswagen rabbit custom')
1 row(s) inserted.
Statement 327
INSERT INTO CAR_NAMES VALUES(242,'pontiac','pontiac sunbird coupe')
1 row(s) inserted.
Statement 328
INSERT INTO CAR_NAMES VALUES(243,'toyota','toyota corolla liftback')
1 row(s) inserted.
Statement 329
INSERT INTO CAR_NAMES VALUES(244,'ford','ford mustang ii 2+2')
1 row(s) inserted.
Statement 330
INSERT INTO CAR_NAMES VALUES(245,'chevrolet','chevrolet chevette')
1 row(s) inserted.
Statement 331
INSERT INTO CAR_NAMES VALUES(246,'dodge','dodge colt m/m')
1 row(s) inserted.
Statement 332
INSERT INTO CAR_NAMES VALUES(247,'subaru','subaru dl')
1 row(s) inserted.
Statement 333
INSERT INTO CAR_NAMES VALUES(248,'volkswagen','volkswagen dasher')
1 row(s) inserted.
Statement 334
INSERT INTO CAR_NAMES VALUES(249,'datsun','datsun 810')
1 row(s) inserted.
Statement 335
INSERT INTO CAR_NAMES VALUES(250,'bmw','bmw 320i')
1 row(s) inserted.
Statement 336
INSERT INTO CAR_NAMES VALUES(251,'mazda','mazda rx-4')
1 row(s) inserted.
Statement 337
INSERT INTO CAR_NAMES VALUES(252,'volkswagen','volkswagen rabbit custom diesel')
1 row(s) inserted.
Statement 338
INSERT INTO CAR_NAMES VALUES(253,'ford','ford fiesta')
1 row(s) inserted.
Statement 339
INSERT INTO CAR_NAMES VALUES(254,'mazda','mazda glc deluxe')
1 row(s) inserted.
Statement 340
INSERT INTO CAR_NAMES VALUES(255,'datsun','datsun b210 gx')
1 row(s) inserted.
Statement 341
INSERT INTO CAR_NAMES VALUES(256,'honda','honda civic cvcc')
1 row(s) inserted.
Statement 342
INSERT INTO CAR_NAMES VALUES(257,'oldsmobile','oldsmobile cutlass salon brougham')
1 row(s) inserted.
Statement 343
INSERT INTO CAR_NAMES VALUES(258,'dodge','dodge diplomat')
1 row(s) inserted.
Statement 344
INSERT INTO CAR_NAMES VALUES(259,'mercury','mercury monarch ghia')
1 row(s) inserted.
Statement 345
INSERT INTO CAR_NAMES VALUES(260,'pontiac','pontiac phoenix lj')
1 row(s) inserted.
Statement 346
INSERT INTO CAR_NAMES VALUES(261,'chevrolet','chevrolet malibu')
1 row(s) inserted.
Statement 347
INSERT INTO CAR_NAMES VALUES(262,'ford','ford fairmont (auto)')
1 row(s) inserted.
Statement 348
INSERT INTO CAR_NAMES VALUES(263,'ford','ford fairmont (man)')
1 row(s) inserted.
Statement 349
INSERT INTO CAR_NAMES VALUES(264,'plymouth','plymouth volare')
1 row(s) inserted.
Statement 350
INSERT INTO CAR_NAMES VALUES(265,'amc','amc concord')
1 row(s) inserted.
Statement 351
INSERT INTO CAR_NAMES VALUES(266,'buick','buick century special')
1 row(s) inserted.
Statement 352
INSERT INTO CAR_NAMES VALUES(267,'mercury','mercury zephyr')
1 row(s) inserted.
Statement 353
INSERT INTO CAR_NAMES VALUES(268,'dodge','dodge aspen')
1 row(s) inserted.
Statement 354
INSERT INTO CAR_NAMES VALUES(269,'amc','amc concord d/l')
1 row(s) inserted.
Statement 355
INSERT INTO CAR_NAMES VALUES(270,'chevrolet','chevrolet monte carlo landau')
1 row(s) inserted.
Statement 356
INSERT INTO CAR_NAMES VALUES(271,'buick','buick regal sport coupe (turbo)')
1 row(s) inserted.
Statement 357
INSERT INTO CAR_NAMES VALUES(272,'ford','ford futura')
1 row(s) inserted.
Statement 358
INSERT INTO CAR_NAMES VALUES(273,'dodge','dodge magnum xe')
1 row(s) inserted.
Statement 359
INSERT INTO CAR_NAMES VALUES(274,'chevrolet','chevrolet chevette')
1 row(s) inserted.
Statement 360
INSERT INTO CAR_NAMES VALUES(275,'toyota','toyota corona')
1 row(s) inserted.
Statement 361
INSERT INTO CAR_NAMES VALUES(276,'datsun','datsun 510')
1 row(s) inserted.
Statement 362
INSERT INTO CAR_NAMES VALUES(277,'dodge','dodge omni')
1 row(s) inserted.
Statement 363
INSERT INTO CAR_NAMES VALUES(278,'toyota','toyota celica gt liftback')
1 row(s) inserted.
Statement 364
INSERT INTO CAR_NAMES VALUES(279,'plymouth','plymouth sapporo')
1 row(s) inserted.
Statement 365
INSERT INTO CAR_NAMES VALUES(280,'oldsmobile','oldsmobile starfire sx')
1 row(s) inserted.
Statement 366
INSERT INTO CAR_NAMES VALUES(281,'datsun','datsun 200-sx')
1 row(s) inserted.
Statement 367
INSERT INTO CAR_NAMES VALUES(282,'audi','audi 5000')
1 row(s) inserted.
Statement 368
INSERT INTO CAR_NAMES VALUES(283,'volvo','volvo 264gl')
1 row(s) inserted.
Statement 369
INSERT INTO CAR_NAMES VALUES(284,'saab','saab 99gle')
1 row(s) inserted.
Statement 370
INSERT INTO CAR_NAMES VALUES(285,'peugeot','peugeot 604sl')
1 row(s) inserted.
Statement 371
INSERT INTO CAR_NAMES VALUES(286,'volkswagen','volkswagen scirocco')
1 row(s) inserted.
Statement 372
INSERT INTO CAR_NAMES VALUES(287,'honda','honda accord lx')
1 row(s) inserted.
Statement 373
INSERT INTO CAR_NAMES VALUES(288,'pontiac','pontiac lemans v6')
1 row(s) inserted.
Statement 374
INSERT INTO CAR_NAMES VALUES(289,'mercury','mercury zephyr 6')
1 row(s) inserted.
Statement 375
INSERT INTO CAR_NAMES VALUES(290,'ford','ford fairmont 4')
1 row(s) inserted.
Statement 376
INSERT INTO CAR_NAMES VALUES(291,'amc','amc concord dl 6')
1 row(s) inserted.
Statement 377
INSERT INTO CAR_NAMES VALUES(292,'dodge','dodge aspen 6')
1 row(s) inserted.
Statement 378
INSERT INTO CAR_NAMES VALUES(293,'chevrolet','chevrolet caprice classic')
1 row(s) inserted.
Statement 379
INSERT INTO CAR_NAMES VALUES(294,'ford','ford ltd landau')
1 row(s) inserted.
Statement 380
INSERT INTO CAR_NAMES VALUES(295,'mercury','mercury grand marquis')
1 row(s) inserted.
Statement 381
INSERT INTO CAR_NAMES VALUES(296,'dodge','dodge st. regis')
1 row(s) inserted.
Statement 382
INSERT INTO CAR_NAMES VALUES(297,'buick','buick estate wagon (sw)')
1 row(s) inserted.
Statement 383
INSERT INTO CAR_NAMES VALUES(298,'ford','ford country squire (sw)')
1 row(s) inserted.
Statement 384
INSERT INTO CAR_NAMES VALUES(299,'chevrolet','chevrolet malibu classic (sw)')
1 row(s) inserted.
Statement 385
INSERT INTO CAR_NAMES VALUES(300,'chrysler','chrysler lebaron town @ country (sw)')
1 row(s) inserted.
Statement 386
INSERT INTO CAR_NAMES VALUES(301,'volkswagen','vw rabbit custom')
1 row(s) inserted.
Statement 387
INSERT INTO CAR_NAMES VALUES(302,'mazda', 'mazda glc deluxe')
1 row(s) inserted.
Statement 388
INSERT INTO CAR_NAMES VALUES(303,'dodge','dodge colt hatchback custom')
1 row(s) inserted.
Statement 389
INSERT INTO CAR_NAMES VALUES(304,'amc','amc spirit dl')
1 row(s) inserted.
Statement 390
INSERT INTO CAR_NAMES VALUES(305,'mercedes','mercedes benz 300d')
1 row(s) inserted.
Statement 391
INSERT INTO CAR_NAMES VALUES(306,'cadillac','cadillac eldorado')
1 row(s) inserted.
Statement 392
INSERT INTO CAR_NAMES VALUES(307,'peugeot','peugeot 504')
1 row(s) inserted.
Statement 393
INSERT INTO CAR_NAMES VALUES(308,'oldsmobile','oldsmobile cutlass salon brougham')
1 row(s) inserted.
Statement 394
INSERT INTO CAR_NAMES VALUES(309,'plymouth','plymouth horizon')
1 row(s) inserted.
Statement 395
INSERT INTO CAR_NAMES VALUES(310,'plymouth','plymouth horizon tc3')
1 row(s) inserted.
Statement 396
INSERT INTO CAR_NAMES VALUES(311,'datsun','datsun 210')
1 row(s) inserted.
Statement 397
INSERT INTO CAR_NAMES VALUES(312,'fiat','fiat strada custom')
1 row(s) inserted.
Statement 398
INSERT INTO CAR_NAMES VALUES(313,'buick','buick skylark limited')
1 row(s) inserted.
Statement 399
INSERT INTO CAR_NAMES VALUES(314,'chevrolet','chevrolet citation')
1 row(s) inserted.
Statement 400
INSERT INTO CAR_NAMES VALUES(315,'oldsmobile','oldsmobile omega brougham')
1 row(s) inserted.
Statement 401
INSERT INTO CAR_NAMES VALUES(316,'pontiac','pontiac phoenix')
1 row(s) inserted.
Statement 402
INSERT INTO CAR_NAMES VALUES(317,'volkswagen','vw rabbit')
1 row(s) inserted.
Statement 403
INSERT INTO CAR_NAMES VALUES(318,'toyota','toyota corolla tercel')
1 row(s) inserted.
Statement 404
INSERT INTO CAR_NAMES VALUES(319,'chevrolet','chevrolet chevette')
1 row(s) inserted.
Statement 405
INSERT INTO CAR_NAMES VALUES(320,'datsun','datsun 310')
1 row(s) inserted.
Statement 406
INSERT INTO CAR_NAMES VALUES(321,'chevrolet','chevrolet citation')
1 row(s) inserted.
Statement 407
INSERT INTO CAR_NAMES VALUES(322,'ford','ford fairmont')
1 row(s) inserted.
Statement 408
INSERT INTO CAR_NAMES VALUES(323,'amc','amc concord')
1 row(s) inserted.
Statement 409
INSERT INTO CAR_NAMES VALUES(324,'dodge','dodge aspen')
1 row(s) inserted.
Statement 410
INSERT INTO CAR_NAMES VALUES(325,'audi','audi 4000')
1 row(s) inserted.
Statement 411
INSERT INTO CAR_NAMES VALUES(326,'toyota','toyota corona liftback')
1 row(s) inserted.
Statement 412
INSERT INTO CAR_NAMES VALUES(327,'mazda','mazda 626')
1 row(s) inserted.
Statement 413
INSERT INTO CAR_NAMES VALUES(328,'datsun','datsun 510 hatchback')
1 row(s) inserted.
Statement 414
INSERT INTO CAR_NAMES VALUES(329,'toyota','toyota corolla')
1 row(s) inserted.
Statement 415
INSERT INTO CAR_NAMES VALUES(330,'mazda','mazda glc')
1 row(s) inserted.
Statement 416
INSERT INTO CAR_NAMES VALUES(331,'dodge','dodge colt')
1 row(s) inserted.
Statement 417
INSERT INTO CAR_NAMES VALUES(332,'datsun','datsun 210')
1 row(s) inserted.
Statement 418
INSERT INTO CAR_NAMES VALUES(333,'volkswagen','vw rabbit c (diesel)')
1 row(s) inserted.
Statement 419
INSERT INTO CAR_NAMES VALUES(334,'volkswagen','vw dasher (diesel)')
1 row(s) inserted.
Statement 420
INSERT INTO CAR_NAMES VALUES(335,'audi','audi 5000s (diesel)')
1 row(s) inserted.
Statement 421
INSERT INTO CAR_NAMES VALUES(336,'mercedes-benz','mercedes-benz 240d')
1 row(s) inserted.
Statement 422
INSERT INTO CAR_NAMES VALUES(337,'honda','honda civic 1500 gl')
1 row(s) inserted.
Statement 423
INSERT INTO CAR_NAMES VALUES(338,'renault','renault lecar deluxe')
1 row(s) inserted.
Statement 424
INSERT INTO CAR_NAMES VALUES(339,'subaru','subaru dl')
1 row(s) inserted.
Statement 425
INSERT INTO CAR_NAMES VALUES(340, 'volkswagen','volkswagen rabbit')
1 row(s) inserted.
Statement 426
INSERT INTO CAR_NAMES VALUES(341,'datsun','datsun 280-zx')
1 row(s) inserted.
Statement 427
INSERT INTO CAR_NAMES VALUES(342,'mazda','mazda rx-7 gs')
1 row(s) inserted.
Statement 428
INSERT INTO CAR_NAMES VALUES(343,'triumph','triumph tr7 coupe')
1 row(s) inserted.
Statement 429
INSERT INTO CAR_NAMES VALUES(344,'ford','ford mustang cobra')
1 row(s) inserted.
Statement 430
INSERT INTO CAR_NAMES VALUES(345,'honda','honda accord')
1 row(s) inserted.
Statement 431
INSERT INTO CAR_NAMES VALUES(346,'plymouth','plymouth reliant')
1 row(s) inserted.
Statement 432
INSERT INTO CAR_NAMES VALUES(347,'buick','buick skylark')
1 row(s) inserted.
Statement 433
INSERT INTO CAR_NAMES VALUES(348,'dodge','dodge aries wagon (sw)')
1 row(s) inserted.
Statement 434
INSERT INTO CAR_NAMES VALUES(349,'chevrolet','chevrolet citation')
1 row(s) inserted.
Statement 435
INSERT INTO CAR_NAMES VALUES(350,'plymouth','plymouth reliant')
1 row(s) inserted.
Statement 436
INSERT INTO CAR_NAMES VALUES(351,'toyota','toyota starlet')
1 row(s) inserted.
Statement 437
INSERT INTO CAR_NAMES VALUES(352,'plymouth','plymouth champ')
1 row(s) inserted.
Statement 438
INSERT INTO CAR_NAMES VALUES(353,'honda','honda civic 1300')
1 row(s) inserted.
Statement 439
INSERT INTO CAR_NAMES VALUES(354,'subaru','subaru')
1 row(s) inserted.
Statement 440
INSERT INTO CAR_NAMES VALUES(355,'datsun','datsun 210 mpg')
1 row(s) inserted.
Statement 441
INSERT INTO CAR_NAMES VALUES(356,'toyota','toyota tercel')
1 row(s) inserted.
Statement 442
INSERT INTO CAR_NAMES VALUES(357,'mazda','mazda glc 4')
1 row(s) inserted.
Statement 443
INSERT INTO CAR_NAMES VALUES(358,'plymouth','plymouth horizon 4')
1 row(s) inserted.
Statement 444
INSERT INTO CAR_NAMES VALUES(359,'ford','ford escort 4w')
1 row(s) inserted.
Statement 445
INSERT INTO CAR_NAMES VALUES(360,'ford','ford escort 2h')
1 row(s) inserted.
Statement 446
INSERT INTO CAR_NAMES VALUES(361,'volkswagen','volkswagen jetta')
1 row(s) inserted.
Statement 447
INSERT INTO CAR_NAMES VALUES(362,'renault','renault 18i')
1 row(s) inserted.
Statement 448
INSERT INTO CAR_NAMES VALUES(363,'honda','honda prelude')
1 row(s) inserted.
Statement 449
INSERT INTO CAR_NAMES VALUES(364,'toyota','toyota corolla')
1 row(s) inserted.
Statement 450
INSERT INTO CAR_NAMES VALUES(365,'datsun','datsun 200sx')
1 row(s) inserted.
Statement 451
INSERT INTO CAR_NAMES VALUES(366,'mazda','mazda 626')
1 row(s) inserted.
Statement 452
INSERT INTO CAR_NAMES VALUES(367,'peugeot','peugeot 505s turbo diesel')
1 row(s) inserted.
Statement 453
INSERT INTO CAR_NAMES VALUES(368,'saab','saab 900s')
1 row(s) inserted.
Statement 454
INSERT INTO CAR_NAMES VALUES(369,'volvo','volvo diesel')
1 row(s) inserted.
Statement 455
INSERT INTO CAR_NAMES VALUES(370,'toyota','toyota cressida')
1 row(s) inserted.
Statement 456
INSERT INTO CAR_NAMES VALUES(371,'datsun','datsun 810 maxima')
1 row(s) inserted.
Statement 457
INSERT INTO CAR_NAMES VALUES(372,'buick','buick century')
1 row(s) inserted.
Statement 458
INSERT INTO CAR_NAMES VALUES(373,'oldsmobile','oldsmobile cutlass ls')
1 row(s) inserted.
Statement 459
INSERT INTO CAR_NAMES VALUES(374,'ford','ford granada gl')
1 row(s) inserted.
Statement 460
INSERT INTO CAR_NAMES VALUES(375,'chrysler','chrysler lebaron salon')
1 row(s) inserted.
Statement 461
INSERT INTO CAR_NAMES VALUES(376,'chevrolet','chevrolet cavalier')
1 row(s) inserted.
Statement 462
INSERT INTO CAR_NAMES VALUES(377,'chevrolet','chevrolet cavalier wagon')
1 row(s) inserted.
Statement 463
INSERT INTO CAR_NAMES VALUES(378,'chevrolet','chevrolet cavalier 2-door')
1 row(s) inserted.
Statement 464
INSERT INTO CAR_NAMES VALUES(379,'pontiac','pontiac j2000 se hatchback')
1 row(s) inserted.
Statement 465
INSERT INTO CAR_NAMES VALUES(380,'dodge','dodge aries se')
1 row(s) inserted.
Statement 466
INSERT INTO CAR_NAMES VALUES(381,'pontiac','pontiac phoenix')
1 row(s) inserted.
Statement 467
INSERT INTO CAR_NAMES VALUES(382,'ford','ford fairmont futura')
1 row(s) inserted.
Statement 468
INSERT INTO CAR_NAMES VALUES(383,'amc','amc concord dl')
1 row(s) inserted.
Statement 469
INSERT INTO CAR_NAMES VALUES(384,'volkswagen','volkswagen rabbit l')
1 row(s) inserted.
Statement 470
INSERT INTO CAR_NAMES VALUES(385,'mazda','mazda glc custom l')
1 row(s) inserted.
Statement 471
INSERT INTO CAR_NAMES VALUES(386,'mazda','mazda glc custom')
1 row(s) inserted.
Statement 472
INSERT INTO CAR_NAMES VALUES(387,'plymouth','plymouth horizon miser')
1 row(s) inserted.
Statement 473
INSERT INTO CAR_NAMES VALUES(388,'mercury','mercury lynx l')
1 row(s) inserted.
Statement 474
INSERT INTO CAR_NAMES VALUES(389,'nissan','nissan stanza xe')
1 row(s) inserted.
Statement 475
INSERT INTO CAR_NAMES VALUES(390,'honda','honda accord')
1 row(s) inserted.
Statement 476
INSERT INTO CAR_NAMES VALUES(391,'toyota','toyota corolla')
1 row(s) inserted.
Statement 477
INSERT INTO CAR_NAMES VALUES(392,'honda','honda civic')
1 row(s) inserted.
Statement 478
INSERT INTO CAR_NAMES VALUES(393,'honda','honda civic (auto)')
1 row(s) inserted.
Statement 479
INSERT INTO CAR_NAMES VALUES(394,'datsun','datsun 310 gx')
1 row(s) inserted.
Statement 480
INSERT INTO CAR_NAMES VALUES(395,'buick','buick century limited')
1 row(s) inserted.
Statement 481
INSERT INTO CAR_NAMES VALUES(396,'oldsmobile','oldsmobile cutlass ciera (diesel)')
1 row(s) inserted.
Statement 482
INSERT INTO CAR_NAMES VALUES(397,'chrysler','chrysler lebaron medallion')
1 row(s) inserted.
Statement 483
INSERT INTO CAR_NAMES VALUES(398,'ford','ford granada l')
1 row(s) inserted.
Statement 484
INSERT INTO CAR_NAMES VALUES(399,'toyota','toyota celica gt')
1 row(s) inserted.
Statement 485
INSERT INTO CAR_NAMES VALUES(400,'dodge','dodge charger 2.2')
1 row(s) inserted.
Statement 486
INSERT INTO CAR_NAMES VALUES(401,'chevrolet','chevrolet camaro')
1 row(s) inserted.
Statement 487
INSERT INTO CAR_NAMES VALUES(402,'ford','ford mustang gl')
1 row(s) inserted.
Statement 488
INSERT INTO CAR_NAMES VALUES(403,'volkswagen','vw pickup')
1 row(s) inserted.
Statement 489
INSERT INTO CAR_NAMES VALUES(404,'dodge','dodge rampage')
1 row(s) inserted.
Statement 490
INSERT INTO CAR_NAMES VALUES(405,'ford','ford ranger')
1 row(s) inserted.
Statement 491
INSERT INTO CAR_NAMES VALUES(406,'chevrolet','chevy s-10')
1 row(s) inserted.
Statement 492
INSERT INTO CAR_dETAILS VALUES(1,18,8,307,130,3504,12,1970)
1 row(s) inserted.
Statement 493
INSERT INTO CAR_dETAILS VALUES(2,15,8,350,165,3693,11.5,1970)
1 row(s) inserted.
Statement 494
INSERT INTO CAR_dETAILS VALUES(3,18,8,318,150,3436,11,1970)
1 row(s) inserted.
Statement 495
INSERT INTO CAR_dETAILS VALUES(4,16,8,304,150,3433,12,1970)
1 row(s) inserted.
Statement 496
INSERT INTO CAR_dETAILS VALUES(5,17,8,302,140,3449,10.5,1970)
1 row(s) inserted.
Statement 497
INSERT INTO CAR_dETAILS VALUES(6,15,8,429,198,4341,10,1970)
1 row(s) inserted.
Statement 498
INSERT INTO CAR_dETAILS VALUES(7,14,8,454,220,4354,9,1970)
1 row(s) inserted.
Statement 499
INSERT INTO CAR_dETAILS VALUES(8,14,8,440,215,4312,8.5,1970)
1 row(s) inserted.
Statement 500
INSERT INTO CAR_dETAILS VALUES(9,14,8,455,225,4425,10,1970)
1 row(s) inserted.
Statement 501
INSERT INTO CAR_dETAILS VALUES(10,15,8,390,190,3850,8.5,1970)
1 row(s) inserted.
Statement 502
INSERT INTO CAR_dETAILS VALUES(11,null,4,133,115,3090,17.5,1970)
1 row(s) inserted.
Statement 503
INSERT INTO CAR_dETAILS VALUES(12,null,8,350,165,4142,11.5,1970)
1 row(s) inserted.
Statement 504
INSERT INTO CAR_dETAILS VALUES(13,null,8,351,153,4034,11,1970)
1 row(s) inserted.
Statement 505
INSERT INTO CAR_dETAILS VALUES(14,null,8,383,175,4166,10.5,1970)
1 row(s) inserted.
Statement 506
INSERT INTO CAR_dETAILS VALUES(15,null,8,360,175,3850,11,1970)
1 row(s) inserted.
Statement 507
INSERT INTO CAR_dETAILS VALUES(16,15,8,383,170,3563,10,1970)
1 row(s) inserted.
Statement 508
INSERT INTO CAR_dETAILS VALUES(17,14,8,340,160,3609,8,1970)
1 row(s) inserted.
Statement 509
INSERT INTO CAR_dETAILS VALUES(18,null,8,302,140,3353,8,1970)
1 row(s) inserted.
Statement 510
INSERT INTO CAR_dETAILS VALUES(19,15,8,400,150,3761,9.5,1970)
1 row(s) inserted.
Statement 511
INSERT INTO CAR_dETAILS VALUES(20,14,8,455,225,3086,10,1970)
1 row(s) inserted.
Statement 512
INSERT INTO CAR_dETAILS VALUES(21,24,4,113,95,2372,15,1970)
1 row(s) inserted.
Statement 513
INSERT INTO CAR_dETAILS VALUES(22,22,6,198,95,2833,15.5,1970)
1 row(s) inserted.
Statement 514
INSERT INTO CAR_dETAILS VALUES(23,18,6,199,97,2774,15.5,1970)
1 row(s) inserted.
Statement 515
INSERT INTO CAR_dETAILS VALUES(24,21,6,200,85,2587,16,1970)
1 row(s) inserted.
Statement 516
INSERT INTO CAR_dETAILS VALUES(25,27,4,97,88,2130,14.5,1970)
1 row(s) inserted.
Statement 517
INSERT INTO CAR_dETAILS VALUES(26,26,4,97,46,1835,20.5,1970)
1 row(s) inserted.
Statement 518
INSERT INTO CAR_dETAILS VALUES(27,25,4,110,87,2672,17.5,1970)
1 row(s) inserted.
Statement 519
INSERT INTO CAR_dETAILS VALUES(28,24,4,107,90,2430,14.5,1970)
1 row(s) inserted.
Statement 520
INSERT INTO CAR_dETAILS VALUES(29,25,4,104,95,2375,17.5,1970)
1 row(s) inserted.
Statement 521
INSERT INTO CAR_dETAILS VALUES(30,26,4,121,113,2234,12.5,1970)
1 row(s) inserted.
Statement 522
INSERT INTO CAR_dETAILS VALUES(31,21,6,199,90,2648,15,1970)
1 row(s) inserted.
Statement 523
INSERT INTO CAR_dETAILS VALUES(32,10,8,360,215,4615,14,1970)
1 row(s) inserted.
Statement 524
INSERT INTO CAR_dETAILS VALUES(33,10,8,307,200,4376,15,1970)
1 row(s) inserted.
Statement 525
INSERT INTO CAR_dETAILS VALUES(34,11,8,318,210,4382,13.5,1970)
1 row(s) inserted.
Statement 526
INSERT INTO CAR_dETAILS VALUES(35,9,8,304,193,4732,18.5,1970)
1 row(s) inserted.
Statement 527
INSERT INTO CAR_dETAILS VALUES(36,27,4,97,88,2130,14.5,1971)
1 row(s) inserted.
Statement 528
INSERT INTO CAR_dETAILS VALUES(37,28,4,140,90,2264,15.5,1971)
1 row(s) inserted.
Statement 529
INSERT INTO CAR_dETAILS VALUES(38,25,4,113,95,2228,14,1971)
1 row(s) inserted.
Statement 530
INSERT INTO CAR_dETAILS VALUES(39,25,4,98,null,2046,19,1971)
1 row(s) inserted.
Statement 531
INSERT INTO CAR_dETAILS VALUES(40,null,4,97,48,1978,20,1971)
1 row(s) inserted.
Statement 532
INSERT INTO CAR_dETAILS VALUES(41,19,6,232,100,2634,13,1971)
1 row(s) inserted.
Statement 533
INSERT INTO CAR_dETAILS VALUES(42,16,6,225,105,3439,15.5,1971)
1 row(s) inserted.
Statement 534
INSERT INTO CAR_dETAILS VALUES(43,17,6,250,100,3329,15.5,1971)
1 row(s) inserted.
Statement 535
INSERT INTO CAR_dETAILS VALUES(44,19,6,250,88,3302,15.5,1971)
1 row(s) inserted.
Statement 536
INSERT INTO CAR_dETAILS VALUES(45,18,6,232,100,3288,15.5,1971)
1 row(s) inserted.
Statement 537
INSERT INTO CAR_dETAILS VALUES(46,14,8,350,165,4209,12,1971)
1 row(s) inserted.
Statement 538
INSERT INTO CAR_dETAILS VALUES(47,14,8,400,175,4464,11.5,1971)
1 row(s) inserted.
Statement 539
INSERT INTO CAR_dETAILS VALUES(48,14,8,351,153,4154,13.5,1971)
1 row(s) inserted.
Statement 540
INSERT INTO CAR_dETAILS VALUES(49,14,8,318,150,4096,13,1971)
1 row(s) inserted.
Statement 541
INSERT INTO CAR_dETAILS VALUES(50,12,8,383,180,4955,11.5,1971)
1 row(s) inserted.
Statement 542
INSERT INTO CAR_dETAILS VALUES(51,13,8,400,170,4746,12,1971)
1 row(s) inserted.
Statement 543
INSERT INTO CAR_dETAILS VALUES(52,13,8,400,175,5140,12,1971)
1 row(s) inserted.
Statement 544
INSERT INTO CAR_dETAILS VALUES(53,18,6,258,110,2962,13.5,1971)
1 row(s) inserted.
Statement 545
INSERT INTO CAR_dETAILS VALUES(54,22,4,140,72,2408,19,1971)
1 row(s) inserted.
Statement 546
INSERT INTO CAR_dETAILS VALUES(55,19,6,250,100,3282,15,1971)
1 row(s) inserted.
Statement 547
INSERT INTO CAR_dETAILS VALUES(56,18,6,250,88,3139,14.5,1971)
1 row(s) inserted.
Statement 548
INSERT INTO CAR_dETAILS VALUES(57,23,4,122,86,2220,14,1971)
1 row(s) inserted.
Statement 549
INSERT INTO CAR_dETAILS VALUES(58,28,4,116,90,2123,14,1971)
1 row(s) inserted.
Statement 550
INSERT INTO CAR_dETAILS VALUES(59,30,4,79,70,2074,19.5,1971)
1 row(s) inserted.
Statement 551
INSERT INTO CAR_dETAILS VALUES(60,30,4,88,76,2065,14.5,1971)
1 row(s) inserted.
Statement 552
INSERT INTO CAR_dETAILS VALUES(61,31,4,71,65,1773,19,1971)
1 row(s) inserted.
Statement 553
INSERT INTO CAR_dETAILS VALUES(62,35,4,72,69,1613,18,1971)
1 row(s) inserted.
Statement 554
INSERT INTO CAR_dETAILS VALUES(63,27,4,97,60,1834,19,1971)
1 row(s) inserted.
Statement 555
INSERT INTO CAR_dETAILS VALUES(64,26,4,91,70,1955,20.5,1971)
1 row(s) inserted.
Statement 556
INSERT INTO CAR_dETAILS VALUES(65,24,4,113,95,2278,15.5,1972)
1 row(s) inserted.
Statement 557
INSERT INTO CAR_dETAILS VALUES(66,25,4,97.5,80,2126,17,1972)
1 row(s) inserted.
Statement 558
INSERT INTO CAR_dETAILS VALUES(67,23,4,97,54,2254,23.5,1972)
1 row(s) inserted.
Statement 559
INSERT INTO CAR_dETAILS VALUES(68,20,4,140,90,2408,19.5,1972)
1 row(s) inserted.
Statement 560
INSERT INTO CAR_dETAILS VALUES(69,21,4,122,86,2226,16.5,1972)
1 row(s) inserted.
Statement 561
INSERT INTO CAR_dETAILS VALUES(70,13,8,350,165,4274,12,1972)
1 row(s) inserted.
Statement 562
INSERT INTO CAR_dETAILS VALUES(71,14,8,400,175,4385,12,1972)
1 row(s) inserted.
Statement 563
INSERT INTO CAR_dETAILS VALUES(72,15,8,318,150,4135,13.5,1972)
1 row(s) inserted.
Statement 564
INSERT INTO CAR_dETAILS VALUES(73,14,8,351,153,4129,13,1972)
1 row(s) inserted.
Statement 565
INSERT INTO CAR_dETAILS VALUES(74,17,8,304,150,3672,11.5,1972)
1 row(s) inserted.
Statement 566
INSERT INTO CAR_dETAILS VALUES(75,11,8,429,208,4633,11,1972)
1 row(s) inserted.
Statement 567
INSERT INTO CAR_dETAILS VALUES(76,13,8,350,155,4502,13.5,1972)
1 row(s) inserted.
Statement 568
INSERT INTO CAR_dETAILS VALUES(77,12,8,350,160,4456,13.5,1972)
1 row(s) inserted.
Statement 569
INSERT INTO CAR_dETAILS VALUES(78,13,8,400,190,4422,12.5,1972)
1 row(s) inserted.
Statement 570
INSERT INTO CAR_dETAILS VALUES(79,19,3,70,97,2330,13.5,1972)
1 row(s) inserted.
Statement 571
INSERT INTO CAR_dETAILS VALUES(80,15,8,304,150,3892,12.5,1972)
1 row(s) inserted.
Statement 572
INSERT INTO CAR_dETAILS VALUES(81,13,8,307,130,4098,14,1972)
1 row(s) inserted.
Statement 573
INSERT INTO CAR_dETAILS VALUES(82,13,8,302,140,4294,16,1972)
1 row(s) inserted.
Statement 574
INSERT INTO CAR_dETAILS VALUES(83,14,8,318,150,4077,14,1972)
1 row(s) inserted.
Statement 575
INSERT INTO CAR_dETAILS VALUES(84,18,4,121,112,2933,14.5,1972)
1 row(s) inserted.
Statement 576
INSERT INTO CAR_dETAILS VALUES(85,22,4,121,76,2511,18,1972)
1 row(s) inserted.
Statement 577
INSERT INTO CAR_dETAILS VALUES(86,21,4,120,87,2979,19.5,1972)
1 row(s) inserted.
Statement 578
INSERT INTO CAR_dETAILS VALUES(87,26,4,96,69,2189,18,1972)
1 row(s) inserted.
Statement 579
INSERT INTO CAR_dETAILS VALUES(88,22,4,122,86,2395,16,1972)
1 row(s) inserted.
Statement 580
INSERT INTO CAR_dETAILS VALUES(89,28,4,97,92,2288,17,1972)
1 row(s) inserted.
Statement 581
INSERT INTO CAR_dETAILS VALUES(90,23,4,120,97,2506,14.5,1972)
1 row(s) inserted.
Statement 582
INSERT INTO CAR_dETAILS VALUES(91,28,4,98,80,2164,15,1972)
1 row(s) inserted.
Statement 583
INSERT INTO CAR_dETAILS VALUES(92,27,4,97,88,2100,16.5,1972)
1 row(s) inserted.
Statement 584
INSERT INTO CAR_dETAILS VALUES(93,13,8,350,175,4100,13,1973)
1 row(s) inserted.
Statement 585
INSERT INTO CAR_dETAILS VALUES(94,14,8,304,150,3672,11.5,1973)
1 row(s) inserted.
Statement 586
INSERT INTO CAR_dETAILS VALUES(95,13,8,350,145,3988,13,1973)
1 row(s) inserted.
Statement 587
INSERT INTO CAR_dETAILS VALUES(96,14,8,302,137,4042,14.5,1973)
1 row(s) inserted.
Statement 588
INSERT INTO CAR_dETAILS VALUES(97,15,8,318,150,3777,12.5,1973)
1 row(s) inserted.
Statement 589
INSERT INTO CAR_dETAILS VALUES(98,12,8,429,198,4952,11.5,1973)
1 row(s) inserted.
Statement 590
INSERT INTO CAR_dETAILS VALUES(99,13,8,400,150,4464,12,1973)
1 row(s) inserted.
Statement 591
INSERT INTO CAR_dETAILS VALUES(100,13,8,351,158,4363,13,1973)
1 row(s) inserted.
Statement 592
INSERT INTO CAR_dETAILS VALUES(101,14,8,318,150,4237,14.5,1973)
1 row(s) inserted.
Statement 593
INSERT INTO CAR_dETAILS VALUES(102,13,8,440,215,4735,11,1973)
1 row(s) inserted.
Statement 594
INSERT INTO CAR_dETAILS VALUES(103,12,8,455,225,4951,11,1973)
1 row(s) inserted.
Statement 595
INSERT INTO CAR_dETAILS VALUES(104,13,8,360,175,3821,11,1973)
1 row(s) inserted.
Statement 596
INSERT INTO CAR_dETAILS VALUES(105,18,6,225,105,3121,16.5,1973)
1 row(s) inserted.
Statement 597
INSERT INTO CAR_dETAILS VALUES(106,16,6,250,100,3278,18,1973)
1 row(s) inserted.
Statement 598
INSERT INTO CAR_dETAILS VALUES(107,18,6,232,100,2945,16,1973)
1 row(s) inserted.
Statement 599
INSERT INTO CAR_dETAILS VALUES(108,18,6,250,88,3021,16.5,1973)
1 row(s) inserted.
Statement 600
INSERT INTO CAR_dETAILS VALUES(109,23,6,198,95,2904,16,1973)
1 row(s) inserted.
Statement 601
INSERT INTO CAR_dETAILS VALUES(110,26,4,97,46,1950,21,1973)
1 row(s) inserted.
Statement 602
INSERT INTO CAR_dETAILS VALUES(111,11,8,400,150,4997,14,1973)
1 row(s) inserted.
Statement 603
INSERT INTO CAR_dETAILS VALUES(112,12,8,400,167,4906,12.5,1973)
1 row(s) inserted.
Statement 604
INSERT INTO CAR_dETAILS VALUES(113,13,8,360,170,4654,13,1973)
1 row(s) inserted.
Statement 605
INSERT INTO CAR_dETAILS VALUES(114,12,8,350,180,4499,12.5,1973)
1 row(s) inserted.
Statement 606
INSERT INTO CAR_dETAILS VALUES(115,18,6,232,100,2789,15,1973)
1 row(s) inserted.
Statement 607
INSERT INTO CAR_dETAILS VALUES(116,20,4,97,88,2279,19,1973)
1 row(s) inserted.
Statement 608
INSERT INTO CAR_dETAILS VALUES(117,21,4,140,72,2401,19.5,1973)
1 row(s) inserted.
Statement 609
INSERT INTO CAR_dETAILS VALUES(118,22,4,108,94,2379,16.5,1973)
1 row(s) inserted.
Statement 610
INSERT INTO CAR_dETAILS VALUES(119,18,3,70,90,2124,13.5,1973)
1 row(s) inserted.
Statement 611
INSERT INTO CAR_dETAILS VALUES(120,19,4,122,85,2310,18.5,1973)
1 row(s) inserted.
Statement 612
INSERT INTO CAR_dETAILS VALUES(121,21,6,155,107,2472,14,1973)
1 row(s) inserted.
Statement 613
INSERT INTO CAR_dETAILS VALUES(122,26,4,98,90,2265,15.5,1973)
1 row(s) inserted.
Statement 614
INSERT INTO CAR_dETAILS VALUES(123,15,8,350,145,4082,13,1973)
1 row(s) inserted.
Statement 615
INSERT INTO CAR_dETAILS VALUES(124,16,8,400,230,4278,9.5,1973)
1 row(s) inserted.
Statement 616
INSERT INTO CAR_dETAILS VALUES(125,29,4,68,49,1867,19.5,1973)
1 row(s) inserted.
Statement 617
INSERT INTO CAR_dETAILS VALUES(126,24,4,116,75,2158,15.5,1973)
1 row(s) inserted.
Statement 618
INSERT INTO CAR_dETAILS VALUES(127,20,4,114,91,2582,14,1973)
1 row(s) inserted.
Statement 619
INSERT INTO CAR_dETAILS VALUES(128,19,4,121,112,2868,15.5,1973)
1 row(s) inserted.
Statement 620
INSERT INTO CAR_dETAILS VALUES(129,15,8,318,150,3399,11,1973)
1 row(s) inserted.
Statement 621
INSERT INTO CAR_dETAILS VALUES(130,24,4,121,110,2660,14,1973)
1 row(s) inserted.
Statement 622
INSERT INTO CAR_dETAILS VALUES(131,20,6,156,122,2807,13.5,1973)
1 row(s) inserted.
Statement 623
INSERT INTO CAR_dETAILS VALUES(132,11,8,350,180,3664,11,1973)
1 row(s) inserted.
Statement 624
INSERT INTO CAR_dETAILS VALUES(133,20,6,198,95,3102,16.5,1974)
1 row(s) inserted.
Statement 625
INSERT INTO CAR_dETAILS VALUES(134,21,6,200,null,2875,17,1974)
1 row(s) inserted.
Statement 626
INSERT INTO CAR_dETAILS VALUES(135,19,6,232,100,2901,16,1974)
1 row(s) inserted.
Statement 627
INSERT INTO CAR_dETAILS VALUES(136,15,6,250,100,3336,17,1974)
1 row(s) inserted.
Statement 628
INSERT INTO CAR_dETAILS VALUES(137,31,4,79,67,1950,19,1974)
1 row(s) inserted.
Statement 629
INSERT INTO CAR_dETAILS VALUES(138,26,4,122,80,2451,16.5,1974)
1 row(s) inserted.
Statement 630
INSERT INTO CAR_dETAILS VALUES(139,32,4,71,65,1836,21,1974)
1 row(s) inserted.
Statement 631
INSERT INTO CAR_dETAILS VALUES(140,25,4,140,75,2542,17,1974)
1 row(s) inserted.
Statement 632
INSERT INTO CAR_dETAILS VALUES(141,16,6,250,100,3781,17,1974)
1 row(s) inserted.
Statement 633
INSERT INTO CAR_dETAILS VALUES(142,16,6,258,110,3632,18,1974)
1 row(s) inserted.
Statement 634
INSERT INTO CAR_dETAILS VALUES(143,18,6,225,105,3613,16.5,1974)
1 row(s) inserted.
Statement 635
INSERT INTO CAR_dETAILS VALUES(144,16,8,302,140,4141,14,1974)
1 row(s) inserted.
Statement 636
INSERT INTO CAR_dETAILS VALUES(145,13,8,350,150,4699,14.5,1974)
1 row(s) inserted.
Statement 637
INSERT INTO CAR_dETAILS VALUES(146,14,8,318,150,4457,13.5,1974)
1 row(s) inserted.
Statement 638
INSERT INTO CAR_dETAILS VALUES(147,14,8,302,140,4638,16,1974)
1 row(s) inserted.
Statement 639
INSERT INTO CAR_dETAILS VALUES(148,14,8,304,150,4257,15.5,1974)
1 row(s) inserted.
Statement 640
INSERT INTO CAR_dETAILS VALUES(149,29,4,98,83,2219,16.5,1974)
1 row(s) inserted.
Statement 641
INSERT INTO CAR_dETAILS VALUES(150,26,4,79,67,1963,15.5,1974)
1 row(s) inserted.
Statement 642
INSERT INTO CAR_dETAILS VALUES(151,26,4,97,78,2300,14.5,1974)
1 row(s) inserted.
Statement 643
INSERT INTO CAR_dETAILS VALUES(152,31,4,76,52,1649,16.5,1974)
1 row(s) inserted.
Statement 644
INSERT INTO CAR_dETAILS VALUES(153,32,4,83,61,2003,19,1974)
1 row(s) inserted.
Statement 645
INSERT INTO CAR_dETAILS VALUES(154,28,4,90,75,2125,14.5,1974)
1 row(s) inserted.
Statement 646
INSERT INTO CAR_dETAILS VALUES(155,24,4,90,75,2108,15.5,1974)
1 row(s) inserted.
Statement 647
INSERT INTO CAR_dETAILS VALUES(156,26,4,116,75,2246,14,1974)
1 row(s) inserted.
Statement 648
INSERT INTO CAR_dETAILS VALUES(157,24,4,120,97,2489,15,1974)
1 row(s) inserted.
Statement 649
INSERT INTO CAR_dETAILS VALUES(158,26,4,108,93,2391,15.5,1974)
1 row(s) inserted.
Statement 650
INSERT INTO CAR_dETAILS VALUES(159,31,4,79,67,2000,16,1974)
1 row(s) inserted.
Statement 651
INSERT INTO CAR_dETAILS VALUES(160,19,6,225,95,3264,16,1975)
1 row(s) inserted.
Statement 652
INSERT INTO CAR_dETAILS VALUES(161,18,6,250,105,3459,16,1975)
1 row(s) inserted.
Statement 653
INSERT INTO CAR_dETAILS VALUES(162,15,6,250,72,3432,21,1975)
1 row(s) inserted.
Statement 654
INSERT INTO CAR_dETAILS VALUES(163,15,6,250,72,3158,19.5,1975)
1 row(s) inserted.
Statement 655
INSERT INTO CAR_dETAILS VALUES(164,16,8,400,170,4668,11.5,1975)
1 row(s) inserted.
Statement 656
INSERT INTO CAR_dETAILS VALUES(165,15,8,350,145,4440,14,1975)
1 row(s) inserted.
Statement 657
INSERT INTO CAR_dETAILS VALUES(166,16,8,318,150,4498,14.5,1975)
1 row(s) inserted.
Statement 658
INSERT INTO CAR_dETAILS VALUES(167,14,8,351,148,4657,13.5,1975)
1 row(s) inserted.
Statement 659
INSERT INTO CAR_dETAILS VALUES(168,17,6,231,110,3907,21,1975)
1 row(s) inserted.
Statement 660
INSERT INTO CAR_dETAILS VALUES(169,16,6,250,105,3897,18.5,1975)
1 row(s) inserted.
Statement 661
INSERT INTO CAR_dETAILS VALUES(170,15,6,258,110,3730,19,1975)
1 row(s) inserted.
Statement 662
INSERT INTO CAR_dETAILS VALUES(171,18,6,225,95,3785,19,1975)
1 row(s) inserted.
Statement 663
INSERT INTO CAR_dETAILS VALUES(172,21,6,231,110,3039,15,1975)
1 row(s) inserted.
Statement 664
INSERT INTO CAR_dETAILS VALUES(173,20,8,262,110,3221,13.5,1975)
1 row(s) inserted.
Statement 665
INSERT INTO CAR_dETAILS VALUES(174,13,8,302,129,3169,12,1975)
1 row(s) inserted.
Statement 666
INSERT INTO CAR_dETAILS VALUES(175,29,4,97,75,2171,16,1975)
1 row(s) inserted.
Statement 667
INSERT INTO CAR_dETAILS VALUES(176,23,4,140,83,2639,17,1975)
1 row(s) inserted.
Statement 668
INSERT INTO CAR_dETAILS VALUES(177,20,6,232,100,2914,16,1975)
1 row(s) inserted.
Statement 669
INSERT INTO CAR_dETAILS VALUES(178,23,4,140,78,2592,18.5,1975)
1 row(s) inserted.
Statement 670
INSERT INTO CAR_dETAILS VALUES(179,24,4,134,96,2702,13.5,1975)
1 row(s) inserted.
Statement 671
INSERT INTO CAR_dETAILS VALUES(180,25,4,90,71,2223,16.5,1975)
1 row(s) inserted.
Statement 672
INSERT INTO CAR_dETAILS VALUES(181,24,4,119,97,2545,17,1975)
1 row(s) inserted.
Statement 673
INSERT INTO CAR_dETAILS VALUES(182,18,6,171,97,2984,14.5,1975)
1 row(s) inserted.
Statement 674
INSERT INTO CAR_dETAILS VALUES(183,29,4,90,70,1937,14,1975)
1 row(s) inserted.
Statement 675
INSERT INTO CAR_dETAILS VALUES(184,19,6,232,90,3211,17,1975)
1 row(s) inserted.
Statement 676
INSERT INTO CAR_dETAILS VALUES(185,23,4,115,95,2694,15,1975)
1 row(s) inserted.
Statement 677
INSERT INTO CAR_dETAILS VALUES(186,23,4,120,88,2957,17,1975)
1 row(s) inserted.
Statement 678
INSERT INTO CAR_dETAILS VALUES(187,22,4,121,98,2945,14.5,1975)
1 row(s) inserted.
Statement 679
INSERT INTO CAR_dETAILS VALUES(188,25,4,121,115,2671,13.5,1975)
1 row(s) inserted.
Statement 680
INSERT INTO CAR_dETAILS VALUES(189,33,4,91,53,1795,17.5,1975)
1 row(s) inserted.
Statement 681
INSERT INTO CAR_dETAILS VALUES(190,28,4,107,86,2464,15.5,1976)
1 row(s) inserted.
Statement 682
INSERT INTO CAR_dETAILS VALUES(191,25,4,116,81,2220,16.9,1976)
1 row(s) inserted.
Statement 683
INSERT INTO CAR_dETAILS VALUES(192,25,4,140,92,2572,14.9,1976)
1 row(s) inserted.
Statement 684
INSERT INTO CAR_dETAILS VALUES(193,26,4,98,79,2255,17.7,1976)
1 row(s) inserted.
Statement 685
INSERT INTO CAR_dETAILS VALUES(194,27,4,101,83,2202,15.3,1976)
1 row(s) inserted.
Statement 686
INSERT INTO CAR_dETAILS VALUES(195,17.5,8,305,140,4215,13,1976)
1 row(s) inserted.
Statement 687
INSERT INTO CAR_dETAILS VALUES(196,16,8,318,150,4190,13,1976)
1 row(s) inserted.
Statement 688
INSERT INTO CAR_dETAILS VALUES(197,15.5,8,304,120,3962,13.9,1976)
1 row(s) inserted.
Statement 689
INSERT INTO CAR_dETAILS VALUES(198,14.5,8,351,152,4215,12.8,1976)
1 row(s) inserted.
Statement 690
INSERT INTO CAR_dETAILS VALUES(199,22,6,225,100,3233,15.4,1976)
1 row(s) inserted.
Statement 691
INSERT INTO CAR_dETAILS VALUES(200,22,6,250,105,3353,14.5,1976)
1 row(s) inserted.
Statement 692
INSERT INTO CAR_dETAILS VALUES(201,24,6,200,81,3012,17.6,1976)
1 row(s) inserted.
Statement 693
INSERT INTO CAR_dETAILS VALUES(202,22.5,6,232,90,3085,17.6,1976)
1 row(s) inserted.
Statement 694
INSERT INTO CAR_dETAILS VALUES(203,29,4,85,52,2035,22.2,1976)
1 row(s) inserted.
Statement 695
INSERT INTO CAR_dETAILS VALUES(204,24.5,4,98,60,2164,22.1,1976)
1 row(s) inserted.
Statement 696
INSERT INTO CAR_dETAILS VALUES(205,29,4,90,70,1937,14.2,1976)
1 row(s) inserted.
Statement 697
INSERT INTO CAR_dETAILS VALUES(206,33,4,91,53,1795,17.4,1976)
1 row(s) inserted.
Statement 698
INSERT INTO CAR_dETAILS VALUES(207,20,6,225,100,3651,17.7,1976)
1 row(s) inserted.
Statement 699
INSERT INTO CAR_dETAILS VALUES(208,18,6,250,78,3574,21,1976)
1 row(s) inserted.
Statement 700
INSERT INTO CAR_dETAILS VALUES(209,18.5,6,250,110,3645,16.2,1976)
1 row(s) inserted.
Statement 701
INSERT INTO CAR_dETAILS VALUES(210,17.5,6,258,95,3193,17.8,1976)
1 row(s) inserted.
Statement 702
INSERT INTO CAR_dETAILS VALUES(211,29.5,4,97,71,1825,12.2,1976)
1 row(s) inserted.
Statement 703
INSERT INTO CAR_dETAILS VALUES(212,32,4,85,70,1990,17,1976)
1 row(s) inserted.
Statement 704
INSERT INTO CAR_dETAILS VALUES(213,28,4,97,75,2155,16.4,1976)
1 row(s) inserted.
Statement 705
INSERT INTO CAR_dETAILS VALUES(214,26.5,4,140,72,2565,13.6,1976)
1 row(s) inserted.
Statement 706
INSERT INTO CAR_dETAILS VALUES(215,20,4,130,102,3150,15.7,1976)
1 row(s) inserted.
Statement 707
INSERT INTO CAR_dETAILS VALUES(216,13,8,318,150,3940,13.2,1976)
1 row(s) inserted.
Statement 708
INSERT INTO CAR_dETAILS VALUES(217,19,4,120,88,3270,21.9,1976)
1 row(s) inserted.
Statement 709
INSERT INTO CAR_dETAILS VALUES(218,19,6,156,108,2930,15.5,1976)
1 row(s) inserted.
Statement 710
INSERT INTO CAR_dETAILS VALUES(219,16.5,6,168,120,3820,16.7,1976)
1 row(s) inserted.
Statement 711
INSERT INTO CAR_dETAILS VALUES(220,16.5,8,350,180,4380,12.1,1976)
1 row(s) inserted.
Statement 712
INSERT INTO CAR_dETAILS VALUES(221,13,8,350,145,4055,12,1976)
1 row(s) inserted.
Statement 713
INSERT INTO CAR_dETAILS VALUES(222,13,8,302,130,3870,15,1976)
1 row(s) inserted.
Statement 714
INSERT INTO CAR_dETAILS VALUES(223,13,8,318,150,3755,14,1976)
1 row(s) inserted.
Statement 715
INSERT INTO CAR_dETAILS VALUES(224,31.5,4,98,68,2045,18.5,1977)
1 row(s) inserted.
Statement 716
INSERT INTO CAR_dETAILS VALUES(225,30,4,111,80,2155,14.8,1977)
1 row(s) inserted.
Statement 717
INSERT INTO CAR_dETAILS VALUES(226,36,4,79,58,1825,18.6,1977)
1 row(s) inserted.
Statement 718
INSERT INTO CAR_dETAILS VALUES(227,25.5,4,122,96,2300,15.5,1977)
1 row(s) inserted.
Statement 719
INSERT INTO CAR_dETAILS VALUES(228,33.5,4,85,70,1945,16.8,1977)
1 row(s) inserted.
Statement 720
INSERT INTO CAR_dETAILS VALUES(229,17.5,8,305,145,3880,12.5,1977)
1 row(s) inserted.
Statement 721
INSERT INTO CAR_dETAILS VALUES(230,17,8,260,110,4060,19,1977)
1 row(s) inserted.
Statement 722
INSERT INTO CAR_dETAILS VALUES(231,15.5,8,318,145,4140,13.7,1977)
1 row(s) inserted.
Statement 723
INSERT INTO CAR_dETAILS VALUES(232,15,8,302,130,4295,14.9,1977)
1 row(s) inserted.
Statement 724
INSERT INTO CAR_dETAILS VALUES(233,17.5,6,250,110,3520,16.4,1977)
1 row(s) inserted.
Statement 725
INSERT INTO CAR_dETAILS VALUES(234,20.5,6,231,105,3425,16.9,1977)
1 row(s) inserted.
Statement 726
INSERT INTO CAR_dETAILS VALUES(235,19,6,225,100,3630,17.7,1977)
1 row(s) inserted.
Statement 727
INSERT INTO CAR_dETAILS VALUES(236,18.5,6,250,98,3525,19,1977)
1 row(s) inserted.
Statement 728
INSERT INTO CAR_dETAILS VALUES(237,16,8,400,180,4220,11.1,1977)
1 row(s) inserted.
Statement 729
INSERT INTO CAR_dETAILS VALUES(238,15.5,8,350,170,4165,11.4,1977)
1 row(s) inserted.
Statement 730
INSERT INTO CAR_dETAILS VALUES(239,15.5,8,400,190,4325,12.2,1977)
1 row(s) inserted.
Statement 731
INSERT INTO CAR_dETAILS VALUES(240,16,8,351,149,4335,14.5,1977)
1 row(s) inserted.
Statement 732
INSERT INTO CAR_dETAILS VALUES(241,29,4,97,78,1940,14.5,1977)
1 row(s) inserted.
Statement 733
INSERT INTO CAR_dETAILS VALUES(242,24.5,4,151,88,2740,16,1977)
1 row(s) inserted.
Statement 734
INSERT INTO CAR_dETAILS VALUES(243,26,4,97,75,2265,18.2,1977)
1 row(s) inserted.
Statement 735
INSERT INTO CAR_dETAILS VALUES(244,25.5,4,140,89,2755,15.8,1977)
1 row(s) inserted.
Statement 736
INSERT INTO CAR_dETAILS VALUES(245,30.5,4,98,63,2051,17,1977)
1 row(s) inserted.
Statement 737
INSERT INTO CAR_dETAILS VALUES(246,33.5,4,98,83,2075,15.9,1977)
1 row(s) inserted.
Statement 738
INSERT INTO CAR_dETAILS VALUES(247,30,4,97,67,1985,16.4,1977)
1 row(s) inserted.
Statement 739
INSERT INTO CAR_dETAILS VALUES(248,30.5,4,97,78,2190,14.1,1977)
1 row(s) inserted.
Statement 740
INSERT INTO CAR_dETAILS VALUES(249,22,6,146,97,2815,14.5,1977)
1 row(s) inserted.
Statement 741
INSERT INTO CAR_dETAILS VALUES(250,21.5,4,121,110,2600,12.8,1977)
1 row(s) inserted.
Statement 742
INSERT INTO CAR_dETAILS VALUES(251,21.5,3,80,110,2720,13.5,1977)
1 row(s) inserted.
Statement 743
INSERT INTO CAR_dETAILS VALUES(252,43.1,4,90,48,1985,21.5,1978)
1 row(s) inserted.
Statement 744
INSERT INTO CAR_dETAILS VALUES(253,36.1,4,98,66,1800,14.4,1978)
1 row(s) inserted.
Statement 745
INSERT INTO CAR_dETAILS VALUES(254,32.8,4,78,52,1985,19.4,1978)
1 row(s) inserted.
Statement 746
INSERT INTO CAR_dETAILS VALUES(255,39.4,4,85,70,2070,18.6,1978)
1 row(s) inserted.
Statement 747
INSERT INTO CAR_dETAILS VALUES(256,36.1,4,91,60,1800,16.4,1978)
1 row(s) inserted.
Statement 748
INSERT INTO CAR_dETAILS VALUES(257,19.9,8,260,110,3365,15.5,1978)
1 row(s) inserted.
Statement 749
INSERT INTO CAR_dETAILS VALUES(258,19.4,8,318,140,3735,13.2,1978)
1 row(s) inserted.
Statement 750
INSERT INTO CAR_dETAILS VALUES(259,20.2,8,302,139,3570,12.8,1978)
1 row(s) inserted.
Statement 751
INSERT INTO CAR_dETAILS VALUES(260,19.2,6,231,105,3535,19.2,1978)
1 row(s) inserted.
Statement 752
INSERT INTO CAR_dETAILS VALUES(261,20.5,6,200,95,3155,18.2,1978)
1 row(s) inserted.
Statement 753
INSERT INTO CAR_dETAILS VALUES(262,20.2,6,200,85,2965,15.8,1978)
1 row(s) inserted.
Statement 754
INSERT INTO CAR_dETAILS VALUES(263,25.1,4,140,88,2720,15.4,1978)
1 row(s) inserted.
Statement 755
INSERT INTO CAR_dETAILS VALUES(264,20.5,6,225,100,3430,17.2,1978)
1 row(s) inserted.
Statement 756
INSERT INTO CAR_dETAILS VALUES(265,19.4,6,232,90,3210,17.2,1978)
1 row(s) inserted.
Statement 757
INSERT INTO CAR_dETAILS VALUES(266,20.6,6,231,105,3380,15.8,1978)
1 row(s) inserted.
Statement 758
INSERT INTO CAR_dETAILS VALUES(267,20.8,6,200,85,3070,16.7,1978)
1 row(s) inserted.
Statement 759
INSERT INTO CAR_dETAILS VALUES(268,18.6,6,225,110,3620,18.7,1978)
1 row(s) inserted.
Statement 760
INSERT INTO CAR_dETAILS VALUES(269,18.1,6,258,120,3410,15.1,1978)
1 row(s) inserted.
Statement 761
INSERT INTO CAR_dETAILS VALUES(270,19.2,8,305,145,3425,13.2,1978)
1 row(s) inserted.
Statement 762
INSERT INTO CAR_dETAILS VALUES(271,17.7,6,231,165,3445,13.4,1978)
1 row(s) inserted.
Statement 763
INSERT INTO CAR_dETAILS VALUES(272,18.1,8,302,139,3205,11.2,1978)
1 row(s) inserted.
Statement 764
INSERT INTO CAR_dETAILS VALUES(273,17.5,8,318,140,4080,13.7,1978)
1 row(s) inserted.
Statement 765
INSERT INTO CAR_dETAILS VALUES(274,30,4,98,68,2155,16.5,1978)
1 row(s) inserted.
Statement 766
INSERT INTO CAR_dETAILS VALUES(275,27.5,4,134,95,2560,14.2,1978)
1 row(s) inserted.
Statement 767
INSERT INTO CAR_dETAILS VALUES(276,27.2,4,119,97,2300,14.7,1978)
1 row(s) inserted.
Statement 768
INSERT INTO CAR_dETAILS VALUES(277,30.9,4,105,75,2230,14.5,1978)
1 row(s) inserted.
Statement 769
INSERT INTO CAR_dETAILS VALUES(278,21.1,4,134,95,2515,14.8,1978)
1 row(s) inserted.
Statement 770
INSERT INTO CAR_dETAILS VALUES(279,23.2,4,156,105,2745,16.7,1978)
1 row(s) inserted.
Statement 771
INSERT INTO CAR_dETAILS VALUES(280,23.8,4,151,85,2855,17.6,1978)
1 row(s) inserted.
Statement 772
INSERT INTO CAR_dETAILS VALUES(281,23.9,4,119,97,2405,14.9,1978)
1 row(s) inserted.
Statement 773
INSERT INTO CAR_dETAILS VALUES(282,20.3,5,131,103,2830,15.9,1978)
1 row(s) inserted.
Statement 774
INSERT INTO CAR_dETAILS VALUES(283,17,6,163,125,3140,13.6,1978)
1 row(s) inserted.
Statement 775
INSERT INTO CAR_dETAILS VALUES(284,21.6,4,121,115,2795,15.7,1978)
1 row(s) inserted.
Statement 776
INSERT INTO CAR_dETAILS VALUES(285,16.2,6,163,133,3410,15.8,1978)
1 row(s) inserted.
Statement 777
INSERT INTO CAR_dETAILS VALUES(286,31.5,4,89,71,1990,14.9,1978)
1 row(s) inserted.
Statement 778
INSERT INTO CAR_dETAILS VALUES(287,29.5,4,98,68,2135,16.6,1978)
1 row(s) inserted.
Statement 779
INSERT INTO CAR_dETAILS VALUES(288,21.5,6,231,115,3245,15.4,1979)
1 row(s) inserted.
Statement 780
INSERT INTO CAR_dETAILS VALUES(289,19.8,6,200,85,2990,18.2,1979)
1 row(s) inserted.
Statement 781
INSERT INTO CAR_dETAILS VALUES(290,22.3,4,140,88,2890,17.3,1979)
1 row(s) inserted.
Statement 782
INSERT INTO CAR_dETAILS VALUES(291,20.2,6,232,90,3265,18.2,1979)
1 row(s) inserted.
Statement 783
INSERT INTO CAR_dETAILS VALUES(292,20.6,6,225,110,3360,16.6,1979)
1 row(s) inserted.
Statement 784
INSERT INTO CAR_dETAILS VALUES(293,17,8,305,130,3840,15.4,1979)
1 row(s) inserted.
Statement 785
INSERT INTO CAR_dETAILS VALUES(294,17.6,8,302,129,3725,13.4,1979)
1 row(s) inserted.
Statement 786
INSERT INTO CAR_dETAILS VALUES(295,16.5,8,351,138,3955,13.2,1979)
1 row(s) inserted.
Statement 787
INSERT INTO CAR_dETAILS VALUES(296,18.2,8,318,135,3830,15.2,1979)
1 row(s) inserted.
Statement 788
INSERT INTO CAR_dETAILS VALUES(297,16.9,8,350,155,4360,14.9,1979)
1 row(s) inserted.
Statement 789
INSERT INTO CAR_dETAILS VALUES(298,15.5,8,351,142,4054,14.3,1979)
1 row(s) inserted.
Statement 790
INSERT INTO CAR_dETAILS VALUES(299,19.2,8,267,125,3605,15,1979)
1 row(s) inserted.
Statement 791
INSERT INTO CAR_dETAILS VALUES(300,18.5,8,360,150,3940,13,1979)
1 row(s) inserted.
Statement 792
INSERT INTO CAR_dETAILS VALUES(301,31.9,4,89,71,1925,14,1979)
1 row(s) inserted.
Statement 793
INSERT INTO CAR_dETAILS VALUES(302,34.1,4,86,65,1975,15.2,1979)
1 row(s) inserted.
Statement 794
INSERT INTO CAR_dETAILS VALUES(303,35.7,4,98,80,1915,14.4,1979)
1 row(s) inserted.
Statement 795
INSERT INTO CAR_dETAILS VALUES(304,27.4,4,121,80,2670,15,1979)
1 row(s) inserted.
Statement 796
INSERT INTO CAR_dETAILS VALUES(305,25.4,5,183,77,3530,20.1,1979)
1 row(s) inserted.
Statement 797
INSERT INTO CAR_dETAILS VALUES(306,23,8,350,125,3900,17.4,1979)
1 row(s) inserted.
Statement 798
INSERT INTO CAR_dETAILS VALUES(307,27.2,4,141,71,3190,24.8,1979)
1 row(s) inserted.
Statement 799
INSERT INTO CAR_dETAILS VALUES(308,23.9,8,260,90,3420,22.2,1979)
1 row(s) inserted.
Statement 800
INSERT INTO CAR_dETAILS VALUES(309,34.2,4,105,70,2200,13.2,1979)
1 row(s) inserted.
Statement 801
INSERT INTO CAR_dETAILS VALUES(310,34.5,4,105,70,2150,14.9,1979)
1 row(s) inserted.
Statement 802
INSERT INTO CAR_dETAILS VALUES(311,31.8,4,85,65,2020,19.2,1979)
1 row(s) inserted.
Statement 803
INSERT INTO CAR_dETAILS VALUES(312,37.3,4,91,69,2130,14.7,1979)
1 row(s) inserted.
Statement 804
INSERT INTO CAR_dETAILS VALUES(313,28.4,4,151,90,2670,16,1979)
1 row(s) inserted.
Statement 805
INSERT INTO CAR_dETAILS VALUES(314,28.8,6,173,115,2595,11.3,1979)
1 row(s) inserted.
Statement 806
INSERT INTO CAR_dETAILS VALUES(315,26.8,6,173,115,2700,12.9,1979)
1 row(s) inserted.
Statement 807
INSERT INTO CAR_dETAILS VALUES(316,33.5,4,151,90,2556,13.2,1979)
1 row(s) inserted.
Statement 808
INSERT INTO CAR_dETAILS VALUES(317,41.5,4,98,76,2144,14.7,1980)
1 row(s) inserted.
Statement 809
INSERT INTO CAR_dETAILS VALUES(318,38.1,4,89,60,1968,18.8,1980)
1 row(s) inserted.
Statement 810
INSERT INTO CAR_dETAILS VALUES(319,32.1,4,98,70,2120,15.5,1980)
1 row(s) inserted.
Statement 811
INSERT INTO CAR_dETAILS VALUES(320,37.2,4,86,65,2019,16.4,1980)
1 row(s) inserted.
Statement 812
INSERT INTO CAR_dETAILS VALUES(321,28,4,151,90,2678,16.5,1980)
1 row(s) inserted.
Statement 813
INSERT INTO CAR_dETAILS VALUES(322,26.4,4,140,88,2870,18.1,1980)
1 row(s) inserted.
Statement 814
INSERT INTO CAR_dETAILS VALUES(323,24.3,4,151,90,3003,20.1,1980)
1 row(s) inserted.
Statement 815
INSERT INTO CAR_dETAILS VALUES(324,19.1,6,225,90,3381,18.7,1980)
1 row(s) inserted.
Statement 816
INSERT INTO CAR_dETAILS VALUES(325,34.3,4,97,78,2188,15.8,1980)
1 row(s) inserted.
Statement 817
INSERT INTO CAR_dETAILS VALUES(326,29.8,4,134,90,2711,15.5,1980)
1 row(s) inserted.
Statement 818
INSERT INTO CAR_dETAILS VALUES(327,31.3,4,120,75,2542,17.5,1980)
1 row(s) inserted.
Statement 819
INSERT INTO CAR_dETAILS VALUES(328,37,4,119,92,2434,15,1980)
1 row(s) inserted.
Statement 820
INSERT INTO CAR_dETAILS VALUES(329,32.2,4,108,75,2265,15.2,1980)
1 row(s) inserted.
Statement 821
INSERT INTO CAR_dETAILS VALUES(330,46.6,4,86,65,2110,17.9,1980)
1 row(s) inserted.
Statement 822
INSERT INTO CAR_dETAILS VALUES(331,27.9,4,156,105,2800,14.4,1980)
1 row(s) inserted.
Statement 823
INSERT INTO CAR_dETAILS VALUES(332,40.8,4,85,65,2110,19.2,1980)
1 row(s) inserted.
Statement 824
INSERT INTO CAR_dETAILS VALUES(333,44.3,4,90,48,2085,21.7,1980)
1 row(s) inserted.
Statement 825
INSERT INTO CAR_dETAILS VALUES(334,43.4,4,90,48,2335,23.7,1980)
1 row(s) inserted.
Statement 826
INSERT INTO CAR_dETAILS VALUES(335,36.4,5,121,67,2950,19.9,1980)
1 row(s) inserted.
Statement 827
INSERT INTO CAR_dETAILS VALUES(336,30,4,146,67,3250,21.8,1980)
1 row(s) inserted.
Statement 828
INSERT INTO CAR_dETAILS VALUES(337,44.6,4,91,67,1850,13.8,1980)
1 row(s) inserted.
Statement 829
INSERT INTO CAR_dETAILS VALUES(338,40.9,4,85,null,1835,17.3,1980)
1 row(s) inserted.
Statement 830
INSERT INTO CAR_dETAILS VALUES(339,33.8,4,97,67,2145,18,1980)
1 row(s) inserted.
Statement 831
INSERT INTO CAR_dETAILS VALUES(340,29.8,4,89,62,1845,15.3,1980)
1 row(s) inserted.
Statement 832
INSERT INTO CAR_dETAILS VALUES(341,32.7,6,168,132,2910,11.4,1980)
1 row(s) inserted.
Statement 833
INSERT INTO CAR_dETAILS VALUES(342,23.7,3,70,100,2420,12.5,1980)
1 row(s) inserted.
Statement 834
INSERT INTO CAR_dETAILS VALUES(343,35,4,122,88,2500,15.1,1980)
1 row(s) inserted.
Statement 835
INSERT INTO CAR_dETAILS VALUES(344,23.6,4,140,null,2905,14.3,1980)
1 row(s) inserted.
Statement 836
INSERT INTO CAR_dETAILS VALUES(345,32.4,4,107,72,2290,17,1980)
1 row(s) inserted.
Statement 837
INSERT INTO CAR_dETAILS VALUES(346,27.2,4,135,84,2490,15.7,1981)
1 row(s) inserted.
Statement 838
INSERT INTO CAR_dETAILS VALUES(347,26.6,4,151,84,2635,16.4,1981)
1 row(s) inserted.
Statement 839
INSERT INTO CAR_dETAILS VALUES(348,25.8,4,156,92,2620,14.4,1981)
1 row(s) inserted.
Statement 840
INSERT INTO CAR_dETAILS VALUES(349,23.5,6,173,110,2725,12.6,1981)
1 row(s) inserted.
Statement 841
INSERT INTO CAR_dETAILS VALUES(350,30,4,135,84,2385,12.9,1981)
1 row(s) inserted.
Statement 842
INSERT INTO CAR_dETAILS VALUES(351,39.1,4,79,58,1755,16.9,1981)
1 row(s) inserted.
Statement 843
INSERT INTO CAR_dETAILS VALUES(352,39,4,86,64,1875,16.4,1981)
1 row(s) inserted.
Statement 844
INSERT INTO CAR_dETAILS VALUES(353,35.1,4,81,60,1760,16.1,1981)
1 row(s) inserted.
Statement 845
INSERT INTO CAR_dETAILS VALUES(354,32.3,4,97,67,2065,17.8,1981)
1 row(s) inserted.
Statement 846
INSERT INTO CAR_dETAILS VALUES(355,37,4,85,65,1975,19.4,1981)
1 row(s) inserted.
Statement 847
INSERT INTO CAR_dETAILS VALUES(356,37.7,4,89,62,2050,17.3,1981)
1 row(s) inserted.
Statement 848
INSERT INTO CAR_dETAILS VALUES(357,34.1,4,91,68,1985,16,1981)
1 row(s) inserted.
Statement 849
INSERT INTO CAR_dETAILS VALUES(358,34.7,4,105,63,2215,14.9,1981)
1 row(s) inserted.
Statement 850
INSERT INTO CAR_dETAILS VALUES(359,34.4,4,98,65,2045,16.2,1981)
1 row(s) inserted.
Statement 851
INSERT INTO CAR_dETAILS VALUES(360,29.9,4,98,65,2380,20.7,1981)
1 row(s) inserted.
Statement 852
INSERT INTO CAR_dETAILS VALUES(361,33,4,105,74,2190,14.2,1981)
1 row(s) inserted.
Statement 853
INSERT INTO CAR_dETAILS VALUES(362,34.5,4,100,null,2320,15.8,1981)
1 row(s) inserted.
Statement 854
INSERT INTO CAR_dETAILS VALUES(363,33.7,4,107,75,2210,14.4,1981)
1 row(s) inserted.
Statement 855
INSERT INTO CAR_dETAILS VALUES(364,32.4,4,108,75,2350,16.8,1981)
1 row(s) inserted.
Statement 856
INSERT INTO CAR_dETAILS VALUES(365,32.9,4,119,100,2615,14.8,1981)
1 row(s) inserted.
Statement 857
INSERT INTO CAR_dETAILS VALUES(366,31.6,4,120,74,2635,18.3,1981)
1 row(s) inserted.
Statement 858
INSERT INTO CAR_dETAILS VALUES(367,28.1,4,141,80,3230,20.4,1981)
1 row(s) inserted.
Statement 859
INSERT INTO CAR_dETAILS VALUES(368,null,4,121,110,2800,15.4,1981)
1 row(s) inserted.
Statement 860
INSERT INTO CAR_dETAILS VALUES(369,30.7,6,145,76,3160,19.6,1981)
1 row(s) inserted.
Statement 861
INSERT INTO CAR_dETAILS VALUES(370,25.4,6,168,116,2900,12.6,1981)
1 row(s) inserted.
Statement 862
INSERT INTO CAR_dETAILS VALUES(371,24.2,6,146,120,2930,13.8,1981)
1 row(s) inserted.
Statement 863
INSERT INTO CAR_dETAILS VALUES(372,22.4,6,231,110,3415,15.8,1981)
1 row(s) inserted.
Statement 864
INSERT INTO CAR_dETAILS VALUES(373,26.6,8,350,105,3725,19,1981)
1 row(s) inserted.
Statement 865
INSERT INTO CAR_dETAILS VALUES(374,20.2,6,200,88,3060,17.1,1981)
1 row(s) inserted.
Statement 866
INSERT INTO CAR_dETAILS VALUES(375,17.6,6,225,85,3465,16.6,1981)
1 row(s) inserted.
Statement 867
INSERT INTO CAR_dETAILS VALUES(376,28,4,112,88,2605,19.6,1982)
1 row(s) inserted.
Statement 868
INSERT INTO CAR_dETAILS VALUES(377,27,4,112,88,2640,18.6,1982)
1 row(s) inserted.
Statement 869
INSERT INTO CAR_dETAILS VALUES(378,34,4,112,88,2395,18,1982)
1 row(s) inserted.
Statement 870
INSERT INTO CAR_dETAILS VALUES(379,31,4,112,85,2575,16.2,1982)
1 row(s) inserted.
Statement 871
INSERT INTO CAR_dETAILS VALUES(380,29,4,135,84,2525,16,1982)
1 row(s) inserted.
Statement 872
INSERT INTO CAR_dETAILS VALUES(381,27,4,151,90,2735,18,1982)
1 row(s) inserted.
Statement 873
INSERT INTO CAR_dETAILS VALUES(382,24,4,140,92,2865,16.4,1982)
1 row(s) inserted.
Statement 874
INSERT INTO CAR_dETAILS VALUES(383,23,4,151,null,3035,20.5,1982)
1 row(s) inserted.
Statement 875
INSERT INTO CAR_dETAILS VALUES(384,36,4,105,74,1980,15.3,1982)
1 row(s) inserted.
Statement 876
INSERT INTO CAR_dETAILS VALUES(385,37,4,91,68,2025,18.2,1982)
1 row(s) inserted.
Statement 877
INSERT INTO CAR_dETAILS VALUES(386,31,4,91,68,1970,17.6,1982)
1 row(s) inserted.
Statement 878
INSERT INTO CAR_dETAILS VALUES(387,38,4,105,63,2125,14.7,1982)
1 row(s) inserted.
Statement 879
INSERT INTO CAR_dETAILS VALUES(388,36,4,98,70,2125,17.3,1982)
1 row(s) inserted.
Statement 880
INSERT INTO CAR_dETAILS VALUES(389,36,4,120,88,2160,14.5,1982)
1 row(s) inserted.
Statement 881
INSERT INTO CAR_dETAILS VALUES(390,36,4,107,75,2205,14.5,1982)
1 row(s) inserted.
Statement 882
INSERT INTO CAR_dETAILS VALUES(391,34,4,108,70,2245,16.9,1982)
1 row(s) inserted.
Statement 883
INSERT INTO CAR_dETAILS VALUES(392,38,4,91,67,1965,15,1982)
1 row(s) inserted.
Statement 884
INSERT INTO CAR_dETAILS VALUES(393,32,4,91,67,1965,15.7,1982)
1 row(s) inserted.
Statement 885
INSERT INTO CAR_dETAILS VALUES(394,38,4,91,67,1995,16.2,1982)
1 row(s) inserted.
Statement 886
INSERT INTO CAR_dETAILS VALUES(395,25,6,181,110,2945,16.4,1982)
1 row(s) inserted.
Statement 887
INSERT INTO CAR_dETAILS VALUES(396,38,6,262,85,3015,17,1982)
1 row(s) inserted.
Statement 888
INSERT INTO CAR_dETAILS VALUES(397,26,4,156,92,2585,14.5,1982)
1 row(s) inserted.
Statement 889
INSERT INTO CAR_dETAILS VALUES(398,22,6,232,112,2835,14.7,1982)
1 row(s) inserted.
Statement 890
INSERT INTO CAR_dETAILS VALUES(399,32,4,144,96,2665,13.9,1982)
1 row(s) inserted.
Statement 891
INSERT INTO CAR_dETAILS VALUES(400,36,4,135,84,2370,13,1982)
1 row(s) inserted.
Statement 892
INSERT INTO CAR_dETAILS VALUES(401,27,4,151,90,2950,17.3,1982)
1 row(s) inserted.
Statement 893
INSERT INTO CAR_dETAILS VALUES(402,27,4,140,86,2790,15.6,1982)
1 row(s) inserted.
Statement 894
INSERT INTO CAR_dETAILS VALUES(403,44,4,97,52,2130,24.6,1982)
1 row(s) inserted.
Statement 895
INSERT INTO CAR_dETAILS VALUES(404,32,4,135,84,2295,11.6,1982)
1 row(s) inserted.
Statement 896
INSERT INTO CAR_dETAILS VALUES(405,28,4,120,79,2625,18.6,1982)
1 row(s) inserted.
Statement 897
INSERT INTO CAR_dETAILS VALUES(406,31,4,119,82,2720,19.4,1982)
1 row(s) inserted.