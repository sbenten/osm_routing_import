-- Materialized View: vw_batch_run_results_base

-- DROP MATERIALIZED VIEW vw_batch_run_results_base;

CREATE MATERIALIZED VIEW vw_batch_run_results_base AS 
 SELECT o.atlas_key,
    o.union_id,
    o.id,
    o.batch_run_id,
    o.batch_item_id,
    o.import_census_id,
    o.group_id,
    o.sub_group_id,
    o.group_description,
    o.sub_group_description,
    o.mode,
    o.batch_item_description,
    o.itemsource,
    o.itemtarget,
    o.itemsourceway,
    o.itemtargetway,
    o.itemsourcepos,
    o.itemtargetpos,
    o.resseq,
    o.resnodeid,
    o.resedgeid,
    o.rescost,
    o.resgeom,
    o.length_m,
    o.resstreetname,
    o.errmsg,
    o.resdelay,
    o.mode_filter,
    o.sub_mode_filter,
    o.run_date,
    o.batch_id,
    o.batchname,
    o.batchdescription,
    o.name,
    o.highway,
    o.attrs,
    o.source,
    o.target,
    o.totalascent,
    o.totaldescent,
    o.built_up,
    o.cost,
    o.cost_time_i,
    o.reverse_cost_time_i,
    o.cost_met_i,
    o.reverse_cost_met_i,
    o.firstnode,
    o.lastnode,
    o.geom,
    o.prev_sub_mode_filter,
    o.next_sub_mode_filter,
    o.prev_sub_group_id,
    o.next_sub_group_id,
    o.prev_geom,
    o.next_geom,
    o.firstgroupnode,
    o.lastgroupnode,
    o.direction,
    o.direction_debug,
        CASE
            WHEN o.id = o.firstgroupnode THEN o.itemsource
            ELSE NULL::geometry
        END AS startpoint,
        CASE
            WHEN o.id = o.lastgroupnode THEN o.itemtarget
            ELSE NULL::geometry
        END AS endpoint,
        CASE
            WHEN o.direction = 1 THEN
            CASE
                WHEN o.built_up THEN o.cost_time_i * o.resdelay
                ELSE o.cost_time_i
            END
            ELSE
            CASE
                WHEN o.built_up THEN o.reverse_cost_time_i * o.resdelay
                ELSE o.reverse_cost_time_i
            END
        END AS delay_time_cost,
        CASE
            WHEN o.direction = 1 THEN
            CASE
                WHEN o.built_up THEN o.cost_met_i * o.resdelay
                ELSE o.cost_met_i
            END
            ELSE
            CASE
                WHEN o.built_up THEN o.reverse_cost_met_i * o.resdelay
                ELSE o.reverse_cost_met_i
            END
        END AS delay_met_cost,
        CASE
            WHEN o.direction = 1 THEN o.cost_time_i
            ELSE o.reverse_cost_time_i
        END AS cost_time,
        CASE
            WHEN o.direction = 1 THEN o.cost_met_i
            ELSE o.reverse_cost_met_i
        END AS cost_met,
    lag(o.direction) OVER (PARTITION BY o.batch_run_id, o.group_id ORDER BY o.sub_group_id, o.resseq) AS prev_direction,
    lead(o.direction) OVER (PARTITION BY o.batch_run_id, o.group_id ORDER BY o.sub_group_id, o.resseq) AS next_direction
   FROM ( SELECT i.atlas_key,
            i.union_id,
            i.id,
            i.batch_run_id,
            i.batch_item_id,
            i.import_census_id,
            i.group_id,
            i.sub_group_id,
            i.group_description,
            i.sub_group_description,
            i.mode,
            i.batch_item_description,
            i.itemsource,
            i.itemtarget,
            i.itemsourceway,
            i.itemtargetway,
            i.itemsourcepos,
            i.itemtargetpos,
            i.resseq,
            i.resnodeid,
            i.resedgeid,
            i.rescost,
            i.resgeom,
            st_length(i.resgeom) AS length_m,
            i.resstreetname,
            i.errmsg,
            i.resdelay,
            i.mode_filter,
            i.sub_mode_filter,
            i.run_date,
            i.batch_id,
            i.batchname,
            i.batchdescription,
            i.name,
            i.highway,
            i.attrs,
            i.source,
            i.target,
            i.totalascent,
            i.totaldescent,
            i.built_up,
            i.cost,
            i.cost_time AS cost_time_i,
            i.reverse_cost_time AS reverse_cost_time_i,
            i.cost_met AS cost_met_i,
            i.reverse_cost_met AS reverse_cost_met_i,
            i.firstnode,
            i.lastnode,
            i.resgeom AS geom,
            lag(i.sub_mode_filter) OVER (PARTITION BY i.batch_run_id, i.group_id ORDER BY i.sub_group_id, i.resseq) AS prev_sub_mode_filter,
            lead(i.sub_mode_filter) OVER (PARTITION BY i.batch_run_id, i.group_id ORDER BY i.sub_group_id, i.resseq) AS next_sub_mode_filter,
            lag(i.sub_group_id) OVER (PARTITION BY i.batch_run_id, i.group_id ORDER BY i.sub_group_id, i.resseq) AS prev_sub_group_id,
            lead(i.sub_group_id) OVER (PARTITION BY i.batch_run_id, i.group_id ORDER BY i.sub_group_id, i.resseq) AS next_sub_group_id,
            lag(i.resgeom) OVER (PARTITION BY i.batch_run_id, i.group_id ORDER BY i.sub_group_id, i.resseq) AS prev_geom,
            lead(i.resgeom) OVER (PARTITION BY i.batch_run_id, i.group_id ORDER BY i.sub_group_id, i.resseq) AS next_geom,
            first_value(i.id) OVER (PARTITION BY i.batch_run_id, i.group_id ORDER BY i.sub_group_id, i.resseq) AS firstgroupnode,
            first_value(i.id) OVER (PARTITION BY i.batch_run_id, i.group_id ORDER BY i.sub_group_id DESC, i.resseq DESC) AS lastgroupnode,
                CASE
                    WHEN i.id = first_value(i.id) OVER (PARTITION BY i.batch_run_id, i.group_id ORDER BY i.sub_group_id, i.resseq) THEN 1
                    ELSE
                    CASE
                        WHEN st_touches(st_startpoint(i.resgeom), lag(i.resgeom) OVER (PARTITION BY i.batch_run_id, i.group_id ORDER BY i.sub_group_id, i.resseq)) THEN 1
                        WHEN st_touches(st_endpoint(i.resgeom), lag(i.resgeom) OVER (PARTITION BY i.batch_run_id, i.group_id ORDER BY i.sub_group_id, i.resseq)) THEN 1
                        ELSE 0
                    END
                END AS direction,
                CASE
                    WHEN i.id = first_value(i.id) OVER (PARTITION BY i.batch_run_id, i.group_id ORDER BY i.sub_group_id, i.resseq) THEN 1
                    ELSE
                    CASE
                        WHEN st_touches(st_startpoint(i.resgeom), lag(i.resgeom) OVER (PARTITION BY i.batch_run_id, i.group_id ORDER BY i.sub_group_id, i.resseq)) THEN 2
                        WHEN st_touches(st_endpoint(i.resgeom), lag(i.resgeom) OVER (PARTITION BY i.batch_run_id, i.group_id ORDER BY i.sub_group_id, i.resseq)) THEN 3
                        ELSE 4
                    END
                END AS direction_debug
           FROM ( SELECT (r.batch_item_id || '_'::text) || r.group_id AS atlas_key,
                    1 AS union_id,
                    r.id,
                    r.batch_run_id,
                    r.batch_item_id,
                    i_1.import_census_id,
                    r.group_id,
                    r.sub_group_id,
                    r.group_description,
                    r.sub_group_description,
                    r.mode,
                    r.batch_item_description,
                    r.itemsource,
                    r.itemtarget,
                    r.itemsourceway,
                    r.itemtargetway,
                    r.itemsourcepos,
                    r.itemtargetpos,
                    r.resseq,
                    r.resnodeid,
                    r.resedgeid,
                    r.rescost,
                    r.resgeom,
                    r.resstreetname,
                    r.errmsg,
                    r.resdelay,
                    r.mode_filter,
                    r.sub_mode_filter,
                    s.run_date,
                    s.batch_id,
                    s.batchname,
                    s.batchdescription,
                    NULL::character varying AS name,
                    NULL::character varying AS highway,
                    NULL::hstore AS attrs,
                    NULL::integer AS source,
                    NULL::integer AS target,
                    0 AS totalascent,
                    0 AS totaldescent,
                    true AS built_up,
                    r.rescost AS cost,
                    r.virtual_time_cost AS cost_time,
                    r.virtual_time_cost AS reverse_cost_time,
                    r.virtual_met_cost AS cost_met,
                    r.virtual_met_cost AS reverse_cost_met,
                    min(r.id) OVER (PARTITION BY r.batch_run_id, r.group_id, r.sub_group_id) AS firstnode,
                    max(r.id) OVER (PARTITION BY r.batch_run_id, r.group_id, r.sub_group_id) AS lastnode
                   FROM batch_run_res r
                     JOIN batch_runs s ON s.id = r.batch_run_id
                     JOIN batch_items i_1 ON i_1.id = r.batch_item_id
                  WHERE r.virtual_length_m > 0::double precision
                UNION ALL
                 SELECT (r.batch_item_id || '_'::text) || r.group_id AS atlas_key,
                    2 AS union_id,
                    r.id,
                    r.batch_run_id,
                    r.batch_item_id,
                    i_1.import_census_id,
                    r.group_id,
                    r.sub_group_id,
                    r.group_description,
                    r.sub_group_description,
                    r.mode,
                    r.batch_item_description,
                    r.itemsource,
                    r.itemtarget,
                    r.itemsourceway,
                    r.itemtargetway,
                    r.itemsourcepos,
                    r.itemtargetpos,
                    r.resseq,
                    r.resnodeid,
                    r.resedgeid,
                    r.rescost,
                    r.resgeom,
                    r.resstreetname,
                    r.errmsg,
                    r.resdelay,
                    r.mode_filter,
                    r.sub_mode_filter,
                    s.run_date,
                    s.batch_id,
                    s.batchname,
                    s.batchdescription,
                    w.name,
                    w.highway,
                    w.attrs,
                    w.source,
                    w.target,
                    w.totalascent,
                    w.totaldescent,
                    w.built_up,
                    r.rescost AS cost,
                        CASE
                            WHEN r.sub_mode_filter = 1 THEN w.car_cost_time
                            WHEN r.sub_mode_filter = 2 THEN w.car_cost_time
                            WHEN r.sub_mode_filter = 3 THEN w.cycle_cost_time
                            WHEN r.sub_mode_filter = 4 THEN COALESCE(w.walk_cost_time, r.virtual_time_cost)
                            ELSE NULL::double precision
                        END AS cost_time,
                        CASE
                            WHEN r.sub_mode_filter = 1 THEN w.car_reverse_cost_time
                            WHEN r.sub_mode_filter = 2 THEN w.car_reverse_cost_time
                            WHEN r.sub_mode_filter = 3 THEN w.cycle_reverse_cost_time
                            WHEN r.sub_mode_filter = 4 THEN COALESCE(w.walk_reverse_cost_time, r.virtual_time_cost)
                            ELSE NULL::double precision
                        END AS reverse_cost_time,
                        CASE
                            WHEN r.sub_mode_filter = 1 THEN w.car_cost_met
                            WHEN r.sub_mode_filter = 2 THEN w.car_cost_met
                            WHEN r.sub_mode_filter = 3 THEN w.cycle_cost_met
                            WHEN r.sub_mode_filter = 4 THEN COALESCE(w.walk_cost_met, r.virtual_met_cost)
                            ELSE NULL::double precision
                        END AS cost_met,
                        CASE
                            WHEN r.sub_mode_filter = 1 THEN w.car_reverse_cost_met
                            WHEN r.sub_mode_filter = 2 THEN w.car_reverse_cost_met
                            WHEN r.sub_mode_filter = 3 THEN w.cycle_reverse_cost_met
                            WHEN r.sub_mode_filter = 4 THEN COALESCE(w.walk_reverse_cost_met, r.virtual_met_cost)
                            ELSE NULL::double precision
                        END AS reverse_cost_met,
                    min(r.id) OVER (PARTITION BY r.batch_run_id, r.group_id, r.sub_group_id) AS firstnode,
                    max(r.id) OVER (PARTITION BY r.batch_run_id, r.group_id, r.sub_group_id) AS lastnode
                   FROM batch_run_res r
                     JOIN batch_runs s ON s.id = r.batch_run_id
                     JOIN batch_items i_1 ON i_1.id = r.batch_item_id
                     JOIN ways_clean w ON w.id = r.resedgeid AND r.sub_mode_filter <> 6
                UNION ALL
                 SELECT (r.batch_item_id || '_'::text) || r.group_id AS atlas_key,
                    3 AS union_id,
                    r.id,
                    r.batch_run_id,
                    r.batch_item_id,
                    i_1.import_census_id,
                    r.group_id,
                    r.sub_group_id,
                    r.group_description,
                    r.sub_group_description,
                    r.mode,
                    r.batch_item_description,
                    r.itemsource,
                    r.itemtarget,
                    r.itemsourceway,
                    r.itemtargetway,
                    r.itemsourcepos,
                    r.itemtargetpos,
                    r.resseq,
                    r.resnodeid,
                    r.resedgeid,
                    r.rescost,
                    r.resgeom,
                    r.resstreetname,
                    r.errmsg,
                    r.resdelay,
                    r.mode_filter,
                        CASE
                            WHEN t.transport_mode::text = 'walk'::text THEN 4
                            WHEN t.transport_mode::text = 'wait'::text THEN 5
                            ELSE r.sub_mode_filter
                        END AS sub_mode_filter,
                    s.run_date,
                    s.batch_id,
                    s.batchname,
                    s.batchdescription,
                    r.resstreetname AS name,
                        CASE
                            WHEN t.transport_mode::text = 'walk'::text THEN 'path'::text
                            WHEN t.transport_mode::text = 'wait'::text THEN 'path'::text
                            WHEN t.transport_mode::text = 'bus'::text THEN 'road'::text
                            WHEN t.transport_mode::text = 'tram'::text THEN 'tram'::text
                            WHEN t.transport_mode::text = 'train'::text THEN 'trainline'::text
                            ELSE NULL::text
                        END AS highway,
                    NULL::hstore AS attrs,
                    t.source,
                    t.target,
                    t.totalascent,
                    t.totaldescent,
                    true AS built_up,
                    r.rescost AS cost,
                    COALESCE(t.cost_time, r.virtual_time_cost) AS cost_time,
                    COALESCE(t.reverse_cost_time, r.virtual_time_cost) AS reverse_cost_time,
                    COALESCE(t.cost_met, r.virtual_met_cost) AS cost_met,
                    COALESCE(t.reverse_cost_met, r.virtual_met_cost) AS reverse_cost_met,
                    min(r.id) OVER (PARTITION BY r.batch_run_id, r.group_id, r.sub_group_id) AS firstnode,
                    max(r.id) OVER (PARTITION BY r.batch_run_id, r.group_id, r.sub_group_id) AS lastnode
                   FROM batch_run_res r
                     JOIN batch_runs s ON s.id = r.batch_run_id
                     JOIN batch_items i_1 ON i_1.id = r.batch_item_id
                     JOIN public_transport_route_times t ON t.id = r.resedgeid AND r.sub_mode_filter = 6) i) o
  ORDER BY o.group_id, o.sub_group_id, o.resseq
WITH DATA;

ALTER TABLE vw_batch_run_results_base
  OWNER TO postgres;

-- Index: vw_batch_item_id_idx

-- DROP INDEX vw_batch_item_id_idx;

CREATE INDEX vw_batch_item_id_idx
  ON vw_batch_run_results_base
  USING btree
  (batch_item_id);

-- Index: vw_batch_run_id_idx

-- DROP INDEX vw_batch_run_id_idx;

CREATE INDEX vw_batch_run_id_idx
  ON vw_batch_run_results_base
  USING btree
  (batch_run_id);

-- Index: vw_group_id_idx

-- DROP INDEX vw_group_id_idx;

CREATE INDEX vw_group_id_idx
  ON vw_batch_run_results_base
  USING btree
  (group_id);

-- Index: vw_sub_group_id_idx

-- DROP INDEX vw_sub_group_id_idx;

CREATE INDEX vw_sub_group_id_idx
  ON vw_batch_run_results_base
  USING btree
  (sub_group_id);

