drop table if exists orders;
drop table if exists customers;
drop table if exists revinfo;
drop table if exists customers_aud;
drop table if exists orders_aud;
drop sequence if exists hibernate_sequence;

  create table customers
  (
      id            bigint          not null,
      first_name    varchar(255)    not null,
      last_name     varchar(255)    not null,
      constraint    customer_pkey primary key (id)
  );

  create table orders
  (
      id            bigint          not null,
      customer_id   bigint          not null references customers(id) on delete cascade,
      product       varchar(255)    not null,
      quantity      integer         not null,
      price         numeric(8,2)    not null
  );

  create table revinfo
  (
      rev           integer         not null,
      revtstmp      bigint          not null,
      username      varchar(255),
      constraint    revinfo_pkey primary key (rev)
  );

  create table customers_aud
  (
      id            bigint          not null,
      rev           integer         not null,
      revtype       smallint,
      first_name    varchar(255),
      last_name     varchar(255),
      constraint customer_aud_pkey primary key (id, rev)
  );

  create table orders_aud
  (
      id            bigint          not null,
      rev           integer         not null,
      revtype       smallint,
      customer_id   bigint,
      product       varchar(255),
      quantity      integer,
      price         numeric(8,2),
      constraint order_aud_pkey primary key (id, rev)
  );

  create sequence hibernate_sequence minvalue 300;