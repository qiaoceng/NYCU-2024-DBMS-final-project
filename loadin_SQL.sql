create table Calorie(
    food varchar(100),
    Caloric_Value FLOAT default 0,
    primary key (food)
);

load data local infile './Calorie.csv'
into table Calorie
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 lines;

create table Carbon_Sugar(
    food varchar(100),
    Carbohydrates FLOAT default 0,
    Sugars FLOAT default 0,
    primary key (food)
);

load data local infile './Carbon_Sugar.csv'
into table Carbon_Sugar
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 lines;

create table Dietary_Fiber_Cholesterol(
    food varchar(100),
    Dietary_Fiber FLOAT default 0,
    Cholesterol FLOAT default 0,
    primary key (food)
);

load data local infile './Dietary_Fiber_Cholesterol.csv'
into table Dietary_Fiber_Cholesterol
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 lines;

create table Fat(
    food varchar(100),
    Fat FLOAT default 0,
    Saturated_Fats FLOAT default 0,
    Monounsaturated_Fats FLOAT default 0,
    Polyunsaturated_Fats FLOAT default 0,
    primary key (food)
);

load data local infile './Fat.csv'
into table Fat
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 lines;

create table Mineral(
    food varchar(100),
    Sodium FLOAT default 0,
    Calcium FLOAT default 0,
    Copper FLOAT default 0,
    Iron FLOAT default 0,
    Magnesium FLOAT default 0,
    Manganese FLOAT default 0,
    Phosphorus FLOAT default 0,
    Potassium FLOAT default 0,
    Selenium FLOAT default 0,
    Zinc FLOAT default 0,
    primary key (food)
);

load data local infile './Minerals.csv'
into table Mineral
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 lines;

create table Nutrition_Density(
    food varchar(100),
    Nutrition_Density FLOAT default 0,
    primary key (food)
);

load data local infile './Nutrition_Density.csv'
into table Nutrition_Density
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 lines;

create table Protein(
    food varchar(100),
    Protein FLOAT default 0,
    primary key (food)
);

load data local infile './Protein.csv'
into table Protein
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 lines;

create table Vitamin(
    food varchar(100),
    Vitamin_A FLOAT default 0,
    Vitamin_B1 FLOAT default 0,
    Vitamin_B11 FLOAT default 0,
    Vitamin_B12 FLOAT default 0,
    Vitamin_B2 FLOAT default 0,
    Vitamin_B3 FLOAT default 0,
    Vitamin_B5 FLOAT default 0,
    Vitamin_B6 FLOAT default 0,
    Vitamin_C FLOAT default 0,
    Vitamin_D FLOAT default 0,
    Vitamin_E FLOAT default 0,
    Vitamin_K FLOAT default 0,
    primary key (food)
);

load data local infile './Vitamin.csv'
into table Vitamin
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 lines;

create table Water(
    food varchar(100),
    Water FLOAT default 0,
    primary key (food)
);

load data local infile './Water.csv'
into table Water
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 lines;

CREATE TABLE customers (
    user_id INT PRIMARY KEY auto_increment,
    name VARCHAR(100),
    password VARCHAR(100),
    workout_frequency INT,
    weight FLOAT,
    height FLOAT,
    age INT
);

CREATE TABLE meals (
    user_id INT not null,
    date DATE not null,
    time VARCHAR(30) not null,
    food VARCHAR(100) not null,
    PRIMARY KEY (user_id, date, time, food)
);

CREATE VIEW foods AS
SELECT Calorie.food, Calorie.Caloric_Value, Carbon_Sugar.Carbohydrates, Carbon_Sugar.Sugars,
    Dietary_Fiber_Cholesterol.Dietary_Fiber, Dietary_Fiber_Cholesterol.Cholesterol, 
    Fat.Fat, Fat.Saturated_Fats, Fat.Monounsaturated_Fats, Fat.Polyunsaturated_Fats,
    Mineral.Sodium, Mineral.Calcium, Mineral.Copper, Mineral.Iron, Mineral.Magnesium, Mineral.Manganese, Mineral.Phosphorus, Mineral.Potassium, Mineral.Selenium, Mineral.Zinc,
    Nutrition_Density.Nutrition_Density, Protein.Protein,
    Vitamin.Vitamin_A, Vitamin.Vitamin_B1, Vitamin.Vitamin_B2, Vitamin.Vitamin_B3, Vitamin.Vitamin_B5, Vitamin.Vitamin_B6, Vitamin.Vitamin_B11, Vitamin.Vitamin_B12, Vitamin.Vitamin_C, Vitamin.Vitamin_D, Vitamin.Vitamin_E, Vitamin.Vitamin_K,
    Water.Water
FROM Calorie, Carbon_Sugar, Dietary_Fiber_Cholesterol, Fat, Mineral, Nutrition_Density, Protein, Vitamin, Water
WHERE Calorie.food = Carbon_Sugar.food 
AND Carbon_Sugar.food = Dietary_Fiber_Cholesterol.food 
AND Dietary_Fiber_Cholesterol.food = Fat.food 
AND Fat.food = Mineral.food 
AND Mineral.food = Nutrition_Density.food 
AND Nutrition_Density.food = Protein.food 
AND Protein.food = Vitamin.food 
AND Vitamin.food = Water.food;
