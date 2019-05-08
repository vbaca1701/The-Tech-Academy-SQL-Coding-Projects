CREATE DATABASE LibrarySystem
GO

-- Begin creation of database tables

USE LibrarySystem
GO

CREATE TABLE tbl_library_branch (
	branch_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	branch_name VARCHAR(60) NOT NULL,
	branch_address VARCHAR(60) NOT NULL
);

CREATE TABLE tbl_publisher (
	publisher_name VARCHAR(60) PRIMARY KEY NOT NULL,
	publisher_address VARCHAR(60) NOT NULL,
	publisher_phone VARCHAR(30) NOT NULL 
);

CREATE TABLE tbl_books (
	book_id INT PRIMARY KEY NOT NULL IDENTITY (101,1),
	book_title VARCHAR(60) NOT NULL,
	publisher_name VARCHAR(60) NOT NULL CONSTRAINT fk_publisher_name FOREIGN KEY REFERENCES tbl_publisher(publisher_name) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE tbl_book_copies (
	book_id INT NOT NULL CONSTRAINT fk_book_id FOREIGN KEY REFERENCES tbl_books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	branch_id INT NOT NULL CONSTRAINT fk_branch_id FOREIGN KEY REFERENCES tbl_library_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	number_of_copies INT NOT NULL
);

CREATE TABLE tbl_book_authors (
	book_id INT NOT NULL CONSTRAINT fk_author_book_id FOREIGN KEY REFERENCES tbl_books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	author_name VARCHAR(100) NOT NULL
);

CREATE TABLE tbl_borrower (
	card_number INT PRIMARY KEY NOT NULL IDENTITY (500001,1),
	borrower_name VARCHAR(60) NOT NULL,
	borrower_address VARCHAR(60) NOT NULL,
	borrower_phone VARCHAR(30) NOT NULL
);

CREATE TABLE tbl_book_loans (
	book_id INT NOT NULL CONSTRAINT fk_loans_book_id FOREIGN KEY REFERENCES tbl_books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	branch_id INT NOT NULL CONSTRAINT fk_loans_branch_id FOREIGN KEY REFERENCES tbl_library_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	card_number INT NOT NULL CONSTRAINT fk_card_number FOREIGN KEY REFERENCES tbl_borrower(card_number) ON UPDATE CASCADE ON DELETE CASCADE,
	date_out DATE NOT NULL,
	date_due DATE NOT NULL
);



-- Begin data insertion into tables

INSERT INTO tbl_library_branch
	(branch_name, branch_address)
	VALUES
    ('Sharpstown', '1111 W. Fairview Avenue'),
    ('Central', '4569 Cyprus Drive'),
    ('Columbine', '7706 W. Bowles Avenue'),
    ('Belmar', '555 S. Allison Pkwy.')
;

INSERT INTO tbl_publisher
	(publisher_name, publisher_address, publisher_phone)
	VALUES
	('Penguin Putnam Inc.', '375 Hudson St., New York, New York 10014', '888-123-4567'),
    ('Zondervan', '3838 Northfield Blvd., Grand Rapids, MI 49530', '616-497-8569'),
    ('Tom Doherty Associates, LLC', '175 Fifth Ave., New York, New York 10010', '718-215-6988'),
    ('Cico Books', '519 Broadway, 5th Floor, New York, New York 10012', '718-496-5212'),
    ('Mulberry Hill Press', '2710 S. Washington St. Ste. B, Englewood, CO 80113', '303-555-1982'),
    ('John Wiley & Sons, Inc.', '111 River St., Hoboken, NJ 07030', '877-555-4719'),
    ('Workman Publishing Co., Inc.', '225 Varick St., New York, New York 10014', '718-499-6598')
;

INSERT INTO tbl_books
	(book_title, publisher_name)
	VALUES
	('The Iliad', 'Penguin Putnam Inc.'),
    ('The Odyssey', 'Penguin Putnam Inc.'),
    ('Velvet Elvis', 'Zondervan'),
    ('One Year After', 'Tom Doherty Associates, LLC'),
    ('Living In The Moment', 'Cico Books'),
    ('Walking The Amazon', 'Penguin Putnam Inc.'),
    ('Abidance', 'Mulberry Hill Press'),
    ('A Legacy of Spies', 'Penguin Putnam Inc.'),
    ('An Anthology of World Masterpieces', 'Mulberry Hill Press'),
    ('An Anthology of American Masterpieces', 'Mulberry Hill Press'),
    ('A Man & His Watch', 'Workman Publishing Co., Inc.'),
    ('No More Dragons', 'Cico Books'),
    ('SQL For Dummies', 'John Wiley & Sons, Inc.'),
    ('PHP, MySQL, & JavaScript For Dummies', 'John Wiley & Sons, Inc.'),
    ('Cujo', 'Penguin Putnam Inc.'),
    ('It', 'Penguin Putnam Inc.'),
    ('The Langoliers', 'Penguin Putnam Inc.'),
    ('Redemption', 'Zondervan'),
    ('Neon Prey', 'Zondervan'),
    ('The Lost Tribe', 'Workman Publishing Co., Inc.'),
    ('The Second Mountain', 'Cico Books'),
    ('Atomic Habits', 'John Wiley & Sons, Inc.'),
    ('The Owl', 'Penguin Putnam Inc.')
;

INSERT INTO tbl_book_authors
	(book_id, author_name)
	VALUES
	(101, 'Robert Fagles'),
    (102, 'Robert Fagles'),
    (103, 'Rob Bell'),
    (104, 'William R. Forstchen'),
    (105, 'Anna Black'),
    (106, 'Ed Stafford'),
    (107, 'Lois T. Hjelmstad'),
    (108, 'John Le Carre'),
    (109, 'Various'),
    (110, 'Various'),
    (111, 'Matt Hranek'),
    (112, 'Jim Burgen'),
    (113, 'Allen G. Taylor'),
    (114, 'Richard Blum'),
    (115, 'Stephen King'),
    (116, 'Stephen King'),
    (117, 'Stephen King'),
    (118, 'David Baldacci'),
    (119, 'John Sandford'),
    (120, 'C. Taylor-Butler'),
    (121, 'David Brooks'),
    (122, 'James Clear'),
    (123, 'Peter Skalsgard')
;

INSERT INTO tbl_book_copies
	(book_id, branch_id, number_of_copies)
	VALUES
	(101, 1, 2),
	(102, 1, 5),
	(103, 1, 6),
	(104, 1, 9),
	(105, 1, 10),
	(106, 1, 8),
	(107, 1, 9),
	(108, 1, 3),
	(109, 1, 8),
	(110, 1, 4),
	(111, 1, 9),
	(112, 1, 6),
	(113, 1, 10),
	(114, 1, 2),
	(115, 1, 5),
	(116, 1, 7),
	(117, 1, 2),
	(118, 1, 3),
	(119, 1, 9),
	(120, 1, 11),
	(121, 1, 5),
	(122, 1, 3),
	(123, 1, 8),
	(101, 2, 2),
	(102, 2, 5),
	(103, 2, 6),
	(104, 2, 9),
	(105, 2, 10),
	(106, 2, 8),
	(107, 2, 9),
	(108, 2, 3),
	(109, 2, 8),
	(110, 2, 4),
	(111, 2, 9),
	(112, 2, 6),
	(113, 2, 10),
	(114, 2, 2),
	(115, 2, 5),
	(116, 2, 7),
	(117, 2, 2),
	(118, 2, 3),
	(119, 2, 9),
	(120, 2, 11),
	(121, 2, 2),
	(122, 2, 3),
	(123, 2, 8),
	(101, 3, 2),
	(102, 3, 5),
	(103, 3, 6),
	(104, 3, 9),
	(105, 3, 10),
	(106, 3, 8),
	(107, 3, 9),
	(108, 3, 3),
	(109, 3, 8),
	(110, 3, 4),
	(111, 3, 9),
	(112, 3, 6),
	(113, 3, 10),
	(114, 3, 2),
	(115, 3, 5),
	(116, 3, 7),
	(117, 3, 2),
	(118, 3, 3),
	(119, 3, 9),
	(120, 3, 11),
	(121, 3, 10),
	(122, 3, 3),
	(123, 3, 8),
	(101, 4, 2),
	(102, 4, 5),
	(103, 4, 6),
	(104, 4, 9),
	(105, 4, 10),
	(106, 4, 8),
	(107, 4, 9),
	(108, 4, 3),
	(109, 4, 8),
	(110, 4, 4),
	(111, 4, 9),
	(112, 4, 6),
	(113, 4, 10),
	(114, 4, 2),
	(115, 4, 5),
	(116, 4, 7),
	(117, 4, 2),
	(118, 4, 3),
	(119, 4, 9),
	(120, 4, 11),
	(121, 4, 8),
	(122, 4, 3),
	(123, 4, 8)
;

INSERT INTO tbl_borrower
	(borrower_name, borrower_address, borrower_phone)
	VALUES
    ('Brittany Barnes', '4241 S. Sunshine Blvd., Littleton, CO 80219', '303-555-1984'),
    ('Charlie Brown', '70 Football St., Peanutville, OH 36989', '319-566-7498'),
    ('Joyce Brown', '71 Football St., Peanutville, OH 36989', '319-567-7499'),
    ('T.F. Bacall', '36 N. Cumbria Rd., Magill, CT 10189', '720-555-1956'),
    ('James Bond', '7007 Walther Way., London, TX 43698', '414-989-3656'),
    ('Edmund Hillary', '1953 Everest Way, Kathmandu, NY 00123', '316-555-7489'),
    ('Stephen Barnes', '4747 Bear Ln., Bailey, CO 81456', '720-555-2676'),
    ('Brian McKindle', '52 Essex Blvd., Inglewood, CA 95645', '720-564-9789'),
    ('Megan DeLuca', '6978 Ainsley Ave., Englewood, CO 85649', '585-555-9636'),
    ('Joe Morris', '8556 Indigo Dr., Conifer, CO 82369', '412-555-8432')
;

INSERT INTO tbl_book_loans
	(book_id, branch_id, card_number, date_out, date_due)
	VALUES
	--Brittany Barnes (8 books checked out)
	(101, 1, 500001, '2019-04-01', '2019-05-08'),
	(102, 1, 500001, '2019-04-01', '2019-05-14'),
	(103, 2, 500001, '2019-03-31', '2019-06-21'),
	(104, 2, 500001, '2019-03-31', '2019-05-28'),
	(105, 3, 500001, '2019-04-30', '2019-06-11'),
	(106, 3, 500001, '2019-04-30', '2019-06-11'),
	(107, 4, 500001, '2019-05-02', '2019-07-05'),
	(108, 4, 500001, '2019-05-02', '2019-07-05'),

	--Charlie Brown (12 books checked out)
	(101, 1, 500002, '2019-04-02', '2019-05-10'),
	(102, 1, 500002, '2019-04-02', '2019-05-24'),
	(103, 1, 500002, '2019-04-02', '2019-05-21'),
	(104, 2, 500002, '2019-05-07', '2019-06-28'),
	(105, 2, 500002, '2019-05-07', '2019-06-04'),
	(106, 2, 500002, '2019-05-07', '2019-06-11'),
	(107, 3, 500002, '2019-02-11', '2019-05-18'),
	(108, 3, 500002, '2019-02-18', '2019-05-25'),
	(109, 3, 500002, '2019-02-25', '2019-06-04'),
	(110, 4, 500002, '2019-04-04', '2019-05-11'),
	(111, 4, 500002, '2019-04-11', '2019-05-18'),
	(112, 4, 500002, '2019-04-18', '2019-05-25'),

	--Joyce Brown (12 books checked out)
	(107, 1, 500003, '2019-05-01', '2019-06-07'),
	(108, 1, 500003, '2019-05-01', '2019-06-14'),
	(109, 1, 500003, '2019-05-01', '2019-06-21'),
	(110, 2, 500003, '2019-04-21', '2019-05-28'),
	(111, 2, 500003, '2019-04-28', '2019-06-04'),
	(112, 2, 500003, '2019-04-04', '2019-05-11'),
	(101, 3, 500003, '2019-03-11', '2019-05-18'),
	(102, 3, 500003, '2019-04-18', '2019-05-25'),
	(103, 3, 500003, '2019-03-25', '2019-06-04'),
	(104, 4, 500003, '2019-04-04', '2019-05-11'),
	(105, 4, 500003, '2019-04-11', '2019-05-18'),
	(106, 4, 500003, '2019-04-18', '2019-05-25'),

	--T.F. Bacall (12 books checked out)
	(107, 1, 500004, '2019-04-01', '2019-06-07'),
	(108, 1, 500004, '2019-04-07', '2019-05-14'),
	(109, 1, 500004, '2019-04-14', '2019-05-21'),
	(110, 1, 500004, '2019-04-21', '2019-05-28'),
	(111, 2, 500004, '2019-04-28', '2019-06-04'),
	(112, 2, 500004, '2019-05-04', '2019-05-11'),
	(101, 2, 500004, '2019-04-11', '2019-05-18'),
	(102, 3, 500004, '2019-04-18', '2019-05-25'),
	(103, 3, 500004, '2019-04-25', '2019-06-04'),
	(104, 3, 500004, '2019-05-04', '2019-06-11'),
	(105, 4, 500004, '2019-04-11', '2019-05-18'),
	(106, 4, 500004, '2019-04-18', '2019-05-25'),

	--James Bond (6 books checked out)
	(113, 1, 500005, '2019-05-01', '2019-06-08'),
	(114, 1, 500005, '2019-04-08', '2019-06-15'),
	(115, 2, 500005, '2019-04-15', '2019-05-22'),
	(116, 3, 500005, '2019-04-22', '2019-05-29'), 
	(117, 4, 500005, '2019-04-29', '2019-06-06'),
	(123, 4, 500005, '2019-05-01', '2019-06-08'),

    --Edmund Hillary (4 books checked out)
    (120, 1, 500006, '2019-04-22', '2019-05-29'),
    (121, 1, 500006, '2019-04-22', '2019-05-29'),
    (122, 1, 500006, '2019-04-22', '2019-05-29'),
    (123, 1, 500006, '2019-04-22', '2019-05-29'),


	--Stephen Barnes (3 books checked out)
	(114, 1, 500007, '2019-04-08', '2019-05-15'),
	(115, 4, 500007, '2019-04-15', '2019-05-22'),
	(116, 4, 500007, '2019-04-22', '2019-05-29'), 

	--Megan DeLuca (1 book checked out)
	(117, 3, 500009, '2019-04-29', '2019-06-06')
;
