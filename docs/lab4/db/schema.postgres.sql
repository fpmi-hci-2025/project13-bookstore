create table if not exists "user" (
  id serial primary key,
  username varchar(255) not null unique,
  password varchar(255) not null,
  email varchar(255) not null unique
);

create table if not exists book (
  id serial primary key,
  title varchar(255) not null,
  author varchar(255) not null,
  genre varchar(100),
  price numeric(10,2) not null check (price >= 0),
  stock integer not null default 0 check (stock >= 0)
);

create table if not exists "order" (
  id serial primary key,
  user_id integer not null references "user"(id) on delete cascade,
  total_price numeric(10,2) not null check (total_price >= 0),
  delivery_address varchar(255) not null,
  created_at timestamp not null default now(),
  status varchar(50) not null default 'created'
);

create table if not exists order_item (
  id serial primary key,
  order_id integer not null references "order"(id) on delete cascade,
  book_id integer not null references book(id),
  quantity integer not null check (quantity > 0),
  price numeric(10,2) not null check (price >= 0)
);

create table if not exists review (
  id serial primary key,
  user_id integer not null references "user"(id) on delete cascade,
  book_id integer not null references book(id) on delete cascade,
  rating integer not null check (rating between 1 and 5),
  comment text,
  created_at timestamp not null default now(),
  unique (user_id, book_id)
);

create index if not exists idx_book_title on book (title);
create index if not exists idx_book_author on book (author);
create index if not exists idx_order_user on "order" (user_id);
create index if not exists idx_order_item_order on order_item (order_id);
create index if not exists idx_review_book on review (book_id);
