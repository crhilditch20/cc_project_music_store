DROP TABLE albums;
DROP TABLE genres;
DROP TABLE artists;

CREATE TABLE artists (
  id SERIAL8 primary key,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE genres (
  id SERIAL8 primary key,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE albums (
  id SERIAL8 primary key,
  title TEXT NOT NULL,
  artist_id INT8 references artists(id) NOT NULL,
  quantity INT4,
  genre_id INT8 references genres(id) NOT NULL,
  on_order INT4
);