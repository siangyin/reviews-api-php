CREATE TABLE r_users (
  userId INT(5) AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(100) NOT NULL,
  email VARCHAR(200) NOT NULL UNIQUE,
  password VARCHAR(100) NOT NULL,
  createdOn TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE r_restaurants (
  restaurantId INT(5) AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(300) NOT NULL,
  photo TEXT NOT NULL,
  category varchar(255) DEFAULT NULL,
  description text NOT NULL,
  openinghours varchar(255) NOT NULL
);

CREATE TABLE r_reviews (
  reviewId INT(5) AUTO_INCREMENT PRIMARY KEY,
  userId INT(5) NOT NULL,
  restaurantId INT(5) NOT NULL,
  comment TEXT NOT NULL,
  createdOn DATE DEFAULT current_timestamp()
  CONSTRAINT FK_user_review FOREIGN KEY(userId) REFERENCES r_users(userId),
  CONSTRAINT FK_restaurant_review FOREIGN KEY(restaurantId) REFERENCES r_restaurants(restaurantId)
);

INSERT INTO `r_restaurants`(`name`, `photo`) VALUES ('4 Fingers Crispy Chicken','https://onewestside.com/wp-content/uploads/2019/09/4Fingers_logo.png');

INSERT INTO `r_restaurants`(`name`, `photo`) VALUES ('Akira Back','https://i2.wp.com/absteakla.com/wp-content/uploads/2020/09/AB-Steak-logo.jpg?fit=1321%2C1017&ssl=1');

INSERT INTO `r_restaurants`(`name`, `photo`) VALUES ('Bar-Roque Grill','https://static.wixstatic.com/media/a35e9b_b2eaf7f1c50c4cae8e8c1ec2d157c643~mv2.png/v1/fill/w_640,h_400,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/a35e9b_b2eaf7f1c50c4cae8e8c1ec2d157c643~mv2.png');


INSERT INTO `r_restaurants`(`name`, `photo`) VALUES ('Haidilao Hot Pot','https://www.sunwaypyramid.com/static/shops/48b1fd331b010c44f54c41f66e814301/w768.png');


INSERT INTO `r_restaurants`(`name`, `photo`) VALUES ('NOX - Dine In The Dark','https://whatstheplanb.files.wordpress.com/2021/05/nox_logo_social.jpeg');

INSERT INTO `r_restaurants`(`name`, `photo`) VALUES ('Shin Minori Japanese Restaurant','https://s3-ap-southeast-1.amazonaws.com/v3-live.image.oddle.me/logo/menu_logo_ShinMinoriJapaneseRestaurantae3cc9.jpg');