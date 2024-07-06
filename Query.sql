CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('Admin', 'User') NOT NULL
);
INSERT INTO users (username, password, role) VALUES
('admin1', 'hashedpassword1', 'Admin'),
('user1', 'hashedpassword2', 'User'),CREATE TABLE posts (
    post_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    title VARCHAR(200) NOT NULL,
    content TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

('user2', 'hashedpassword3', 'User');
CREATE TABLE profiles (
    profile_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    birthdate DATE,
    bio VARCHAR(500),
    FOREIGN KEY (user_id) REFERENCES users(id)
);
INSERT INTO profiles (user_id, full_name, birthdate, bio) VALUES
(1, 'Admin One', '1980-01-01', 'Bio of Admin One'),
(2, 'User One', '1990-02-02', 'Bio of User One'),
(3, 'User Two', '1995-03-03', 'Bio of User Two');
CREATE TABLE comments (
    comment_id INT AUTO_INCREMENT PRIMARY KEY,
    post_id INT NOT NULL,
    user_id INT NOT NULL,
    comment_text VARCHAR(1000) NOT NULL,
    commented_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES posts(post_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);
INSERT INTO comments (post_id, user_id, comment_text) VALUES
(1, 2, 'First comment on the first post'),
(2, 3, 'First comment on the second post'),
(3, 1, 'First comment on the third post');
SELECT 
    u.username, 
    p.full_name, 
    p.bio 
FROM 
    users u
    JOIN profiles p ON u.id = p.user_id;

