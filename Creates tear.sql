

-- SCHEMA: tear

-- DROP SCHEMA IF EXISTS tear ;

CREATE SCHEMA IF NOT EXISTS tear
    AUTHORIZATION postgres;


-- Table: tear.concluidos

-- DROP TABLE IF EXISTS tear.concluidos;

CREATE TABLE IF NOT EXISTS tear.concluidos
(
    "codProjeto" integer NOT NULL,
    quantidade text COLLATE pg_catalog."default" NOT NULL,
    "dataConclusao" date NOT NULL,
    CONSTRAINT concluidos_pkey PRIMARY KEY ("codProjeto"),
    CONSTRAINT fk_concluidos FOREIGN KEY ("codProjeto")
        REFERENCES tear.fichas ("codigoProjeto") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS tear.concluidos
    OWNER to postgres;
-- Index: fki_fk_concluidos

-- DROP INDEX IF EXISTS tear.fki_fk_concluidos;

CREATE INDEX IF NOT EXISTS fki_fk_concluidos
    ON tear.concluidos USING btree
    ("codProjeto" ASC NULLS LAST)
    TABLESPACE pg_default;



    -- Table: tear.descricao

-- DROP TABLE IF EXISTS tear.descricao;

CREATE TABLE IF NOT EXISTS tear.descricao
(
    "codProjeto" integer NOT NULL,
    "npkMaquina" numeric NOT NULL,
    "velocidadeEstiragem" numeric NOT NULL,
    "velocidadeMaquina" text COLLATE pg_catalog."default" NOT NULL,
    "matriculaFuncionario" text COLLATE pg_catalog."default" NOT NULL,
    "nomeFuncionario" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Descricao_pkey" PRIMARY KEY ("codProjeto"),
    CONSTRAINT fk_ficha FOREIGN KEY ("codProjeto")
        REFERENCES tear.fichas ("codigoProjeto") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS tear.descricao
    OWNER to postgres;




    -- Table: tear.fichas

-- DROP TABLE IF EXISTS tear.fichas;

CREATE TABLE IF NOT EXISTS tear.fichas
(
    "codigoProjeto" integer NOT NULL,
    "tipoLinha1" text COLLATE pg_catalog."default" NOT NULL,
    "tipoLinha2" text COLLATE pg_catalog."default",
    "tipoLinha3" text COLLATE pg_catalog."default",
    cor1 text COLLATE pg_catalog."default" NOT NULL,
    cor2 text COLLATE pg_catalog."default",
    cor3 text COLLATE pg_catalog."default",
    lowmelt1 text COLLATE pg_catalog."default" NOT NULL,
    lowmelt2 text COLLATE pg_catalog."default" NOT NULL,
    monofio1 text COLLATE pg_catalog."default",
    monofio2 text COLLATE pg_catalog."default",
    elastico text COLLATE pg_catalog."default" NOT NULL,
    quantidade text COLLATE pg_catalog."default" NOT NULL,
    "matriculaFuncionario" text COLLATE pg_catalog."default" NOT NULL,
    "nomeFuncionario" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT fichas_pkey PRIMARY KEY ("codigoProjeto")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS tear.fichas
    OWNER to postgres;



    -- Table: tear.insumos

-- DROP TABLE IF EXISTS tear.insumos;

CREATE TABLE IF NOT EXISTS tear.insumos
(
    "tipoLinha" text COLLATE pg_catalog."default" NOT NULL,
    cor text COLLATE pg_catalog."default" NOT NULL,
    "corSecundaria" text COLLATE pg_catalog."default",
    quantidade integer NOT NULL,
    lote text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT insumos_pkey PRIMARY KEY (lote, cor)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS tear.insumos
    OWNER to postgres;



