# Hair Cuttery Management System

#### A Salon owner will keep track of the stylists and clients, December 11, 2016

#### By Getro Naissance

## Description

* A salon owner will be able to view, add, update and delete stylists.
* A salon owner will be able to view, add, update and delete clients.
* A salon owner will be able to to add clients to a stylist

## Setup/Installation Requirements

* Open the terminal with two additional tabs.
* On the first tab, type "postgres" during the entirety of your interaction with the program.
* On the second tab, type "psql" in order to create the database and the table.
* CREATE DATABASE hair_salon;
* CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);
* CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int);
* On the third tab, simply run "ruby app.rb"
* It is imperative that the server is running while you are fiddling with the app.

## Known Bugs

There are no known bugs as of now.

## Support and contact details

if you run into any issues or have questions, ideas or concerns. Feel free to contact me at getro89@gmail.com

## Technologies Used

*Sinatra
*Ruby
*CSS

### License

@Epicodus 2016, All rights reserved.
Copyright (c) 2016 **Getro Naissance**
