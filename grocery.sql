create table users (
user_id serial primary key,
email text NOT NULL,
password text NOT NULL,
user_name text NOT NULL
);

create table ingredients (
ingredient_id serial primary key,
item text NOT NULL
);

create table recipes(
recipe_id serial primary key,
recipe_name text NOT NULL,
ingredient int NOT NULL REFERENCES INGREDIENTS(ingredient_id),
instructions text NOT NULL,
public_recipe boolean NOT NULL,
recipe_owner int NOT NULL REFERENCES users(user_id)
);

create table grocery_list (
grocery_id serial primary key,
grocery_list_owner int NOT NULL References users(user_id),
recipe_ingredients int NOT NULL References ingredients(ingredient_id),
recipe_id int NOT NULL References recipes(recipe_id)
);

create table follower (
follower_id int NOT NULL References users(user_id),
followee_id int NOT NULL References users(user_id)
);

create table occasions (
occasion_id serial primary key,
event_name text NOT NULL,
recipe_id int NOT NULL References recipes(recipe_id),
recipe_ingredients int NOT NULL References ingredients(ingredient_id),
user_id int NOT NULL References users(user_id)
);