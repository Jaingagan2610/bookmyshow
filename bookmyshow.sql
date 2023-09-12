create table
  user_data (
    id SERIAL primary key,
    first_name varchar(255) not null,
    last_name varchar(255) not null,
    dob DATE not null,
    user_image BYTEA
  );

create table
  user_address (
    id int primary key generated always as identity,
    address_no int,
    pincode int,
    address varchar,
    landmark varchar,
    town_city varchar,
    state varchar,
    foreign key (id) references user_data (id)
  );

create table
  movies (
    id bigint primary key generated always as identity,
    title text,
    description text,
    duration timestamp with time zone,
    language text,
    release_date timestamp with time zone,
    country text,
    genres text
  );

create table
  show_data (
    show_id int primary key generated always as identity,
    date timestamp with time zone,
    start_time timestamp with time zone,
    end_time timestamp with time zone,
    cinema_hall varchar,
    movie_id int,
    cinema_id int,
    foreign key (movie_id) references movies (id),
    foreign key (cinema_id) references cinema (cinema_id)
  );

create table
  booking (
    book_id int primary key generated always as identity,
    no_of_seat int,
    time timestamp,
    user_id int,
    show_id int,
    cinema_seat int,
    price int,
    foreign key (user_id) references user_data (id),
    foreign key (show_id) references show_data (show_id),
    foreign key (cinema_seat) references cinema_seat (seat_id)
  );

create table
  cinema (
    cinema_id bigint primary key generated always as identity,
    name text,
    total_cinema int,
    city_id bigint,
    foreign key (city_id) references city (city_id)
  );

create table
  city (
    city_id int generated always as identity primary key,
    city_name varchar(255)
  );

  create table
  cinema_hall (
    cinema_hall_id int primary key generated always as identity,
    name varchar,
    cinema_seat int,
    cinema_id int,
    foreign key (cinema_seat) references cinema_seat ("seat-id"),
    foreign key (cinema_id) references cinema (cinema_id)
  );

CREATE TABLE cinema_seat (
  seat_id int primary key generated always as identity,
  seat_no INT,
  cinema_hall_id INT,
  FOREIGN KEY (cinema_hall_id) REFERENCES cinema_hall(cinema_hall_id)
);

CREATE TABLE payment (
  payment_id int primary key generated always as identity ,
  booking_id INT,
  amount INT,
  discount_coupon INT,
  remote_transaction INT,
  FOREIGN KEY (booking_id) REFERENCES booking(book_id)
);