BEGIN;

CREATE TABLE links(
	id serial NOT NULL,
	url varchar(255) NOT NULL,
	shortcode varchar(8) NOT NULL,
	"views" integer NOT NULL DEFAULT 0,
	hosts_id integer NOT NULL,
	users_id integer NOT NULL,
	CONSTRAINT links_pkey PRIMARY KEY(id)
);

CREATE TABLE hosts(
	id serial NOT NULL,
	host varchar(255) NOT NULL,
	CONSTRAINT hosts_pkey PRIMARY KEY(id)
);

CREATE TABLE "views"(
	date timestamp NOT NULL DEFAULT NOW(),
	links_id integer NOT NULL,
	users_id integer,
	CONSTRAINT views_pkey PRIMARY KEY(links_id, date)
);

CREATE TABLE users(
	id serial NOT NULL,
	username varchar(60) NOT NULL,
	email varchar(255) NOT NULL,
	"password" varchar NOT NULL,
	uid uuid NOT NULL,
	CONSTRAINT users_pkey PRIMARY KEY(id)
);

ALTER TABLE
	links
ADD
	CONSTRAINT links_hosts_id_fkey FOREIGN KEY (hosts_id) REFERENCES hosts (id);

ALTER TABLE
	"views"
ADD
	CONSTRAINT views_links_id_fkey FOREIGN KEY (links_id) REFERENCES links (id);

ALTER TABLE
	links
ADD
	CONSTRAINT links_users_id_fkey FOREIGN KEY (users_id) REFERENCES users (id);

ALTER TABLE
	"views"
ADD
	CONSTRAINT views_users_id_fkey FOREIGN KEY (users_id) REFERENCES users (id);

END;