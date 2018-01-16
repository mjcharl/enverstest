DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS revinfo;
DROP TABLE IF EXISTS customers_aud;

CREATE TABLE customers
(
    id bigint NOT NULL,
    first_name varchar(255),
    last_name varchar(255),
    CONSTRAINT customer_pkey PRIMARY KEY (id)
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