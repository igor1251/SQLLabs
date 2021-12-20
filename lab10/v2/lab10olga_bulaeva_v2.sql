/* таблица цехов-изготовителей */
CREATE TABLE workshops (
    id           INTEGER      PRIMARY KEY AUTOINCREMENT
                              NOT NULL,
    workshopName VARCHAR (40) NOT NULL
);

/* таблица продуктов */
CREATE TABLE products (
    id             INTEGER      PRIMARY KEY AUTOINCREMENT
                                NOT NULL,
    productName    VARCHAR (40) NOT NULL,
    measureUnit    VARCHAR (10) NOT NULL,
    workshopID     INTEGER      NOT NULL,
    productGroupID INTEGER      NOT NULL,
    cost           DECIMAL      NOT NULL
);

/* план изготовления */
CREATE TABLE [plan] (
    productID    INTEGER NOT NULL,
    productCount DOUBLE  NOT NULL,
    monthNumber  INTEGER NOT NULL
);

/* задание 3 */
select productGroups.groupName, count(*) 
from products 
join productGroups on products.productGroupID = productGroups.id
group by products.productGroupID

/* задание 4 */

/* группы продуктов */
CREATE TABLE productGroups (
    id        INTEGER      PRIMARY KEY AUTOINCREMENT
                           NOT NULL,
    groupName VARCHAR (40) NOT NULL
);

/* задание 5 */
insert into productGroups (groupName) values ("болты")

/* задание 6 */
select productGroups.groupName, products.productName, [plan].monthNumber, [plan].productCount * products.cost
from products
join productGroups on products.productGroupID = productGroups.id
join [plan] on [plan].productID = products.id

/* задание 7 */
update products set cost = cost + (cost * 0.5)

/* задание 8 */
select products.productName, sum([plan].productCount * products.cost) 
from products
join [plan] on [plan].productID = products.id
group by [plan].productID

/* задание 9 */
select productGroups.groupName, sum(products.cost) 
from products 
join productGroups on products.productGroupID = productGroups.id
group by products.productGroupID

/* задание 10 */
select products.productName 
from products
join [plan] on products.id = [plan].productID
where [plan].productCount < (select avg([plan].productCount) from [plan])
