CREATE SEQUENCE car_parks_id_seq
    START WITH 2138
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE car_parks_id_seq OWNER TO postgres;

CREATE TABLE car_parks (
    id integer DEFAULT nextval('car_parks_id_seq'::regclass) NOT NULL,
    geom public.geometry(Polygon,27700),
    boundary public.geometry(LineString,27700),
    osm_id bigint NOT NULL,
    name character varying,
    access character varying
);


ALTER TABLE car_parks OWNER TO postgres;