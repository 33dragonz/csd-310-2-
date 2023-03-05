/*
    Title: whatabook.init.sql
    Author: natasha jeter
    Date: 3-4-2023
    Description: WhatABook database initialization script.
*/

import mysql.connector 
from mysql.connector import error code

config = {
    "user": "root",
    "password": "Elisea2025!",
    "host": "127.0.0.1",
    "database": "whatabook",
    "raise_on_warnings": True
}





-- drop test user if exists 
DROP USER IF EXISTS 'root'@'localhost';
-- create whatabook_user and grant them all privileges to the whatabook database 
CREATE USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Elisea2025!';
-- grant all privileges to the whatabook database to user whatabook_user on localhost 
GRANT ALL PRIVILEGES ON whatabook.* TO'root'@'localhost';
-- drop contstraints if they exist
ALTER TABLE wishlist DROP FOREIGN KEY fk_book;
ALTER TABLE wishlist DROP FOREIGN KEY fk_user;
-- drop tables if they exist
DROP TABLE IF EXISTS store;
DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS wishlist;
DROP TABLE IF EXISTS user;
/*
    Create table(s)
*/
CREATE TABLE store (
    store_id    INT             NOT NULL    AUTO_INCREMENT,
    locale      VARCHAR(500)    NOT NULL,
    PRIMARY KEY(store_id)
);
CREATE TABLE book (
    book_id     INT             NOT NULL    AUTO_INCREMENT,
    book_name   VARCHAR(200)    NOT NULL,
    author      VARCHAR(200)    NOT NULL,
    details     VARCHAR(500),
    PRIMARY KEY(book_id)
);
CREATE TABLE user (
    user_id         INT         NOT NULL    AUTO_INCREMENT,
    first_name      VARCHAR(75) NOT NULL,
    last_name       VARCHAR(75) NOT NULL,
    PRIMARY KEY(user_id) 
);
CREATE TABLE wishlist (
    wishlist_id     INT         NOT NULL    AUTO_INCREMENT,
    user_id         INT         NOT NULL,
    book_id         INT         NOT NULL,
    PRIMARY KEY (wishlist_id),
    CONSTRAINT fk_book
    FOREIGN KEY (book_id)
        REFERENCES book(book_id),
    CONSTRAINT fk_user
    FOREIGN KEY (user_id)
        REFERENCES user(user_Id)
);
/*
    insert store record 
*/
INSERT INTO store(locale)
    VALUES('555 Bookington Way, Bellevue, NE 68005');
/*
    insert book records 
*/
INSERT INTO book(book_name, author, details)
    VALUES('The Hunger Games', 'Suzanne Collins', 'Kids killing kids in dystopian tournaments');
INSERT INTO book(book_name, author, details)
    VALUES('Alice in Wonderland', 'Lewis Carroll', 'Girls falls down rabbit hole into trippy alternate universe');
INSERT INTO book(book_name, author, details)
    VALUES('The Lord of the Flies', 'William Golding', "Kids killing kids but on the beach");
INSERT INTO book(book_name, author)
    VALUES('On a Pale Horse', 'Piers Anthony');
INSERT INTO book(book_name, author)
    VALUES('Dune: Deluxe Edition', 'Frank Herbert');
INSERT INTO book(book_name, author)
    VALUES("Night", 'Elie Weasel');
INSERT INTO book(book_name, author)
    VALUES('The Hitchikers Guide to the Galaxy', 'Douglas Adams');
INSERT INTO book(book_name, author)
    VALUES('Hamlet', 'William Shakespeare');
INSERT INTO book(book_name, author)
    VALUES('A Tale of Two Cities', 'Charles Dickens');
/*
    insert user
*/ 
INSERT INTO user(first_name, last_name) 
    VALUES('James', 'jameson');
INSERT INTO user(first_name, last_name)
    VALUES('Natalia', 'Romanov');
INSERT INTO user(first_name, last_name)
    VALUES('Eric', 'Steinbeck');
/*
    insert wishlist records 
*/
INSERT INTO wishlist(user_id, book_id) 
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'James'), 
        (SELECT book_id FROM book WHERE book_name = 'On a Pale Horse')
    );
INSERT INTO wishlist(user_id, book_id)
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Natalia'),
        (SELECT book_id FROM book WHERE book_name = 'The Hitchikers Guide to the Galaxy')
    );
INSERT INTO wishlist(user_id, book_id)
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Eric'),
        (SELECT book_id FROM book WHERE book_name = 'Hamlet')
    );