use music_data ;

CREATE TABLE employee(
employee_id VARCHAR(50) PRIMARY KEY,
last_name CHAR(50),
first_name CHAR(50),
title VARCHAR(50),
reports_to VARCHAR(30),
levels VARCHAR(10),
birthdate TIMESTAMP,
hire_date TIMESTAMP,
address VARCHAR(120),
city VARCHAR(50),
state VARCHAR(50),
country VARCHAR(30),
postal_code VARCHAR(30),
phone VARCHAR(30),
fax VARCHAR(30),
email VARCHAR(30));


SET SESSION sql_mode = '';

SET SQL_SAFE_UPDATES = 0;

SET SQL_SAFE_UPDATES = 1;  

load data infile
"E:/Music Playlist- SQL Project/employee.csv"
into table employee
fields terminated by ','
lines terminated by '\n'
ignore 1 rows;

select * from employee ;

----------------------------------------------------------------------------------------------------------------------------------------- # 1

CREATE TABLE customer(
customer_id VARCHAR(30) PRIMARY KEY,
first_name CHAR(30),
last_name CHAR(30),
company VARCHAR(30),
address VARCHAR(30),
city VARCHAR(30),
state VARCHAR(30),
country VARCHAR(30),
postal_code INT8,
phone INT,
fax INT,
email VARCHAR(30),
support_rep_id VARCHAR(30));

load data infile
"E:/Music Playlist- SQL Project/customer.csv"
into table customer
fields terminated by ','
lines terminated by '\n'
ignore 1 rows;

select * from customer; 

---------------------------------------------------------------------------------------------------------------------------------------- # 2

CREATE TABLE invoice(
invoice_id VARCHAR(30) PRIMARY KEY,
customer_id VARCHAR(30),
invoice_date date,
billing_address VARCHAR(120),
billing_city VARCHAR(30),
billing_state VARCHAR(30),
billing_country VARCHAR(30),
billing_postal VARCHAR(30),
total FLOAT8);

drop table invoice;

load data infile
"E:/Music Playlist- SQL Project/cleaned_invoice.csv"
into table invoice
fields terminated by ','
lines terminated by '\n'
ignore 1 rows;

select * from invoice;

-------------------------------------------------------------------------------------------------------------------------------------- # 3


CREATE TABLE invoice_line(
invoice_line_id VARCHAR(50) PRIMARY KEY,
invoice_id VARCHAR(30),
track_id VARCHAR(30),
unit_price VARCHAR(30),
quantity VARCHAR(30));

load data infile
"E:/Music Playlist- SQL Project/invoice_line.csv"
into table invoice_line
fields terminated by ','
lines terminated by '\n'
ignore 1 rows;

---------------------------------------------------------------------------------------------------------------------------------------- # 4

CREATE TABLE track(
track_id VARCHAR(50) PRIMARY KEY,
name VARCHAR(30),
album_id VARCHAR(30),
media_type_id VARCHAR(30),
genre_id VARCHAR(30),
composer VARCHAR(30),
milliseconds TIMESTAMP,
bytes INT8,
unit_price INT  );

load data infile
"E:/Music Playlist- SQL Project/track.csv"
into table track
fields terminated by ','
lines terminated by '\n'
ignore 1 rows;

---------------------------------------------------------------------------------------------------------------------------------------- # 5

CREATE TABLE playlist(
playlist_id VARCHAR(50) PRIMARY KEY,
name  VARCHAR(30));

load data infile
"E:/Music Playlist- SQL Project/playlist.csv"
into table playlist
fields terminated by ','
lines terminated by '\n'
ignore 1 rows;

select * from playlist;

------------------------------------------------------------------------------------------------------------------------------------------- # 6
drop table playlist_track;

use music_data;

CREATE TABLE playlist_track(
playlist_id VARCHAR(50) PRIMARY KEY,
track_id VARCHAR(40) PRIMARY KEY);

CREATE TABLE playlist_track (
    playlist_id VARCHAR(50),
    track_id VARCHAR(40),
    PRIMARY KEY (playlist_id, track_id)
);

drop table playlist_track;

load data infile
"E:/Music Playlist- SQL Project/playlist_track.csv"
into table playlist_track
fields terminated by ','
lines terminated by '\n'
ignore 1 rows;


select * from playlist_track;

------------------------------------------------------------------------------------------------------------------------------------------# 7


CREATE TABLE artist(
artist_id VARCHAR(100) PRIMARY KEY,
name  VARCHAR(200)); 

drop table artist;

load data infile
"E:/Music Playlist- SQL Project/encoded-artist.csv"
into table artist
fields terminated by ','
lines terminated by '\n'
ignore 1 rows;

select * from artist;

----------------------------------------------------------------------------------------------------------------------------------------- # 8

CREATE TABLE album(
album_id VARCHAR(50) PRIMARY KEY,
title  VARCHAR(100),
artist_id  VARCHAR(100));

drop table album;

load data infile
"E:/Music Playlist- SQL Project/album.csv"
into table album
fields terminated by ','
lines terminated by '\n'
ignore 1 rows;

select * from album; 

------------------------------------------------------------------------------------------------------------------------------------------- # 9

CREATE TABLE media_type(
media_type_id VARCHAR(50) PRIMARY KEY,
name VARCHAR(50));

load data infile
"E:/Music Playlist- SQL Project/media_type.csv"
into table media_type
fields terminated by ','
lines terminated by '\n'
ignore 1 rows;


select * from media_type;

------------------------------------------------------------------------------------------------------------------------------------------ # 10
CREATE TABLE genre(
genre_id VARCHAR(50) PRIMARY KEY,
name VARCHAR(30));

load data infile
"E:/Music Playlist- SQL Project/genre.csv"
into table genre 
fields terminated by ','
lines terminated by '\n'
ignore 1 rows;

select * from genre;

-------------------------------------------------------------------------------------------------------------------------------------------------
