/* Database & SQL Final Assignment Step 81 Stored Procedures Creation */

-- Create usp_Number1 1.) How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?

CREATE PROCEDURE usp_Number1
AS
SELECT
	a1.book_id, b1.book_title, c1.branch_name, a1.number_of_copies
	FROM tbl_book_copies a1
	INNER JOIN tbl_books b1 ON a1.book_id = b1.book_id
	INNER JOIN tbl_library_branch c1 ON a1.branch_id = c1.branch_id
	WHERE book_title = 'The Lost Tribe' AND branch_name = 'Sharpstown';

-- Stored Procedure

EXEC usp_Number1

---------------------------------------------------------------------------------------------------------------------------------------------------------

-- Create usp_Number2 2.) How many copies of the book titled "The Lost Tribe" are owned by each library branch?

CREATE PROCEDURE usp_Number2
AS
SELECT
	a1.book_id, b1.book_title, c1.branch_name, a1.number_of_copies
	FROM tbl_book_copies a1
	INNER JOIN tbl_books b1 ON a1.book_id = b1.book_id
	INNER JOIN tbl_library_branch c1 ON a1.branch_id = c1.branch_id
	WHERE a1.book_id = 120 AND book_title = 'The Lost Tribe'

-- Stored Procedure

EXEC usp_Number2


---------------------------------------------------------------------------------------------------------------------------------------------------------

-- Create usp_Number3 3.) Retrieve the names of all borrowers who do not have any books checked out.

CREATE PROCEDURE usp_Number3
AS
SELECT 
	a1.card_number, a1.borrower_name, a1.borrower_address, a1.borrower_phone
	FROM tbl_borrower a1
	LEFT OUTER JOIN tbl_book_loans b1 ON a1.card_number = b1.card_number
	WHERE b1.book_id IS NULL

-- Stored Procedure

EXEC usp_Number3

--------------------------------------------------------------------------------------------------------------------------------------------------------

/* Create usp_Number4 4.) For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, 
retrieve the book title, the borrower's name, and the borrower's address.
*/

CREATE PROCEDURE usp_Number4
AS
SELECT
	c1.book_title, a1.borrower_name, a1.borrower_address
	FROM tbl_borrower a1
	INNER JOIN tbl_book_loans b1 ON a1.card_number = b1.card_number
	INNER JOIN tbl_books c1 ON b1.book_id = c1.book_id
	INNER JOIN tbl_library_branch d1 ON b1.branch_id = d1.branch_id
	WHERE branch_name = 'Sharpstown' AND date_due = '2019-05-08'

-- Stored Procedure

EXEC usp_Number4


------------------------------------------------------------------------------------------------------------------------------------------------------

-- Create usp_Number5 5.) For each library branch, retrieve the branch name and the total number of books loaned out from that branch.

CREATE PROCEDURE usp_Number5
AS
SELECT 
	a1branch_name, COUNT(*) AS books_loaned_out
	FROM tbl_library_branch a1
	INNER JOIN tbl_book_loans b1 ON a1.branch_id = b1.branch_id
	GROUP BY branch_name

-- Stored Procedure

EXEC usp_Number5


----------------------------------------------------------------------------------------------------------------------------------------------------

/* Create usp_Number6 6.) Retrieve the names, addresses, and the number of books checked out for all borrowers who have more 
than five books checked out.
*/

CREATE PROCEDURE usp_Number6
AS
SELECT
	a1.borrower_name, a1.borrower_address, a1.borrower_phone, COUNT(*) AS books_loaned_out
	FROM tbl_borrower a1
	INNER JOIN tbl_book_loans b1 ON a1.card_number = b1.card_number
	GROUP BY a1.borrower_name, a1.borrower_address, a1.borrower_phone
	HAVING COUNT(*) > 5

-- Stored Procedure

EXEC usp_Number6


--------------------------------------------------------------------------------------------------------------------------------------------------

/* Create usp_Number7 7.) For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of copies owned by 
the library branch whose name is "Central".
*/

CREATE PROCEDURE usp_Number7
AS
SELECT
	a1.book_title, c1.number_of_copies
	FROM tbl_books a1 
	INNER JOIN tbl_book_authors b1 ON a1.book_id = b1.book_id
	INNER JOIN tbl_book_copies c1 ON b1.book_id = c1.book_id
	INNER JOIN tbl_library_branch d1 ON c1.branch_id = d1.branch_id
	WHERE b1.author_name = 'Stephen King' AND branch_name = 'Central'

-- Stored Procedure

EXEC usp_Number7






