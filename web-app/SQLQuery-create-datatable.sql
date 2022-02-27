CREATE TABLE admin_tbl(
	adminID int IDENTITY(1,1),
	userName VARCHAR(50) NOT NULL,
	passWord VARCHAR(50) NOT NULL
)

CREATE TABLE user_tbl(
	userID int IDENTITY(1,1),
	full_name VARCHAR(50) NOT NULL,
	DOB VARCHAR(50) NULL,
	gender VARCHAR(10) NULL,
	city VARCHAR(50) NULL,
	country VARCHAR(50) NULL,
	email VARCHAR(50) NULL,
	contact_no VARCHAR(50) NULL,
	userName VARCHAR(50) NOT NULL,
	passWord VARCHAR(MAX) NOT NULL
)

CREATE TABLE contents_tbl(
	contentID int IDENTITY(1,1) PRIMARY KEY,
	content_title VARCHAR(50) NOT NULL,
	content_main VARCHAR(MAX) NOT NULL
)