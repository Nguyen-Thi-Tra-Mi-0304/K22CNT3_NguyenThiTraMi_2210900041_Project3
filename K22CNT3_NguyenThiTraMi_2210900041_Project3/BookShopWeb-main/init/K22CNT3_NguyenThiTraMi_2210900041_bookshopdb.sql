-- create database and tables

CREATE DATABASE k22cnt3_nguyenthitrami_2210900041_bookshopdb;

USE k22cnt3_nguyenthitrami_2210900041_bookshopdb;

CREATE TABLE k22cnt3_nguyenthitrami_2210900041_bookshopdb.user
(
    id          BIGINT       NOT NULL AUTO_INCREMENT,
    username    VARCHAR(25)  NOT NULL,
    password    VARCHAR(32)  NOT NULL,
    fullname    VARCHAR(50)  NOT NULL,
    email       VARCHAR(50)  NOT NULL,
    phoneNumber VARCHAR(11)  NOT NULL,
    gender      BIT          NOT NULL,
    address     VARCHAR(200) NOT NULL,
    role        VARCHAR(10)  NOT NULL,
    PRIMARY KEY (id),
    UNIQUE INDEX uq_username (username),
    UNIQUE INDEX uq_email (email),
    UNIQUE INDEX uq_phoneNumber (phoneNumber)
);

CREATE TABLE k22cnt3_nguyenthitrami_2210900041_bookshopdb.product
(
    id             BIGINT       NOT NULL AUTO_INCREMENT,
    name           VARCHAR(100) NOT NULL,
    price          FLOAT        NOT NULL,
    discount       FLOAT        NOT NULL,
    quantity       SMALLINT     NOT NULL,
    totalBuy       SMALLINT     NOT NULL,
    author         VARCHAR(50)  NOT NULL,
    pages          SMALLINT     NOT NULL,
    publisher      VARCHAR(100) NOT NULL,
    yearPublishing YEAR         NOT NULL,
    description    TEXT         NULL,
    imageName      VARCHAR(35)  NULL,
    shop           BIT          NOT NULL,
    createdAt      DATETIME     NOT NULL,
    updatedAt      DATETIME     NULL,
    startsAt       DATETIME     NULL,
    endsAt         DATETIME     NULL,
    PRIMARY KEY (id)
);

CREATE TABLE k22cnt3_nguyenthitrami_2210900041_bookshopdb.product_review
(
    id          BIGINT   NOT NULL AUTO_INCREMENT,
    userId      BIGINT   NOT NULL,
    productId   BIGINT   NOT NULL,
    ratingScore TINYINT  NOT NULL,
    content     TEXT     NOT NULL,
    isShow      BIT      NOT NULL,
    createdAt   DATETIME NOT NULL,
    updatedAt   DATETIME NULL,
    PRIMARY KEY (id),
    INDEX idx_product_review_user (userId),
    INDEX idx_product_review_product (productId),
    CONSTRAINT fk_product_review_user
        FOREIGN KEY (userId)
            REFERENCES k22cnt3_nguyenthitrami_2210900041_bookshopdb.user (id)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT fk_product_review_product
        FOREIGN KEY (productId)
            REFERENCES k22cnt3_nguyenthitrami_2210900041_bookshopdb.product (id)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
);

CREATE TABLE k22cnt3_nguyenthitrami_2210900041_bookshopdb.category
(
    id          BIGINT       NOT NULL AUTO_INCREMENT,
    name        VARCHAR(100) NOT NULL,
    description TEXT         NULL,
    imageName   VARCHAR(35)  NULL,
    PRIMARY KEY (id)
);

CREATE TABLE k22cnt3_nguyenthitrami_2210900041_bookshopdb.product_category
(
    productId  BIGINT NOT NULL,
    categoryId BIGINT NOT NULL,
    PRIMARY KEY (productId, categoryId),
    INDEX idx_product_category_product (productId),
    INDEX idx_product_category_category (categoryId),
    CONSTRAINT fk_product_category_product
        FOREIGN KEY (productId)
            REFERENCES k22cnt3_nguyenthitrami_2210900041_bookshopdb.product (id)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT fk_product_category_category
        FOREIGN KEY (categoryId)
            REFERENCES k22cnt3_nguyenthitrami_2210900041_bookshopdb.category (id)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
);

CREATE TABLE k22cnt3_nguyenthitrami_2210900041_bookshopdb.cart
(
    id        BIGINT   NOT NULL AUTO_INCREMENT,
    userId    BIGINT   NOT NULL,
    createdAt DATETIME NOT NULL,
    updatedAt DATETIME NULL,
    PRIMARY KEY (id),
    INDEX idx_cart_user (userId),
    CONSTRAINT fk_cart_user
        FOREIGN KEY (userId)
            REFERENCES k22cnt3_nguyenthitrami_2210900041_bookshopdb.user (id)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
);

CREATE TABLE k22cnt3_nguyenthitrami_2210900041_bookshopdb.cart_item
(
    id        BIGINT   NOT NULL AUTO_INCREMENT,
    cartId    BIGINT   NOT NULL,
    productId BIGINT   NOT NULL,
    quantity  SMALLINT NOT NULL,
    createdAt DATETIME NOT NULL,
    updatedAt DATETIME NULL,
    PRIMARY KEY (id),
    UNIQUE uq_cartId_productId (cartId, productId),
    INDEX idx_cart_item_cart (cartId),
    INDEX idx_cart_item_product (productId),
    CONSTRAINT fk_cart_item_cart
        FOREIGN KEY (cartId)
            REFERENCES k22cnt3_nguyenthitrami_2210900041_bookshopdb.cart (id)
            ON DELETE CASCADE
            ON UPDATE NO ACTION,
    CONSTRAINT fk_cart_item_product
        FOREIGN KEY (productId)
            REFERENCES k22cnt3_nguyenthitrami_2210900041_bookshopdb.product (id)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
);

CREATE TABLE k22cnt3_nguyenthitrami_2210900041_bookshopdb.orders
(
    id             BIGINT   NOT NULL AUTO_INCREMENT,
    userId         BIGINT   NOT NULL,
    status         TINYINT  NOT NULL,
    deliveryMethod TINYINT  NOT NULL,
    deliveryPrice  FLOAT    NOT NULL,
    createdAt      DATETIME NOT NULL,
    updatedAt      DATETIME NULL,
    PRIMARY KEY (id),
    INDEX idx_orders_user (userId),
    CONSTRAINT fk_orders_user
        FOREIGN KEY (userId)
            REFERENCES k22cnt3_nguyenthitrami_2210900041_bookshopdb.user (id)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
);

CREATE TABLE k22cnt3_nguyenthitrami_2210900041_bookshopdb.order_item
(
    id        BIGINT   NOT NULL AUTO_INCREMENT,
    orderId   BIGINT   NOT NULL,
    productId BIGINT   NOT NULL,
    price     FLOAT    NOT NULL,
    discount  FLOAT    NOT NULL,
    quantity  SMALLINT NOT NULL,
    createdAt DATETIME NOT NULL,
    updatedAt DATETIME NULL,
    PRIMARY KEY (id),
    INDEX idx_order_item_orders (orderId),
    INDEX idx_order_item_product (productId),
    CONSTRAINT fk_order_item_orders
        FOREIGN KEY (orderId)
            REFERENCES k22cnt3_nguyenthitrami_2210900041_bookshopdb.orders (id)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT fk_order_item_product
        FOREIGN KEY (productId)
            REFERENCES k22cnt3_nguyenthitrami_2210900041_bookshopdb.product (id)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
);

CREATE TABLE k22cnt3_nguyenthitrami_2210900041_bookshopdb.wishlist_item
(
    id        BIGINT   NOT NULL AUTO_INCREMENT,
    userId    BIGINT   NOT NULL,
    productId BIGINT   NOT NULL,
    createdAt DATETIME NOT NULL,
    PRIMARY KEY (id),
    UNIQUE uq_userId_productId (userId, productId),
    INDEX idx_wishlist_item_user (userId),
    INDEX idx_wishlist_item_product (productId),
    CONSTRAINT fk_wishlist_item_user
        FOREIGN KEY (userId)
            REFERENCES k22cnt3_nguyenthitrami_2210900041_bookshopdb.user (id)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT fk_wishlist_item_product
        FOREIGN KEY (productId)
            REFERENCES k22cnt3_nguyenthitrami_2210900041_bookshopdb.product (id)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
);

-- insert data

-- user
INSERT INTO k22cnt3_nguyenthitrami_2210900041_bookshopdb.user(`username`,`password`,`fullname`,`email`,`phoneNumber`,`gender`,`address`,`role`) VALUES ('user1','202CB962AC59075B964B07152D234B70','Phạm Nhật Nam','phamnhatnam@gmail.com','0989894900',0,'8 Virginia Place, Troy, Norway','ADMIN');
INSERT INTO k22cnt3_nguyenthitrami_2210900041_bookshopdb.user(`username`,`password`,`fullname`,`email`,`phoneNumber`,`gender`,`address`,`role`) VALUES ('employee','202CB962AC59075B964B07152D234B70','Trịnh Thanh Thủy','thanhthuy@gmail.com','0993194154',0,'28 Richardson Street, Layhill, Netherlands','EMPLOYEE');
INSERT INTO k22cnt3_nguyenthitrami_2210900041_bookshopdb.user(`username`,`password`,`fullname`,`email`,`phoneNumber`,`gender`,`address`,`role`) VALUES ('user3','202CB962AC59075B964B07152D234B70','Nguyễn Nhất Nam','nhatnam@gmail.com','0930174351',1,'41 Linden Street, Slovan, S. Georgia and S. Sandwich Isls.','EMPLOYEE');
INSERT INTO k22cnt3_nguyenthitrami_2210900041_bookshopdb.user(`username`,`password`,`fullname`,`email`,`phoneNumber`,`gender`,`address`,`role`) VALUES ('user4','202CB962AC59075B964B07152D234B70','Đinh Yến Nhi','yennhi@gmail.com','0911925643',1,'5 Schenck Court, Dana, Cyprus','CUSTOMER');
INSERT INTO k22cnt3_nguyenthitrami_2210900041_bookshopdb.user(`username`,`password`,`fullname`,`email`,`phoneNumber`,`gender`,`address`,`role`) VALUES ('user5','202CB962AC59075B964B07152D234B70','Lê Phương Linh','phuonglinh@gmail.com','0987509391',1,'5 Pooles Lane, Allentown, Zambia','CUSTOMER');
INSERT INTO k22cnt3_nguyenthitrami_2210900041_bookshopdb.user(`username`,`password`,`fullname`,`email`,`phoneNumber`,`gender`,`address`,`role`) VALUES ('admin','123456','NguyenThiTraMi','traminguyen@gmail.com','0963225045',0,'Gia Lâm, Hà Nội','ADMIN');

-- product
INSERT INTO k22cnt3_nguyenthitrami_2210900041_bookshopdb.product(`name`,`price`,`discount`,`quantity`,`totalBuy`,`author`,`pages`,`publisher`,`yearPublishing`,`description`,`imageName`,`shop`,`createdAt`,`updatedAt`,`startsAt`,`endsAt`) VALUES ('Sách Toyletry',466183,0,86,86,'Stafford Hayden',250,'NXB Giáo dục',2013,'Consequat cupidatat magna nostrud ullamco non commodo esse. Veniam anim ipsum duis cillum cillum exercitation deserunt irure sint eiusmod. Duis consectetur adipisicing aliquip magna eiusmod ullamco ut ad ipsum nostrud dolore id. Ex ullamco nulla Lorem consequat sunt exercitation cillum adipisicing.\r\nProident labore ut qui esse cupidatat deserunt occaecat dolor in. Ad nulla reprehenderit pariatur esse enim ullamco do incididunt anim do excepteur est dolore excepteur. Laboris voluptate cupidatat anim dolore eiusmod in id fugiat est cupidatat pariatur mollit. Mollit irure proident enim consequat irure ipsum proident amet aliqua. Irure ad dolore laboris elit reprehenderit officia ex.\r\n','temp-10075522682831764585.jpg',0,'2021-03-23 08:22:50',NULL,NULL,NULL);
INSERT INTO k22cnt3_nguyenthitrami_2210900041_bookshopdb.product(`name`,`price`,`discount`,`quantity`,`totalBuy`,`author`,`pages`,`publisher`,`yearPublishing`,`description`,`imageName`,`shop`,`createdAt`,`updatedAt`,`startsAt`,`endsAt`) VALUES ('Sách Sultrax',26228,0,23,60,'Diane Nguyen',305,'NXB Đại học Sư phạm TP.HCM',2011,'Ipsum consequat reprehenderit amet ullamco dolore consectetur non eiusmod dolor irure sit. Lorem nulla officia dolore officia laboris. Excepteur anim consectetur reprehenderit duis duis ea nostrud. Reprehenderit consequat cupidatat enim ea eiusmod nisi. Mollit veniam quis est ex elit proident tempor pariatur sit aute. Eu Lorem irure sunt sit aute nostrud culpa. Voluptate enim sit dolor laborum est nulla eiusmod eu laborum Lorem laborum.\r\nPariatur id proident laborum consectetur pariatur deserunt quis tempor excepteur non tempor. Sit tempor irure id fugiat occaecat. Ex ut veniam nostrud sunt dolore. Veniam cillum incididunt enim tempor ut amet do est pariatur aliqua labore.\r\n','temp-17624438115898823949.jpg',1,'2021-12-19 15:03:05',NULL,NULL,NULL);
INSERT INTO k22cnt3_nguyenthitrami_2210900041_bookshopdb.product(`name`,`price`,`discount`,`quantity`,`totalBuy`,`author`,`pages`,`publisher`,`yearPublishing`,`description`,`imageName`,`shop`,`createdAt`,`updatedAt`,`startsAt`,`endsAt`) VALUES ('Sách Medcom',294114,20,68,116,'Byrd Collier',457,'NXB Đại học Sư phạm TP.HCM',2003,'Cupidatat ipsum ea laborum nisi veniam nulla dolor labore excepteur ad eu. Commodo Lorem esse veniam sunt in. Voluptate amet commodo est commodo ipsum excepteur aliqua voluptate amet. Sunt elit ut esse proident irure tempor velit quis eu cupidatat pariatur duis ea.\r\nEnim magna esse dolor amet ex nostrud quis consectetur velit. Sunt minim consectetur anim veniam elit proident exercitation sunt commodo veniam magna ad. Sint eu mollit veniam cupidatat occaecat fugiat reprehenderit nisi fugiat cillum. Amet exercitation aute qui eu ullamco non do officia non amet commodo. Minim excepteur nisi mollit reprehenderit ad. Sit consectetur sit sit laboris ipsum dolore ut sit ex aliquip cillum. Aliquip ut ea adipisicing ullamco Lorem nostrud magna qui amet cillum.\r\n','temp-6352099207348952932.jpg',1,'2021-07-31 10:44:48',NULL,NULL,NULL);
INSERT INTO k22cnt3_nguyenthitrami_2210900041_bookshopdb.product(`name`,`price`,`discount`,`quantity`,`totalBuy`,`author`,`pages`,`publisher`,`yearPublishing`,`description`,`imageName`,`shop`,`createdAt`,`updatedAt`,`startsAt`,`endsAt`) VALUES ('Sách Radiantix',61888,20,46,195,'Dodson Wilkinson',426,'NXB Đại học Sư phạm TP.HCM',2019,'Qui magna ex aute deserunt aliquip mollit labore ad. Ipsum pariatur nostrud magna pariatur labore duis ad consequat magna. Ad cillum dolore exercitation proident elit. Cillum occaecat proident officia sit cillum magna ullamco id occaecat non irure mollit minim.\r\nDeserunt elit velit nostrud id aliqua. Velit pariatur in sint ut irure non laborum eiusmod labore fugiat aliquip eu irure. Deserunt velit qui in elit ipsum Lorem aute tempor ullamco minim fugiat deserunt ut. Commodo proident aliqua nostrud dolor do consequat aliquip dolor officia laboris.\r\n','temp-13862094760385571107.jpg',0,'2021-07-26 17:44:04',NULL,NULL,NULL);
INSERT INTO k22cnt3_nguyenthitrami_2210900041_bookshopdb.product(`name`,`price`,`discount`,`quantity`,`totalBuy`,`author`,`pages`,`publisher`,`yearPublishing`,`description`,`imageName`,`shop`,`createdAt`,`updatedAt`,`startsAt`,`endsAt`) VALUES ('Sách Prosely',195442,0,52,178,'Horne Oneill',270,'NXB Giáo dục',2000,'Sit cillum ipsum cillum commodo dolor ipsum aliquip id exercitation non proident qui. Veniam tempor labore id exercitation nisi veniam et in non anim ad laborum nostrud fugiat. In ullamco excepteur nostrud esse id nisi eiusmod sint elit aute elit. Amet consectetur commodo amet occaecat. Nostrud labore ad cillum mollit ad fugiat amet.\r\nQui commodo officia ea adipisicing laborum tempor aliqua mollit aliqua. Est sunt amet cupidatat esse id officia qui fugiat eu et et. Cillum tempor esse enim culpa culpa cupidatat labore exercitation aute do voluptate consequat esse.\r\n','temp-17624438115898823949.jpg',0,'2021-03-04 01:10:28',NULL,NULL,NULL);
INSERT INTO k22cnt3_nguyenthitrami_2210900041_bookshopdb.product(`name`,`price`,`discount`,`quantity`,`totalBuy`,`author`,`pages`,`publisher`,`yearPublishing`,`description`,`imageName`,`shop`,`createdAt`,`updatedAt`,`startsAt`,`endsAt`) VALUES ('Sách Xth',462713,0,13,212,'Karin Jackson',186,'NXB Đại học Sư phạm TP.HCM',2008,'Ut pariatur culpa sint aliqua culpa ullamco laboris duis dolore mollit dolor cillum. Veniam sit consectetur irure anim do. Labore dolore nisi in aliquip ipsum sit eu excepteur sit magna officia consectetur amet.\r\nCulpa consequat magna consequat aliquip sint amet nulla culpa ea mollit pariatur quis deserunt esse. Non sint id non aliqua ipsum id laboris. Magna ullamco est ullamco et nisi ullamco adipisicing. Nisi irure cillum nostrud laborum aute ea incididunt cillum. Qui quis nostrud adipisicing fugiat et incididunt irure Lorem in. Ipsum nulla ea ullamco irure ea dolore et nostrud.\r\n','temp-16741118072528735594.jpg',1,'2021-06-18 05:55:06',NULL,NULL,NULL);
INSERT INTO k22cnt3_nguyenthitrami_2210900041_bookshopdb.product(`name`,`price`,`discount`,`quantity`,`totalBuy`,`author`,`pages`,`publisher`,`yearPublishing`,`description`,`imageName`,`shop`,`createdAt`,`updatedAt`,`startsAt`,`endsAt`) VALUES ('Sách Liquicom',488021,0,65,95,'Johnson Wilkins',260,'NXB Đại học Huế',2003,'Nostrud minim nostrud duis nostrud cupidatat reprehenderit nostrud dolor amet esse. Anim eiusmod ea ea deserunt. Elit pariatur voluptate esse occaecat sint. Enim reprehenderit ad culpa ad dolor duis elit minim cupidatat Lorem est. Enim exercitation cillum nulla consequat ut et sunt esse cupidatat velit esse enim. Excepteur officia eu voluptate fugiat ad esse irure anim irure eiusmod cupidatat consequat eiusmod occaecat. Tempor voluptate incididunt veniam dolore nisi voluptate adipisicing mollit dolore consequat non nostrud est.\r\nDo irure ut occaecat adipisicing sint Lorem fugiat. Quis et aliqua ipsum in esse sit. Sint laborum eiusmod duis magna. Veniam consectetur nulla deserunt Lorem excepteur. Cillum nisi minim incididunt adipisicing anim eu ipsum reprehenderit non irure ea officia nulla. Ad culpa aliqua sit adipisicing.\r\n','temp-6243426685116508297.jpg',1,'2021-11-01 20:47:34',NULL,NULL,NULL);
INSERT INTO k22cnt3_nguyenthitrami_2210900041_bookshopdb.product(`name`,`price`,`discount`,`quantity`,`totalBuy`,`author`,`pages`,`publisher`,`yearPublishing`,`description`,`imageName`,`shop`,`createdAt`,`updatedAt`,`startsAt`,`endsAt`) VALUES ('Sách Supremia',478294,0,60,316,'Ayala Rich',359,'NXB Đại học Sư phạm Hà Nội',2006,'Reprehenderit quis exercitation reprehenderit velit et magna. Velit ex cupidatat est mollit eiusmod in mollit aliqua velit laborum adipisicing eiusmod ex. Duis Lorem dolore labore veniam.\r\nSunt esse consectetur culpa nostrud ad id tempor voluptate elit cupidatat. Dolor proident ipsum cillum anim mollit incididunt nisi labore voluptate est sunt magna non. Sit magna eiusmod officia nostrud aliqua exercitation. Aliquip labore cillum commodo labore do ullamco ea tempor ullamco exercitation nostrud officia.\r\n','temp-10075522682831764585.jpg',0,'2021-08-27 02:56:32',NULL,NULL,NULL);
INSERT INTO k22cnt3_nguyenthitrami_2210900041_bookshopdb.product(`name`,`price`,`discount`,`quantity`,`totalBuy`,`author`,`pages`,`publisher`,`yearPublishing`,`description`,`imageName`,`shop`,`createdAt`,`updatedAt`,`startsAt`,`endsAt`) VALUES ('Sách Cyclonica',96299,20,45,14,'Flynn Sanford',420,'NXB Đại học Sư phạm Hà Nội',2013,'Laborum elit laborum do esse ut id sunt voluptate ut minim sint mollit irure. Amet veniam cupidatat anim minim tempor ipsum dolore tempor aliquip voluptate mollit id velit eu. Proident culpa aliquip ut aliquip tempor commodo occaecat Lorem. Pariatur consequat id eu irure ex culpa elit aliqua in ea sunt id eiusmod non. Non laboris officia pariatur enim sint officia. Ipsum aliquip commodo in dolore. Ullamco consectetur proident dolor nostrud eu cupidatat aliqua dolor sint.\r\nEst pariatur fugiat amet sint ut tempor ut labore ipsum veniam deserunt non occaecat irure. Labore nostrud amet in voluptate. Qui ullamco officia ullamco ipsum cillum. Amet Lorem aliqua dolore sit.\r\n','temp-16741118072528735594.jpg',1,'2021-08-07 21:11:03',NULL,NULL,NULL);
INSERT INTO k22cnt3_nguyenthitrami_2210900041_bookshopdb.product(`name`,`price`,`discount`,`quantity`,`totalBuy`,`author`,`pages`,`publisher`,`yearPublishing`,`description`,`imageName`,`shop`,`createdAt`,`updatedAt`,`startsAt`,`endsAt`) VALUES ('Sách Envire',397768,20,65,347,'Gilda Harris',321,'NXB Đại học Sư phạm TP.HCM',2020,'Non veniam dolore esse aute officia in nostrud id sint ipsum incididunt qui incididunt. Commodo irure esse sunt ex eu minim sit culpa in mollit. Incididunt id irure ullamco ea. Adipisicing enim sit nisi dolore velit dolore eu deserunt pariatur deserunt eu exercitation ipsum nostrud. Commodo veniam elit duis mollit ut mollit enim. Aliquip labore non ea id cillum qui laboris occaecat quis adipisicing. Elit nulla ut laborum officia occaecat dolore aute commodo voluptate qui incididunt deserunt consectetur.\r\nEiusmod duis nulla occaecat deserunt ut sint consectetur. Nostrud eu velit nulla amet qui consequat labore. Consectetur proident cupidatat occaecat ex dolor dolor sint eiusmod mollit sint.\r\n','temp-13862094760385571107.jpg',1,'2021-06-07 23:23:46',NULL,NULL,NULL);
INSERT INTO k22cnt3_nguyenthitrami_2210900041_bookshopdb.product(`name`,`price`,`discount`,`quantity`,`totalBuy`,`author`,`pages`,`publisher`,`yearPublishing`,`description`,`imageName`,`shop`,`createdAt`,`updatedAt`,`startsAt`,`endsAt`) VALUES ('Sách Insuresys',366716,0,50,305,'Lolita Cochran',89,'NXB Đại học Quốc gia Hà Nội',2007,'Magna enim veniam consequat minim. Incididunt ea ex minim officia magna culpa. Duis proident voluptate nostrud consectetur dolor adipisicing magna in. Lorem pariatur aliqua incididunt ut aliquip commodo ipsum est dolore exercitation. Pariatur non ad ipsum ut reprehenderit sit nostrud proident et consectetur. Eu amet aute dolor consequat consectetur incididunt fugiat duis ipsum et magna nisi incididunt nulla. Non mollit qui nostrud nostrud pariatur non.\r\nAdipisicing aliquip non commodo sit labore sint voluptate cupidatat anim amet. Non reprehenderit tempor mollit duis in reprehenderit. Est laborum aute eu dolor reprehenderit ut culpa ullamco Lorem qui laborum elit. Esse pariatur eu ex magna excepteur incididunt irure aute nulla eu. Occaecat irure cupidatat et quis consequat eiusmod ad reprehenderit veniam elit nostrud voluptate. Et reprehenderit mollit ullamco laborum tempor elit. Nisi eiusmod ipsum dolore culpa reprehenderit ad quis consequat aliqua anim aute.\r\n','temp-10075522682831764585.jpg',1,'2021-12-10 13:59:07',NULL,NULL,NULL);
INSERT INTO k22cnt3_nguyenthitrami_2210900041_bookshopdb.product(`name`,`price`,`discount`,`quantity`,`totalBuy`,`author`,`pages`,`publisher`,`yearPublishing`,`description`,`imageName`,`shop`,`createdAt`,`updatedAt`,`startsAt`,`endsAt`) VALUES ('Sách Exostream',51700,0,85,62,'Christian Alvarado',435,'NXB Đại học Sư phạm Hà Nội',2018,'In laborum tempor cupidatat aliqua in pariatur tempor voluptate velit deserunt. Irure proident labore nostrud occaecat aliqua excepteur eiusmod exercitation eiusmod eiusmod. Ex anim do id tempor aute proident proident in irure. Tempor duis esse laboris do. Duis amet qui nisi velit mollit ad. Proident aute ea ullamco qui irure proident.\r\nDolor enim Lorem ea excepteur aliqua. Aute sint aliqua elit pariatur. Ullamco ut occaecat voluptate ut irure qui tempor tempor qui consequat fugiat.\r\n','temp-17624438115898823949.jpg',0,'2021-12-14 19:28:20',NULL,NULL,NULL);

-- category
INSERT INTO k22cnt3_nguyenthitrami_2210900041_bookshopdb.category(`name`,`description`,`imageName`) VALUES ('Sách giáo khoa','Cillum nulla non Lorem ut irure fugiat veniam deserunt do.','sach-giao-khoa.jpg');
INSERT INTO k22cnt3_nguyenthitrami_2210900041_bookshopdb.category(`name`,`description`,`imageName`) VALUES ('Sách khoa học','Aliqua exercitation ea sint do.','sach-khoa-hoc.png');
INSERT INTO k22cnt3_nguyenthitrami_2210900041_bookshopdb.category(`name`,`description`,`imageName`) VALUES ('Truyện tranh','Cillum laboris et nulla nostrud duis consectetur labore cupidatat minim proident.','truyen-tranh.png');
INSERT INTO k22cnt3_nguyenthitrami_2210900041_bookshopdb.category(`name`,`description`,`imageName`) VALUES ('Tiểu thuyết','Enim dolore cupidatat tempor sunt amet veniam aute officia est officia.','tieu-thuyet.png');
INSERT INTO k22cnt3_nguyenthitrami_2210900041_bookshopdb.category(`name`,`description`,`imageName`) VALUES ('Truyện ngắn','Dolor in pariatur aliqua dolore ea cillum ut consectetur tempor do eu incididunt est.','truyen-ngan.png');
INSERT INTO k22cnt3_nguyenthitrami_2210900041_bookshopdb.category(`name`,`description`,`imageName`) VALUES ('Truyện dài','Eiusmod adipisicing consectetur occaecat culpa in ullamco labore velit magna.','truyen-dai.png');
INSERT INTO k22cnt3_nguyenthitrami_2210900041_bookshopdb.category(`name`,`description`,`imageName`) VALUES ('Sách giáo trình','In officia ex magna commodo ullamco in magna incididunt esse mollit enim consectetur laboris.','sach-giao-trinh.png');
INSERT INTO k22cnt3_nguyenthitrami_2210900041_bookshopdb.category(`name`,`description`,`imageName`) VALUES ('Báo in','Laborum in elit ullamco pariatur laborum magna veniam nostrud eu anim irure deserunt ad sunt.','bao-in.png');
INSERT INTO k22cnt3_nguyenthitrami_2210900041_bookshopdb.category(`name`,`description`,`imageName`) VALUES ('Tạp chí','Excepteur qui commodo sint sint irure sunt sunt in nostrud.','tap-chi.png');
INSERT INTO k22cnt3_nguyenthitrami_2210900041_bookshopdb.category(`name`,`description`,`imageName`) VALUES ('Tập san','Elit amet proident et cupidatat in eu quis velit tempor sunt labore aute et.','tap-san.png');
INSERT INTO k22cnt3_nguyenthitrami_2210900041_bookshopdb.category(`name`,`description`,`imageName`) VALUES ('Sách nấu ăn','Consequat anim officia aute eiusmod dolor.','nau-an.png');
INSERT INTO k22cnt3_nguyenthitrami_2210900041_bookshopdb.category(`name`,`description`,`imageName`) VALUES ('Sách kỹ thuật','Veniam pariatur deserunt ea non voluptate sunt do culpa elit esse.','sach-ky-thuat.png');
INSERT INTO k22cnt3_nguyenthitrami_2210900041_bookshopdb.category(`name`,`description`,`imageName`) VALUES ('Sách nông nghiệp','Minim deserunt aute ipsum duis ea eiusmod aute sint sint ut.','sach-nong-nghiep.png');
INSERT INTO k22cnt3_nguyenthitrami_2210900041_bookshopdb.category(`name`,`description`,`imageName`) VALUES ('Sách thiếu nhi','Ex eu ad adipisicing magna tempor occaecat id cupidatat dolor dolor aliquip dolore.','sach-thieu-nhi.png');
INSERT INTO k22cnt3_nguyenthitrami_2210900041_bookshopdb.category(`name`,`description`,`imageName`) VALUES ('Sách kỹ năng sống','Ad exercitation anim in magna qui ipsum ipsum proident magna.','sach-ky-nang-song.png');



