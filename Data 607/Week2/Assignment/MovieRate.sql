/*
 Sedo Oh
 Week 2 Assignment
 */

-- Drop Tables
DROP TABLE IF EXISTS Movies;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Rating;

-- Movie List
CREATE TABLE Movies (
  MovieID int NOT NULL auto_increment,
  MovieName varchar(50) NOT NULL,
  Primary Key (MovieID)
);

INSERT INTO Movies (MovieName) VALUES ("Fast and Furious");
INSERT INTO Movies (MovieName) VALUES ("Spider Man");
INSERT INTO Movies (MovieName) VALUES ("Iron Man");
INSERT INTO Movies (MovieName) VALUES ("Captain America");
INSERT INTO Movies (MovieName) VALUES ("Transformers");
INSERT INTO Movies (MovieName) VALUES ("Despicable Me");

Select * from Movies;

-- User List
CREATE TABLE Users (
  UserID int NOT NULL auto_increment,
  UserName varchar(50) NOT NULL,
  primary key (UserID)
);

INSERT INTO Users (UserName) VALUES ("James");
INSERT INTO Users (UserName) VALUES ("Sam");
INSERT INTO Users (UserName) VALUES ("David");
INSERT INTO Users (UserName) VALUES ("John");
INSERT INTO Users (UserName) VALUES ("Eric");	

Select * from Users;

-- Rating List
CREATE TABLE Rating (
    RateID INT NOT NULL auto_increment,
    UserID INT,
    MovieID INT,
    Rating INT NOT NULL,
    CHECK (Rating >=1 and Rating <=5),
    primary key (RateID),
    foreign key (UserID) references Users (UserID) on update cascade,
    foreign key (MovieID) references Movies (MovieID) on update cascade
);

INSERT INTO Rating (UserID, MovieID, Rating) VALUES (1,1,2);
INSERT INTO Rating (UserID, MovieID, Rating) VALUES (1,2,4);
INSERT INTO Rating (UserID, MovieID, Rating) VALUES (1,3,4);
INSERT INTO Rating (UserID, MovieID, Rating) VALUES (1,4,5);
INSERT INTO Rating (UserID, MovieID, Rating) VALUES (1,5,5);
INSERT INTO Rating (UserID, MovieID, Rating) VALUES (1,6,3);
INSERT INTO Rating (UserID, MovieID, Rating) VALUES (2,1,5);
INSERT INTO Rating (UserID, MovieID, Rating) VALUES (2,2,4);
INSERT INTO Rating (UserID, MovieID, Rating) VALUES (2,3,4);
INSERT INTO Rating (UserID, MovieID, Rating) VALUES (2,4,2);
INSERT INTO Rating (UserID, MovieID, Rating) VALUES (2,5,2);
INSERT INTO Rating (UserID, MovieID, Rating) VALUES (2,6,3);
INSERT INTO Rating (UserID, MovieID, Rating) VALUES (3,1,5);
INSERT INTO Rating (UserID, MovieID, Rating) VALUES (3,2,3);
INSERT INTO Rating (UserID, MovieID, Rating) VALUES (3,3,4);
INSERT INTO Rating (UserID, MovieID, Rating) VALUES (3,4,3);
INSERT INTO Rating (UserID, MovieID, Rating) VALUES (3,5,4);
INSERT INTO Rating (UserID, MovieID, Rating) VALUES (3,6,1);
INSERT INTO Rating (UserID, MovieID, Rating) VALUES (4,1,2);
INSERT INTO Rating (UserID, MovieID, Rating) VALUES (4,2,1);
INSERT INTO Rating (UserID, MovieID, Rating) VALUES (4,3,5);
INSERT INTO Rating (UserID, MovieID, Rating) VALUES (4,4,1);
INSERT INTO Rating (UserID, MovieID, Rating) VALUES (4,5,2);
INSERT INTO Rating (UserID, MovieID, Rating) VALUES (4,6,4);
INSERT INTO Rating (UserID, MovieID, Rating) VALUES (5,1,4);
INSERT INTO Rating (UserID, MovieID, Rating) VALUES (5,2,2);
INSERT INTO Rating (UserID, MovieID, Rating) VALUES (5,3,5);
INSERT INTO Rating (UserID, MovieID, Rating) VALUES (5,4,1);
INSERT INTO Rating (UserID, MovieID, Rating) VALUES (5,5,4);
INSERT INTO Rating (UserID, MovieID, Rating) VALUES (5,6,4);

Select * from Rating;

-- Combine all 3 tables
select
	Movies.MovieName as 'MovieName',
    Users.UserName as 'UserName',
    Rating.Rating as 'Rating'
From
	Rating
		LEFT join
        Users on Users.UserID = Rating.UserID
        LEFT JOIN
        Movies ON Movies.MovieID = Rating.MovieID
Order by UserName;

-- Looks good

