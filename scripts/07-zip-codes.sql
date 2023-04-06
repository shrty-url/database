BEGIN;

CREATE TABLE IF NOT EXISTS public.zip_codes (
  id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
  zip character varying(5) COLLATE pg_catalog."default" NOT NULL,
  city character varying(100) COLLATE pg_catalog."default" NOT NULL,
  state character varying(100) COLLATE pg_catalog."default" NOT NULL
);


END;