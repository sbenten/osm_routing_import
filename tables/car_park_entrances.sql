CREATE SEQUENCE car_park_entrances_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE car_park_entrances_id_seq OWNER TO postgres;

CREATE TABLE car_park_entrances (
    id integer DEFAULT nextval('car_park_entrances_id_seq'::regclass) NOT NULL,
    car_park_id integer NOT NULL,
    geom public.geometry(Point,27700) NOT NULL,
    car_allow boolean DEFAULT false NOT NULL,
    walk_allow boolean DEFAULT false NOT NULL,
    virtual public.geometry(Point,27700)
);


ALTER TABLE car_park_entrances OWNER TO postgres;