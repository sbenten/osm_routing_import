CREATE SEQUENCE landuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE landuses_id_seq OWNER TO postgres;



CREATE TABLE landuses (
    id integer DEFAULT nextval('landuses_id_seq'::regclass) NOT NULL,
    geom public.geometry(Polygon,27700),
    boundary public.geometry(LineString,27700),
    osm_id bigint NOT NULL,
    name character varying,
    type character varying
);


ALTER TABLE landuses OWNER TO postgres;