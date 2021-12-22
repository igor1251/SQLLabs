CREATE DATABASE LAB10
USE LAB10

/* таблица цехов-изготовителей */
CREATE TABLE [workshops]
(
	id INTEGER IDENTITY(1,1) NOT NULL PRIMARY KEY,
	workshopName VARCHAR (40) NOT NULL
)

/* таблица продуктов */
CREATE TABLE [products]
(
	id INTEGER IDENTITY (1, 1) NOT NULL PRIMARY KEY,
	productName VARCHAR (40) NOT NULL,
	measureUnit VARCHAR (10) NOT NULL,
    workshopID INTEGER NOT NULL,
    productGroupID INTEGER NOT NULL,
    cost DECIMAL NOT NULL
)

/* таблица плана изготовления */
CREATE TABLE [plan]
(
	productID INTEGER NOT NULL,
	productCount FLOAT NOT NULL,
	monthNumber INTEGER NOT NULL
)

/* задание 4 */
CREATE TABLE [productGroups] (
    id INTEGER IDENTITY (1, 1) PRIMARY KEY,
    groupName VARCHAR (40) NOT NULL
);

/* задание 3 */
SELECT [productGroups].[groupName], count(*) 
FROM [products]
JOIN [productGroups] ON [products].[productGroupID] = [productGroups].[id]
GROUP BY [productGroups].[groupName]


/* задание 5 */
INSERT INTO [productGroups] ([groupName]) VALUES ('болты')


/* задание 6 */
SELECT [productGroups].[groupName], [products].[productName], [plan].[monthNumber], [plan].[productCount] * [products].[cost]
FROM [products]
JOIN [productGroups] ON [products].[productGroupID] = [productGroups].[id]
JOIN [plan] ON [plan].[productID] = [products].[id]

/* задание 7 */
UPDATE [products] SET [products].[cost] = [products].[cost] + ([products].[cost] / 2)

/* задание 8 */
SELECT [products].[productName], sum([plan].[productCount] * [products].[cost]) 
FROM [products]
JOIN [plan] ON [plan].[productID] = [products].[id]
GROUP BY [products].[productName]

/* задание 9 */
SELECT [productGroups].[groupName], sum([products].[cost]) 
FROM [products] 
JOIN [productGroups] ON [products].[productGroupID] = [productGroups].[id]
GROUP BY [productGroups].[groupName]

/* задание 10 */
SELECT [products].[productName] 
FROM [products]
JOIN [plan] ON [products].[id] = [plan].[productID]
WHERE [plan].[productCount] < (SELECT avg([plan].[productCount]) FROM [plan])
