BEGIN;

CREATE TABLE IF NOT EXISTS public.tokens 
(
  id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
  token character varying(36) COLLATE pg_catalog."default" NOT NULL,
  user_id integer NOT NULL,
  date_created timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	last_used timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	times_used integer NOT NULL DEFAULT 0,
  permissions integer NOT NULL DEFAULT 0,
	CONSTRAINT "PK_TOKENS" PRIMARY KEY (id)
);

ALTER TABLE public.tokens
    ADD CONSTRAINT FK_USERS_TOKENS_USER_ID FOREIGN KEY (user_id) REFERENCES users (id);

END;