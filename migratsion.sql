-- users database

CREATE TABLE users(
    user_id SERIAL PRIMARY KEY, 
    nickname VARCHAR(255) UNIQUE NOT NULL, 
    password VARCHAR(255) NOT NULL, 
    email VARCHAR(255) DEFAULT '', 
    phone_number VARCHAR(255) DEFAULT '', 
    created_at TIMESTAMP, 
    birth_date DATE, 
    posts INT DEFAULT 0,
    marks INT DEFAULT 0, 
    followers INT DEFAULT 0, 
    following INT DEFAULT 0,
    premium BOOLEAN,
    biograpfy VARCHAR(255) DEFAULT '',
);

CREATE TABLE user_follow(
    follower_id INT,
    followed_id INT,
    FOREIGN KEY (follower_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (followed_id) REFERENCES users(user_id) ON DELETE CASCADE
);


-- article database

CREATE TABLE posts(
    post_id SERIAL PRIMARY KEY,
    user_id INT,
    title VARCHAR(255) NOT NULL,
    body TEXT NOT NULL,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    views INT DEFAULT 0,
    shares INT DEFAULT 0,
    saved INT DEFAULT 0,
    claps INT DEFAULT 0,
    comments INT DEFAULT 0
    archive BOOLEAN DEFAULT FALSE,
    public BOOLEAN DEFAULT FALSE,
    private BOOLEAN DEFAULT FALSE,
);


CREATE TABLE saved_posts(
    user_id INT,
    post_id INT,
    saved_at TIMESTAMP,
)


CREATE TABLE saved_posts(
    post_id INT,
    saved_at TIMESTAMP
);

CREATE TABLE marks_post(
    marks_id SERIAL PRIMARY KEY,
    post_id INT,
    user_id INT,
    mark_at TIMESTAMP,
)


CREATE TABLE aftorshift_post(
    aftorshift_id SERIAL PRIMARY KEY,
    post_id INT,
    user1_id INT,
    user2_id INT,
)

-- comments database 

CREATE TABLE comments_post(
    comment_id SERIAL PRIMARY KEY,
    user_id INT,
    post_id INT,
    comment TEXT NOT NULL,
);

CREATE TABLE comments_reply(
    comment_id SERIAL PRIMARY KEY,
    user_id INT,
    reply_id INT,
    comment TEXT NOT NULL,
);

CREATE TABLE marks_comment(
    marks_id SERIAL PRIMARY KEY,
    user_id INT,
    user_marked_id INT,
    comment_id INT,
)

-- claps database

CREATE TABLE claps_post(
    clap_id SERIAL PRIMARY KEY,
    user_id INT,
    post_id INT,
    clap_at TIMESTAMP,
);

CREATE TABLE claps_comment(
    clap_id SERIAL PRIMARY KEY,
    user_id INT
    comment_id INT,
    clap_at TIMESTAMP,
);


-- -- payment database


-- CREATE TABLE cardholder(
--     card_id SERIAL PRIMARY KEY,
--     user_id INT,
--     cardnumber VARCHAR(255),
--     cardname VARCHAR(255),
--     cardcvc VARCHAR(255),
--     cardmonth VARCHAR(255),
--     cardyear VARCHAR(255),
--     payment_method VARCHAR(255),
-- );

-- CREATE TABLE payment(
--     payment_id SERIAL PRIMARY KEY,
--     user_id INT,
--     amount DECIMAL(8,5),
--     payment_date TIMESTAMP,
--     payment_till TIMESTAMP,
--     payment_status BOOLEAN DEFAULT FALSE,
--     card
-- );

-- CREATE TABLE price_payment(
--     price_moth DECIMAL(8,5),
--     price_year DECIMAL(8,5),
-- );


-- notification database


CREATE TABLE notifications(
    
)

-- direct database

CREATE TABLE direct(
    message_id SERIAL PRIMARY KEY,
    from_id INT,
    to_id INT,
    message TEXT NOT NULL,
    sent_at TIMESTAMP,
)