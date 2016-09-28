DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS questions_follows;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS likes;


CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(50),
  lname VARCHAR(50)
);


CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT,
  body TEXT,
  user_id INTEGER,

  FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE questions_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER,

  FOREIGN KEY(user_id) REFERENCES users(id),
  FOREIGN KEY(question_id) REFERENCES questions(id)
);


CREATE TABLE replies(
  id INTEGER PRIMARY KEY,
  question_id INTEGER,
  user_id INTEGER,
  reply TEXT,
  reply_id INTEGER,

  FOREIGN KEY(question_id) REFERENCES questions(id),
  FOREIGN KEY(user_id) REFERENCES users(id),
  FOREIGN KEY(reply_id) REFERENCES replies(id) -- parent
);


CREATE TABLE likes (
  user_id INTEGER,
  question_id INTEGER,

  FOREIGN KEY(user_id) REFERENCES users(id),
  FOREIGN KEY(question_id) REFERENCES questions(id)
);

INSERT INTO
  users(fname, lname)
VALUES
  ('Michael', 'Losch'),
  ('Deep', 'Tailor'),
  ('Loren', 'Davis'),
  ('Jagdish', 'Tailor');

INSERT INTO
  questions(title, body, user_id)
VALUES
  ('hello', 'where is the world', 1),
  ('What''s up?', 'Just checking in', 2),
  ('herp derp', 'skerp', 3),
  ('scollywag', 'cheary-o!', 2),
  ('suuhhh d3rd', 'dude suuuuhhh', 3);

INSERT INTO
  questions_follows(user_id, question_id)
VALUES
  (1,1),
  (1,2),
  (2,1),
  (2,2),
  (3,1),
  (4,2);



INSERT INTO
  replies(reply, question_id, user_id, reply_id)
VALUES
  ('you are in it', 1, 3, NULL),
  ('thanks', 2, 4, NULL),
  ('you are welcome', 2, 1, 2),
  ('Whats up?',1,4,1);

INSERT INTO
  likes(user_id, question_id)
VALUES
  (1,1),
  (1,2),
  (2,1),
  (2,2),
  (3,1),
  (3,3),
  (4,3),
  (3,2),
  (3,1),
  (4,4),
  (4,5);
