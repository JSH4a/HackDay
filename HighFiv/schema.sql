DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS bounty;
DROP TABLE IF EXISTS nomination;
DROP TABLE IF EXISTS vote;
DROP TABLE IF EXISTS winner;
DROP TABLE IF EXISTS withdrawl;
DROP TABLE IF EXISTS reward;

CREATE TABLE user (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  email TEXT NOT NULL,
  password_hash TEXT NOT NULL,
  fivbucks INTEGER,
  bountybucks INTEGER,
  role TEXT
);

CREATE TABLE bounty (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  target_id INTEGER NOT NULL,
  reporter_id INTEGER NOT NULL,
  amount INTEGER NOT NULL,
  date_placed TEXT NOT NULL,
  isApproved INTEGER NOT NULL,
  isAnonymous INTEGER NOT NULL,

  FOREIGN KEY (target_id) REFERENCES user(id),
  FOREIGN KEY (reporter_id) REFERENCES user(id)
);

CREATE TABLE nomination (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  nominee_id INTEGER NOT NULL,
  nominator_id INTEGER NOT NULL,
  date_placed TEXT NOT NULL,
  votes INTEGER NOT NULL,
  reason TEXT,

  FOREIGN KEY (nominee_id) REFERENCES user(id),
  FOREIGN KEY (nominator_id) REFERENCES user(id)
);

CREATE TABLE vote (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  nomination_id INTEGER,
  voter_id INTEGER,
  date_placed TEXT,

  FOREIGN KEY (nomination_id) REFERENCES nomination(id),
  FOREIGN KEY (voter_id) REFERENCES user(id)
);

CREATE TABLE winner (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  nomination_id INTEGER,

  FOREIGN KEY (nomination_id) REFERENCES nomination(id)
);

CREATE TABLE withdrawl (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id INTEGER,
  reward TEXT,

  FOREIGN KEY (user_id) REFERENCES user(id)
);

CREATE TABLE reward (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  cost INTEGER
)
