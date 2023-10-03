CREATE DATABASE Theatre;

USE Theatre;

CREATE TABLE Theatre (
  TheatreID INT PRIMARY KEY,
  TheatreName VARCHAR(255) NOT NULL,
  Location VARCHAR(255),
  ContactNumber VARCHAR(15)
);

CREATE TABLE Movie (
  MovieID INT PRIMARY KEY,
  MovieTitle VARCHAR(255) NOT NULL,
  Genre VARCHAR(50),
  ReleaseYear INT
);

CREATE TABLE shows (
  ShowID INT PRIMARY KEY,
  MovieID INT,
  TheatreID INT,
  ShowDate DATE,
  FOREIGN KEY (MovieID) REFERENCES Movie(MovieID),
  FOREIGN KEY (TheatreID) REFERENCES Theatre(TheatreID)
);

CREATE TABLE ShowTiming (
  ShowTimingID INT PRIMARY KEY,
  ShowID INT,
  StartTime TIME,
  FOREIGN KEY (ShowID) REFERENCES shows(ShowID)
);


INSERT INTO Theatre (TheatreID, TheatreName, Location, ContactNumber)
VALUES (1, 'ABC Theatre', 'CityName', '123-456-7890');


INSERT INTO Movie (MovieID, MovieTitle, Genre, ReleaseYear)
VALUES (1, 'MovieTitle1', 'Action', 2022);

INSERT INTO shows(ShowID, MovieID, TheatreID, ShowDate)
VALUES (1, 1, 1, '2023-01-15');


INSERT INTO ShowTiming (ShowTimingID, ShowID, StartTime)
VALUES (1, 1, '18:00:00');
INSERT INTO ShowTiming (ShowTimingID, ShowID, StartTime)
VALUES (2, 1, '20:30:00');

SELECT
    M.MovieTitle,
    S.ShowDate,
    ST.StartTime
FROM
    shows S
JOIN
    Movie M ON S.MovieID = M.MovieID
JOIN
    ShowTiming ST ON S.ShowID = ST.ShowID
WHERE
    S.TheatreID = theatreID
    AND S.ShowDate = selectedDate;




