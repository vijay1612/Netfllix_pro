# Netflix Movies and TV Shows using SQL
![Netflix Logo](https://github.com/vijay1612/Netfllix_pro/blob/main/pngimg.com%20-%20netflix_PNG6.png)

Netflix Data Analysis Project

This repository contains SQL queries used to analyze a dataset of Netflix content, including movies and TV shows. The project involves querying data from a relational database to extract insights about the content on Netflix, including statistics, content categorization, and more. The dataset contains information such as the show’s title, director, type, country, release year, rating, and more.

Project Overview

The main purpose of this project is to explore and analyze the Netflix dataset using SQL. The project answers various questions about the Netflix content, such as:
	•	The most common ratings for movies and TV shows
	•	The top countries with the most content on Netflix
	•	Analysis of content added over the last 5 years
	•	The number of movies and TV shows in each genre
	•	Finding movies and TV shows by director or content type

Database Structure

The netflix table contains the following columns:
	•	show_id: Unique identifier for the show
	•	type: Type of content (Movie/TV Show)
	•	title: Title of the show
	•	director: Director(s) of the show
	•	casts: Actors in the show
	•	country: Country where the show is available
	•	date_added: Date the show was added to Netflix
	•	release_year: Year the show was released
	•	rating: Rating of the show
	•	duration: Duration of the show (for TV shows, this could be the number of seasons)
	•	listed_in: Categories or genres the show falls into
	•	description: A short description of the show

SQL Queries & Analysis

1. Count the number of movies vs TV shows
	•	This query counts the total number of movies and TV shows in the dataset.

2. Find the most common rating for movies and TV shows
	•	This query identifies the most common rating for each content type (movie and TV show).

3. List all movies released in 2020
	•	This query retrieves all movies released in 2020.

4. Find the top 5 countries with the most content on Netflix
	•	This query counts the number of shows available in each country and returns the top 5 countries with the most content.

5. Identify the longest duration movie
	•	This query finds the movie with the longest duration.

6. Find content added in the last five years
	•	This query lists all Netflix content added in the last 5 years.

7. Find all movies/TV shows by director ‘Rajiv Chilaka’
	•	This query retrieves all content directed by “Rajiv Chilaka.”

8. List all TV shows with more than 5 seasons
	•	This query returns all TV shows that have more than 5 seasons.

9. Count the number of content items in each genre
	•	This query counts the total content per genre, based on the listed_in field.

10. Find each year and the average number of content released by the USA on Netflix (Top 5 years with the highest average content release)
	•	This query calculates the average number of content releases by year for the United States.

11. List all movies that are documentaries
	•	This query lists all movies categorized as “Documentaries.”

12. Find all the content without a director
	•	This query retrieves all content items where the director field is NULL.

13. Find how many movies the actor “Luis Ernesto Franco” appeared in during the last 10 years
	•	This query finds the number of movies in which the actor appeared in the last 10 years.

14. Find the top 10 actors who have appeared in the highest number of movies produced in the United States
	•	This query lists the top 10 actors who have appeared in the most movies made in the United States.

15. Categorize the content based on the presence of the keywords ‘kill’ and ‘violence’ in the description
	•	This query categorizes content as “bad” if the description contains “kill” or “violence” and “good” otherwise. It then counts how many items fall in each category.

Technologies Used
	•	SQL: All analysis is performed using SQL queries on a relational database (PostgreSQL or any other RDBMS).
	•	PostgreSQL: The queries are designed to work with PostgreSQL. Adjustments may be necessary for other database systems.

Setup and Requirements
	1.	Clone the Repository:git clone https://github.com/yourusername/netflix-project.git
 	2.	Database Setup:
	•	You need a relational database (like PostgreSQL) where you can create the netflix table and run these SQL queries.
	•	Use the provided SQL schema to create the table in your database.
