BEGIN;

CREATE TABLE IF NOT EXISTS public.token_usage (
  id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
  token_id integer NOT NULL,
  date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	resource_hash character varying(6) COLLATE pg_catalog."default" NOT NULL,
	payload_length integer NOT NULL,
	response_length integer NOT NULL,
	response_success boolean NOT NULL,
	response_code integer NOT NULL,
	CONSTRAINT "PK_TOKEN_USAGE" PRIMARY KEY (id)
);


ALTER TABLE public.token_usage
    ADD CONSTRAINT FK_TOKENS_TOKEN_USAGE_TOKEN_ID FOREIGN KEY (token_id) REFERENCES tokens (id);

END;