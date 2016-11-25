DROP TABLE albums;
DROP TABLE artists;

CREATE TABLE artists (
  id SERIAL8 primary key,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE albums (
  id SERIAL8 primary key,
  title TEXT NOT NULL,
  artist_id INT8 references artists(id) NOT NULL,
  quantity INT4
);