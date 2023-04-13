BEGIN;

CREATE TABLE links(
	id serial NOT NULL,
	url varchar(255) NOT NULL,
	shortcode varchar(8) NOT NULL,
	"views" integer NOT NULL DEFAULT 0,
	hosts_id integer NOT NULL,
	CONSTRAINT links_pkey PRIMARY KEY(id)
);

CREATE TABLE hosts(
	id serial NOT NULL,
	host varchar(255) NOT NULL,
	CONSTRAINT hosts_pkey PRIMARY KEY(id)
);

CREATE TABLE views(
	date timestamp NOT NULL DEFAULT NOW(),
	links_id integer NOT NULL,
	CONSTRAINT views_pkey PRIMARY KEY(links_id, date)
);

ALTER TABLE
	links
ADD
	CONSTRAINT links_hosts_id_fkey FOREIGN KEY (hosts_id) REFERENCES hosts (id);

ALTER TABLE
	"views"
ADD
	CONSTRAINT views_links_id_fkey FOREIGN KEY (links_id) REFERENCES links (id);

END;