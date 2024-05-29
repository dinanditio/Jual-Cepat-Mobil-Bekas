-- Creating the Cities table
CREATE TABLE Cities (
    city_id SERIAL PRIMARY KEY,
    city_name VARCHAR(255) NOT NULL,
    latitude FLOAT NOT NULL,
    longitude FLOAT NOT NULL
);

-- Creating the Users table
CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    contact_number VARCHAR(15) NOT NULL,
    city_id INT,
    FOREIGN KEY (location_id) REFERENCES Cities(city_id)
);

-- Creating the Cars table
CREATE TABLE Cars (
    car_id SERIAL PRIMARY KEY,
    brand VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    body_type VARCHAR(50) NOT NULL,
    manufacture_year INT NOT NULL,
    transmission_type VARCHAR(50),
    color VARCHAR(50),
    mileage INT,
    list_price INT NOT NULL
);

-- Creating the Advertisements table
CREATE TABLE Advertisements (
    ad_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    car_id INT NOT NULL,
    description TEXT,
    price INT NOT NULL,
    posted_date DATE NOT NULL,
    allow_bargaining BOOLEAN NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (car_id) REFERENCES Cars(car_id)
);

-- Creating the Bids table
CREATE TABLE Bids (
    bid_id SERIAL PRIMARY KEY,
    ad_id INT NOT NULL,
    user_id INT NOT NULL,
    bid_price INT NOT NULL,
    bid_date DATE NOT NULL,
    FOREIGN KEY (ad_id) REFERENCES Advertisements(ad_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Creating the Sales table
CREATE TABLE Sales (
    sale_id SERIAL PRIMARY KEY,
    ad_id INT UNIQUE NOT NULL,
    buyer_id INT NOT NULL,
    seller_id INT NOT NULL,
    final_price INT NOT NULL,
    sale_date DATE NOT NULL,
    FOREIGN KEY (ad_id) REFERENCES Advertisements(ad_id),
    FOREIGN KEY (buyer_id) REFERENCES Users(user_id),
    FOREIGN KEY (seller_id) REFERENCES Users(user_id)
);