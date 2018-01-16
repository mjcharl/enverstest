DROP TABLE IF EXISTS orders;
  DROP TABLE IF EXISTS customers;
  DROP TABLE IF EXISTS revinfo;
  DROP TABLE IF EXISTS customers_aud;
  DROP TABLE IF EXISTS orders_aud;

  CREATE TABLE customers
  (
      id bigint NOT NULL,
      first_name varchar(255),
      last_name varchar(255),
      CONSTRAINT customer_pkey PRIMARY KEY (id)
  );

  CREATE TABLE orders
  (
      id bigint NOT NULL,
      customer_id bigint not null references customers(id) on delete cascade,
      product varchar(255) not null,
      quantity integer not null,
      price numeric(8,2) not null
  );

  CREATE TABLE revinfo
  (
      rev integer NOT NULL,
      revtstmp bigint NOT NULL,
      username varchar(255),
      CONSTRAINT revinfo_pkey PRIMARY KEY (rev)
  );

  CREATE TABLE customers_aud
  (
      id bigint NOT NULL,
      rev integer NOT NULL,
      revtype smallint,
      first_name varchar(255),
      last_name varchar(255),
      CONSTRAINT customer_aud_pkey PRIMARY KEY (id, rev)
  );

  CREATE TABLE orders_aud
  (
      id bigint NOT NULL,
      rev integer NOT NULL,
      revtype smallint,
      customer_id bigint,
      product varchar(255),
      quantity integer,
      price numeric(8,2),
      CONSTRAINT order_aud_pkey PRIMARY KEY (id, rev)
  );