# Superheroes_Data_Analysis

<img width="766" alt="image" src="C:\Users\gaura\OneDrive\Pictures\wallhaven-vqqe28.jpg">

## Overview

Welcome to the Superhero Data Analysis project! This repository houses the code and resources for analyzing data related to superheroes. Whether you're a comic book enthusiast, a data scientist, or just curious about the world of superheroes, this project provides insights into the fascinating realm of fictional characters with extraordinary abilities.
The dataset was obtained from the 
[kaggle dataset of superhero movies from 1978 to 2018](https://www.kaggle.com/datasets/abhishekbagwan/superhero-1978-movie-csv)
[kaggle dataset for superheroes comics universe](https://www.kaggle.com/datasets/ankytastic/superheroes-comic-universe?rvi=1)
and [kaggle dataset for superheroes powers and information](https://www.kaggle.com/code/julianacorts/heroes-and-villains-comics-eda)

Beside these sets of data another CSV data is fetched with the help of CHATGPT about superheroes character that have appeared in the movie list.


### Features
Data Exploration: Dive into an extensive dataset containing information about superhero characters, their movies, and release years.
Statistical Analysis: Uncover interesting facts, distributions, and correlations within the superhero universe.
Ranking and Trends: Identify the most recent movies, popular characters, and evolving trends over time.

## Purpose of the Project

The major Aim of this project is to gain insight and get to a meaningful conclusion of the datasets, and understand better trends related to superheroes Movies.

## about Data

The dataset was obtained from the 
[kaggle dataset of superhero movies from 1978 to 2018](https://www.kaggle.com/datasets/abhishekbagwan/superhero-1978-movie-csv)
consist of 732 rows about movie release during 1978 to 2018.

| Field                     | Type              |
|---------------------------|-------------------|
| Rank                      | int               |
| Title                     | text              |
| Studio                    | text              |
| Lifetime Gross /Theaters  | decimal(12,2)     |
| Lifetime Gross /Theaters2 | int               |
| Opening /Theaters         | int               |
| Opening /Theaters2        | int               |
| DATE                      | date              |


Also,
[kaggle dataset for superheroes comics universe](https://www.kaggle.com/datasets/ankytastic/superheroes-comic-universe?rvi=1)
consist of 731 rows
| Field             | Type   |
|-------------------|--------|
| MyUnknownColumn   | int    |
| Name              | text   |
| Intelligence      | int    |
| Strength          | int    |
| Speed             | int    |
| Durability        | int    |
| Power             | int    |
| Combat            | int    |
| Full-Name         | text   |
| Alter-Egos        | text   |
| Aliases           | text   |
| Place-Of-Birth    | text   |
| First-Appearance  | text   |
| Publisher         | text   |
| Alignment         | text   |
| Gender            | text   |
| Race              | text   |
| Height            | text   |
| Weight            | text   |
| Eye-Color         | text   |
| Hair-Color        | text   |
| Occupation        | text   |
| Base              | text   |
| Group-Affiliation | text   |
| Relatives         | text   |
| Image-Url         | text   |

Also,
[kaggle dataset for superheroes powers and information](https://www.kaggle.com/code/julianacorts/heroes-and-villains-comics-eda)
consist of 667 rows about basic heroes_info and their superpowers.

| Field           | Type   |
|-----------------|--------|
| index           | int    |
| name            | text   |
| Gender          | text   |
| Eye color       | text   |
| Race            | text   |
| Hair color      | text   |
| Height          | double |
| Publisher       | text   |
| Skin color      | text   |
| Alignment       | text   |
| Weight          | double |


| Field                      | Type     |
|----------------------------|----------|
| hero_names                 | text     |
| Agility                    | text     |
| Accelerated Healing        | text     |
| Lantern Power Ring         | text     |
| Dimensional Awareness      | text     |
| Cold Resistance            | text     |
| Durability                 | text     |
| Stealth                    | text     |
| Energy Absorption          | text     |
| Flight                     | text     |
| Danger Sense               | text     |
| Underwater breathing       | text     |
| Marksmanship               | text     |
| Weapons Master             | text     |
| Power Augmentation         | text     |
| Animal Attributes          | text     |
| ------------------------   | ------   |

### Approach Used
1. Data Wrangling: This is the first step where inspection of data is done to make sure NULL values and missing values are detected and data replacement methods are used to replace, missing or NULL values.
  1. Build a database
  2. Create table and insert the data.
  3. Select columns with null values in them. There are no null values in our database as in creating the tables, we set NOT NULL for each field, hence null values are filtered out.

2. Exploratory Data Analysis (EDA): Exploratory data analysis is done to answer the listed questions and aims of this project.

### Quesions Inquired-

1. What are the names,publisher of all the superheroes who has good alignment in the dataset heroes_info ?
2. provide count of each supercharacter on the basis of publisher and its alignment?
3. How many superheroes have powers related to telepathy and which publisher they belong?
4. show the count of supes on the basis of previous question requirement group them by publisher & gender?
5. from above data in marvel comics publisher what are the alignment of telepaths,their full name and first appearance in comics?
6. for above data find name of superheroes that appeared in movies and its lifetime collection(earnings)?
7. Which superhero has the most movies in the dataset?
8. Which superhero has collective highest boxoffice gross earning?
9. List the count of movie released before & after year 2010 ,also total Earning collection made?
10. top 10 list of superhero have most set of superpower, publisher name , first appearance,race,alignment,?
etc.














