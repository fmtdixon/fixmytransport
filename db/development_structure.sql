--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: -
--

CREATE PROCEDURAL LANGUAGE plpgsql;


SET search_path = public, pg_catalog;

--
-- Name: box2d; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE box2d;


--
-- Name: box2d_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d_in(cstring) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2DFLOAT4_in';


--
-- Name: box2d_out(box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d_out(box2d) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2DFLOAT4_out';


--
-- Name: box2d; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE box2d (
    INTERNALLENGTH = 16,
    INPUT = box2d_in,
    OUTPUT = box2d_out,
    ALIGNMENT = int4,
    STORAGE = plain
);


--
-- Name: box3d; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE box3d;


--
-- Name: box3d_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box3d_in(cstring) RETURNS box3d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_in';


--
-- Name: box3d_out(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box3d_out(box3d) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_out';


--
-- Name: box3d; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE box3d (
    INTERNALLENGTH = 48,
    INPUT = box3d_in,
    OUTPUT = box3d_out,
    ALIGNMENT = double,
    STORAGE = plain
);


--
-- Name: box3d_extent; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE box3d_extent;


--
-- Name: box3d_extent_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box3d_extent_in(cstring) RETURNS box3d_extent
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_in';


--
-- Name: box3d_extent_out(box3d_extent); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box3d_extent_out(box3d_extent) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_extent_out';


--
-- Name: box3d_extent; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE box3d_extent (
    INTERNALLENGTH = 48,
    INPUT = box3d_extent_in,
    OUTPUT = box3d_extent_out,
    ALIGNMENT = double,
    STORAGE = plain
);


--
-- Name: chip; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE chip;


--
-- Name: chip_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION chip_in(cstring) RETURNS chip
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_in';


--
-- Name: chip_out(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION chip_out(chip) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_out';


--
-- Name: chip; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE chip (
    INTERNALLENGTH = variable,
    INPUT = chip_in,
    OUTPUT = chip_out,
    ALIGNMENT = double,
    STORAGE = extended
);


--
-- Name: geography; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE geography;


--
-- Name: geography_analyze(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography_analyze(internal) RETURNS boolean
    LANGUAGE c STRICT
    AS '$libdir/postgis-1.5', 'geography_analyze';


--
-- Name: geography_in(cstring, oid, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography_in(cstring, oid, integer) RETURNS geography
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_in';


--
-- Name: geography_out(geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography_out(geography) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_out';


--
-- Name: geography_typmod_in(cstring[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography_typmod_in(cstring[]) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_typmod_in';


--
-- Name: geography_typmod_out(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography_typmod_out(integer) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_typmod_out';


--
-- Name: geography; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE geography (
    INTERNALLENGTH = variable,
    INPUT = geography_in,
    OUTPUT = geography_out,
    TYPMOD_IN = geography_typmod_in,
    TYPMOD_OUT = geography_typmod_out,
    ANALYZE = geography_analyze,
    ALIGNMENT = double,
    STORAGE = main
);


--
-- Name: geometry; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE geometry;


--
-- Name: geometry_analyze(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_analyze(internal) RETURNS boolean
    LANGUAGE c STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_analyze';


--
-- Name: geometry_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_in(cstring) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_in';


--
-- Name: geometry_out(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_out(geometry) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_out';


--
-- Name: geometry_recv(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_recv(internal) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_recv';


--
-- Name: geometry_send(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_send(geometry) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_send';


--
-- Name: geometry; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE geometry (
    INTERNALLENGTH = variable,
    INPUT = geometry_in,
    OUTPUT = geometry_out,
    RECEIVE = geometry_recv,
    SEND = geometry_send,
    ANALYZE = geometry_analyze,
    DELIMITER = ':',
    ALIGNMENT = int4,
    STORAGE = main
);


--
-- Name: geometry_dump; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE geometry_dump AS (
	path integer[],
	geom geometry
);


--
-- Name: gidx; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE gidx;


--
-- Name: gidx_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gidx_in(cstring) RETURNS gidx
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'gidx_in';


--
-- Name: gidx_out(gidx); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gidx_out(gidx) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'gidx_out';


--
-- Name: gidx; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE gidx (
    INTERNALLENGTH = variable,
    INPUT = gidx_in,
    OUTPUT = gidx_out,
    ALIGNMENT = double,
    STORAGE = plain
);


--
-- Name: pgis_abs; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE pgis_abs;


--
-- Name: pgis_abs_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgis_abs_in(cstring) RETURNS pgis_abs
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'pgis_abs_in';


--
-- Name: pgis_abs_out(pgis_abs); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgis_abs_out(pgis_abs) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'pgis_abs_out';


--
-- Name: pgis_abs; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE pgis_abs (
    INTERNALLENGTH = 8,
    INPUT = pgis_abs_in,
    OUTPUT = pgis_abs_out,
    ALIGNMENT = double,
    STORAGE = plain
);


--
-- Name: spheroid; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE spheroid;


--
-- Name: spheroid_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION spheroid_in(cstring) RETURNS spheroid
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'ellipsoid_in';


--
-- Name: spheroid_out(spheroid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION spheroid_out(spheroid) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'ellipsoid_out';


--
-- Name: spheroid; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE spheroid (
    INTERNALLENGTH = 65,
    INPUT = spheroid_in,
    OUTPUT = spheroid_out,
    ALIGNMENT = double,
    STORAGE = plain
);


--
-- Name: _st_asgeojson(integer, geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_asgeojson(integer, geometry, integer, integer) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_asGeoJson';


--
-- Name: _st_asgeojson(integer, geography, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_asgeojson(integer, geography, integer, integer) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_as_geojson';


--
-- Name: _st_asgml(integer, geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_asgml(integer, geometry, integer, integer) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_asGML';


--
-- Name: _st_asgml(integer, geography, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_asgml(integer, geography, integer, integer) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_as_gml';


--
-- Name: _st_askml(integer, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_askml(integer, geometry, integer) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_asKML';


--
-- Name: _st_askml(integer, geography, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_askml(integer, geography, integer) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_as_kml';


--
-- Name: _st_bestsrid(geography, geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_bestsrid(geography, geography) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_bestsrid';


--
-- Name: _st_bestsrid(geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_bestsrid(geography) RETURNS integer
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_BestSRID($1,$1)$_$;


--
-- Name: _st_buffer(geometry, double precision, cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_buffer(geometry, double precision, cstring) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'buffer';


--
-- Name: _st_contains(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_contains(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'contains';


--
-- Name: _st_containsproperly(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_containsproperly(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'containsproperly';


--
-- Name: _st_coveredby(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_coveredby(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'coveredby';


--
-- Name: _st_covers(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_covers(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'covers';


--
-- Name: _st_covers(geography, geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_covers(geography, geography) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'geography_covers';


--
-- Name: _st_crosses(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_crosses(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'crosses';


--
-- Name: _st_dfullywithin(geometry, geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_dfullywithin(geometry, geometry, double precision) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_dfullywithin';


--
-- Name: _st_distance(geography, geography, double precision, boolean); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_distance(geography, geography, double precision, boolean) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'geography_distance';


--
-- Name: _st_dumppoints(geometry, integer[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_dumppoints(the_geom geometry, cur_path integer[]) RETURNS SETOF geometry_dump
    LANGUAGE plpgsql
    AS $$
DECLARE
  tmp geometry_dump;
  tmp2 geometry_dump;
  nb_points integer;
  nb_geom integer;
  i integer;
  j integer;
  g geometry;
  
BEGIN
  
  RAISE DEBUG '%,%', cur_path, ST_GeometryType(the_geom);

  -- Special case (MULTI* OR GEOMETRYCOLLECTION) : iterate and return the DumpPoints of the geometries
  SELECT ST_NumGeometries(the_geom) INTO nb_geom;

  IF (nb_geom IS NOT NULL) THEN
    
    i = 1;
    FOR tmp2 IN SELECT (ST_Dump(the_geom)).* LOOP

      FOR tmp IN SELECT * FROM _ST_DumpPoints(tmp2.geom, cur_path || tmp2.path) LOOP
	    RETURN NEXT tmp;
      END LOOP;
      i = i + 1;
      
    END LOOP;

    RETURN;
  END IF;
  

  -- Special case (POLYGON) : return the points of the rings of a polygon
  IF (ST_GeometryType(the_geom) = 'ST_Polygon') THEN

    FOR tmp IN SELECT * FROM _ST_DumpPoints(ST_ExteriorRing(the_geom), cur_path || ARRAY[1]) LOOP
      RETURN NEXT tmp;
    END LOOP;
    
    j := ST_NumInteriorRings(the_geom);
    FOR i IN 1..j LOOP
        FOR tmp IN SELECT * FROM _ST_DumpPoints(ST_InteriorRingN(the_geom, i), cur_path || ARRAY[i+1]) LOOP
          RETURN NEXT tmp;
        END LOOP;
    END LOOP;
    
    RETURN;
  END IF;

    
  -- Special case (POINT) : return the point
  IF (ST_GeometryType(the_geom) = 'ST_Point') THEN

    tmp.path = cur_path || ARRAY[1];
    tmp.geom = the_geom;

    RETURN NEXT tmp;
    RETURN;

  END IF;


  -- Use ST_NumPoints rather than ST_NPoints to have a NULL value if the_geom isn't
  -- a LINESTRING or CIRCULARSTRING.
  SELECT ST_NumPoints(the_geom) INTO nb_points;

  -- This should never happen
  IF (nb_points IS NULL) THEN
    RAISE EXCEPTION 'Unexpected error while dumping geometry %', ST_AsText(the_geom);
  END IF;

  FOR i IN 1..nb_points LOOP
    tmp.path = cur_path || ARRAY[i];
    tmp.geom := ST_PointN(the_geom, i);
    RETURN NEXT tmp;
  END LOOP;
   
END
$$;


--
-- Name: _st_dwithin(geometry, geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_dwithin(geometry, geometry, double precision) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'LWGEOM_dwithin';


--
-- Name: _st_dwithin(geography, geography, double precision, boolean); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_dwithin(geography, geography, double precision, boolean) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'geography_dwithin';


--
-- Name: _st_equals(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_equals(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'geomequals';


--
-- Name: _st_expand(geography, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_expand(geography, double precision) RETURNS geography
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_expand';


--
-- Name: _st_intersects(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_intersects(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'intersects';


--
-- Name: _st_linecrossingdirection(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_linecrossingdirection(geometry, geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'ST_LineCrossingDirection';


--
-- Name: _st_longestline(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_longestline(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_longestline2d';


--
-- Name: _st_maxdistance(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_maxdistance(geometry, geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_maxdistance2d_linestring';


--
-- Name: _st_orderingequals(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_orderingequals(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'LWGEOM_same';


--
-- Name: _st_overlaps(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_overlaps(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'overlaps';


--
-- Name: _st_pointoutside(geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_pointoutside(geography) RETURNS geography
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_point_outside';


--
-- Name: _st_touches(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_touches(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'touches';


--
-- Name: _st_within(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_within(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'within';


--
-- Name: addauth(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION addauth(text) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$ 
DECLARE
	lockid alias for $1;
	okay boolean;
	myrec record;
BEGIN
	-- check to see if table exists
	--  if not, CREATE TEMP TABLE mylock (transid xid, lockcode text)
	okay := 'f';
	FOR myrec IN SELECT * FROM pg_class WHERE relname = 'temp_lock_have_table' LOOP
		okay := 't';
	END LOOP; 
	IF (okay <> 't') THEN 
		CREATE TEMP TABLE temp_lock_have_table (transid xid, lockcode text);
			-- this will only work from pgsql7.4 up
			-- ON COMMIT DELETE ROWS;
	END IF;

	--  INSERT INTO mylock VALUES ( $1)
--	EXECUTE 'INSERT INTO temp_lock_have_table VALUES ( '||
--		quote_literal(getTransactionID()) || ',' ||
--		quote_literal(lockid) ||')';

	INSERT INTO temp_lock_have_table VALUES (getTransactionID(), lockid);

	RETURN true::boolean;
END;
$_$;


--
-- Name: addbbox(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION addbbox(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_addBBOX';


--
-- Name: addgeometrycolumn(character varying, character varying, character varying, character varying, integer, character varying, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION addgeometrycolumn(character varying, character varying, character varying, character varying, integer, character varying, integer) RETURNS text
    LANGUAGE plpgsql STRICT
    AS $_$
DECLARE
	catalog_name alias for $1;
	schema_name alias for $2;
	table_name alias for $3;
	column_name alias for $4;
	new_srid alias for $5;
	new_type alias for $6;
	new_dim alias for $7;
	rec RECORD;
	sr varchar;
	real_schema name;
	sql text;

BEGIN

	-- Verify geometry type
	IF ( NOT ( (new_type = 'GEOMETRY') OR
			   (new_type = 'GEOMETRYCOLLECTION') OR
			   (new_type = 'POINT') OR
			   (new_type = 'MULTIPOINT') OR
			   (new_type = 'POLYGON') OR
			   (new_type = 'MULTIPOLYGON') OR
			   (new_type = 'LINESTRING') OR
			   (new_type = 'MULTILINESTRING') OR
			   (new_type = 'GEOMETRYCOLLECTIONM') OR
			   (new_type = 'POINTM') OR
			   (new_type = 'MULTIPOINTM') OR
			   (new_type = 'POLYGONM') OR
			   (new_type = 'MULTIPOLYGONM') OR
			   (new_type = 'LINESTRINGM') OR
			   (new_type = 'MULTILINESTRINGM') OR
			   (new_type = 'CIRCULARSTRING') OR
			   (new_type = 'CIRCULARSTRINGM') OR
			   (new_type = 'COMPOUNDCURVE') OR
			   (new_type = 'COMPOUNDCURVEM') OR
			   (new_type = 'CURVEPOLYGON') OR
			   (new_type = 'CURVEPOLYGONM') OR
			   (new_type = 'MULTICURVE') OR
			   (new_type = 'MULTICURVEM') OR
			   (new_type = 'MULTISURFACE') OR
			   (new_type = 'MULTISURFACEM')) )
	THEN
		RAISE EXCEPTION 'Invalid type name - valid ones are:
	POINT, MULTIPOINT,
	LINESTRING, MULTILINESTRING,
	POLYGON, MULTIPOLYGON,
	CIRCULARSTRING, COMPOUNDCURVE, MULTICURVE,
	CURVEPOLYGON, MULTISURFACE,
	GEOMETRY, GEOMETRYCOLLECTION,
	POINTM, MULTIPOINTM,
	LINESTRINGM, MULTILINESTRINGM,
	POLYGONM, MULTIPOLYGONM,
	CIRCULARSTRINGM, COMPOUNDCURVEM, MULTICURVEM
	CURVEPOLYGONM, MULTISURFACEM,
	or GEOMETRYCOLLECTIONM';
		RETURN 'fail';
	END IF;


	-- Verify dimension
	IF ( (new_dim >4) OR (new_dim <0) ) THEN
		RAISE EXCEPTION 'invalid dimension';
		RETURN 'fail';
	END IF;

	IF ( (new_type LIKE '%M') AND (new_dim!=3) ) THEN
		RAISE EXCEPTION 'TypeM needs 3 dimensions';
		RETURN 'fail';
	END IF;


	-- Verify SRID
	IF ( new_srid != -1 ) THEN
		SELECT SRID INTO sr FROM spatial_ref_sys WHERE SRID = new_srid;
		IF NOT FOUND THEN
			RAISE EXCEPTION 'AddGeometryColumns() - invalid SRID';
			RETURN 'fail';
		END IF;
	END IF;


	-- Verify schema
	IF ( schema_name IS NOT NULL AND schema_name != '' ) THEN
		sql := 'SELECT nspname FROM pg_namespace ' ||
			'WHERE text(nspname) = ' || quote_literal(schema_name) ||
			'LIMIT 1';
		RAISE DEBUG '%', sql;
		EXECUTE sql INTO real_schema;

		IF ( real_schema IS NULL ) THEN
			RAISE EXCEPTION 'Schema % is not a valid schemaname', quote_literal(schema_name);
			RETURN 'fail';
		END IF;
	END IF;

	IF ( real_schema IS NULL ) THEN
		RAISE DEBUG 'Detecting schema';
		sql := 'SELECT n.nspname AS schemaname ' ||
			'FROM pg_catalog.pg_class c ' ||
			  'JOIN pg_catalog.pg_namespace n ON n.oid = c.relnamespace ' ||
			'WHERE c.relkind = ' || quote_literal('r') ||
			' AND n.nspname NOT IN (' || quote_literal('pg_catalog') || ', ' || quote_literal('pg_toast') || ')' ||
			' AND pg_catalog.pg_table_is_visible(c.oid)' ||
			' AND c.relname = ' || quote_literal(table_name);
		RAISE DEBUG '%', sql;
		EXECUTE sql INTO real_schema;

		IF ( real_schema IS NULL ) THEN
			RAISE EXCEPTION 'Table % does not occur in the search_path', quote_literal(table_name);
			RETURN 'fail';
		END IF;
	END IF;


	-- Add geometry column to table
	sql := 'ALTER TABLE ' ||
		quote_ident(real_schema) || '.' || quote_ident(table_name)
		|| ' ADD COLUMN ' || quote_ident(column_name) ||
		' geometry ';
	RAISE DEBUG '%', sql;
	EXECUTE sql;


	-- Delete stale record in geometry_columns (if any)
	sql := 'DELETE FROM geometry_columns WHERE
		f_table_catalog = ' || quote_literal('') ||
		' AND f_table_schema = ' ||
		quote_literal(real_schema) ||
		' AND f_table_name = ' || quote_literal(table_name) ||
		' AND f_geometry_column = ' || quote_literal(column_name);
	RAISE DEBUG '%', sql;
	EXECUTE sql;


	-- Add record in geometry_columns
	sql := 'INSERT INTO geometry_columns (f_table_catalog,f_table_schema,f_table_name,' ||
										  'f_geometry_column,coord_dimension,srid,type)' ||
		' VALUES (' ||
		quote_literal('') || ',' ||
		quote_literal(real_schema) || ',' ||
		quote_literal(table_name) || ',' ||
		quote_literal(column_name) || ',' ||
		new_dim::text || ',' ||
		new_srid::text || ',' ||
		quote_literal(new_type) || ')';
	RAISE DEBUG '%', sql;
	EXECUTE sql;


	-- Add table CHECKs
	sql := 'ALTER TABLE ' ||
		quote_ident(real_schema) || '.' || quote_ident(table_name)
		|| ' ADD CONSTRAINT '
		|| quote_ident('enforce_srid_' || column_name)
		|| ' CHECK (ST_SRID(' || quote_ident(column_name) ||
		') = ' || new_srid::text || ')' ;
	RAISE DEBUG '%', sql;
	EXECUTE sql;

	sql := 'ALTER TABLE ' ||
		quote_ident(real_schema) || '.' || quote_ident(table_name)
		|| ' ADD CONSTRAINT '
		|| quote_ident('enforce_dims_' || column_name)
		|| ' CHECK (ST_NDims(' || quote_ident(column_name) ||
		') = ' || new_dim::text || ')' ;
	RAISE DEBUG '%', sql;
	EXECUTE sql;

	IF ( NOT (new_type = 'GEOMETRY')) THEN
		sql := 'ALTER TABLE ' ||
			quote_ident(real_schema) || '.' || quote_ident(table_name) || ' ADD CONSTRAINT ' ||
			quote_ident('enforce_geotype_' || column_name) ||
			' CHECK (GeometryType(' ||
			quote_ident(column_name) || ')=' ||
			quote_literal(new_type) || ' OR (' ||
			quote_ident(column_name) || ') is null)';
		RAISE DEBUG '%', sql;
		EXECUTE sql;
	END IF;

	RETURN
		real_schema || '.' ||
		table_name || '.' || column_name ||
		' SRID:' || new_srid::text ||
		' TYPE:' || new_type ||
		' DIMS:' || new_dim::text || ' ';
END;
$_$;


--
-- Name: addgeometrycolumn(character varying, character varying, character varying, integer, character varying, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION addgeometrycolumn(character varying, character varying, character varying, integer, character varying, integer) RETURNS text
    LANGUAGE plpgsql STABLE STRICT
    AS $_$
DECLARE
	ret  text;
BEGIN
	SELECT AddGeometryColumn('',$1,$2,$3,$4,$5,$6) into ret;
	RETURN ret;
END;
$_$;


--
-- Name: addgeometrycolumn(character varying, character varying, integer, character varying, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION addgeometrycolumn(character varying, character varying, integer, character varying, integer) RETURNS text
    LANGUAGE plpgsql STRICT
    AS $_$
DECLARE
	ret  text;
BEGIN
	SELECT AddGeometryColumn('','',$1,$2,$3,$4,$5) into ret;
	RETURN ret;
END;
$_$;


--
-- Name: addpoint(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION addpoint(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_addpoint';


--
-- Name: addpoint(geometry, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION addpoint(geometry, geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_addpoint';


--
-- Name: affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_affine';


--
-- Name: affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT affine($1,  $2, $3, 0,  $4, $5, 0,  0, 0, 1,  $6, $7, 0)$_$;


--
-- Name: area(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION area(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_area_polygon';


--
-- Name: area2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION area2d(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_area_polygon';


--
-- Name: asbinary(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION asbinary(geometry) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_asBinary';


--
-- Name: asbinary(geometry, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION asbinary(geometry, text) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_asBinary';


--
-- Name: asewkb(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION asewkb(geometry) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'WKBFromLWGEOM';


--
-- Name: asewkb(geometry, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION asewkb(geometry, text) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'WKBFromLWGEOM';


--
-- Name: asewkt(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION asewkt(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_asEWKT';


--
-- Name: asgml(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION asgml(geometry, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGML(2, $1, $2, 0)$_$;


--
-- Name: asgml(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION asgml(geometry) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGML(2, $1, 15, 0)$_$;


--
-- Name: ashexewkb(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ashexewkb(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_asHEXEWKB';


--
-- Name: ashexewkb(geometry, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ashexewkb(geometry, text) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_asHEXEWKB';


--
-- Name: askml(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION askml(geometry, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsKML(2, transform($1,4326), $2)$_$;


--
-- Name: askml(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION askml(geometry) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsKML(2, transform($1,4326), 15)$_$;


--
-- Name: askml(integer, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION askml(integer, geometry, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsKML($1, transform($2,4326), $3)$_$;


--
-- Name: assvg(geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION assvg(geometry, integer, integer) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'assvg_geometry';


--
-- Name: assvg(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION assvg(geometry, integer) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'assvg_geometry';


--
-- Name: assvg(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION assvg(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'assvg_geometry';


--
-- Name: astext(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION astext(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_asText';


--
-- Name: azimuth(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION azimuth(geometry, geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_azimuth';


--
-- Name: bdmpolyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION bdmpolyfromtext(text, integer) RETURNS geometry
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$
DECLARE
	geomtext alias for $1;
	srid alias for $2;
	mline geometry;
	geom geometry;
BEGIN
	mline := MultiLineStringFromText(geomtext, srid);

	IF mline IS NULL
	THEN
		RAISE EXCEPTION 'Input is not a MultiLinestring';
	END IF;

	geom := multi(BuildArea(mline));

	RETURN geom;
END;
$_$;


--
-- Name: bdpolyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION bdpolyfromtext(text, integer) RETURNS geometry
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$
DECLARE
	geomtext alias for $1;
	srid alias for $2;
	mline geometry;
	geom geometry;
BEGIN
	mline := MultiLineStringFromText(geomtext, srid);

	IF mline IS NULL
	THEN
		RAISE EXCEPTION 'Input is not a MultiLinestring';
	END IF;

	geom := BuildArea(mline);

	IF GeometryType(geom) != 'POLYGON'
	THEN
		RAISE EXCEPTION 'Input returns more then a single polygon, try using BdMPolyFromText instead';
	END IF;

	RETURN geom;
END;
$_$;


--
-- Name: boundary(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION boundary(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'boundary';


--
-- Name: box(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box(geometry) RETURNS box
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_to_BOX';


--
-- Name: box(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box(box3d) RETURNS box
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_to_BOX';


--
-- Name: box2d(box3d_extent); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d(box3d_extent) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_to_BOX2DFLOAT4';


--
-- Name: box2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d(geometry) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_to_BOX2DFLOAT4';


--
-- Name: box2d(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d(box3d) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_to_BOX2DFLOAT4';


--
-- Name: box3d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box3d(geometry) RETURNS box3d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_to_BOX3D';


--
-- Name: box3d(box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box3d(box2d) RETURNS box3d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2DFLOAT4_to_BOX3D';


--
-- Name: box3d_extent(box3d_extent); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box3d_extent(box3d_extent) RETURNS box3d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_extent_to_BOX3D';


--
-- Name: box3dtobox(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box3dtobox(box3d) RETURNS box
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT box($1)$_$;


--
-- Name: buffer(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION buffer(geometry, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'buffer';


--
-- Name: buffer(geometry, double precision, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION buffer(geometry, double precision, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_Buffer($1, $2, $3)$_$;


--
-- Name: buildarea(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION buildarea(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'LWGEOM_buildarea';


--
-- Name: bytea(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION bytea(geometry) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_to_bytea';


--
-- Name: centroid(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION centroid(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'centroid';


--
-- Name: checkauth(text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION checkauth(text, text, text) RETURNS integer
    LANGUAGE plpgsql
    AS $_$ 
DECLARE
	schema text;
BEGIN
	IF NOT LongTransactionsEnabled() THEN
		RAISE EXCEPTION 'Long transaction support disabled, use EnableLongTransaction() to enable.';
	END IF;

	if ( $1 != '' ) THEN
		schema = $1;
	ELSE
		SELECT current_schema() into schema;
	END IF;

	-- TODO: check for an already existing trigger ?

	EXECUTE 'CREATE TRIGGER check_auth BEFORE UPDATE OR DELETE ON ' 
		|| quote_ident(schema) || '.' || quote_ident($2)
		||' FOR EACH ROW EXECUTE PROCEDURE CheckAuthTrigger('
		|| quote_literal($3) || ')';

	RETURN 0;
END;
$_$;


--
-- Name: checkauth(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION checkauth(text, text) RETURNS integer
    LANGUAGE sql
    AS $_$ SELECT CheckAuth('', $1, $2) $_$;


--
-- Name: checkauthtrigger(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION checkauthtrigger() RETURNS trigger
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'check_authorization';


--
-- Name: collect(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION collect(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.5', 'LWGEOM_collect';


--
-- Name: combine_bbox(box2d, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION combine_bbox(box2d, geometry) RETURNS box2d
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.5', 'BOX2DFLOAT4_combine';


--
-- Name: combine_bbox(box3d_extent, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION combine_bbox(box3d_extent, geometry) RETURNS box3d_extent
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.5', 'BOX3D_combine';


--
-- Name: combine_bbox(box3d, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION combine_bbox(box3d, geometry) RETURNS box3d
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.5', 'BOX3D_combine';


--
-- Name: compression(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION compression(chip) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_getCompression';


--
-- Name: contains(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION contains(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'contains';


--
-- Name: convexhull(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION convexhull(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'convexhull';


--
-- Name: crosses(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION crosses(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'crosses';


--
-- Name: datatype(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION datatype(chip) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_getDatatype';


--
-- Name: difference(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION difference(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'difference';


--
-- Name: dimension(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dimension(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_dimension';


--
-- Name: disablelongtransactions(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION disablelongtransactions() RETURNS text
    LANGUAGE plpgsql
    AS $$ 
DECLARE
	rec RECORD;

BEGIN

	--
	-- Drop all triggers applied by CheckAuth()
	--
	FOR rec IN
		SELECT c.relname, t.tgname, t.tgargs FROM pg_trigger t, pg_class c, pg_proc p
		WHERE p.proname = 'checkauthtrigger' and t.tgfoid = p.oid and t.tgrelid = c.oid
	LOOP
		EXECUTE 'DROP TRIGGER ' || quote_ident(rec.tgname) ||
			' ON ' || quote_ident(rec.relname);
	END LOOP;

	--
	-- Drop the authorization_table table
	--
	FOR rec IN SELECT * FROM pg_class WHERE relname = 'authorization_table' LOOP
		DROP TABLE authorization_table;
	END LOOP;

	--
	-- Drop the authorized_tables view
	--
	FOR rec IN SELECT * FROM pg_class WHERE relname = 'authorized_tables' LOOP
		DROP VIEW authorized_tables;
	END LOOP;

	RETURN 'Long transactions support disabled';
END;
$$;


--
-- Name: disjoint(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION disjoint(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'disjoint';


--
-- Name: distance(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION distance(geometry, geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'LWGEOM_mindistance2d';


--
-- Name: distance_sphere(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION distance_sphere(geometry, geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'LWGEOM_distance_sphere';


--
-- Name: distance_spheroid(geometry, geometry, spheroid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION distance_spheroid(geometry, geometry, spheroid) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'LWGEOM_distance_ellipsoid';


--
-- Name: dropbbox(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dropbbox(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_dropBBOX';


--
-- Name: dropgeometrycolumn(character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dropgeometrycolumn(character varying, character varying, character varying, character varying) RETURNS text
    LANGUAGE plpgsql STRICT
    AS $_$
DECLARE
	catalog_name alias for $1;
	schema_name alias for $2;
	table_name alias for $3;
	column_name alias for $4;
	myrec RECORD;
	okay boolean;
	real_schema name;

BEGIN


	-- Find, check or fix schema_name
	IF ( schema_name != '' ) THEN
		okay = 'f';

		FOR myrec IN SELECT nspname FROM pg_namespace WHERE text(nspname) = schema_name LOOP
			okay := 't';
		END LOOP;

		IF ( okay <> 't' ) THEN
			RAISE NOTICE 'Invalid schema name - using current_schema()';
			SELECT current_schema() into real_schema;
		ELSE
			real_schema = schema_name;
		END IF;
	ELSE
		SELECT current_schema() into real_schema;
	END IF;

	-- Find out if the column is in the geometry_columns table
	okay = 'f';
	FOR myrec IN SELECT * from geometry_columns where f_table_schema = text(real_schema) and f_table_name = table_name and f_geometry_column = column_name LOOP
		okay := 't';
	END LOOP;
	IF (okay <> 't') THEN
		RAISE EXCEPTION 'column not found in geometry_columns table';
		RETURN 'f';
	END IF;

	-- Remove ref from geometry_columns table
	EXECUTE 'delete from geometry_columns where f_table_schema = ' ||
		quote_literal(real_schema) || ' and f_table_name = ' ||
		quote_literal(table_name)  || ' and f_geometry_column = ' ||
		quote_literal(column_name);

	-- Remove table column
	EXECUTE 'ALTER TABLE ' || quote_ident(real_schema) || '.' ||
		quote_ident(table_name) || ' DROP COLUMN ' ||
		quote_ident(column_name);

	RETURN real_schema || '.' || table_name || '.' || column_name ||' effectively removed.';

END;
$_$;


--
-- Name: dropgeometrycolumn(character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dropgeometrycolumn(character varying, character varying, character varying) RETURNS text
    LANGUAGE plpgsql STRICT
    AS $_$
DECLARE
	ret text;
BEGIN
	SELECT DropGeometryColumn('',$1,$2,$3) into ret;
	RETURN ret;
END;
$_$;


--
-- Name: dropgeometrycolumn(character varying, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dropgeometrycolumn(character varying, character varying) RETURNS text
    LANGUAGE plpgsql STRICT
    AS $_$
DECLARE
	ret text;
BEGIN
	SELECT DropGeometryColumn('','',$1,$2) into ret;
	RETURN ret;
END;
$_$;


--
-- Name: dropgeometrytable(character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dropgeometrytable(character varying, character varying, character varying) RETURNS text
    LANGUAGE plpgsql STRICT
    AS $_$
DECLARE
	catalog_name alias for $1;
	schema_name alias for $2;
	table_name alias for $3;
	real_schema name;

BEGIN

	IF ( schema_name = '' ) THEN
		SELECT current_schema() into real_schema;
	ELSE
		real_schema = schema_name;
	END IF;

	-- Remove refs from geometry_columns table
	EXECUTE 'DELETE FROM geometry_columns WHERE ' ||
		'f_table_schema = ' || quote_literal(real_schema) ||
		' AND ' ||
		' f_table_name = ' || quote_literal(table_name);

	-- Remove table
	EXECUTE 'DROP TABLE '
		|| quote_ident(real_schema) || '.' ||
		quote_ident(table_name);

	RETURN
		real_schema || '.' ||
		table_name ||' dropped.';

END;
$_$;


--
-- Name: dropgeometrytable(character varying, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dropgeometrytable(character varying, character varying) RETURNS text
    LANGUAGE sql STRICT
    AS $_$ SELECT DropGeometryTable('',$1,$2) $_$;


--
-- Name: dropgeometrytable(character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dropgeometrytable(character varying) RETURNS text
    LANGUAGE sql STRICT
    AS $_$ SELECT DropGeometryTable('','',$1) $_$;


--
-- Name: dump(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dump(geometry) RETURNS SETOF geometry_dump
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_dump';


--
-- Name: dumprings(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dumprings(geometry) RETURNS SETOF geometry_dump
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_dump_rings';


--
-- Name: enablelongtransactions(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION enablelongtransactions() RETURNS text
    LANGUAGE plpgsql
    AS $$ 
DECLARE
	"query" text;
	exists bool;
	rec RECORD;

BEGIN

	exists = 'f';
	FOR rec IN SELECT * FROM pg_class WHERE relname = 'authorization_table'
	LOOP
		exists = 't';
	END LOOP;

	IF NOT exists
	THEN
		"query" = 'CREATE TABLE authorization_table (
			toid oid, -- table oid
			rid text, -- row id
			expires timestamp,
			authid text
		)';
		EXECUTE "query";
	END IF;

	exists = 'f';
	FOR rec IN SELECT * FROM pg_class WHERE relname = 'authorized_tables'
	LOOP
		exists = 't';
	END LOOP;

	IF NOT exists THEN
		"query" = 'CREATE VIEW authorized_tables AS ' ||
			'SELECT ' ||
			'n.nspname as schema, ' ||
			'c.relname as table, trim(' ||
			quote_literal(chr(92) || '000') ||
			' from t.tgargs) as id_column ' ||
			'FROM pg_trigger t, pg_class c, pg_proc p ' ||
			', pg_namespace n ' ||
			'WHERE p.proname = ' || quote_literal('checkauthtrigger') ||
			' AND c.relnamespace = n.oid' ||
			' AND t.tgfoid = p.oid and t.tgrelid = c.oid';
		EXECUTE "query";
	END IF;

	RETURN 'Long transactions support enabled';
END;
$$;


--
-- Name: endpoint(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION endpoint(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_endpoint_linestring';


--
-- Name: envelope(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION envelope(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_envelope';


--
-- Name: equals(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION equals(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geomequals';


--
-- Name: estimated_extent(text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION estimated_extent(text, text, text) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT SECURITY DEFINER
    AS '$libdir/postgis-1.5', 'LWGEOM_estimated_extent';


--
-- Name: estimated_extent(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION estimated_extent(text, text) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT SECURITY DEFINER
    AS '$libdir/postgis-1.5', 'LWGEOM_estimated_extent';


--
-- Name: expand(box3d, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION expand(box3d, double precision) RETURNS box3d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_expand';


--
-- Name: expand(box2d, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION expand(box2d, double precision) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2DFLOAT4_expand';


--
-- Name: expand(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION expand(geometry, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_expand';


--
-- Name: exteriorring(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION exteriorring(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_exteriorring_polygon';


--
-- Name: factor(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION factor(chip) RETURNS real
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_getFactor';


--
-- Name: find_extent(text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION find_extent(text, text, text) RETURNS box2d
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$
DECLARE
	schemaname alias for $1;
	tablename alias for $2;
	columnname alias for $3;
	myrec RECORD;

BEGIN
	FOR myrec IN EXECUTE 'SELECT extent("' || columnname || '") FROM "' || schemaname || '"."' || tablename || '"' LOOP
		return myrec.extent;
	END LOOP;
END;
$_$;


--
-- Name: find_extent(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION find_extent(text, text) RETURNS box2d
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$
DECLARE
	tablename alias for $1;
	columnname alias for $2;
	myrec RECORD;

BEGIN
	FOR myrec IN EXECUTE 'SELECT extent("' || columnname || '") FROM "' || tablename || '"' LOOP
		return myrec.extent;
	END LOOP;
END;
$_$;


--
-- Name: find_srid(character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION find_srid(character varying, character varying, character varying) RETURNS integer
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$
DECLARE
	schem text;
	tabl text;
	sr int4;
BEGIN
	IF $1 IS NULL THEN
	  RAISE EXCEPTION 'find_srid() - schema is NULL!';
	END IF;
	IF $2 IS NULL THEN
	  RAISE EXCEPTION 'find_srid() - table name is NULL!';
	END IF;
	IF $3 IS NULL THEN
	  RAISE EXCEPTION 'find_srid() - column name is NULL!';
	END IF;
	schem = $1;
	tabl = $2;
-- if the table contains a . and the schema is empty
-- split the table into a schema and a table
-- otherwise drop through to default behavior
	IF ( schem = '' and tabl LIKE '%.%' ) THEN
	 schem = substr(tabl,1,strpos(tabl,'.')-1);
	 tabl = substr(tabl,length(schem)+2);
	ELSE
	 schem = schem || '%';
	END IF;

	select SRID into sr from geometry_columns where f_table_schema like schem and f_table_name = tabl and f_geometry_column = $3;
	IF NOT FOUND THEN
	   RAISE EXCEPTION 'find_srid() - couldnt find the corresponding SRID - is the geometry registered in the GEOMETRY_COLUMNS table?  Is there an uppercase/lowercase missmatch?';
	END IF;
	return sr;
END;
$_$;


--
-- Name: fix_geometry_columns(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION fix_geometry_columns() RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
	mislinked record;
	result text;
	linked integer;
	deleted integer;
	foundschema integer;
BEGIN

	-- Since 7.3 schema support has been added.
	-- Previous postgis versions used to put the database name in
	-- the schema column. This needs to be fixed, so we try to
	-- set the correct schema for each geometry_colums record
	-- looking at table, column, type and srid.
	UPDATE geometry_columns SET f_table_schema = n.nspname
		FROM pg_namespace n, pg_class c, pg_attribute a,
			pg_constraint sridcheck, pg_constraint typecheck
			WHERE ( f_table_schema is NULL
		OR f_table_schema = ''
			OR f_table_schema NOT IN (
					SELECT nspname::varchar
					FROM pg_namespace nn, pg_class cc, pg_attribute aa
					WHERE cc.relnamespace = nn.oid
					AND cc.relname = f_table_name::name
					AND aa.attrelid = cc.oid
					AND aa.attname = f_geometry_column::name))
			AND f_table_name::name = c.relname
			AND c.oid = a.attrelid
			AND c.relnamespace = n.oid
			AND f_geometry_column::name = a.attname

			AND sridcheck.conrelid = c.oid
		AND sridcheck.consrc LIKE '(srid(% = %)'
			AND sridcheck.consrc ~ textcat(' = ', srid::text)

			AND typecheck.conrelid = c.oid
		AND typecheck.consrc LIKE
		'((geometrytype(%) = ''%''::text) OR (% IS NULL))'
			AND typecheck.consrc ~ textcat(' = ''', type::text)

			AND NOT EXISTS (
					SELECT oid FROM geometry_columns gc
					WHERE c.relname::varchar = gc.f_table_name
					AND n.nspname::varchar = gc.f_table_schema
					AND a.attname::varchar = gc.f_geometry_column
			);

	GET DIAGNOSTICS foundschema = ROW_COUNT;

	-- no linkage to system table needed
	return 'fixed:'||foundschema::text;

END;
$$;


--
-- Name: force_2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION force_2d(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_force_2d';


--
-- Name: force_3d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION force_3d(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_force_3dz';


--
-- Name: force_3dm(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION force_3dm(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_force_3dm';


--
-- Name: force_3dz(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION force_3dz(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_force_3dz';


--
-- Name: force_4d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION force_4d(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_force_4d';


--
-- Name: force_collection(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION force_collection(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_force_collection';


--
-- Name: forcerhr(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION forcerhr(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_forceRHR_poly';


--
-- Name: geography(geography, integer, boolean); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography(geography, integer, boolean) RETURNS geography
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_enforce_typmod';


--
-- Name: geography(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography(geometry) RETURNS geography
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_from_geometry';


--
-- Name: geography_cmp(geography, geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography_cmp(geography, geography) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_cmp';


--
-- Name: geography_eq(geography, geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography_eq(geography, geography) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_eq';


--
-- Name: geography_ge(geography, geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography_ge(geography, geography) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_ge';


--
-- Name: geography_gist_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography_gist_compress(internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'geography_gist_compress';


--
-- Name: geography_gist_consistent(internal, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography_gist_consistent(internal, geometry, integer) RETURNS boolean
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'geography_gist_consistent';


--
-- Name: geography_gist_decompress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography_gist_decompress(internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'geography_gist_decompress';


--
-- Name: geography_gist_join_selectivity(internal, oid, internal, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography_gist_join_selectivity(internal, oid, internal, smallint) RETURNS double precision
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'geography_gist_join_selectivity';


--
-- Name: geography_gist_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography_gist_penalty(internal, internal, internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'geography_gist_penalty';


--
-- Name: geography_gist_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography_gist_picksplit(internal, internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'geography_gist_picksplit';


--
-- Name: geography_gist_same(box2d, box2d, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography_gist_same(box2d, box2d, internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'geography_gist_same';


--
-- Name: geography_gist_selectivity(internal, oid, internal, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography_gist_selectivity(internal, oid, internal, integer) RETURNS double precision
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'geography_gist_selectivity';


--
-- Name: geography_gist_union(bytea, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography_gist_union(bytea, internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'geography_gist_union';


--
-- Name: geography_gt(geography, geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography_gt(geography, geography) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_gt';


--
-- Name: geography_le(geography, geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography_le(geography, geography) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_le';


--
-- Name: geography_lt(geography, geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography_lt(geography, geography) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_lt';


--
-- Name: geography_overlaps(geography, geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography_overlaps(geography, geography) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_overlaps';


--
-- Name: geography_typmod_dims(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography_typmod_dims(integer) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_typmod_dims';


--
-- Name: geography_typmod_srid(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography_typmod_srid(integer) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_typmod_srid';


--
-- Name: geography_typmod_type(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geography_typmod_type(integer) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_typmod_type';


--
-- Name: geomcollfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomcollfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromText($1, $2)) = 'GEOMETRYCOLLECTION'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$;


--
-- Name: geomcollfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomcollfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromText($1)) = 'GEOMETRYCOLLECTION'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$;


--
-- Name: geomcollfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomcollfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromWKB($1, $2)) = 'GEOMETRYCOLLECTION'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: geomcollfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomcollfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromWKB($1)) = 'GEOMETRYCOLLECTION'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- Name: geometry(box3d_extent); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry(box3d_extent) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_to_LWGEOM';


--
-- Name: geometry(box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry(box2d) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2DFLOAT4_to_LWGEOM';


--
-- Name: geometry(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry(box3d) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_to_LWGEOM';


--
-- Name: geometry(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry(text) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'parse_WKT_lwgeom';


--
-- Name: geometry(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry(chip) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_to_LWGEOM';


--
-- Name: geometry(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry(bytea) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_from_bytea';


--
-- Name: geometry(geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry(geography) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geometry_from_geography';


--
-- Name: geometry_above(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_above(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_above';


--
-- Name: geometry_below(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_below(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_below';


--
-- Name: geometry_cmp(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_cmp(geometry, geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'lwgeom_cmp';


--
-- Name: geometry_contain(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_contain(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_contain';


--
-- Name: geometry_contained(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_contained(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_contained';


--
-- Name: geometry_eq(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_eq(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'lwgeom_eq';


--
-- Name: geometry_ge(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_ge(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'lwgeom_ge';


--
-- Name: geometry_gist_joinsel(internal, oid, internal, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_gist_joinsel(internal, oid, internal, smallint) RETURNS double precision
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'LWGEOM_gist_joinsel';


--
-- Name: geometry_gist_sel(internal, oid, internal, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_gist_sel(internal, oid, internal, integer) RETURNS double precision
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'LWGEOM_gist_sel';


--
-- Name: geometry_gt(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_gt(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'lwgeom_gt';


--
-- Name: geometry_le(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_le(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'lwgeom_le';


--
-- Name: geometry_left(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_left(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_left';


--
-- Name: geometry_lt(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_lt(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'lwgeom_lt';


--
-- Name: geometry_overabove(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_overabove(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_overabove';


--
-- Name: geometry_overbelow(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_overbelow(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_overbelow';


--
-- Name: geometry_overlap(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_overlap(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_overlap';


--
-- Name: geometry_overleft(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_overleft(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_overleft';


--
-- Name: geometry_overright(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_overright(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_overright';


--
-- Name: geometry_right(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_right(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_right';


--
-- Name: geometry_same(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_same(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_samebox';


--
-- Name: geometry_samebox(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_samebox(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_samebox';


--
-- Name: geometryfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometryfromtext(text) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_from_text';


--
-- Name: geometryfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometryfromtext(text, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_from_text';


--
-- Name: geometryn(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometryn(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_geometryn_collection';


--
-- Name: geometrytype(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometrytype(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_getTYPE';


--
-- Name: geomfromewkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomfromewkb(bytea) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOMFromWKB';


--
-- Name: geomfromewkt(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomfromewkt(text) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'parse_WKT_lwgeom';


--
-- Name: geomfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT geometryfromtext($1)$_$;


--
-- Name: geomfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT geometryfromtext($1, $2)$_$;


--
-- Name: geomfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomfromwkb(bytea) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_from_WKB';


--
-- Name: geomfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT setSRID(GeomFromWKB($1), $2)$_$;


--
-- Name: geomunion(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomunion(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geomunion';


--
-- Name: get_proj4_from_srid(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION get_proj4_from_srid(integer) RETURNS text
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$
BEGIN
	RETURN proj4text::text FROM spatial_ref_sys WHERE srid= $1;
END;
$_$;


--
-- Name: getbbox(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION getbbox(geometry) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_to_BOX2DFLOAT4';


--
-- Name: getsrid(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION getsrid(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_getSRID';


--
-- Name: gettransactionid(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gettransactionid() RETURNS xid
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'getTransactionID';


--
-- Name: hasbbox(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION hasbbox(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_hasBBOX';


--
-- Name: height(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION height(chip) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_getHeight';


--
-- Name: interiorringn(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION interiorringn(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_interiorringn_polygon';


--
-- Name: intersection(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION intersection(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'intersection';


--
-- Name: intersects(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION intersects(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'intersects';


--
-- Name: isclosed(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isclosed(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_isclosed_linestring';


--
-- Name: isempty(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isempty(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_isempty';


--
-- Name: isring(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isring(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'isring';


--
-- Name: issimple(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION issimple(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'issimple';


--
-- Name: isvalid(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isvalid(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'isvalid';


--
-- Name: length(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION length(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_length_linestring';


--
-- Name: length2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION length2d(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_length2d_linestring';


--
-- Name: length2d_spheroid(geometry, spheroid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION length2d_spheroid(geometry, spheroid) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'LWGEOM_length2d_ellipsoid';


--
-- Name: length3d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION length3d(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_length_linestring';


--
-- Name: length3d_spheroid(geometry, spheroid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION length3d_spheroid(geometry, spheroid) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_length_ellipsoid_linestring';


--
-- Name: length_spheroid(geometry, spheroid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION length_spheroid(geometry, spheroid) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'LWGEOM_length_ellipsoid_linestring';


--
-- Name: line_interpolate_point(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION line_interpolate_point(geometry, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_line_interpolate_point';


--
-- Name: line_locate_point(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION line_locate_point(geometry, geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_line_locate_point';


--
-- Name: line_substring(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION line_substring(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_line_substring';


--
-- Name: linefrommultipoint(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linefrommultipoint(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_line_from_mpoint';


--
-- Name: linefromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linefromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'LINESTRING'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$;


--
-- Name: linefromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linefromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'LINESTRING'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$;


--
-- Name: linefromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linefromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'LINESTRING'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: linefromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linefromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'LINESTRING'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- Name: linemerge(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linemerge(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'linemerge';


--
-- Name: linestringfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linestringfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT LineFromText($1)$_$;


--
-- Name: linestringfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linestringfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT LineFromText($1, $2)$_$;


--
-- Name: linestringfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linestringfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'LINESTRING'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: linestringfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linestringfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'LINESTRING'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- Name: locate_along_measure(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION locate_along_measure(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT locate_between_measures($1, $2, $2) $_$;


--
-- Name: locate_between_measures(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION locate_between_measures(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_locate_between_m';


--
-- Name: lockrow(text, text, text, text, timestamp without time zone); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lockrow(text, text, text, text, timestamp without time zone) RETURNS integer
    LANGUAGE plpgsql STRICT
    AS $_$ 
DECLARE
	myschema alias for $1;
	mytable alias for $2;
	myrid   alias for $3;
	authid alias for $4;
	expires alias for $5;
	ret int;
	mytoid oid;
	myrec RECORD;
	
BEGIN

	IF NOT LongTransactionsEnabled() THEN
		RAISE EXCEPTION 'Long transaction support disabled, use EnableLongTransaction() to enable.';
	END IF;

	EXECUTE 'DELETE FROM authorization_table WHERE expires < now()'; 

	SELECT c.oid INTO mytoid FROM pg_class c, pg_namespace n
		WHERE c.relname = mytable
		AND c.relnamespace = n.oid
		AND n.nspname = myschema;

	-- RAISE NOTICE 'toid: %', mytoid;

	FOR myrec IN SELECT * FROM authorization_table WHERE 
		toid = mytoid AND rid = myrid
	LOOP
		IF myrec.authid != authid THEN
			RETURN 0;
		ELSE
			RETURN 1;
		END IF;
	END LOOP;

	EXECUTE 'INSERT INTO authorization_table VALUES ('||
		quote_literal(mytoid::text)||','||quote_literal(myrid)||
		','||quote_literal(expires::text)||
		','||quote_literal(authid) ||')';

	GET DIAGNOSTICS ret = ROW_COUNT;

	RETURN ret;
END;
$_$;


--
-- Name: lockrow(text, text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lockrow(text, text, text, text) RETURNS integer
    LANGUAGE sql STRICT
    AS $_$ SELECT LockRow($1, $2, $3, $4, now()::timestamp+'1:00'); $_$;


--
-- Name: lockrow(text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lockrow(text, text, text) RETURNS integer
    LANGUAGE sql STRICT
    AS $_$ SELECT LockRow(current_schema(), $1, $2, $3, now()::timestamp+'1:00'); $_$;


--
-- Name: lockrow(text, text, text, timestamp without time zone); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lockrow(text, text, text, timestamp without time zone) RETURNS integer
    LANGUAGE sql STRICT
    AS $_$ SELECT LockRow(current_schema(), $1, $2, $3, $4); $_$;


--
-- Name: longtransactionsenabled(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION longtransactionsenabled() RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
DECLARE
	rec RECORD;
BEGIN
	FOR rec IN SELECT oid FROM pg_class WHERE relname = 'authorized_tables'
	LOOP
		return 't';
	END LOOP;
	return 'f';
END;
$$;


--
-- Name: lwgeom_gist_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lwgeom_gist_compress(internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'LWGEOM_gist_compress';


--
-- Name: lwgeom_gist_consistent(internal, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lwgeom_gist_consistent(internal, geometry, integer) RETURNS boolean
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'LWGEOM_gist_consistent';


--
-- Name: lwgeom_gist_decompress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lwgeom_gist_decompress(internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'LWGEOM_gist_decompress';


--
-- Name: lwgeom_gist_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lwgeom_gist_penalty(internal, internal, internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'LWGEOM_gist_penalty';


--
-- Name: lwgeom_gist_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lwgeom_gist_picksplit(internal, internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'LWGEOM_gist_picksplit';


--
-- Name: lwgeom_gist_same(box2d, box2d, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lwgeom_gist_same(box2d, box2d, internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'LWGEOM_gist_same';


--
-- Name: lwgeom_gist_union(bytea, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lwgeom_gist_union(bytea, internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'LWGEOM_gist_union';


--
-- Name: m(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION m(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_m_point';


--
-- Name: makebox2d(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION makebox2d(geometry, geometry) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2DFLOAT4_construct';


--
-- Name: makebox3d(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION makebox3d(geometry, geometry) RETURNS box3d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_construct';


--
-- Name: makeline(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION makeline(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makeline';


--
-- Name: makeline_garray(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION makeline_garray(geometry[]) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makeline_garray';


--
-- Name: makepoint(double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION makepoint(double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makepoint';


--
-- Name: makepoint(double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION makepoint(double precision, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makepoint';


--
-- Name: makepoint(double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION makepoint(double precision, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makepoint';


--
-- Name: makepointm(double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION makepointm(double precision, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makepoint3dm';


--
-- Name: makepolygon(geometry, geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION makepolygon(geometry, geometry[]) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makepoly';


--
-- Name: makepolygon(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION makepolygon(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makepoly';


--
-- Name: max_distance(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION max_distance(geometry, geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_maxdistance2d_linestring';


--
-- Name: mem_size(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mem_size(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_mem_size';


--
-- Name: mlinefromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mlinefromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromText($1, $2)) = 'MULTILINESTRING'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$;


--
-- Name: mlinefromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mlinefromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'MULTILINESTRING'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$;


--
-- Name: mlinefromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mlinefromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'MULTILINESTRING'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: mlinefromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mlinefromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTILINESTRING'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- Name: mpointfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mpointfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1,$2)) = 'MULTIPOINT'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$;


--
-- Name: mpointfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mpointfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'MULTIPOINT'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$;


--
-- Name: mpointfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mpointfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1,$2)) = 'MULTIPOINT'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: mpointfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mpointfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTIPOINT'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- Name: mpolyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mpolyfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'MULTIPOLYGON'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$;


--
-- Name: mpolyfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mpolyfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'MULTIPOLYGON'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$;


--
-- Name: mpolyfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mpolyfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'MULTIPOLYGON'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: mpolyfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mpolyfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTIPOLYGON'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- Name: multi(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multi(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_force_multi';


--
-- Name: multilinefromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multilinefromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'MULTILINESTRING'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: multilinefromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multilinefromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTILINESTRING'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- Name: multilinestringfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multilinestringfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_MLineFromText($1)$_$;


--
-- Name: multilinestringfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multilinestringfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT MLineFromText($1, $2)$_$;


--
-- Name: multipointfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multipointfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT MPointFromText($1, $2)$_$;


--
-- Name: multipointfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multipointfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT MPointFromText($1)$_$;


--
-- Name: multipointfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multipointfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1,$2)) = 'MULTIPOINT'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: multipointfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multipointfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTIPOINT'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- Name: multipolyfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multipolyfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'MULTIPOLYGON'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: multipolyfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multipolyfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTIPOLYGON'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- Name: multipolygonfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multipolygonfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT MPolyFromText($1, $2)$_$;


--
-- Name: multipolygonfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multipolygonfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT MPolyFromText($1)$_$;


--
-- Name: ndims(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ndims(geometry) RETURNS smallint
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_ndims';


--
-- Name: noop(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION noop(geometry) RETURNS geometry
    LANGUAGE c STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_noop';


--
-- Name: npoints(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION npoints(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_npoints';


--
-- Name: nrings(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION nrings(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_nrings';


--
-- Name: numgeometries(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION numgeometries(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_numgeometries_collection';


--
-- Name: numinteriorring(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION numinteriorring(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_numinteriorrings_polygon';


--
-- Name: numinteriorrings(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION numinteriorrings(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_numinteriorrings_polygon';


--
-- Name: numpoints(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION numpoints(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_numpoints_linestring';


--
-- Name: overlaps(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "overlaps"(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'overlaps';


--
-- Name: perimeter(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION perimeter(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_perimeter_poly';


--
-- Name: perimeter2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION perimeter2d(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_perimeter2d_poly';


--
-- Name: perimeter3d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION perimeter3d(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_perimeter_poly';


--
-- Name: pgis_geometry_accum_finalfn(pgis_abs); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgis_geometry_accum_finalfn(pgis_abs) RETURNS geometry[]
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'pgis_geometry_accum_finalfn';


--
-- Name: pgis_geometry_accum_transfn(pgis_abs, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgis_geometry_accum_transfn(pgis_abs, geometry) RETURNS pgis_abs
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'pgis_geometry_accum_transfn';


--
-- Name: pgis_geometry_collect_finalfn(pgis_abs); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgis_geometry_collect_finalfn(pgis_abs) RETURNS geometry
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'pgis_geometry_collect_finalfn';


--
-- Name: pgis_geometry_makeline_finalfn(pgis_abs); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgis_geometry_makeline_finalfn(pgis_abs) RETURNS geometry
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'pgis_geometry_makeline_finalfn';


--
-- Name: pgis_geometry_polygonize_finalfn(pgis_abs); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgis_geometry_polygonize_finalfn(pgis_abs) RETURNS geometry
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'pgis_geometry_polygonize_finalfn';


--
-- Name: pgis_geometry_union_finalfn(pgis_abs); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgis_geometry_union_finalfn(pgis_abs) RETURNS geometry
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'pgis_geometry_union_finalfn';


--
-- Name: point_inside_circle(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION point_inside_circle(geometry, double precision, double precision, double precision) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_inside_circle_point';


--
-- Name: pointfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pointfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'POINT'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$;


--
-- Name: pointfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pointfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'POINT'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$;


--
-- Name: pointfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pointfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'POINT'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: pointfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pointfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'POINT'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- Name: pointn(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pointn(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_pointn_linestring';


--
-- Name: pointonsurface(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pointonsurface(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'pointonsurface';


--
-- Name: polyfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polyfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'POLYGON'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$;


--
-- Name: polyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polyfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'POLYGON'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$;


--
-- Name: polyfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polyfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'POLYGON'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: polyfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polyfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'POLYGON'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- Name: polygonfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polygonfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT PolyFromText($1, $2)$_$;


--
-- Name: polygonfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polygonfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT PolyFromText($1)$_$;


--
-- Name: polygonfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polygonfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1,$2)) = 'POLYGON'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: polygonfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polygonfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'POLYGON'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- Name: polygonize_garray(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polygonize_garray(geometry[]) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'polygonize_garray';


--
-- Name: populate_geometry_columns(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION populate_geometry_columns() RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
	inserted    integer;
	oldcount    integer;
	probed      integer;
	stale       integer;
	gcs         RECORD;
	gc          RECORD;
	gsrid       integer;
	gndims      integer;
	gtype       text;
	query       text;
	gc_is_valid boolean;

BEGIN
	SELECT count(*) INTO oldcount FROM geometry_columns;
	inserted := 0;

	EXECUTE 'TRUNCATE geometry_columns';

	-- Count the number of geometry columns in all tables and views
	SELECT count(DISTINCT c.oid) INTO probed
	FROM pg_class c,
		 pg_attribute a,
		 pg_type t,
		 pg_namespace n
	WHERE (c.relkind = 'r' OR c.relkind = 'v')
	AND t.typname = 'geometry'
	AND a.attisdropped = false
	AND a.atttypid = t.oid
	AND a.attrelid = c.oid
	AND c.relnamespace = n.oid
	AND n.nspname NOT ILIKE 'pg_temp%';

	-- Iterate through all non-dropped geometry columns
	RAISE DEBUG 'Processing Tables.....';

	FOR gcs IN
	SELECT DISTINCT ON (c.oid) c.oid, n.nspname, c.relname
		FROM pg_class c,
			 pg_attribute a,
			 pg_type t,
			 pg_namespace n
		WHERE c.relkind = 'r'
		AND t.typname = 'geometry'
		AND a.attisdropped = false
		AND a.atttypid = t.oid
		AND a.attrelid = c.oid
		AND c.relnamespace = n.oid
		AND n.nspname NOT ILIKE 'pg_temp%'
	LOOP

	inserted := inserted + populate_geometry_columns(gcs.oid);
	END LOOP;

	-- Add views to geometry columns table
	RAISE DEBUG 'Processing Views.....';
	FOR gcs IN
	SELECT DISTINCT ON (c.oid) c.oid, n.nspname, c.relname
		FROM pg_class c,
			 pg_attribute a,
			 pg_type t,
			 pg_namespace n
		WHERE c.relkind = 'v'
		AND t.typname = 'geometry'
		AND a.attisdropped = false
		AND a.atttypid = t.oid
		AND a.attrelid = c.oid
		AND c.relnamespace = n.oid
	LOOP

	inserted := inserted + populate_geometry_columns(gcs.oid);
	END LOOP;

	IF oldcount > inserted THEN
	stale = oldcount-inserted;
	ELSE
	stale = 0;
	END IF;

	RETURN 'probed:' ||probed|| ' inserted:'||inserted|| ' conflicts:'||probed-inserted|| ' deleted:'||stale;
END

$$;


--
-- Name: populate_geometry_columns(oid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION populate_geometry_columns(tbl_oid oid) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
	gcs         RECORD;
	gc          RECORD;
	gsrid       integer;
	gndims      integer;
	gtype       text;
	query       text;
	gc_is_valid boolean;
	inserted    integer;

BEGIN
	inserted := 0;

	-- Iterate through all geometry columns in this table
	FOR gcs IN
	SELECT n.nspname, c.relname, a.attname
		FROM pg_class c,
			 pg_attribute a,
			 pg_type t,
			 pg_namespace n
		WHERE c.relkind = 'r'
		AND t.typname = 'geometry'
		AND a.attisdropped = false
		AND a.atttypid = t.oid
		AND a.attrelid = c.oid
		AND c.relnamespace = n.oid
		AND n.nspname NOT ILIKE 'pg_temp%'
		AND c.oid = tbl_oid
	LOOP

	RAISE DEBUG 'Processing table %.%.%', gcs.nspname, gcs.relname, gcs.attname;

	DELETE FROM geometry_columns
	  WHERE f_table_schema = quote_ident(gcs.nspname)
	  AND f_table_name = quote_ident(gcs.relname)
	  AND f_geometry_column = quote_ident(gcs.attname);

	gc_is_valid := true;

	-- Try to find srid check from system tables (pg_constraint)
	gsrid :=
		(SELECT replace(replace(split_part(s.consrc, ' = ', 2), ')', ''), '(', '')
		 FROM pg_class c, pg_namespace n, pg_attribute a, pg_constraint s
		 WHERE n.nspname = gcs.nspname
		 AND c.relname = gcs.relname
		 AND a.attname = gcs.attname
		 AND a.attrelid = c.oid
		 AND s.connamespace = n.oid
		 AND s.conrelid = c.oid
		 AND a.attnum = ANY (s.conkey)
		 AND s.consrc LIKE '%srid(% = %');
	IF (gsrid IS NULL) THEN
		-- Try to find srid from the geometry itself
		EXECUTE 'SELECT srid(' || quote_ident(gcs.attname) || ')
				 FROM ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || '
				 WHERE ' || quote_ident(gcs.attname) || ' IS NOT NULL LIMIT 1'
			INTO gc;
		gsrid := gc.srid;

		-- Try to apply srid check to column
		IF (gsrid IS NOT NULL) THEN
			BEGIN
				EXECUTE 'ALTER TABLE ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || '
						 ADD CONSTRAINT ' || quote_ident('enforce_srid_' || gcs.attname) || '
						 CHECK (srid(' || quote_ident(gcs.attname) || ') = ' || gsrid || ')';
			EXCEPTION
				WHEN check_violation THEN
					RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not apply constraint CHECK (srid(%) = %)', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname), quote_ident(gcs.attname), gsrid;
					gc_is_valid := false;
			END;
		END IF;
	END IF;

	-- Try to find ndims check from system tables (pg_constraint)
	gndims :=
		(SELECT replace(split_part(s.consrc, ' = ', 2), ')', '')
		 FROM pg_class c, pg_namespace n, pg_attribute a, pg_constraint s
		 WHERE n.nspname = gcs.nspname
		 AND c.relname = gcs.relname
		 AND a.attname = gcs.attname
		 AND a.attrelid = c.oid
		 AND s.connamespace = n.oid
		 AND s.conrelid = c.oid
		 AND a.attnum = ANY (s.conkey)
		 AND s.consrc LIKE '%ndims(% = %');
	IF (gndims IS NULL) THEN
		-- Try to find ndims from the geometry itself
		EXECUTE 'SELECT ndims(' || quote_ident(gcs.attname) || ')
				 FROM ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || '
				 WHERE ' || quote_ident(gcs.attname) || ' IS NOT NULL LIMIT 1'
			INTO gc;
		gndims := gc.ndims;

		-- Try to apply ndims check to column
		IF (gndims IS NOT NULL) THEN
			BEGIN
				EXECUTE 'ALTER TABLE ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || '
						 ADD CONSTRAINT ' || quote_ident('enforce_dims_' || gcs.attname) || '
						 CHECK (ndims(' || quote_ident(gcs.attname) || ') = '||gndims||')';
			EXCEPTION
				WHEN check_violation THEN
					RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not apply constraint CHECK (ndims(%) = %)', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname), quote_ident(gcs.attname), gndims;
					gc_is_valid := false;
			END;
		END IF;
	END IF;

	-- Try to find geotype check from system tables (pg_constraint)
	gtype :=
		(SELECT replace(split_part(s.consrc, '''', 2), ')', '')
		 FROM pg_class c, pg_namespace n, pg_attribute a, pg_constraint s
		 WHERE n.nspname = gcs.nspname
		 AND c.relname = gcs.relname
		 AND a.attname = gcs.attname
		 AND a.attrelid = c.oid
		 AND s.connamespace = n.oid
		 AND s.conrelid = c.oid
		 AND a.attnum = ANY (s.conkey)
		 AND s.consrc LIKE '%geometrytype(% = %');
	IF (gtype IS NULL) THEN
		-- Try to find geotype from the geometry itself
		EXECUTE 'SELECT geometrytype(' || quote_ident(gcs.attname) || ')
				 FROM ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || '
				 WHERE ' || quote_ident(gcs.attname) || ' IS NOT NULL LIMIT 1'
			INTO gc;
		gtype := gc.geometrytype;
		--IF (gtype IS NULL) THEN
		--    gtype := 'GEOMETRY';
		--END IF;

		-- Try to apply geometrytype check to column
		IF (gtype IS NOT NULL) THEN
			BEGIN
				EXECUTE 'ALTER TABLE ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || '
				ADD CONSTRAINT ' || quote_ident('enforce_geotype_' || gcs.attname) || '
				CHECK ((geometrytype(' || quote_ident(gcs.attname) || ') = ' || quote_literal(gtype) || ') OR (' || quote_ident(gcs.attname) || ' IS NULL))';
			EXCEPTION
				WHEN check_violation THEN
					-- No geometry check can be applied. This column contains a number of geometry types.
					RAISE WARNING 'Could not add geometry type check (%) to table column: %.%.%', gtype, quote_ident(gcs.nspname),quote_ident(gcs.relname),quote_ident(gcs.attname);
			END;
		END IF;
	END IF;

	IF (gsrid IS NULL) THEN
		RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not determine the srid', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname);
	ELSIF (gndims IS NULL) THEN
		RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not determine the number of dimensions', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname);
	ELSIF (gtype IS NULL) THEN
		RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not determine the geometry type', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname);
	ELSE
		-- Only insert into geometry_columns if table constraints could be applied.
		IF (gc_is_valid) THEN
			INSERT INTO geometry_columns (f_table_catalog,f_table_schema, f_table_name, f_geometry_column, coord_dimension, srid, type)
			VALUES ('', gcs.nspname, gcs.relname, gcs.attname, gndims, gsrid, gtype);
			inserted := inserted + 1;
		END IF;
	END IF;
	END LOOP;

	-- Add views to geometry columns table
	FOR gcs IN
	SELECT n.nspname, c.relname, a.attname
		FROM pg_class c,
			 pg_attribute a,
			 pg_type t,
			 pg_namespace n
		WHERE c.relkind = 'v'
		AND t.typname = 'geometry'
		AND a.attisdropped = false
		AND a.atttypid = t.oid
		AND a.attrelid = c.oid
		AND c.relnamespace = n.oid
		AND n.nspname NOT ILIKE 'pg_temp%'
		AND c.oid = tbl_oid
	LOOP
		RAISE DEBUG 'Processing view %.%.%', gcs.nspname, gcs.relname, gcs.attname;

		EXECUTE 'SELECT ndims(' || quote_ident(gcs.attname) || ')
				 FROM ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || '
				 WHERE ' || quote_ident(gcs.attname) || ' IS NOT NULL LIMIT 1'
			INTO gc;
		gndims := gc.ndims;

		EXECUTE 'SELECT srid(' || quote_ident(gcs.attname) || ')
				 FROM ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || '
				 WHERE ' || quote_ident(gcs.attname) || ' IS NOT NULL LIMIT 1'
			INTO gc;
		gsrid := gc.srid;

		EXECUTE 'SELECT geometrytype(' || quote_ident(gcs.attname) || ')
				 FROM ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || '
				 WHERE ' || quote_ident(gcs.attname) || ' IS NOT NULL LIMIT 1'
			INTO gc;
		gtype := gc.geometrytype;

		IF (gndims IS NULL) THEN
			RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not determine ndims', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname);
		ELSIF (gsrid IS NULL) THEN
			RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not determine srid', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname);
		ELSIF (gtype IS NULL) THEN
			RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not determine gtype', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname);
		ELSE
			query := 'INSERT INTO geometry_columns (f_table_catalog,f_table_schema, f_table_name, f_geometry_column, coord_dimension, srid, type) ' ||
					 'VALUES ('''', ' || quote_literal(gcs.nspname) || ',' || quote_literal(gcs.relname) || ',' || quote_literal(gcs.attname) || ',' || gndims || ',' || gsrid || ',' || quote_literal(gtype) || ')';
			EXECUTE query;
			inserted := inserted + 1;
		END IF;
	END LOOP;

	RETURN inserted;
END

$$;


--
-- Name: postgis_addbbox(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_addbbox(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_addBBOX';


--
-- Name: postgis_cache_bbox(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_cache_bbox() RETURNS trigger
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'cache_bbox';


--
-- Name: postgis_dropbbox(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_dropbbox(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_dropBBOX';


--
-- Name: postgis_full_version(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_full_version() RETURNS text
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
	libver text;
	projver text;
	geosver text;
	libxmlver text;
	usestats bool;
	dbproc text;
	relproc text;
	fullver text;
BEGIN
	SELECT postgis_lib_version() INTO libver;
	SELECT postgis_proj_version() INTO projver;
	SELECT postgis_geos_version() INTO geosver;
	SELECT postgis_libxml_version() INTO libxmlver;
	SELECT postgis_uses_stats() INTO usestats;
	SELECT postgis_scripts_installed() INTO dbproc;
	SELECT postgis_scripts_released() INTO relproc;

	fullver = 'POSTGIS="' || libver || '"';

	IF  geosver IS NOT NULL THEN
		fullver = fullver || ' GEOS="' || geosver || '"';
	END IF;

	IF  projver IS NOT NULL THEN
		fullver = fullver || ' PROJ="' || projver || '"';
	END IF;

	IF  libxmlver IS NOT NULL THEN
		fullver = fullver || ' LIBXML="' || libxmlver || '"';
	END IF;

	IF usestats THEN
		fullver = fullver || ' USE_STATS';
	END IF;

	-- fullver = fullver || ' DBPROC="' || dbproc || '"';
	-- fullver = fullver || ' RELPROC="' || relproc || '"';

	IF dbproc != relproc THEN
		fullver = fullver || ' (procs from ' || dbproc || ' need upgrade)';
	END IF;

	RETURN fullver;
END
$$;


--
-- Name: postgis_geos_version(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_geos_version() RETURNS text
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.5', 'postgis_geos_version';


--
-- Name: postgis_getbbox(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_getbbox(geometry) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_to_BOX2DFLOAT4';


--
-- Name: postgis_gist_joinsel(internal, oid, internal, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_gist_joinsel(internal, oid, internal, smallint) RETURNS double precision
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'LWGEOM_gist_joinsel';


--
-- Name: postgis_gist_sel(internal, oid, internal, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_gist_sel(internal, oid, internal, integer) RETURNS double precision
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'LWGEOM_gist_sel';


--
-- Name: postgis_hasbbox(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_hasbbox(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_hasBBOX';


--
-- Name: postgis_lib_build_date(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_lib_build_date() RETURNS text
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.5', 'postgis_lib_build_date';


--
-- Name: postgis_lib_version(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_lib_version() RETURNS text
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.5', 'postgis_lib_version';


--
-- Name: postgis_libxml_version(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_libxml_version() RETURNS text
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.5', 'postgis_libxml_version';


--
-- Name: postgis_noop(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_noop(geometry) RETURNS geometry
    LANGUAGE c STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_noop';


--
-- Name: postgis_proj_version(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_proj_version() RETURNS text
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.5', 'postgis_proj_version';


--
-- Name: postgis_scripts_build_date(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_scripts_build_date() RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $$SELECT '2010-09-30 02:44:42'::text AS version$$;


--
-- Name: postgis_scripts_installed(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_scripts_installed() RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $$SELECT '1.5 r5976'::text AS version$$;


--
-- Name: postgis_scripts_released(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_scripts_released() RETURNS text
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.5', 'postgis_scripts_released';


--
-- Name: postgis_transform_geometry(geometry, text, text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_transform_geometry(geometry, text, text, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'transform_geom';


--
-- Name: postgis_uses_stats(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_uses_stats() RETURNS boolean
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.5', 'postgis_uses_stats';


--
-- Name: postgis_version(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_version() RETURNS text
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.5', 'postgis_version';


--
-- Name: probe_geometry_columns(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION probe_geometry_columns() RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
	inserted integer;
	oldcount integer;
	probed integer;
	stale integer;
BEGIN

	SELECT count(*) INTO oldcount FROM geometry_columns;

	SELECT count(*) INTO probed
		FROM pg_class c, pg_attribute a, pg_type t,
			pg_namespace n,
			pg_constraint sridcheck, pg_constraint typecheck

		WHERE t.typname = 'geometry'
		AND a.atttypid = t.oid
		AND a.attrelid = c.oid
		AND c.relnamespace = n.oid
		AND sridcheck.connamespace = n.oid
		AND typecheck.connamespace = n.oid
		AND sridcheck.conrelid = c.oid
		AND sridcheck.consrc LIKE '(srid('||a.attname||') = %)'
		AND typecheck.conrelid = c.oid
		AND typecheck.consrc LIKE
		'((geometrytype('||a.attname||') = ''%''::text) OR (% IS NULL))'
		;

	INSERT INTO geometry_columns SELECT
		''::varchar as f_table_catalogue,
		n.nspname::varchar as f_table_schema,
		c.relname::varchar as f_table_name,
		a.attname::varchar as f_geometry_column,
		2 as coord_dimension,
		trim(both  ' =)' from
			replace(replace(split_part(
				sridcheck.consrc, ' = ', 2), ')', ''), '(', ''))::integer AS srid,
		trim(both ' =)''' from substr(typecheck.consrc,
			strpos(typecheck.consrc, '='),
			strpos(typecheck.consrc, '::')-
			strpos(typecheck.consrc, '=')
			))::varchar as type
		FROM pg_class c, pg_attribute a, pg_type t,
			pg_namespace n,
			pg_constraint sridcheck, pg_constraint typecheck
		WHERE t.typname = 'geometry'
		AND a.atttypid = t.oid
		AND a.attrelid = c.oid
		AND c.relnamespace = n.oid
		AND sridcheck.connamespace = n.oid
		AND typecheck.connamespace = n.oid
		AND sridcheck.conrelid = c.oid
		AND sridcheck.consrc LIKE '(st_srid('||a.attname||') = %)'
		AND typecheck.conrelid = c.oid
		AND typecheck.consrc LIKE
		'((geometrytype('||a.attname||') = ''%''::text) OR (% IS NULL))'

			AND NOT EXISTS (
					SELECT oid FROM geometry_columns gc
					WHERE c.relname::varchar = gc.f_table_name
					AND n.nspname::varchar = gc.f_table_schema
					AND a.attname::varchar = gc.f_geometry_column
			);

	GET DIAGNOSTICS inserted = ROW_COUNT;

	IF oldcount > probed THEN
		stale = oldcount-probed;
	ELSE
		stale = 0;
	END IF;

	RETURN 'probed:'||probed::text||
		' inserted:'||inserted::text||
		' conflicts:'||(probed-inserted)::text||
		' stale:'||stale::text;
END

$$;


--
-- Name: relate(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION relate(geometry, geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'relate_full';


--
-- Name: relate(geometry, geometry, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION relate(geometry, geometry, text) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'relate_pattern';


--
-- Name: removepoint(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION removepoint(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_removepoint';


--
-- Name: rename_geometry_table_constraints(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION rename_geometry_table_constraints() RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $$
SELECT 'rename_geometry_table_constraint() is obsoleted'::text
$$;


--
-- Name: reverse(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION reverse(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_reverse';


--
-- Name: rotate(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION rotate(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT rotateZ($1, $2)$_$;


--
-- Name: rotatex(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION rotatex(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT affine($1, 1, 0, 0, 0, cos($2), -sin($2), 0, sin($2), cos($2), 0, 0, 0)$_$;


--
-- Name: rotatey(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION rotatey(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT affine($1,  cos($2), 0, sin($2),  0, 1, 0,  -sin($2), 0, cos($2), 0,  0, 0)$_$;


--
-- Name: rotatez(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION rotatez(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT affine($1,  cos($2), -sin($2), 0,  sin($2), cos($2), 0,  0, 0, 1,  0, 0, 0)$_$;


--
-- Name: scale(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION scale(geometry, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT affine($1,  $2, 0, 0,  0, $3, 0,  0, 0, $4,  0, 0, 0)$_$;


--
-- Name: scale(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION scale(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT scale($1, $2, $3, 1)$_$;


--
-- Name: se_envelopesintersect(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION se_envelopesintersect(geometry, geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ 
	SELECT $1 && $2
	$_$;


--
-- Name: se_is3d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION se_is3d(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_hasz';


--
-- Name: se_ismeasured(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION se_ismeasured(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_hasm';


--
-- Name: se_locatealong(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION se_locatealong(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT locate_between_measures($1, $2, $2) $_$;


--
-- Name: se_locatebetween(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION se_locatebetween(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_locate_between_m';


--
-- Name: se_m(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION se_m(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_m_point';


--
-- Name: se_z(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION se_z(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_z_point';


--
-- Name: segmentize(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION segmentize(geometry, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_segmentize2d';


--
-- Name: setfactor(chip, real); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION setfactor(chip, real) RETURNS chip
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_setFactor';


--
-- Name: setpoint(geometry, integer, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION setpoint(geometry, integer, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_setpoint_linestring';


--
-- Name: setsrid(chip, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION setsrid(chip, integer) RETURNS chip
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_setSRID';


--
-- Name: setsrid(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION setsrid(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_setSRID';


--
-- Name: shift_longitude(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION shift_longitude(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_longitude_shift';


--
-- Name: simplify(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION simplify(geometry, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_simplify2d';


--
-- Name: snaptogrid(geometry, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION snaptogrid(geometry, double precision, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_snaptogrid';


--
-- Name: snaptogrid(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION snaptogrid(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT SnapToGrid($1, 0, 0, $2, $3)$_$;


--
-- Name: snaptogrid(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION snaptogrid(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT SnapToGrid($1, 0, 0, $2, $2)$_$;


--
-- Name: snaptogrid(geometry, geometry, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION snaptogrid(geometry, geometry, double precision, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_snaptogrid_pointoff';


--
-- Name: srid(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION srid(chip) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_getSRID';


--
-- Name: srid(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION srid(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_getSRID';


--
-- Name: st_addmeasure(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_addmeasure(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'ST_AddMeasure';


--
-- Name: st_addpoint(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_addpoint(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_addpoint';


--
-- Name: st_addpoint(geometry, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_addpoint(geometry, geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_addpoint';


--
-- Name: st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_affine';


--
-- Name: st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT affine($1,  $2, $3, 0,  $4, $5, 0,  0, 0, 1,  $6, $7, 0)$_$;


--
-- Name: st_area(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_area(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_area_polygon';


--
-- Name: st_area(geography, boolean); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_area(geography, boolean) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'geography_area';


--
-- Name: st_area(geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_area(geography) RETURNS double precision
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_Area($1, true)$_$;


--
-- Name: st_area(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_area(text) RETURNS double precision
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT ST_Area($1::geometry);  $_$;


--
-- Name: st_area2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_area2d(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_area_polygon';


--
-- Name: st_asbinary(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asbinary(geometry) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_asBinary';


--
-- Name: st_asbinary(geometry, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asbinary(geometry, text) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_asBinary';


--
-- Name: st_asbinary(geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asbinary(geography) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_as_binary';


--
-- Name: st_asbinary(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asbinary(text) RETURNS bytea
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT ST_AsBinary($1::geometry);  $_$;


--
-- Name: st_asewkb(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asewkb(geometry) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'WKBFromLWGEOM';


--
-- Name: st_asewkb(geometry, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asewkb(geometry, text) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'WKBFromLWGEOM';


--
-- Name: st_asewkt(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asewkt(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_asEWKT';


--
-- Name: st_asgeojson(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgeojson(geometry, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGeoJson(1, $1, $2, 0)$_$;


--
-- Name: st_asgeojson(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgeojson(geometry) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGeoJson(1, $1, 15, 0)$_$;


--
-- Name: st_asgeojson(integer, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgeojson(integer, geometry) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGeoJson($1, $2, 15, 0)$_$;


--
-- Name: st_asgeojson(integer, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgeojson(integer, geometry, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGeoJson($1, $2, $3, 0)$_$;


--
-- Name: st_asgeojson(geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgeojson(geometry, integer, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGeoJson(1, $1, $2, $3)$_$;


--
-- Name: st_asgeojson(integer, geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgeojson(integer, geometry, integer, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGeoJson($1, $2, $3, $4)$_$;


--
-- Name: st_asgeojson(geography, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgeojson(geography, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGeoJson(1, $1, $2, 0)$_$;


--
-- Name: st_asgeojson(geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgeojson(geography) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGeoJson(1, $1, 15, 0)$_$;


--
-- Name: st_asgeojson(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgeojson(text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT ST_AsGeoJson($1::geometry);  $_$;


--
-- Name: st_asgeojson(integer, geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgeojson(integer, geography) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGeoJson($1, $2, 15, 0)$_$;


--
-- Name: st_asgeojson(integer, geography, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgeojson(integer, geography, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGeoJson($1, $2, $3, 0)$_$;


--
-- Name: st_asgeojson(geography, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgeojson(geography, integer, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGeoJson(1, $1, $2, $3)$_$;


--
-- Name: st_asgeojson(integer, geography, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgeojson(integer, geography, integer, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGeoJson($1, $2, $3, $4)$_$;


--
-- Name: st_asgml(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(geometry, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGML(2, $1, $2, 0)$_$;


--
-- Name: st_asgml(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(geometry) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGML(2, $1, 15, 0)$_$;


--
-- Name: st_asgml(integer, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(integer, geometry) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGML($1, $2, 15, 0)$_$;


--
-- Name: st_asgml(integer, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(integer, geometry, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGML($1, $2, $3, 0)$_$;


--
-- Name: st_asgml(geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(geometry, integer, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGML(2, $1, $2, $3)$_$;


--
-- Name: st_asgml(integer, geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(integer, geometry, integer, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGML($1, $2, $3, $4)$_$;


--
-- Name: st_asgml(geography, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(geography, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGML(2, $1, $2, 0)$_$;


--
-- Name: st_asgml(geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(geography) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGML(2, $1, 15, 0)$_$;


--
-- Name: st_asgml(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT ST_AsGML($1::geometry);  $_$;


--
-- Name: st_asgml(integer, geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(integer, geography) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGML($1, $2, 15, 0)$_$;


--
-- Name: st_asgml(integer, geography, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(integer, geography, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGML($1, $2, $3, 0)$_$;


--
-- Name: st_asgml(geography, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(geography, integer, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGML(2, $1, $2, $3)$_$;


--
-- Name: st_asgml(integer, geography, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(integer, geography, integer, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGML($1, $2, $3, $4)$_$;


--
-- Name: st_ashexewkb(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_ashexewkb(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_asHEXEWKB';


--
-- Name: st_ashexewkb(geometry, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_ashexewkb(geometry, text) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_asHEXEWKB';


--
-- Name: st_askml(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_askml(geometry, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsKML(2, ST_Transform($1,4326), $2)$_$;


--
-- Name: st_askml(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_askml(geometry) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsKML(2, ST_Transform($1,4326), 15)$_$;


--
-- Name: st_askml(integer, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_askml(integer, geometry) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsKML($1, ST_Transform($2,4326), 15)$_$;


--
-- Name: st_askml(integer, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_askml(integer, geometry, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsKML($1, ST_Transform($2,4326), $3)$_$;


--
-- Name: st_askml(geography, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_askml(geography, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsKML(2, $1, $2)$_$;


--
-- Name: st_askml(geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_askml(geography) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsKML(2, $1, 15)$_$;


--
-- Name: st_askml(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_askml(text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT ST_AsKML($1::geometry);  $_$;


--
-- Name: st_askml(integer, geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_askml(integer, geography) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsKML($1, $2, 15)$_$;


--
-- Name: st_askml(integer, geography, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_askml(integer, geography, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsKML($1, $2, $3)$_$;


--
-- Name: st_assvg(geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_assvg(geometry, integer, integer) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'assvg_geometry';


--
-- Name: st_assvg(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_assvg(geometry, integer) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'assvg_geometry';


--
-- Name: st_assvg(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_assvg(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'assvg_geometry';


--
-- Name: st_assvg(geography, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_assvg(geography, integer, integer) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_as_svg';


--
-- Name: st_assvg(geography, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_assvg(geography, integer) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_as_svg';


--
-- Name: st_assvg(geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_assvg(geography) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_as_svg';


--
-- Name: st_assvg(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_assvg(text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT ST_AsSVG($1::geometry);  $_$;


--
-- Name: st_astext(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_astext(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_asText';


--
-- Name: st_astext(geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_astext(geography) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_as_text';


--
-- Name: st_astext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_astext(text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT ST_AsText($1::geometry);  $_$;


--
-- Name: st_azimuth(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_azimuth(geometry, geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_azimuth';


--
-- Name: st_bdmpolyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_bdmpolyfromtext(text, integer) RETURNS geometry
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$
DECLARE
	geomtext alias for $1;
	srid alias for $2;
	mline geometry;
	geom geometry;
BEGIN
	mline := ST_MultiLineStringFromText(geomtext, srid);

	IF mline IS NULL
	THEN
		RAISE EXCEPTION 'Input is not a MultiLinestring';
	END IF;

	geom := multi(ST_BuildArea(mline));

	RETURN geom;
END;
$_$;


--
-- Name: st_bdpolyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_bdpolyfromtext(text, integer) RETURNS geometry
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$
DECLARE
	geomtext alias for $1;
	srid alias for $2;
	mline geometry;
	geom geometry;
BEGIN
	mline := ST_MultiLineStringFromText(geomtext, srid);

	IF mline IS NULL
	THEN
		RAISE EXCEPTION 'Input is not a MultiLinestring';
	END IF;

	geom := ST_BuildArea(mline);

	IF GeometryType(geom) != 'POLYGON'
	THEN
		RAISE EXCEPTION 'Input returns more then a single polygon, try using BdMPolyFromText instead';
	END IF;

	RETURN geom;
END;
$_$;


--
-- Name: st_boundary(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_boundary(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'boundary';


--
-- Name: st_box(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box(geometry) RETURNS box
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_to_BOX';


--
-- Name: st_box(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box(box3d) RETURNS box
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_to_BOX';


--
-- Name: st_box2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d(geometry) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_to_BOX2DFLOAT4';


--
-- Name: st_box2d(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d(box3d) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_to_BOX2DFLOAT4';


--
-- Name: st_box2d(box3d_extent); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d(box3d_extent) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_to_BOX2DFLOAT4';


--
-- Name: st_box2d_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d_in(cstring) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2DFLOAT4_in';


--
-- Name: st_box2d_out(box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d_out(box2d) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2DFLOAT4_out';


--
-- Name: st_box3d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box3d(geometry) RETURNS box3d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_to_BOX3D';


--
-- Name: st_box3d(box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box3d(box2d) RETURNS box3d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2DFLOAT4_to_BOX3D';


--
-- Name: st_box3d_extent(box3d_extent); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box3d_extent(box3d_extent) RETURNS box3d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_extent_to_BOX3D';


--
-- Name: st_box3d_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box3d_in(cstring) RETURNS box3d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_in';


--
-- Name: st_box3d_out(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box3d_out(box3d) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_out';


--
-- Name: st_buffer(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_buffer(geometry, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'buffer';


--
-- Name: st_buffer(geometry, double precision, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_buffer(geometry, double precision, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT _ST_Buffer($1, $2,
		CAST('quad_segs='||CAST($3 AS text) as cstring))
	   $_$;


--
-- Name: st_buffer(geometry, double precision, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_buffer(geometry, double precision, text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT _ST_Buffer($1, $2,
		CAST( regexp_replace($3, '^[0123456789]+$',
			'quad_segs='||$3) AS cstring)
		)
	   $_$;


--
-- Name: st_buffer(geography, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_buffer(geography, double precision) RETURNS geography
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT geography(ST_Transform(ST_Buffer(ST_Transform(geometry($1), _ST_BestSRID($1)), $2), 4326))$_$;


--
-- Name: st_buffer(text, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_buffer(text, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT ST_Buffer($1::geometry, $2);  $_$;


--
-- Name: st_buildarea(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_buildarea(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'LWGEOM_buildarea';


--
-- Name: st_bytea(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_bytea(geometry) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_to_bytea';


--
-- Name: st_centroid(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_centroid(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'centroid';


--
-- Name: st_chip_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_chip_in(cstring) RETURNS chip
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_in';


--
-- Name: st_chip_out(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_chip_out(chip) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_out';


--
-- Name: st_closestpoint(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_closestpoint(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_closestpoint';


--
-- Name: st_collect(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_collect(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.5', 'LWGEOM_collect';


--
-- Name: st_collect(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_collect(geometry[]) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_collect_garray';


--
-- Name: st_collectionextract(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_collectionextract(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'ST_CollectionExtract';


--
-- Name: st_combine_bbox(box2d, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_combine_bbox(box2d, geometry) RETURNS box2d
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.5', 'BOX2DFLOAT4_combine';


--
-- Name: st_combine_bbox(box3d_extent, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_combine_bbox(box3d_extent, geometry) RETURNS box3d_extent
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.5', 'BOX3D_combine';


--
-- Name: st_combine_bbox(box3d, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_combine_bbox(box3d, geometry) RETURNS box3d
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-1.5', 'BOX3D_combine';


--
-- Name: st_compression(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_compression(chip) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_getCompression';


--
-- Name: st_contains(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_contains(geometry, geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Contains($1,$2)$_$;


--
-- Name: st_containsproperly(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_containsproperly(geometry, geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_ContainsProperly($1,$2)$_$;


--
-- Name: st_convexhull(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_convexhull(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'convexhull';


--
-- Name: st_coorddim(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_coorddim(geometry) RETURNS smallint
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_ndims';


--
-- Name: st_coveredby(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_coveredby(geometry, geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_CoveredBy($1,$2)$_$;


--
-- Name: st_coveredby(geography, geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_coveredby(geography, geography) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Covers($2, $1)$_$;


--
-- Name: st_coveredby(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_coveredby(text, text) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$ SELECT ST_CoveredBy($1::geometry, $2::geometry);  $_$;


--
-- Name: st_covers(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_covers(geometry, geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Covers($1,$2)$_$;


--
-- Name: st_covers(geography, geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_covers(geography, geography) RETURNS boolean
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT $1 && $2 AND _ST_Covers($1, $2)$_$;


--
-- Name: st_covers(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_covers(text, text) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$ SELECT ST_Covers($1::geometry, $2::geometry);  $_$;


--
-- Name: st_crosses(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_crosses(geometry, geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Crosses($1,$2)$_$;


--
-- Name: st_curvetoline(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_curvetoline(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_curve_segmentize';


--
-- Name: st_curvetoline(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_curvetoline(geometry) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_CurveToLine($1, 32)$_$;


--
-- Name: st_datatype(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_datatype(chip) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_getDatatype';


--
-- Name: st_dfullywithin(geometry, geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_dfullywithin(geometry, geometry, double precision) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && ST_Expand($2,$3) AND $2 && ST_Expand($1,$3) AND _ST_DFullyWithin(ST_ConvexHull($1), ST_ConvexHull($2), $3)$_$;


--
-- Name: st_difference(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_difference(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'difference';


--
-- Name: st_dimension(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_dimension(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_dimension';


--
-- Name: st_disjoint(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_disjoint(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'disjoint';


--
-- Name: st_distance(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_distance(geometry, geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'LWGEOM_mindistance2d';


--
-- Name: st_distance(geography, geography, boolean); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_distance(geography, geography, boolean) RETURNS double precision
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_Distance($1, $2, 0.0, $3)$_$;


--
-- Name: st_distance(geography, geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_distance(geography, geography) RETURNS double precision
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_Distance($1, $2, 0.0, true)$_$;


--
-- Name: st_distance(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_distance(text, text) RETURNS double precision
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT ST_Distance($1::geometry, $2::geometry);  $_$;


--
-- Name: st_distance_sphere(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_distance_sphere(geometry, geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'LWGEOM_distance_sphere';


--
-- Name: st_distance_spheroid(geometry, geometry, spheroid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_distance_spheroid(geometry, geometry, spheroid) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'LWGEOM_distance_ellipsoid';


--
-- Name: st_dump(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_dump(geometry) RETURNS SETOF geometry_dump
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_dump';


--
-- Name: st_dumppoints(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_dumppoints(geometry) RETURNS SETOF geometry_dump
    LANGUAGE sql
    AS $_$
  SELECT * FROM _ST_DumpPoints($1, NULL);
$_$;


--
-- Name: st_dumprings(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_dumprings(geometry) RETURNS SETOF geometry_dump
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_dump_rings';


--
-- Name: st_dwithin(geometry, geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_dwithin(geometry, geometry, double precision) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && ST_Expand($2,$3) AND $2 && ST_Expand($1,$3) AND _ST_DWithin($1, $2, $3)$_$;


--
-- Name: st_dwithin(geography, geography, double precision, boolean); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_dwithin(geography, geography, double precision, boolean) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && _ST_Expand($2,$3) AND $2 && _ST_Expand($1,$3) AND _ST_DWithin($1, $2, $3, $4)$_$;


--
-- Name: st_dwithin(geography, geography, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_dwithin(geography, geography, double precision) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && _ST_Expand($2,$3) AND $2 && _ST_Expand($1,$3) AND _ST_DWithin($1, $2, $3, true)$_$;


--
-- Name: st_dwithin(text, text, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_dwithin(text, text, double precision) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$ SELECT ST_DWithin($1::geometry, $2::geometry, $3);  $_$;


--
-- Name: st_endpoint(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_endpoint(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_endpoint_linestring';


--
-- Name: st_envelope(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_envelope(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_envelope';


--
-- Name: st_equals(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_equals(geometry, geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Equals($1,$2)$_$;


--
-- Name: st_estimated_extent(text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_estimated_extent(text, text, text) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT SECURITY DEFINER
    AS '$libdir/postgis-1.5', 'LWGEOM_estimated_extent';


--
-- Name: st_estimated_extent(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_estimated_extent(text, text) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT SECURITY DEFINER
    AS '$libdir/postgis-1.5', 'LWGEOM_estimated_extent';


--
-- Name: st_expand(box3d, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_expand(box3d, double precision) RETURNS box3d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_expand';


--
-- Name: st_expand(box2d, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_expand(box2d, double precision) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2DFLOAT4_expand';


--
-- Name: st_expand(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_expand(geometry, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_expand';


--
-- Name: st_exteriorring(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_exteriorring(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_exteriorring_polygon';


--
-- Name: st_factor(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_factor(chip) RETURNS real
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_getFactor';


--
-- Name: st_find_extent(text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_find_extent(text, text, text) RETURNS box2d
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$
DECLARE
	schemaname alias for $1;
	tablename alias for $2;
	columnname alias for $3;
	myrec RECORD;

BEGIN
	FOR myrec IN EXECUTE 'SELECT extent("' || columnname || '") FROM "' || schemaname || '"."' || tablename || '"' LOOP
		return myrec.extent;
	END LOOP;
END;
$_$;


--
-- Name: st_find_extent(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_find_extent(text, text) RETURNS box2d
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$
DECLARE
	tablename alias for $1;
	columnname alias for $2;
	myrec RECORD;

BEGIN
	FOR myrec IN EXECUTE 'SELECT extent("' || columnname || '") FROM "' || tablename || '"' LOOP
		return myrec.extent;
	END LOOP;
END;
$_$;


--
-- Name: st_force_2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_force_2d(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_force_2d';


--
-- Name: st_force_3d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_force_3d(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_force_3dz';


--
-- Name: st_force_3dm(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_force_3dm(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_force_3dm';


--
-- Name: st_force_3dz(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_force_3dz(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_force_3dz';


--
-- Name: st_force_4d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_force_4d(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_force_4d';


--
-- Name: st_force_collection(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_force_collection(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_force_collection';


--
-- Name: st_forcerhr(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_forcerhr(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_forceRHR_poly';


--
-- Name: st_geogfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geogfromtext(text) RETURNS geography
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_from_text';


--
-- Name: st_geogfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geogfromwkb(bytea) RETURNS geography
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_from_binary';


--
-- Name: st_geographyfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geographyfromtext(text) RETURNS geography
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_from_text';


--
-- Name: st_geohash(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geohash(geometry, integer) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'ST_GeoHash';


--
-- Name: st_geohash(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geohash(geometry) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_GeoHash($1, 0)$_$;


--
-- Name: st_geomcollfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomcollfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(ST_GeomFromText($1, $2)) = 'GEOMETRYCOLLECTION'
	THEN ST_GeomFromText($1,$2)
	ELSE NULL END
	$_$;


--
-- Name: st_geomcollfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomcollfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(ST_GeomFromText($1)) = 'GEOMETRYCOLLECTION'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$;


--
-- Name: st_geomcollfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomcollfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromWKB($1, $2)) = 'GEOMETRYCOLLECTION'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: st_geomcollfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomcollfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(ST_GeomFromWKB($1)) = 'GEOMETRYCOLLECTION'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- Name: st_geometry(box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry(box2d) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2DFLOAT4_to_LWGEOM';


--
-- Name: st_geometry(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry(box3d) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_to_LWGEOM';


--
-- Name: st_geometry(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry(text) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'parse_WKT_lwgeom';


--
-- Name: st_geometry(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry(chip) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_to_LWGEOM';


--
-- Name: st_geometry(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry(bytea) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_from_bytea';


--
-- Name: st_geometry(box3d_extent); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry(box3d_extent) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_to_LWGEOM';


--
-- Name: st_geometry_above(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_above(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_above';


--
-- Name: st_geometry_analyze(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_analyze(internal) RETURNS boolean
    LANGUAGE c STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_analyze';


--
-- Name: st_geometry_below(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_below(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_below';


--
-- Name: st_geometry_cmp(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_cmp(geometry, geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'lwgeom_cmp';


--
-- Name: st_geometry_contain(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_contain(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_contain';


--
-- Name: st_geometry_contained(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_contained(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_contained';


--
-- Name: st_geometry_eq(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_eq(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'lwgeom_eq';


--
-- Name: st_geometry_ge(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_ge(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'lwgeom_ge';


--
-- Name: st_geometry_gt(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_gt(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'lwgeom_gt';


--
-- Name: st_geometry_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_in(cstring) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_in';


--
-- Name: st_geometry_le(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_le(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'lwgeom_le';


--
-- Name: st_geometry_left(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_left(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_left';


--
-- Name: st_geometry_lt(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_lt(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'lwgeom_lt';


--
-- Name: st_geometry_out(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_out(geometry) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_out';


--
-- Name: st_geometry_overabove(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_overabove(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_overabove';


--
-- Name: st_geometry_overbelow(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_overbelow(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_overbelow';


--
-- Name: st_geometry_overlap(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_overlap(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_overlap';


--
-- Name: st_geometry_overleft(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_overleft(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_overleft';


--
-- Name: st_geometry_overright(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_overright(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_overright';


--
-- Name: st_geometry_recv(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_recv(internal) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_recv';


--
-- Name: st_geometry_right(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_right(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_right';


--
-- Name: st_geometry_same(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_same(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_samebox';


--
-- Name: st_geometry_send(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_send(geometry) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_send';


--
-- Name: st_geometryfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometryfromtext(text) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_from_text';


--
-- Name: st_geometryfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometryfromtext(text, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_from_text';


--
-- Name: st_geometryn(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometryn(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_geometryn_collection';


--
-- Name: st_geometrytype(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometrytype(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geometry_geometrytype';


--
-- Name: st_geomfromewkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomfromewkb(bytea) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOMFromWKB';


--
-- Name: st_geomfromewkt(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomfromewkt(text) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'parse_WKT_lwgeom';


--
-- Name: st_geomfromgml(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomfromgml(text) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geom_from_gml';


--
-- Name: st_geomfromkml(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomfromkml(text) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geom_from_kml';


--
-- Name: st_geomfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomfromtext(text) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_from_text';


--
-- Name: st_geomfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomfromtext(text, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_from_text';


--
-- Name: st_geomfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomfromwkb(bytea) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_from_WKB';


--
-- Name: st_geomfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_SetSRID(ST_GeomFromWKB($1), $2)$_$;


--
-- Name: st_gmltosql(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_gmltosql(text) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geom_from_gml';


--
-- Name: st_hasarc(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_hasarc(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_has_arc';


--
-- Name: st_hausdorffdistance(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_hausdorffdistance(geometry, geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'hausdorffdistance';


--
-- Name: st_hausdorffdistance(geometry, geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_hausdorffdistance(geometry, geometry, double precision) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'hausdorffdistancedensify';


--
-- Name: st_height(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_height(chip) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_getHeight';


--
-- Name: st_interiorringn(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_interiorringn(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_interiorringn_polygon';


--
-- Name: st_intersection(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_intersection(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'intersection';


--
-- Name: st_intersection(geography, geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_intersection(geography, geography) RETURNS geography
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT geography(ST_Transform(ST_Intersection(ST_Transform(geometry($1), _ST_BestSRID($1, $2)), ST_Transform(geometry($2), _ST_BestSRID($1, $2))), 4326))$_$;


--
-- Name: st_intersection(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_intersection(text, text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT ST_Intersection($1::geometry, $2::geometry);  $_$;


--
-- Name: st_intersects(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_intersects(geometry, geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Intersects($1,$2)$_$;


--
-- Name: st_intersects(geography, geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_intersects(geography, geography) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Distance($1, $2, 0.0, false) < 0.00001$_$;


--
-- Name: st_intersects(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_intersects(text, text) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$ SELECT ST_Intersects($1::geometry, $2::geometry);  $_$;


--
-- Name: st_isclosed(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_isclosed(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_isclosed_linestring';


--
-- Name: st_isempty(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_isempty(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_isempty';


--
-- Name: st_isring(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_isring(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'isring';


--
-- Name: st_issimple(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_issimple(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'issimple';


--
-- Name: st_isvalid(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_isvalid(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'isvalid';


--
-- Name: st_isvalidreason(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_isvalidreason(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'isvalidreason';


--
-- Name: st_length(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_length(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_length2d_linestring';


--
-- Name: st_length(geography, boolean); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_length(geography, boolean) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'geography_length';


--
-- Name: st_length(geography); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_length(geography) RETURNS double precision
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT ST_Length($1, true)$_$;


--
-- Name: st_length(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_length(text) RETURNS double precision
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT ST_Length($1::geometry);  $_$;


--
-- Name: st_length2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_length2d(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_length2d_linestring';


--
-- Name: st_length2d_spheroid(geometry, spheroid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_length2d_spheroid(geometry, spheroid) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'LWGEOM_length2d_ellipsoid';


--
-- Name: st_length3d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_length3d(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_length_linestring';


--
-- Name: st_length3d_spheroid(geometry, spheroid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_length3d_spheroid(geometry, spheroid) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'LWGEOM_length_ellipsoid_linestring';


--
-- Name: st_length_spheroid(geometry, spheroid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_length_spheroid(geometry, spheroid) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'LWGEOM_length_ellipsoid_linestring';


--
-- Name: st_line_interpolate_point(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_line_interpolate_point(geometry, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_line_interpolate_point';


--
-- Name: st_line_locate_point(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_line_locate_point(geometry, geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_line_locate_point';


--
-- Name: st_line_substring(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_line_substring(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_line_substring';


--
-- Name: st_linecrossingdirection(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linecrossingdirection(geometry, geometry) RETURNS integer
    LANGUAGE sql IMMUTABLE
    AS $_$ SELECT CASE WHEN NOT $1 && $2 THEN 0 ELSE _ST_LineCrossingDirection($1,$2) END $_$;


--
-- Name: st_linefrommultipoint(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linefrommultipoint(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_line_from_mpoint';


--
-- Name: st_linefromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linefromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'LINESTRING'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$;


--
-- Name: st_linefromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linefromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'LINESTRING'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$;


--
-- Name: st_linefromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linefromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'LINESTRING'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: st_linefromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linefromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'LINESTRING'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- Name: st_linemerge(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linemerge(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'linemerge';


--
-- Name: st_linestringfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linestringfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'LINESTRING'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: st_linestringfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linestringfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'LINESTRING'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- Name: st_linetocurve(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linetocurve(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_line_desegmentize';


--
-- Name: st_locate_along_measure(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_locate_along_measure(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT locate_between_measures($1, $2, $2) $_$;


--
-- Name: st_locate_between_measures(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_locate_between_measures(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_locate_between_m';


--
-- Name: st_locatebetweenelevations(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_locatebetweenelevations(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'ST_LocateBetweenElevations';


--
-- Name: st_longestline(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_longestline(geometry, geometry) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_LongestLine(ST_ConvexHull($1), ST_ConvexHull($2))$_$;


--
-- Name: st_m(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_m(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_m_point';


--
-- Name: st_makebox2d(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makebox2d(geometry, geometry) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2DFLOAT4_construct';


--
-- Name: st_makebox3d(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makebox3d(geometry, geometry) RETURNS box3d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_construct';


--
-- Name: st_makeenvelope(double precision, double precision, double precision, double precision, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makeenvelope(double precision, double precision, double precision, double precision, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'ST_MakeEnvelope';


--
-- Name: st_makeline(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makeline(geometry[]) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makeline_garray';


--
-- Name: st_makeline(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makeline(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makeline';


--
-- Name: st_makeline_garray(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makeline_garray(geometry[]) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makeline_garray';


--
-- Name: st_makepoint(double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makepoint(double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makepoint';


--
-- Name: st_makepoint(double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makepoint(double precision, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makepoint';


--
-- Name: st_makepoint(double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makepoint(double precision, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makepoint';


--
-- Name: st_makepointm(double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makepointm(double precision, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makepoint3dm';


--
-- Name: st_makepolygon(geometry, geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makepolygon(geometry, geometry[]) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makepoly';


--
-- Name: st_makepolygon(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makepolygon(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makepoly';


--
-- Name: st_maxdistance(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_maxdistance(geometry, geometry) RETURNS double precision
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_MaxDistance(ST_ConvexHull($1), ST_ConvexHull($2))$_$;


--
-- Name: st_mem_size(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mem_size(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_mem_size';


--
-- Name: st_minimumboundingcircle(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_minimumboundingcircle(inputgeom geometry, segs_per_quarter integer) RETURNS geometry
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $$
	DECLARE
	hull GEOMETRY;
	ring GEOMETRY;
	center GEOMETRY;
	radius DOUBLE PRECISION;
	dist DOUBLE PRECISION;
	d DOUBLE PRECISION;
	idx1 integer;
	idx2 integer;
	l1 GEOMETRY;
	l2 GEOMETRY;
	p1 GEOMETRY;
	p2 GEOMETRY;
	a1 DOUBLE PRECISION;
	a2 DOUBLE PRECISION;


	BEGIN

	-- First compute the ConvexHull of the geometry
	hull = ST_ConvexHull(inputgeom);
	--A point really has no MBC
	IF ST_GeometryType(hull) = 'ST_Point' THEN
		RETURN hull;
	END IF;
	-- convert the hull perimeter to a linestring so we can manipulate individual points
	--If its already a linestring force it to a closed linestring
	ring = CASE WHEN ST_GeometryType(hull) = 'ST_LineString' THEN ST_AddPoint(hull, ST_StartPoint(hull)) ELSE ST_ExteriorRing(hull) END;

	dist = 0;
	-- Brute Force - check every pair
	FOR i in 1 .. (ST_NumPoints(ring)-2)
		LOOP
			FOR j in i .. (ST_NumPoints(ring)-1)
				LOOP
				d = ST_Distance(ST_PointN(ring,i),ST_PointN(ring,j));
				-- Check the distance and update if larger
				IF (d > dist) THEN
					dist = d;
					idx1 = i;
					idx2 = j;
				END IF;
			END LOOP;
		END LOOP;

	-- We now have the diameter of the convex hull.  The following line returns it if desired.
	-- RETURN MakeLine(PointN(ring,idx1),PointN(ring,idx2));

	-- Now for the Minimum Bounding Circle.  Since we know the two points furthest from each
	-- other, the MBC must go through those two points. Start with those points as a diameter of a circle.

	-- The radius is half the distance between them and the center is midway between them
	radius = ST_Distance(ST_PointN(ring,idx1),ST_PointN(ring,idx2)) / 2.0;
	center = ST_Line_interpolate_point(ST_MakeLine(ST_PointN(ring,idx1),ST_PointN(ring,idx2)),0.5);

	-- Loop through each vertex and check if the distance from the center to the point
	-- is greater than the current radius.
	FOR k in 1 .. (ST_NumPoints(ring)-1)
		LOOP
		IF(k <> idx1 and k <> idx2) THEN
			dist = ST_Distance(center,ST_PointN(ring,k));
			IF (dist > radius) THEN
				-- We have to expand the circle.  The new circle must pass trhough
				-- three points - the two original diameters and this point.

				-- Draw a line from the first diameter to this point
				l1 = ST_Makeline(ST_PointN(ring,idx1),ST_PointN(ring,k));
				-- Compute the midpoint
				p1 = ST_line_interpolate_point(l1,0.5);
				-- Rotate the line 90 degrees around the midpoint (perpendicular bisector)
				l1 = ST_Translate(ST_Rotate(ST_Translate(l1,-X(p1),-Y(p1)),pi()/2),X(p1),Y(p1));
				--  Compute the azimuth of the bisector
				a1 = ST_Azimuth(ST_PointN(l1,1),ST_PointN(l1,2));
				--  Extend the line in each direction the new computed distance to insure they will intersect
				l1 = ST_AddPoint(l1,ST_Makepoint(X(ST_PointN(l1,2))+sin(a1)*dist,Y(ST_PointN(l1,2))+cos(a1)*dist),-1);
				l1 = ST_AddPoint(l1,ST_Makepoint(X(ST_PointN(l1,1))-sin(a1)*dist,Y(ST_PointN(l1,1))-cos(a1)*dist),0);

				-- Repeat for the line from the point to the other diameter point
				l2 = ST_Makeline(ST_PointN(ring,idx2),ST_PointN(ring,k));
				p2 = ST_Line_interpolate_point(l2,0.5);
				l2 = ST_Translate(ST_Rotate(ST_Translate(l2,-X(p2),-Y(p2)),pi()/2),X(p2),Y(p2));
				a2 = ST_Azimuth(ST_PointN(l2,1),ST_PointN(l2,2));
				l2 = ST_AddPoint(l2,ST_Makepoint(X(ST_PointN(l2,2))+sin(a2)*dist,Y(ST_PointN(l2,2))+cos(a2)*dist),-1);
				l2 = ST_AddPoint(l2,ST_Makepoint(X(ST_PointN(l2,1))-sin(a2)*dist,Y(ST_PointN(l2,1))-cos(a2)*dist),0);

				-- The new center is the intersection of the two bisectors
				center = ST_Intersection(l1,l2);
				-- The new radius is the distance to any of the three points
				radius = ST_Distance(center,ST_PointN(ring,idx1));
			END IF;
		END IF;
		END LOOP;
	--DONE!!  Return the MBC via the buffer command
	RETURN ST_Buffer(center,radius,segs_per_quarter);

	END;
$$;


--
-- Name: st_minimumboundingcircle(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_minimumboundingcircle(geometry) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_MinimumBoundingCircle($1, 48)$_$;


--
-- Name: st_mlinefromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mlinefromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromText($1, $2)) = 'MULTILINESTRING'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$;


--
-- Name: st_mlinefromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mlinefromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'MULTILINESTRING'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$;


--
-- Name: st_mlinefromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mlinefromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'MULTILINESTRING'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: st_mlinefromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mlinefromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTILINESTRING'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- Name: st_mpointfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mpointfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'MULTIPOINT'
	THEN GeomFromText($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: st_mpointfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mpointfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'MULTIPOINT'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$;


--
-- Name: st_mpointfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mpointfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'MULTIPOINT'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: st_mpointfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mpointfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTIPOINT'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- Name: st_mpolyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mpolyfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1, $2)) = 'MULTIPOLYGON'
	THEN ST_GeomFromText($1,$2)
	ELSE NULL END
	$_$;


--
-- Name: st_mpolyfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mpolyfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'MULTIPOLYGON'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$;


--
-- Name: st_mpolyfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mpolyfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'MULTIPOLYGON'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: st_mpolyfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mpolyfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTIPOLYGON'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- Name: st_multi(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multi(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_force_multi';


--
-- Name: st_multilinefromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multilinefromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTILINESTRING'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- Name: st_multilinestringfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multilinestringfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_MLineFromText($1)$_$;


--
-- Name: st_multilinestringfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multilinestringfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT MLineFromText($1, $2)$_$;


--
-- Name: st_multipointfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multipointfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT MPointFromText($1)$_$;


--
-- Name: st_multipointfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multipointfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1,$2)) = 'MULTIPOINT'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: st_multipointfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multipointfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTIPOINT'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- Name: st_multipolyfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multipolyfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'MULTIPOLYGON'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: st_multipolyfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multipolyfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTIPOLYGON'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- Name: st_multipolygonfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multipolygonfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT MPolyFromText($1, $2)$_$;


--
-- Name: st_multipolygonfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multipolygonfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT MPolyFromText($1)$_$;


--
-- Name: st_ndims(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_ndims(geometry) RETURNS smallint
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_ndims';


--
-- Name: st_npoints(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_npoints(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_npoints';


--
-- Name: st_nrings(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_nrings(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_nrings';


--
-- Name: st_numgeometries(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_numgeometries(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_numgeometries_collection';


--
-- Name: st_numinteriorring(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_numinteriorring(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_numinteriorrings_polygon';


--
-- Name: st_numinteriorrings(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_numinteriorrings(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_numinteriorrings_polygon';


--
-- Name: st_numpoints(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_numpoints(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_numpoints_linestring';


--
-- Name: st_orderingequals(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_orderingequals(geometry, geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ 
	SELECT $1 ~= $2 AND _ST_OrderingEquals($1, $2)
	$_$;


--
-- Name: st_overlaps(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_overlaps(geometry, geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Overlaps($1,$2)$_$;


--
-- Name: st_perimeter(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_perimeter(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_perimeter2d_poly';


--
-- Name: st_perimeter2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_perimeter2d(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_perimeter2d_poly';


--
-- Name: st_perimeter3d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_perimeter3d(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_perimeter_poly';


--
-- Name: st_point(double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_point(double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makepoint';


--
-- Name: st_point_inside_circle(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_point_inside_circle(geometry, double precision, double precision, double precision) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_inside_circle_point';


--
-- Name: st_pointfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_pointfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'POINT'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$;


--
-- Name: st_pointfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_pointfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1, $2)) = 'POINT'
	THEN ST_GeomFromText($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: st_pointfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_pointfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'POINT'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: st_pointfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_pointfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'POINT'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- Name: st_pointn(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_pointn(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_pointn_linestring';


--
-- Name: st_pointonsurface(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_pointonsurface(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'pointonsurface';


--
-- Name: st_polyfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polyfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'POLYGON'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$;


--
-- Name: st_polyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polyfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1, $2)) = 'POLYGON'
	THEN ST_GeomFromText($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: st_polyfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polyfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'POLYGON'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: st_polyfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polyfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'POLYGON'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- Name: st_polygon(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polygon(geometry, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ 
	SELECT setSRID(makepolygon($1), $2)
	$_$;


--
-- Name: st_polygonfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polygonfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT PolyFromText($1, $2)$_$;


--
-- Name: st_polygonfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polygonfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_PolyFromText($1)$_$;


--
-- Name: st_polygonfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polygonfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1,$2)) = 'POLYGON'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


--
-- Name: st_polygonfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polygonfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'POLYGON'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


--
-- Name: st_polygonize(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polygonize(geometry[]) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'polygonize_garray';


--
-- Name: st_polygonize_garray(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polygonize_garray(geometry[]) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'polygonize_garray';


--
-- Name: st_postgis_gist_joinsel(internal, oid, internal, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_postgis_gist_joinsel(internal, oid, internal, smallint) RETURNS double precision
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'LWGEOM_gist_joinsel';


--
-- Name: st_postgis_gist_sel(internal, oid, internal, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_postgis_gist_sel(internal, oid, internal, integer) RETURNS double precision
    LANGUAGE c
    AS '$libdir/postgis-1.5', 'LWGEOM_gist_sel';


--
-- Name: st_relate(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_relate(geometry, geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'relate_full';


--
-- Name: st_relate(geometry, geometry, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_relate(geometry, geometry, text) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'relate_pattern';


--
-- Name: st_removepoint(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_removepoint(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_removepoint';


--
-- Name: st_reverse(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_reverse(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_reverse';


--
-- Name: st_rotate(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_rotate(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT rotateZ($1, $2)$_$;


--
-- Name: st_rotatex(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_rotatex(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT affine($1, 1, 0, 0, 0, cos($2), -sin($2), 0, sin($2), cos($2), 0, 0, 0)$_$;


--
-- Name: st_rotatey(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_rotatey(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT affine($1,  cos($2), 0, sin($2),  0, 1, 0,  -sin($2), 0, cos($2), 0,  0, 0)$_$;


--
-- Name: st_rotatez(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_rotatez(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT affine($1,  cos($2), -sin($2), 0,  sin($2), cos($2), 0,  0, 0, 1,  0, 0, 0)$_$;


--
-- Name: st_scale(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_scale(geometry, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT affine($1,  $2, 0, 0,  0, $3, 0,  0, 0, $4,  0, 0, 0)$_$;


--
-- Name: st_scale(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_scale(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT scale($1, $2, $3, 1)$_$;


--
-- Name: st_segmentize(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_segmentize(geometry, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_segmentize2d';


--
-- Name: st_setfactor(chip, real); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_setfactor(chip, real) RETURNS chip
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_setFactor';


--
-- Name: st_setpoint(geometry, integer, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_setpoint(geometry, integer, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_setpoint_linestring';


--
-- Name: st_setsrid(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_setsrid(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_setSRID';


--
-- Name: st_shift_longitude(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_shift_longitude(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_longitude_shift';


--
-- Name: st_shortestline(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_shortestline(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_shortestline2d';


--
-- Name: st_simplify(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_simplify(geometry, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_simplify2d';


--
-- Name: st_simplifypreservetopology(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_simplifypreservetopology(geometry, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'topologypreservesimplify';


--
-- Name: st_snaptogrid(geometry, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_snaptogrid(geometry, double precision, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_snaptogrid';


--
-- Name: st_snaptogrid(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_snaptogrid(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_SnapToGrid($1, 0, 0, $2, $3)$_$;


--
-- Name: st_snaptogrid(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_snaptogrid(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_SnapToGrid($1, 0, 0, $2, $2)$_$;


--
-- Name: st_snaptogrid(geometry, geometry, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_snaptogrid(geometry, geometry, double precision, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_snaptogrid_pointoff';


--
-- Name: st_spheroid_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_spheroid_in(cstring) RETURNS spheroid
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'ellipsoid_in';


--
-- Name: st_spheroid_out(spheroid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_spheroid_out(spheroid) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'ellipsoid_out';


--
-- Name: st_srid(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_srid(chip) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_getSRID';


--
-- Name: st_srid(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_srid(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_getSRID';


--
-- Name: st_startpoint(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_startpoint(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_startpoint_linestring';


--
-- Name: st_summary(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_summary(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_summary';


--
-- Name: st_symdifference(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_symdifference(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'symdifference';


--
-- Name: st_symmetricdifference(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_symmetricdifference(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'symdifference';


--
-- Name: st_text(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_text(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_to_text';


--
-- Name: st_touches(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_touches(geometry, geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Touches($1,$2)$_$;


--
-- Name: st_transform(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_transform(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'transform';


--
-- Name: st_translate(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_translate(geometry, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT affine($1, 1, 0, 0, 0, 1, 0, 0, 0, 1, $2, $3, $4)$_$;


--
-- Name: st_translate(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_translate(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT translate($1, $2, $3, 0)$_$;


--
-- Name: st_transscale(geometry, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_transscale(geometry, double precision, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT affine($1,  $4, 0, 0,  0, $5, 0,
		0, 0, 1,  $2 * $4, $3 * $5, 0)$_$;


--
-- Name: st_union(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_union(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geomunion';


--
-- Name: st_union(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_union(geometry[]) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'pgis_union_geometry_array';


--
-- Name: st_unite_garray(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_unite_garray(geometry[]) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'pgis_union_geometry_array';


--
-- Name: st_width(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_width(chip) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_getWidth';


--
-- Name: st_within(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_within(geometry, geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Within($1,$2)$_$;


--
-- Name: st_wkbtosql(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_wkbtosql(bytea) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_from_WKB';


--
-- Name: st_wkttosql(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_wkttosql(text) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_from_text';


--
-- Name: st_x(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_x(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_x_point';


--
-- Name: st_xmax(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_xmax(box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_xmax';


--
-- Name: st_xmin(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_xmin(box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_xmin';


--
-- Name: st_y(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_y(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_y_point';


--
-- Name: st_ymax(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_ymax(box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_ymax';


--
-- Name: st_ymin(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_ymin(box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_ymin';


--
-- Name: st_z(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_z(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_z_point';


--
-- Name: st_zmax(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_zmax(box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_zmax';


--
-- Name: st_zmflag(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_zmflag(geometry) RETURNS smallint
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_zmflag';


--
-- Name: st_zmin(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_zmin(box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_zmin';


--
-- Name: startpoint(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION startpoint(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_startpoint_linestring';


--
-- Name: summary(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION summary(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_summary';


--
-- Name: symdifference(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION symdifference(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'symdifference';


--
-- Name: symmetricdifference(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION symmetricdifference(geometry, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'symdifference';


--
-- Name: text(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION text(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_to_text';


--
-- Name: touches(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION touches(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'touches';


--
-- Name: transform(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION transform(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'transform';


--
-- Name: translate(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION translate(geometry, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT affine($1, 1, 0, 0, 0, 1, 0, 0, 0, 1, $2, $3, $4)$_$;


--
-- Name: translate(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION translate(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT translate($1, $2, $3, 0)$_$;


--
-- Name: transscale(geometry, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION transscale(geometry, double precision, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT affine($1,  $4, 0, 0,  0, $5, 0,
		0, 0, 1,  $2 * $4, $3 * $5, 0)$_$;


--
-- Name: unite_garray(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION unite_garray(geometry[]) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'pgis_union_geometry_array';


--
-- Name: unlockrows(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION unlockrows(text) RETURNS integer
    LANGUAGE plpgsql STRICT
    AS $_$ 
DECLARE
	ret int;
BEGIN

	IF NOT LongTransactionsEnabled() THEN
		RAISE EXCEPTION 'Long transaction support disabled, use EnableLongTransaction() to enable.';
	END IF;

	EXECUTE 'DELETE FROM authorization_table where authid = ' ||
		quote_literal($1);

	GET DIAGNOSTICS ret = ROW_COUNT;

	RETURN ret;
END;
$_$;


--
-- Name: updategeometrysrid(character varying, character varying, character varying, character varying, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION updategeometrysrid(character varying, character varying, character varying, character varying, integer) RETURNS text
    LANGUAGE plpgsql STRICT
    AS $_$
DECLARE
	catalog_name alias for $1;
	schema_name alias for $2;
	table_name alias for $3;
	column_name alias for $4;
	new_srid alias for $5;
	myrec RECORD;
	okay boolean;
	cname varchar;
	real_schema name;

BEGIN


	-- Find, check or fix schema_name
	IF ( schema_name != '' ) THEN
		okay = 'f';

		FOR myrec IN SELECT nspname FROM pg_namespace WHERE text(nspname) = schema_name LOOP
			okay := 't';
		END LOOP;

		IF ( okay <> 't' ) THEN
			RAISE EXCEPTION 'Invalid schema name';
		ELSE
			real_schema = schema_name;
		END IF;
	ELSE
		SELECT INTO real_schema current_schema()::text;
	END IF;

	-- Find out if the column is in the geometry_columns table
	okay = 'f';
	FOR myrec IN SELECT * from geometry_columns where f_table_schema = text(real_schema) and f_table_name = table_name and f_geometry_column = column_name LOOP
		okay := 't';
	END LOOP;
	IF (okay <> 't') THEN
		RAISE EXCEPTION 'column not found in geometry_columns table';
		RETURN 'f';
	END IF;

	-- Update ref from geometry_columns table
	EXECUTE 'UPDATE geometry_columns SET SRID = ' || new_srid::text ||
		' where f_table_schema = ' ||
		quote_literal(real_schema) || ' and f_table_name = ' ||
		quote_literal(table_name)  || ' and f_geometry_column = ' ||
		quote_literal(column_name);

	-- Make up constraint name
	cname = 'enforce_srid_'  || column_name;

	-- Drop enforce_srid constraint
	EXECUTE 'ALTER TABLE ' || quote_ident(real_schema) ||
		'.' || quote_ident(table_name) ||
		' DROP constraint ' || quote_ident(cname);

	-- Update geometries SRID
	EXECUTE 'UPDATE ' || quote_ident(real_schema) ||
		'.' || quote_ident(table_name) ||
		' SET ' || quote_ident(column_name) ||
		' = setSRID(' || quote_ident(column_name) ||
		', ' || new_srid::text || ')';

	-- Reset enforce_srid constraint
	EXECUTE 'ALTER TABLE ' || quote_ident(real_schema) ||
		'.' || quote_ident(table_name) ||
		' ADD constraint ' || quote_ident(cname) ||
		' CHECK (srid(' || quote_ident(column_name) ||
		') = ' || new_srid::text || ')';

	RETURN real_schema || '.' || table_name || '.' || column_name ||' SRID changed to ' || new_srid::text;

END;
$_$;


--
-- Name: updategeometrysrid(character varying, character varying, character varying, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION updategeometrysrid(character varying, character varying, character varying, integer) RETURNS text
    LANGUAGE plpgsql STRICT
    AS $_$
DECLARE
	ret  text;
BEGIN
	SELECT UpdateGeometrySRID('',$1,$2,$3,$4) into ret;
	RETURN ret;
END;
$_$;


--
-- Name: updategeometrysrid(character varying, character varying, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION updategeometrysrid(character varying, character varying, integer) RETURNS text
    LANGUAGE plpgsql STRICT
    AS $_$
DECLARE
	ret  text;
BEGIN
	SELECT UpdateGeometrySRID('','',$1,$2,$3) into ret;
	RETURN ret;
END;
$_$;


--
-- Name: width(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION width(chip) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_getWidth';


--
-- Name: within(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION within(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'within';


--
-- Name: x(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION x(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_x_point';


--
-- Name: xmax(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION xmax(box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_xmax';


--
-- Name: xmin(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION xmin(box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_xmin';


--
-- Name: y(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION y(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_y_point';


--
-- Name: ymax(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ymax(box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_ymax';


--
-- Name: ymin(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ymin(box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_ymin';


--
-- Name: z(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION z(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_z_point';


--
-- Name: zmax(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION zmax(box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_zmax';


--
-- Name: zmflag(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION zmflag(geometry) RETURNS smallint
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_zmflag';


--
-- Name: zmin(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION zmin(box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_zmin';


--
-- Name: accum(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE accum(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_accum_finalfn
);


--
-- Name: collect(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE collect(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_collect_finalfn
);


--
-- Name: extent(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE extent(geometry) (
    SFUNC = public.st_combine_bbox,
    STYPE = box3d_extent
);


--
-- Name: extent3d(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE extent3d(geometry) (
    SFUNC = public.combine_bbox,
    STYPE = box3d
);


--
-- Name: makeline(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE makeline(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_makeline_finalfn
);


--
-- Name: memcollect(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE memcollect(geometry) (
    SFUNC = public.st_collect,
    STYPE = geometry
);


--
-- Name: memgeomunion(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE memgeomunion(geometry) (
    SFUNC = geomunion,
    STYPE = geometry
);


--
-- Name: polygonize(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE polygonize(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_polygonize_finalfn
);


--
-- Name: st_accum(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_accum(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_accum_finalfn
);


--
-- Name: st_collect(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_collect(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_collect_finalfn
);


--
-- Name: st_extent(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_extent(geometry) (
    SFUNC = public.st_combine_bbox,
    STYPE = box3d_extent
);


--
-- Name: st_extent3d(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_extent3d(geometry) (
    SFUNC = public.st_combine_bbox,
    STYPE = box3d
);


--
-- Name: st_makeline(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_makeline(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_makeline_finalfn
);


--
-- Name: st_memcollect(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_memcollect(geometry) (
    SFUNC = public.st_collect,
    STYPE = geometry
);


--
-- Name: st_memunion(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_memunion(geometry) (
    SFUNC = public.st_union,
    STYPE = geometry
);


--
-- Name: st_polygonize(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_polygonize(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_polygonize_finalfn
);


--
-- Name: st_union(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_union(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_union_finalfn
);


--
-- Name: &&; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR && (
    PROCEDURE = geometry_overlap,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = &&,
    RESTRICT = geometry_gist_sel,
    JOIN = geometry_gist_joinsel
);


--
-- Name: &&; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR && (
    PROCEDURE = geography_overlaps,
    LEFTARG = geography,
    RIGHTARG = geography,
    COMMUTATOR = &&,
    RESTRICT = geography_gist_selectivity,
    JOIN = geography_gist_join_selectivity
);


--
-- Name: &<; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR &< (
    PROCEDURE = geometry_overleft,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = &>,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


--
-- Name: &<|; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR &<| (
    PROCEDURE = geometry_overbelow,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = |&>,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


--
-- Name: &>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR &> (
    PROCEDURE = geometry_overright,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = &<,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


--
-- Name: <; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR < (
    PROCEDURE = geometry_lt,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- Name: <; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR < (
    PROCEDURE = geography_lt,
    LEFTARG = geography,
    RIGHTARG = geography,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- Name: <<; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR << (
    PROCEDURE = geometry_left,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = >>,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


--
-- Name: <<|; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <<| (
    PROCEDURE = geometry_below,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = |>>,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


--
-- Name: <=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <= (
    PROCEDURE = geometry_le,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- Name: <=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <= (
    PROCEDURE = geography_le,
    LEFTARG = geography,
    RIGHTARG = geography,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- Name: =; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR = (
    PROCEDURE = geometry_eq,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = =,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- Name: =; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR = (
    PROCEDURE = geography_eq,
    LEFTARG = geography,
    RIGHTARG = geography,
    COMMUTATOR = =,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- Name: >; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR > (
    PROCEDURE = geometry_gt,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- Name: >; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR > (
    PROCEDURE = geography_gt,
    LEFTARG = geography,
    RIGHTARG = geography,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- Name: >=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR >= (
    PROCEDURE = geometry_ge,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- Name: >=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR >= (
    PROCEDURE = geography_ge,
    LEFTARG = geography,
    RIGHTARG = geography,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- Name: >>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR >> (
    PROCEDURE = geometry_right,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = <<,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


--
-- Name: @; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR @ (
    PROCEDURE = geometry_contained,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = ~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- Name: |&>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR |&> (
    PROCEDURE = geometry_overabove,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = &<|,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


--
-- Name: |>>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR |>> (
    PROCEDURE = geometry_above,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = <<|,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


--
-- Name: ~; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ~ (
    PROCEDURE = geometry_contain,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = @,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- Name: ~=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ~= (
    PROCEDURE = geometry_samebox,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = ~=,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


--
-- Name: btree_geography_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS btree_geography_ops
    DEFAULT FOR TYPE geography USING btree AS
    OPERATOR 1 <(geography,geography) ,
    OPERATOR 2 <=(geography,geography) ,
    OPERATOR 3 =(geography,geography) ,
    OPERATOR 4 >=(geography,geography) ,
    OPERATOR 5 >(geography,geography) ,
    FUNCTION 1 geography_cmp(geography,geography);


--
-- Name: btree_geometry_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS btree_geometry_ops
    DEFAULT FOR TYPE geometry USING btree AS
    OPERATOR 1 <(geometry,geometry) ,
    OPERATOR 2 <=(geometry,geometry) ,
    OPERATOR 3 =(geometry,geometry) ,
    OPERATOR 4 >=(geometry,geometry) ,
    OPERATOR 5 >(geometry,geometry) ,
    FUNCTION 1 geometry_cmp(geometry,geometry);


--
-- Name: gist_geography_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_geography_ops
    DEFAULT FOR TYPE geography USING gist AS
    STORAGE gidx ,
    OPERATOR 3 &&(geography,geography) ,
    FUNCTION 1 geography_gist_consistent(internal,geometry,integer) ,
    FUNCTION 2 geography_gist_union(bytea,internal) ,
    FUNCTION 3 geography_gist_compress(internal) ,
    FUNCTION 4 geography_gist_decompress(internal) ,
    FUNCTION 5 geography_gist_penalty(internal,internal,internal) ,
    FUNCTION 6 geography_gist_picksplit(internal,internal) ,
    FUNCTION 7 geography_gist_same(box2d,box2d,internal);


--
-- Name: gist_geometry_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_geometry_ops
    DEFAULT FOR TYPE geometry USING gist AS
    STORAGE box2d ,
    OPERATOR 1 <<(geometry,geometry) ,
    OPERATOR 2 &<(geometry,geometry) ,
    OPERATOR 3 &&(geometry,geometry) ,
    OPERATOR 4 &>(geometry,geometry) ,
    OPERATOR 5 >>(geometry,geometry) ,
    OPERATOR 6 ~=(geometry,geometry) ,
    OPERATOR 7 ~(geometry,geometry) ,
    OPERATOR 8 @(geometry,geometry) ,
    OPERATOR 9 &<|(geometry,geometry) ,
    OPERATOR 10 <<|(geometry,geometry) ,
    OPERATOR 11 |>>(geometry,geometry) ,
    OPERATOR 12 |&>(geometry,geometry) ,
    FUNCTION 1 lwgeom_gist_consistent(internal,geometry,integer) ,
    FUNCTION 2 lwgeom_gist_union(bytea,internal) ,
    FUNCTION 3 lwgeom_gist_compress(internal) ,
    FUNCTION 4 lwgeom_gist_decompress(internal) ,
    FUNCTION 5 lwgeom_gist_penalty(internal,internal,internal) ,
    FUNCTION 6 lwgeom_gist_picksplit(internal,internal) ,
    FUNCTION 7 lwgeom_gist_same(box2d,box2d,internal);


SET search_path = pg_catalog;

--
-- Name: CAST (public.box2d AS public.box3d); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.box2d AS public.box3d) WITH FUNCTION public.box3d(public.box2d) AS IMPLICIT;


--
-- Name: CAST (public.box2d AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.box2d AS public.geometry) WITH FUNCTION public.geometry(public.box2d) AS IMPLICIT;


--
-- Name: CAST (public.box3d AS box); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.box3d AS box) WITH FUNCTION public.box(public.box3d) AS IMPLICIT;


--
-- Name: CAST (public.box3d AS public.box2d); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.box3d AS public.box2d) WITH FUNCTION public.box2d(public.box3d) AS IMPLICIT;


--
-- Name: CAST (public.box3d AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.box3d AS public.geometry) WITH FUNCTION public.geometry(public.box3d) AS IMPLICIT;


--
-- Name: CAST (public.box3d_extent AS public.box2d); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.box3d_extent AS public.box2d) WITH FUNCTION public.box2d(public.box3d_extent) AS IMPLICIT;


--
-- Name: CAST (public.box3d_extent AS public.box3d); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.box3d_extent AS public.box3d) WITH FUNCTION public.box3d_extent(public.box3d_extent) AS IMPLICIT;


--
-- Name: CAST (public.box3d_extent AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.box3d_extent AS public.geometry) WITH FUNCTION public.geometry(public.box3d_extent) AS IMPLICIT;


--
-- Name: CAST (bytea AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (bytea AS public.geometry) WITH FUNCTION public.geometry(bytea) AS IMPLICIT;


--
-- Name: CAST (public.chip AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.chip AS public.geometry) WITH FUNCTION public.geometry(public.chip) AS IMPLICIT;


--
-- Name: CAST (public.geography AS public.geography); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.geography AS public.geography) WITH FUNCTION public.geography(public.geography, integer, boolean) AS IMPLICIT;


--
-- Name: CAST (public.geography AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.geography AS public.geometry) WITH FUNCTION public.geometry(public.geography);


--
-- Name: CAST (public.geometry AS box); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.geometry AS box) WITH FUNCTION public.box(public.geometry) AS IMPLICIT;


--
-- Name: CAST (public.geometry AS public.box2d); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.geometry AS public.box2d) WITH FUNCTION public.box2d(public.geometry) AS IMPLICIT;


--
-- Name: CAST (public.geometry AS public.box3d); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.geometry AS public.box3d) WITH FUNCTION public.box3d(public.geometry) AS IMPLICIT;


--
-- Name: CAST (public.geometry AS bytea); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.geometry AS bytea) WITH FUNCTION public.bytea(public.geometry) AS IMPLICIT;


--
-- Name: CAST (public.geometry AS public.geography); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.geometry AS public.geography) WITH FUNCTION public.geography(public.geometry) AS IMPLICIT;


--
-- Name: CAST (public.geometry AS text); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.geometry AS text) WITH FUNCTION public.text(public.geometry) AS IMPLICIT;


--
-- Name: CAST (text AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (text AS public.geometry) WITH FUNCTION public.geometry(text) AS IMPLICIT;


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: admin_areas; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE admin_areas (
    id integer NOT NULL,
    code character varying(255),
    atco_code character varying(255),
    name text,
    short_name text,
    country character varying(255),
    "national" boolean,
    creation_datetime timestamp without time zone,
    modification_datetime timestamp without time zone,
    revision_number character varying(255),
    modification character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    region_id integer
);


--
-- Name: admin_areas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE admin_areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: admin_areas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE admin_areas_id_seq OWNED BY admin_areas.id;


--
-- Name: alternative_names; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE alternative_names (
    id integer NOT NULL,
    locality_id integer,
    creation_datetime timestamp without time zone,
    modification_datetime timestamp without time zone,
    revision_number character varying(255),
    modification character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    alternative_locality_id integer
);


--
-- Name: alternative_names_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE alternative_names_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: alternative_names_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE alternative_names_id_seq OWNED BY alternative_names.id;


--
-- Name: assignments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE assignments (
    id integer NOT NULL,
    user_id integer,
    campaign_id integer,
    task_id integer,
    status_code integer DEFAULT 0,
    data text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    task_type_name character varying(255),
    problem_id integer,
    creator_id integer
);


--
-- Name: assignments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE assignments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: assignments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE assignments_id_seq OWNED BY assignments.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE comments (
    id integer NOT NULL,
    user_id integer,
    text text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    user_name character varying(255),
    confirmed_at timestamp without time zone,
    status_code integer,
    token character varying(255),
    mark_fixed boolean,
    mark_open boolean,
    commented_type character varying(255),
    commented_id integer
);


--
-- Name: campaign_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE campaign_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: campaign_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE campaign_comments_id_seq OWNED BY comments.id;


--
-- Name: campaign_events; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE campaign_events (
    id integer NOT NULL,
    event_type character varying(255),
    campaign_id integer,
    described_type character varying(255),
    described_id integer,
    visible boolean DEFAULT false,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: campaign_events_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE campaign_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: campaign_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE campaign_events_id_seq OWNED BY campaign_events.id;


--
-- Name: campaign_supporters; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE campaign_supporters (
    id integer NOT NULL,
    campaign_id integer,
    supporter_id integer,
    confirmed_at timestamp without time zone,
    token text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: campaign_supporters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE campaign_supporters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: campaign_supporters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE campaign_supporters_id_seq OWNED BY campaign_supporters.id;


--
-- Name: campaign_updates; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE campaign_updates (
    id integer NOT NULL,
    campaign_id integer,
    incoming_message_id integer,
    user_id integer,
    text text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    sent_at timestamp without time zone,
    is_advice_request boolean,
    outgoing_message_id integer
);


--
-- Name: campaign_updates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE campaign_updates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: campaign_updates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE campaign_updates_id_seq OWNED BY campaign_updates.id;


--
-- Name: campaigns; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE campaigns (
    id integer NOT NULL,
    location_id integer,
    location_type character varying(255),
    title text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    description text,
    transport_mode_id integer,
    category character varying(255),
    token text,
    initiator_id integer,
    status_code integer,
    cached_slug character varying(255),
    subdomain character varying(255),
    confirmed_at timestamp without time zone,
    latest_event_at timestamp without time zone
);


--
-- Name: campaigns_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE campaigns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: campaigns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE campaigns_id_seq OWNED BY campaigns.id;


--
-- Name: council_contacts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE council_contacts (
    id integer NOT NULL,
    area_id integer,
    category character varying(255),
    email character varying(255),
    confirmed boolean,
    notes text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted boolean DEFAULT false NOT NULL,
    district_id integer
);


--
-- Name: council_contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE council_contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: council_contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE council_contacts_id_seq OWNED BY council_contacts.id;


--
-- Name: districts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE districts (
    id integer NOT NULL,
    code character varying(255),
    name text,
    admin_area_id integer,
    creation_datetime timestamp without time zone,
    modification_datetime timestamp without time zone,
    revision_number character varying(255),
    modification character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: districts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE districts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: districts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE districts_id_seq OWNED BY districts.id;


--
-- Name: geography_columns; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW geography_columns AS
    SELECT current_database() AS f_table_catalog, n.nspname AS f_table_schema, c.relname AS f_table_name, a.attname AS f_geography_column, geography_typmod_dims(a.atttypmod) AS coord_dimension, geography_typmod_srid(a.atttypmod) AS srid, geography_typmod_type(a.atttypmod) AS type FROM pg_class c, pg_attribute a, pg_type t, pg_namespace n WHERE ((((((t.typname = 'geography'::name) AND (a.attisdropped = false)) AND (a.atttypid = t.oid)) AND (a.attrelid = c.oid)) AND (c.relnamespace = n.oid)) AND (NOT pg_is_other_temp_schema(c.relnamespace)));


SET default_with_oids = true;

--
-- Name: geometry_columns; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE geometry_columns (
    f_table_catalog character varying(256) NOT NULL,
    f_table_schema character varying(256) NOT NULL,
    f_table_name character varying(256) NOT NULL,
    f_geometry_column character varying(256) NOT NULL,
    coord_dimension integer NOT NULL,
    srid integer NOT NULL,
    type character varying(30) NOT NULL
);


SET default_with_oids = false;

--
-- Name: incoming_messages; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE incoming_messages (
    id integer NOT NULL,
    subject text,
    campaign_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    raw_email_id integer,
    "from" character varying(255),
    main_body_text text,
    main_body_text_folded text
);


--
-- Name: incoming_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE incoming_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: incoming_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE incoming_messages_id_seq OWNED BY incoming_messages.id;


--
-- Name: journey_patterns; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE journey_patterns (
    id integer NOT NULL,
    route_id integer,
    destination character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: journey_patterns_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE journey_patterns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: journey_patterns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE journey_patterns_id_seq OWNED BY journey_patterns.id;


--
-- Name: load_run_completions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE load_run_completions (
    id integer NOT NULL,
    transport_mode_id integer,
    admin_area_id integer,
    load_type character varying(255),
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: load_run_completions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE load_run_completions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: load_run_completions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE load_run_completions_id_seq OWNED BY load_run_completions.id;


--
-- Name: localities; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE localities (
    id integer NOT NULL,
    code character varying(255),
    name text,
    short_name text,
    "national" boolean,
    creation_datetime timestamp without time zone,
    modification_datetime timestamp without time zone,
    revision_number character varying(255),
    modification character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    admin_area_id integer,
    qualifier_name character varying(255),
    source_locality_type character varying(255),
    grid_type character varying(255),
    northing double precision,
    easting double precision,
    coords geometry,
    district_id integer,
    cached_slug character varying(255),
    lat double precision,
    lon double precision,
    primary_metaphone character varying(255),
    secondary_metaphone character varying(255),
    CONSTRAINT enforce_dims_coords CHECK ((st_ndims(coords) = 2)),
    CONSTRAINT enforce_geotype_coords CHECK (((geometrytype(coords) = 'POINT'::text) OR (coords IS NULL))),
    CONSTRAINT enforce_srid_coords CHECK ((st_srid(coords) = 27700))
);


--
-- Name: localities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE localities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: localities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE localities_id_seq OWNED BY localities.id;


--
-- Name: locality_links; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE locality_links (
    id integer NOT NULL,
    ancestor_id integer,
    descendant_id integer,
    direct boolean,
    count integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: locality_links_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE locality_links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: locality_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE locality_links_id_seq OWNED BY locality_links.id;


--
-- Name: location_searches; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE location_searches (
    id integer NOT NULL,
    transport_mode_id integer,
    name character varying(255),
    area character varying(255),
    route_number character varying(255),
    location_type character varying(255),
    session_id character varying(255),
    events text,
    active boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    failed boolean,
    "from" character varying(255),
    "to" character varying(255)
);


--
-- Name: location_searches_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE location_searches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: location_searches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE location_searches_id_seq OWNED BY location_searches.id;


--
-- Name: operator_codes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE operator_codes (
    id integer NOT NULL,
    region_id integer,
    operator_id integer,
    code character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: operator_codes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE operator_codes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: operator_codes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE operator_codes_id_seq OWNED BY operator_codes.id;


--
-- Name: operator_contacts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE operator_contacts (
    id integer NOT NULL,
    operator_id integer,
    location_id integer,
    location_type character varying(255),
    category character varying(255),
    email character varying(255),
    confirmed boolean,
    notes character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted boolean DEFAULT false NOT NULL
);


--
-- Name: operator_contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE operator_contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: operator_contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE operator_contacts_id_seq OWNED BY operator_contacts.id;


--
-- Name: operators; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE operators (
    id integer NOT NULL,
    code character varying(255),
    name text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    short_name character varying(255),
    notes text,
    noc_code character varying(255),
    reference_name character varying(255),
    vosa_license_name character varying(255),
    parent character varying(255),
    vehicle_mode character varying(255),
    ultimate_parent character varying(255),
    transport_mode_id integer,
    company_no character varying(255),
    registered_address text,
    url text
);


--
-- Name: operators_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE operators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: operators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE operators_id_seq OWNED BY operators.id;


--
-- Name: outgoing_messages; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE outgoing_messages (
    id integer NOT NULL,
    campaign_id integer,
    status_code integer,
    author_id integer,
    body text,
    sent_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    recipient_id integer,
    recipient_type character varying(255),
    subject character varying(255),
    incoming_message_id integer,
    assignment_id integer
);


--
-- Name: outgoing_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE outgoing_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: outgoing_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE outgoing_messages_id_seq OWNED BY outgoing_messages.id;


--
-- Name: passenger_transport_executive_areas; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE passenger_transport_executive_areas (
    id integer NOT NULL,
    area_id integer,
    passenger_transport_executive_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: passenger_transport_executive_areas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE passenger_transport_executive_areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: passenger_transport_executive_areas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE passenger_transport_executive_areas_id_seq OWNED BY passenger_transport_executive_areas.id;


--
-- Name: passenger_transport_executives; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE passenger_transport_executives (
    id integer NOT NULL,
    name character varying(255),
    wikipedia_url character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    email text,
    email_confimed boolean,
    notes text
);


--
-- Name: passenger_transport_executives_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE passenger_transport_executives_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: passenger_transport_executives_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE passenger_transport_executives_id_seq OWNED BY passenger_transport_executives.id;


--
-- Name: problems; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE problems (
    id integer NOT NULL,
    subject text,
    description text,
    location_id integer,
    location_type character varying(255),
    transport_mode_id integer,
    token character varying(255),
    reporter_id integer,
    category character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    operator_id integer,
    sent_at timestamp without time zone,
    confirmed_at timestamp without time zone,
    status_code integer,
    council_info character varying(255),
    passenger_transport_executive_id integer,
    campaign_id integer,
    reporter_name character varying(255),
    reporter_phone character varying(255),
    "time" time without time zone,
    date date
);


--
-- Name: problems_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE problems_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: problems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE problems_id_seq OWNED BY problems.id;


--
-- Name: raw_emails; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE raw_emails (
    id integer NOT NULL,
    data_binary bytea,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: raw_emails_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE raw_emails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: raw_emails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE raw_emails_id_seq OWNED BY raw_emails.id;


--
-- Name: regions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE regions (
    id integer NOT NULL,
    code character varying(255),
    name text,
    creation_datetime timestamp without time zone,
    modification_datetime timestamp without time zone,
    revision_number character varying(255),
    modification character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    cached_slug character varying(255)
);


--
-- Name: regions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE regions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: regions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE regions_id_seq OWNED BY regions.id;


--
-- Name: route_localities; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE route_localities (
    id integer NOT NULL,
    locality_id integer,
    route_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: route_localities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE route_localities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: route_localities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE route_localities_id_seq OWNED BY route_localities.id;


--
-- Name: route_operators; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE route_operators (
    id integer NOT NULL,
    operator_id integer,
    route_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: route_operators_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE route_operators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: route_operators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE route_operators_id_seq OWNED BY route_operators.id;


--
-- Name: route_segments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE route_segments (
    id integer NOT NULL,
    from_stop_id integer,
    to_stop_id integer,
    from_terminus boolean DEFAULT false,
    to_terminus boolean DEFAULT false,
    route_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    from_stop_area_id integer,
    to_stop_area_id integer,
    journey_pattern_id integer,
    segment_order integer
);


--
-- Name: route_segments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE route_segments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: route_segments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE route_segments_id_seq OWNED BY route_segments.id;


--
-- Name: route_source_admin_areas; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE route_source_admin_areas (
    id integer NOT NULL,
    route_id integer,
    source_admin_area_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    operator_code character varying(255)
);


--
-- Name: route_source_admin_areas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE route_source_admin_areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: route_source_admin_areas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE route_source_admin_areas_id_seq OWNED BY route_source_admin_areas.id;


--
-- Name: route_sub_routes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE route_sub_routes (
    id integer NOT NULL,
    route_id integer,
    sub_route_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: route_sub_routes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE route_sub_routes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: route_sub_routes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE route_sub_routes_id_seq OWNED BY route_sub_routes.id;


--
-- Name: routes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE routes (
    id integer NOT NULL,
    transport_mode_id integer,
    number character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    type character varying(255),
    name character varying(255),
    region_id integer,
    cached_slug character varying(255),
    operator_code character varying(255),
    loaded boolean,
    lat double precision,
    lon double precision,
    cached_description text
);


--
-- Name: routes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE routes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: routes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE routes_id_seq OWNED BY routes.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: sent_emails; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sent_emails (
    id integer NOT NULL,
    campaign_id integer,
    campaign_update_id integer,
    recipient_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    problem_id integer,
    recipient_type character varying(255),
    outgoing_message_id integer
);


--
-- Name: sent_emails_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sent_emails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: sent_emails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sent_emails_id_seq OWNED BY sent_emails.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sessions (
    id integer NOT NULL,
    session_id character varying(255) NOT NULL,
    data text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sessions_id_seq OWNED BY sessions.id;


--
-- Name: slugs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE slugs (
    id integer NOT NULL,
    name character varying(255),
    sluggable_id integer,
    sequence integer DEFAULT 1 NOT NULL,
    sluggable_type character varying(40),
    scope character varying(255),
    created_at timestamp without time zone
);


--
-- Name: slugs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE slugs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: slugs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE slugs_id_seq OWNED BY slugs.id;


--
-- Name: spatial_ref_sys; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spatial_ref_sys (
    srid integer NOT NULL,
    auth_name character varying(256),
    auth_srid integer,
    srtext character varying(2048),
    proj4text character varying(2048)
);


--
-- Name: stop_area_links; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE stop_area_links (
    id integer NOT NULL,
    ancestor_id integer,
    descendant_id integer,
    direct boolean,
    count integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: stop_area_links_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE stop_area_links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: stop_area_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE stop_area_links_id_seq OWNED BY stop_area_links.id;


--
-- Name: stop_area_memberships; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE stop_area_memberships (
    id integer NOT NULL,
    stop_id integer,
    stop_area_id integer,
    creation_datetime timestamp without time zone,
    modification_datetime timestamp without time zone,
    revision_number integer,
    modification character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: stop_area_memberships_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE stop_area_memberships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: stop_area_memberships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE stop_area_memberships_id_seq OWNED BY stop_area_memberships.id;


--
-- Name: stop_area_operators; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE stop_area_operators (
    id integer NOT NULL,
    stop_area_id integer,
    operator_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: stop_area_operators_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE stop_area_operators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: stop_area_operators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE stop_area_operators_id_seq OWNED BY stop_area_operators.id;


--
-- Name: stop_area_types; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE stop_area_types (
    id integer NOT NULL,
    code character varying(255),
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: stop_area_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE stop_area_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: stop_area_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE stop_area_types_id_seq OWNED BY stop_area_types.id;


--
-- Name: stop_areas; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE stop_areas (
    id integer NOT NULL,
    code character varying(255),
    name text,
    administrative_area_code character varying(255),
    area_type character varying(255),
    grid_type character varying(255),
    easting double precision,
    northing double precision,
    creation_datetime timestamp without time zone,
    modification_datetime timestamp without time zone,
    revision_number integer,
    modification character varying(255),
    status character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    coords geometry,
    lon double precision,
    lat double precision,
    locality_id integer,
    loaded boolean,
    primary_metaphone character varying(255),
    secondary_metaphone character varying(255),
    CONSTRAINT enforce_dims_coords CHECK ((st_ndims(coords) = 2)),
    CONSTRAINT enforce_geotype_coords CHECK (((geometrytype(coords) = 'POINT'::text) OR (coords IS NULL))),
    CONSTRAINT enforce_srid_coords CHECK ((st_srid(coords) = 27700))
);


--
-- Name: stop_areas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE stop_areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: stop_areas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE stop_areas_id_seq OWNED BY stop_areas.id;


--
-- Name: stop_types; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE stop_types (
    id integer NOT NULL,
    code character varying(255),
    description character varying(255),
    on_street boolean,
    point_type character varying(255),
    version double precision,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    sub_type character varying(255)
);


--
-- Name: stop_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE stop_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: stop_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE stop_types_id_seq OWNED BY stop_types.id;


--
-- Name: stops; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE stops (
    id integer NOT NULL,
    atco_code character varying(255),
    naptan_code character varying(255),
    plate_code character varying(255),
    common_name text,
    short_common_name text,
    landmark text,
    street text,
    crossing text,
    indicator text,
    bearing character varying(255),
    town character varying(255),
    suburb character varying(255),
    locality_centre boolean,
    grid_type character varying(255),
    easting double precision,
    northing double precision,
    lon double precision,
    lat double precision,
    stop_type character varying(255),
    bus_stop_type character varying(255),
    administrative_area_code character varying(255),
    creation_datetime timestamp without time zone,
    modification_datetime timestamp without time zone,
    revision_number integer,
    modification character varying(255),
    status character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    coords geometry,
    locality_id integer,
    cached_slug character varying(255),
    loaded boolean,
    tiploc_code character varying(255),
    crs_code character varying(255),
    metro_stop boolean DEFAULT false,
    generation_high integer,
    generation_low integer,
    other_code character varying(255),
    CONSTRAINT enforce_dims_coords CHECK ((st_ndims(coords) = 2)),
    CONSTRAINT enforce_geotype_coords CHECK (((geometrytype(coords) = 'POINT'::text) OR (coords IS NULL))),
    CONSTRAINT enforce_srid_coords CHECK ((st_srid(coords) = 27700))
);


--
-- Name: stops_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE stops_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: stops_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE stops_id_seq OWNED BY stops.id;


--
-- Name: stories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE stories (
    id integer NOT NULL,
    title text,
    story text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    reporter_id integer,
    stop_area_id integer,
    location_id integer,
    location_type character varying(255),
    transport_mode_id integer,
    confirmed boolean DEFAULT false,
    token text,
    category character varying(255)
);


--
-- Name: stories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE stories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: stories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE stories_id_seq OWNED BY stories.id;


--
-- Name: sub_routes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sub_routes (
    id integer NOT NULL,
    from_station_id integer,
    to_station_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    transport_mode_id integer
);


--
-- Name: sub_routes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sub_routes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: sub_routes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sub_routes_id_seq OWNED BY sub_routes.id;


--
-- Name: transport_mode_stop_area_types; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE transport_mode_stop_area_types (
    id integer NOT NULL,
    transport_mode_id integer,
    stop_area_type_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: transport_mode_stop_area_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE transport_mode_stop_area_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: transport_mode_stop_area_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE transport_mode_stop_area_types_id_seq OWNED BY transport_mode_stop_area_types.id;


--
-- Name: transport_mode_stop_types; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE transport_mode_stop_types (
    id integer NOT NULL,
    transport_mode_id integer,
    stop_type_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: transport_mode_stop_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE transport_mode_stop_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: transport_mode_stop_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE transport_mode_stop_types_id_seq OWNED BY transport_mode_stop_types.id;


--
-- Name: transport_modes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE transport_modes (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    naptan_name character varying(255),
    active boolean,
    route_type character varying(255)
);


--
-- Name: transport_modes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE transport_modes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: transport_modes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE transport_modes_id_seq OWNED BY transport_modes.id;


--
-- Name: updates; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE updates (
    id integer NOT NULL,
    problem_id integer,
    reporter_id integer,
    text text,
    confirmed_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    mark_fixed boolean,
    mark_open boolean,
    token character varying(255),
    status_code integer,
    reporter_name character varying(255)
);


--
-- Name: updates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE updates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: updates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE updates_id_seq OWNED BY updates.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    name character varying(255),
    email character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    wants_fmt_updates boolean,
    phone character varying(255),
    crypted_password character varying(255),
    password_salt character varying(255),
    persistence_token character varying(255),
    login_count integer DEFAULT 0 NOT NULL,
    failed_login_count integer DEFAULT 0 NOT NULL,
    last_request_at timestamp without time zone,
    current_login_at timestamp without time zone,
    last_login_at timestamp without time zone,
    registered boolean DEFAULT false NOT NULL,
    email_local_part character varying(255),
    is_expert boolean,
    perishable_token character varying(255) DEFAULT ''::character varying NOT NULL,
    profile_photo_file_name character varying(255),
    profile_photo_content_type character varying(255),
    profile_photo_file_size integer,
    profile_photo_updated_at timestamp without time zone
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: versions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE versions (
    id integer NOT NULL,
    item_type character varying(255) NOT NULL,
    item_id integer NOT NULL,
    event character varying(255) NOT NULL,
    whodunnit character varying(255),
    object text,
    created_at timestamp without time zone
);


--
-- Name: versions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE versions_id_seq OWNED BY versions.id;


--
-- Name: vosa_licenses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE vosa_licenses (
    id integer NOT NULL,
    operator_id integer,
    number character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: vosa_licenses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE vosa_licenses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: vosa_licenses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE vosa_licenses_id_seq OWNED BY vosa_licenses.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE admin_areas ALTER COLUMN id SET DEFAULT nextval('admin_areas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE alternative_names ALTER COLUMN id SET DEFAULT nextval('alternative_names_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE assignments ALTER COLUMN id SET DEFAULT nextval('assignments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE campaign_events ALTER COLUMN id SET DEFAULT nextval('campaign_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE campaign_supporters ALTER COLUMN id SET DEFAULT nextval('campaign_supporters_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE campaign_updates ALTER COLUMN id SET DEFAULT nextval('campaign_updates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE campaigns ALTER COLUMN id SET DEFAULT nextval('campaigns_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE comments ALTER COLUMN id SET DEFAULT nextval('campaign_comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE council_contacts ALTER COLUMN id SET DEFAULT nextval('council_contacts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE districts ALTER COLUMN id SET DEFAULT nextval('districts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE incoming_messages ALTER COLUMN id SET DEFAULT nextval('incoming_messages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE journey_patterns ALTER COLUMN id SET DEFAULT nextval('journey_patterns_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE load_run_completions ALTER COLUMN id SET DEFAULT nextval('load_run_completions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE localities ALTER COLUMN id SET DEFAULT nextval('localities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE locality_links ALTER COLUMN id SET DEFAULT nextval('locality_links_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE location_searches ALTER COLUMN id SET DEFAULT nextval('location_searches_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE operator_codes ALTER COLUMN id SET DEFAULT nextval('operator_codes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE operator_contacts ALTER COLUMN id SET DEFAULT nextval('operator_contacts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE operators ALTER COLUMN id SET DEFAULT nextval('operators_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE outgoing_messages ALTER COLUMN id SET DEFAULT nextval('outgoing_messages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE passenger_transport_executive_areas ALTER COLUMN id SET DEFAULT nextval('passenger_transport_executive_areas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE passenger_transport_executives ALTER COLUMN id SET DEFAULT nextval('passenger_transport_executives_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE problems ALTER COLUMN id SET DEFAULT nextval('problems_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE raw_emails ALTER COLUMN id SET DEFAULT nextval('raw_emails_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE regions ALTER COLUMN id SET DEFAULT nextval('regions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE route_localities ALTER COLUMN id SET DEFAULT nextval('route_localities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE route_operators ALTER COLUMN id SET DEFAULT nextval('route_operators_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE route_segments ALTER COLUMN id SET DEFAULT nextval('route_segments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE route_source_admin_areas ALTER COLUMN id SET DEFAULT nextval('route_source_admin_areas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE route_sub_routes ALTER COLUMN id SET DEFAULT nextval('route_sub_routes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE routes ALTER COLUMN id SET DEFAULT nextval('routes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE sent_emails ALTER COLUMN id SET DEFAULT nextval('sent_emails_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE sessions ALTER COLUMN id SET DEFAULT nextval('sessions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE slugs ALTER COLUMN id SET DEFAULT nextval('slugs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE stop_area_links ALTER COLUMN id SET DEFAULT nextval('stop_area_links_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE stop_area_memberships ALTER COLUMN id SET DEFAULT nextval('stop_area_memberships_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE stop_area_operators ALTER COLUMN id SET DEFAULT nextval('stop_area_operators_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE stop_area_types ALTER COLUMN id SET DEFAULT nextval('stop_area_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE stop_areas ALTER COLUMN id SET DEFAULT nextval('stop_areas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE stop_types ALTER COLUMN id SET DEFAULT nextval('stop_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE stops ALTER COLUMN id SET DEFAULT nextval('stops_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE stories ALTER COLUMN id SET DEFAULT nextval('stories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE sub_routes ALTER COLUMN id SET DEFAULT nextval('sub_routes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE transport_mode_stop_area_types ALTER COLUMN id SET DEFAULT nextval('transport_mode_stop_area_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE transport_mode_stop_types ALTER COLUMN id SET DEFAULT nextval('transport_mode_stop_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE transport_modes ALTER COLUMN id SET DEFAULT nextval('transport_modes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE updates ALTER COLUMN id SET DEFAULT nextval('updates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE versions ALTER COLUMN id SET DEFAULT nextval('versions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE vosa_licenses ALTER COLUMN id SET DEFAULT nextval('vosa_licenses_id_seq'::regclass);


--
-- Name: admin_areas_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY admin_areas
    ADD CONSTRAINT admin_areas_pkey PRIMARY KEY (id);


--
-- Name: alternative_names_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY alternative_names
    ADD CONSTRAINT alternative_names_pkey PRIMARY KEY (id);


--
-- Name: assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY assignments
    ADD CONSTRAINT assignments_pkey PRIMARY KEY (id);


--
-- Name: campaign_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT campaign_comments_pkey PRIMARY KEY (id);


--
-- Name: campaign_events_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY campaign_events
    ADD CONSTRAINT campaign_events_pkey PRIMARY KEY (id);


--
-- Name: campaign_supporters_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY campaign_supporters
    ADD CONSTRAINT campaign_supporters_pkey PRIMARY KEY (id);


--
-- Name: campaign_updates_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY campaign_updates
    ADD CONSTRAINT campaign_updates_pkey PRIMARY KEY (id);


--
-- Name: campaigns_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY campaigns
    ADD CONSTRAINT campaigns_pkey PRIMARY KEY (id);


--
-- Name: council_contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY council_contacts
    ADD CONSTRAINT council_contacts_pkey PRIMARY KEY (id);


--
-- Name: districts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY districts
    ADD CONSTRAINT districts_pkey PRIMARY KEY (id);


--
-- Name: geometry_columns_pk; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY geometry_columns
    ADD CONSTRAINT geometry_columns_pk PRIMARY KEY (f_table_catalog, f_table_schema, f_table_name, f_geometry_column);


--
-- Name: incoming_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY incoming_messages
    ADD CONSTRAINT incoming_messages_pkey PRIMARY KEY (id);


--
-- Name: journey_patterns_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY journey_patterns
    ADD CONSTRAINT journey_patterns_pkey PRIMARY KEY (id);


--
-- Name: load_run_completions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY load_run_completions
    ADD CONSTRAINT load_run_completions_pkey PRIMARY KEY (id);


--
-- Name: localities_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY localities
    ADD CONSTRAINT localities_pkey PRIMARY KEY (id);


--
-- Name: locality_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY locality_links
    ADD CONSTRAINT locality_links_pkey PRIMARY KEY (id);


--
-- Name: location_searches_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY location_searches
    ADD CONSTRAINT location_searches_pkey PRIMARY KEY (id);


--
-- Name: operator_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY operator_codes
    ADD CONSTRAINT operator_codes_pkey PRIMARY KEY (id);


--
-- Name: operator_contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY operator_contacts
    ADD CONSTRAINT operator_contacts_pkey PRIMARY KEY (id);


--
-- Name: operators_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY operators
    ADD CONSTRAINT operators_pkey PRIMARY KEY (id);


--
-- Name: outgoing_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY outgoing_messages
    ADD CONSTRAINT outgoing_messages_pkey PRIMARY KEY (id);


--
-- Name: passenger_transport_executive_areas_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY passenger_transport_executive_areas
    ADD CONSTRAINT passenger_transport_executive_areas_pkey PRIMARY KEY (id);


--
-- Name: passenger_transport_executives_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY passenger_transport_executives
    ADD CONSTRAINT passenger_transport_executives_pkey PRIMARY KEY (id);


--
-- Name: problems_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY stories
    ADD CONSTRAINT problems_pkey PRIMARY KEY (id);


--
-- Name: problems_pkey1; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY problems
    ADD CONSTRAINT problems_pkey1 PRIMARY KEY (id);


--
-- Name: raw_emails_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY raw_emails
    ADD CONSTRAINT raw_emails_pkey PRIMARY KEY (id);


--
-- Name: regions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (id);


--
-- Name: route_localities_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY route_localities
    ADD CONSTRAINT route_localities_pkey PRIMARY KEY (id);


--
-- Name: route_operators_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY route_operators
    ADD CONSTRAINT route_operators_pkey PRIMARY KEY (id);


--
-- Name: route_segments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY route_segments
    ADD CONSTRAINT route_segments_pkey PRIMARY KEY (id);


--
-- Name: route_source_admin_areas_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY route_source_admin_areas
    ADD CONSTRAINT route_source_admin_areas_pkey PRIMARY KEY (id);


--
-- Name: route_sub_routes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY route_sub_routes
    ADD CONSTRAINT route_sub_routes_pkey PRIMARY KEY (id);


--
-- Name: routes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY routes
    ADD CONSTRAINT routes_pkey PRIMARY KEY (id);


--
-- Name: sent_emails_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sent_emails
    ADD CONSTRAINT sent_emails_pkey PRIMARY KEY (id);


--
-- Name: sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: slugs_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY slugs
    ADD CONSTRAINT slugs_pkey PRIMARY KEY (id);


--
-- Name: spatial_ref_sys_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spatial_ref_sys
    ADD CONSTRAINT spatial_ref_sys_pkey PRIMARY KEY (srid);


--
-- Name: stop_area_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY stop_area_links
    ADD CONSTRAINT stop_area_links_pkey PRIMARY KEY (id);


--
-- Name: stop_area_memberships_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY stop_area_memberships
    ADD CONSTRAINT stop_area_memberships_pkey PRIMARY KEY (id);


--
-- Name: stop_area_operators_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY stop_area_operators
    ADD CONSTRAINT stop_area_operators_pkey PRIMARY KEY (id);


--
-- Name: stop_area_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY stop_area_types
    ADD CONSTRAINT stop_area_types_pkey PRIMARY KEY (id);


--
-- Name: stop_areas_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY stop_areas
    ADD CONSTRAINT stop_areas_pkey PRIMARY KEY (id);


--
-- Name: stop_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY stop_types
    ADD CONSTRAINT stop_types_pkey PRIMARY KEY (id);


--
-- Name: stops_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY stops
    ADD CONSTRAINT stops_pkey PRIMARY KEY (id);


--
-- Name: sub_routes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sub_routes
    ADD CONSTRAINT sub_routes_pkey PRIMARY KEY (id);


--
-- Name: transport_mode_stop_area_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY transport_mode_stop_area_types
    ADD CONSTRAINT transport_mode_stop_area_types_pkey PRIMARY KEY (id);


--
-- Name: transport_mode_stop_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY transport_mode_stop_types
    ADD CONSTRAINT transport_mode_stop_types_pkey PRIMARY KEY (id);


--
-- Name: transport_modes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY transport_modes
    ADD CONSTRAINT transport_modes_pkey PRIMARY KEY (id);


--
-- Name: updates_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY updates
    ADD CONSTRAINT updates_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: versions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY versions
    ADD CONSTRAINT versions_pkey PRIMARY KEY (id);


--
-- Name: vosa_licenses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY vosa_licenses
    ADD CONSTRAINT vosa_licenses_pkey PRIMARY KEY (id);


--
-- Name: index_admin_areas_on_name_lower; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_admin_areas_on_name_lower ON admin_areas USING btree (lower(name));


--
-- Name: index_campaigns_on_cached_slug; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_campaigns_on_cached_slug ON campaigns USING btree (cached_slug);


--
-- Name: index_campaigns_on_subdomain; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_campaigns_on_subdomain ON campaigns USING btree (subdomain);


--
-- Name: index_campaigns_on_subdomain_lower; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_campaigns_on_subdomain_lower ON campaigns USING btree (lower((subdomain)::text));


--
-- Name: index_districts_on_name_lower; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_districts_on_name_lower ON districts USING btree (lower(name));


--
-- Name: index_localities_on_cached_slug; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_localities_on_cached_slug ON localities USING btree (cached_slug);


--
-- Name: index_localities_on_coords; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_localities_on_coords ON localities USING gist (coords);


--
-- Name: index_localities_on_name_lower; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_localities_on_name_lower ON localities USING btree (lower(name));


--
-- Name: index_localities_on_primary_metaphone; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_localities_on_primary_metaphone ON localities USING btree (primary_metaphone);


--
-- Name: index_localities_on_secondary_metaphone; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_localities_on_secondary_metaphone ON localities USING btree (secondary_metaphone);


--
-- Name: index_locality_links_on_ancestor_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_locality_links_on_ancestor_id ON locality_links USING btree (ancestor_id);


--
-- Name: index_locality_links_on_descendant_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_locality_links_on_descendant_id ON locality_links USING btree (descendant_id);


--
-- Name: index_regions_on_cached_slug; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_regions_on_cached_slug ON regions USING btree (cached_slug);


--
-- Name: index_regions_on_name_lower; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_regions_on_name_lower ON regions USING btree (lower(name));


--
-- Name: index_route_localities_on_locality_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_route_localities_on_locality_id ON route_localities USING btree (locality_id);


--
-- Name: index_route_localities_on_route_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_route_localities_on_route_id ON route_localities USING btree (route_id);


--
-- Name: index_route_operators_on_operator_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_route_operators_on_operator_id ON route_operators USING btree (operator_id);


--
-- Name: index_route_operators_on_route_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_route_operators_on_route_id ON route_operators USING btree (route_id);


--
-- Name: index_route_segments_on_from_stop_area_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_route_segments_on_from_stop_area_id ON route_segments USING btree (from_stop_area_id);


--
-- Name: index_route_segments_on_from_stop_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_route_segments_on_from_stop_id ON route_segments USING btree (from_stop_id);


--
-- Name: index_route_segments_on_journey_pattern_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_route_segments_on_journey_pattern_id ON route_segments USING btree (journey_pattern_id);


--
-- Name: index_route_segments_on_route_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_route_segments_on_route_id ON route_segments USING btree (route_id);


--
-- Name: index_route_segments_on_to_stop_area_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_route_segments_on_to_stop_area_id ON route_segments USING btree (to_stop_area_id);


--
-- Name: index_route_segments_on_to_stop_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_route_segments_on_to_stop_id ON route_segments USING btree (to_stop_id);


--
-- Name: index_route_source_admin_areas_on_route_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_route_source_admin_areas_on_route_id ON route_source_admin_areas USING btree (route_id);


--
-- Name: index_route_source_admin_areas_on_source_admin_area_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_route_source_admin_areas_on_source_admin_area_id ON route_source_admin_areas USING btree (source_admin_area_id);


--
-- Name: index_routes_on_cached_slug; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_routes_on_cached_slug ON routes USING btree (cached_slug);


--
-- Name: index_routes_on_name_lower; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_routes_on_name_lower ON routes USING btree (lower((name)::text));


--
-- Name: index_routes_on_number; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_routes_on_number ON routes USING btree (number);


--
-- Name: index_routes_on_number_lower; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_routes_on_number_lower ON routes USING btree (lower((number)::text));


--
-- Name: index_routes_on_operator_code; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_routes_on_operator_code ON routes USING btree (operator_code);


--
-- Name: index_routes_on_region_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_routes_on_region_id ON routes USING btree (region_id);


--
-- Name: index_routes_on_transport_mode_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_routes_on_transport_mode_id ON routes USING btree (transport_mode_id);


--
-- Name: index_routes_on_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_routes_on_type ON routes USING btree (type);


--
-- Name: index_sessions_on_session_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_sessions_on_session_id ON sessions USING btree (session_id);


--
-- Name: index_sessions_on_updated_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_sessions_on_updated_at ON sessions USING btree (updated_at);


--
-- Name: index_slugs_on_n_s_s_and_s; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_slugs_on_n_s_s_and_s ON slugs USING btree (name, sluggable_type, sequence, scope);


--
-- Name: index_slugs_on_sluggable_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_slugs_on_sluggable_id ON slugs USING btree (sluggable_id);


--
-- Name: index_slugs_on_sluggable_id_and_sluggable_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_slugs_on_sluggable_id_and_sluggable_type ON slugs USING btree (sluggable_id, sluggable_type);


--
-- Name: index_stop_area_memberships_on_stop_area_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_stop_area_memberships_on_stop_area_id ON stop_area_memberships USING btree (stop_area_id);


--
-- Name: index_stop_area_memberships_on_stop_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_stop_area_memberships_on_stop_id ON stop_area_memberships USING btree (stop_id);


--
-- Name: index_stop_areas_on_code_lower; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_stop_areas_on_code_lower ON stop_areas USING btree (lower((code)::text));


--
-- Name: index_stop_areas_on_coords; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_stop_areas_on_coords ON stop_areas USING gist (coords);


--
-- Name: index_stop_areas_on_locality_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_stop_areas_on_locality_id ON stop_areas USING btree (locality_id);


--
-- Name: index_stop_areas_on_primary_metaphone; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_stop_areas_on_primary_metaphone ON stop_areas USING btree (primary_metaphone);


--
-- Name: index_stop_areas_on_secondary_metaphone; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_stop_areas_on_secondary_metaphone ON stop_areas USING btree (secondary_metaphone);


--
-- Name: index_stops_on_atco_code_lower; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_stops_on_atco_code_lower ON stops USING btree (lower((atco_code)::text));


--
-- Name: index_stops_on_cached_slug; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_stops_on_cached_slug ON stops USING btree (cached_slug);


--
-- Name: index_stops_on_common_name_lower; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_stops_on_common_name_lower ON stops USING btree (lower(common_name));


--
-- Name: index_stops_on_coords; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_stops_on_coords ON stops USING gist (coords);


--
-- Name: index_stops_on_crs_code; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_stops_on_crs_code ON stops USING btree (crs_code);


--
-- Name: index_stops_on_locality_and_stop_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_stops_on_locality_and_stop_type ON stops USING btree (locality_id, stop_type);


--
-- Name: index_stops_on_locality_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_stops_on_locality_id ON stops USING btree (locality_id);


--
-- Name: index_stops_on_metro_stop; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_stops_on_metro_stop ON stops USING btree (metro_stop);


--
-- Name: index_stops_on_naptan_code; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_stops_on_naptan_code ON stops USING btree (naptan_code);


--
-- Name: index_stops_on_other_code_lower; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_stops_on_other_code_lower ON stops USING btree (lower((other_code)::text));


--
-- Name: index_stops_on_stop_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_stops_on_stop_type ON stops USING btree (stop_type);


--
-- Name: index_stops_on_street_lower; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_stops_on_street_lower ON stops USING btree (lower(street));


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_perishable_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_perishable_token ON users USING btree (perishable_token);


--
-- Name: index_versions_on_item_type_and_item_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_versions_on_item_type_and_item_id ON versions USING btree (item_type, item_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: problems_reporter_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stories
    ADD CONSTRAINT problems_reporter_id_fk FOREIGN KEY (reporter_id) REFERENCES users(id) ON DELETE SET NULL;


--
-- Name: route_operators_operator_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY route_operators
    ADD CONSTRAINT route_operators_operator_id_fk FOREIGN KEY (operator_id) REFERENCES operators(id) ON DELETE SET NULL;


--
-- Name: route_operators_route_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY route_operators
    ADD CONSTRAINT route_operators_route_id_fk FOREIGN KEY (route_id) REFERENCES routes(id) ON DELETE SET NULL;


--
-- Name: routes_transport_mode_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY routes
    ADD CONSTRAINT routes_transport_mode_id_fk FOREIGN KEY (transport_mode_id) REFERENCES transport_modes(id) ON DELETE SET NULL;


--
-- Name: stop_area_memberships_stop_area_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stop_area_memberships
    ADD CONSTRAINT stop_area_memberships_stop_area_id_fk FOREIGN KEY (stop_area_id) REFERENCES stop_areas(id);


--
-- Name: stop_area_memberships_stop_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stop_area_memberships
    ADD CONSTRAINT stop_area_memberships_stop_id_fk FOREIGN KEY (stop_id) REFERENCES stops(id);


--
-- Name: transport_mode_stop_area_types_transport_mode_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY transport_mode_stop_area_types
    ADD CONSTRAINT transport_mode_stop_area_types_transport_mode_id_fk FOREIGN KEY (transport_mode_id) REFERENCES transport_modes(id);


--
-- Name: transport_mode_stop_types_stop_type_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY transport_mode_stop_types
    ADD CONSTRAINT transport_mode_stop_types_stop_type_id_fk FOREIGN KEY (stop_type_id) REFERENCES stop_types(id) ON DELETE SET NULL;


--
-- Name: transport_mode_stop_types_transport_mode_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY transport_mode_stop_types
    ADD CONSTRAINT transport_mode_stop_types_transport_mode_id_fk FOREIGN KEY (transport_mode_id) REFERENCES transport_modes(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

INSERT INTO schema_migrations (version) VALUES ('20100407110848');

INSERT INTO schema_migrations (version) VALUES ('20100407171321');

INSERT INTO schema_migrations (version) VALUES ('20100408111344');

INSERT INTO schema_migrations (version) VALUES ('20100408120352');

INSERT INTO schema_migrations (version) VALUES ('20100408150322');

INSERT INTO schema_migrations (version) VALUES ('20100408151525');

INSERT INTO schema_migrations (version) VALUES ('20100408155400');

INSERT INTO schema_migrations (version) VALUES ('20100408164042');

INSERT INTO schema_migrations (version) VALUES ('20100408173847');

INSERT INTO schema_migrations (version) VALUES ('20100413102606');

INSERT INTO schema_migrations (version) VALUES ('20100413110049');

INSERT INTO schema_migrations (version) VALUES ('20100413110304');

INSERT INTO schema_migrations (version) VALUES ('20100413135447');

INSERT INTO schema_migrations (version) VALUES ('20100414104049');

INSERT INTO schema_migrations (version) VALUES ('20100414154754');

INSERT INTO schema_migrations (version) VALUES ('20100414171320');

INSERT INTO schema_migrations (version) VALUES ('20100414172905');

INSERT INTO schema_migrations (version) VALUES ('20100415135241');

INSERT INTO schema_migrations (version) VALUES ('20100415183707');

INSERT INTO schema_migrations (version) VALUES ('20100419121920');

INSERT INTO schema_migrations (version) VALUES ('20100419160210');

INSERT INTO schema_migrations (version) VALUES ('20100419161650');

INSERT INTO schema_migrations (version) VALUES ('20100420093013');

INSERT INTO schema_migrations (version) VALUES ('20100420093220');

INSERT INTO schema_migrations (version) VALUES ('20100420093248');

INSERT INTO schema_migrations (version) VALUES ('20100420101658');

INSERT INTO schema_migrations (version) VALUES ('20100420102749');

INSERT INTO schema_migrations (version) VALUES ('20100420143048');

INSERT INTO schema_migrations (version) VALUES ('20100420165342');

INSERT INTO schema_migrations (version) VALUES ('20100427114647');

INSERT INTO schema_migrations (version) VALUES ('20100427141606');

INSERT INTO schema_migrations (version) VALUES ('20100429100501');

INSERT INTO schema_migrations (version) VALUES ('20100429101323');

INSERT INTO schema_migrations (version) VALUES ('20100429102737');

INSERT INTO schema_migrations (version) VALUES ('20100429120538');

INSERT INTO schema_migrations (version) VALUES ('20100504144559');

INSERT INTO schema_migrations (version) VALUES ('20100504145237');

INSERT INTO schema_migrations (version) VALUES ('20100504150644');

INSERT INTO schema_migrations (version) VALUES ('20100504162509');

INSERT INTO schema_migrations (version) VALUES ('20100505095124');

INSERT INTO schema_migrations (version) VALUES ('20100505100610');

INSERT INTO schema_migrations (version) VALUES ('20100506101504');

INSERT INTO schema_migrations (version) VALUES ('20100506142256');

INSERT INTO schema_migrations (version) VALUES ('20100506155545');

INSERT INTO schema_migrations (version) VALUES ('20100506162135');

INSERT INTO schema_migrations (version) VALUES ('20100506163145');

INSERT INTO schema_migrations (version) VALUES ('20100506164920');

INSERT INTO schema_migrations (version) VALUES ('20100506165758');

INSERT INTO schema_migrations (version) VALUES ('20100506170309');

INSERT INTO schema_migrations (version) VALUES ('20100506172553');

INSERT INTO schema_migrations (version) VALUES ('20100506175112');

INSERT INTO schema_migrations (version) VALUES ('20100506183319');

INSERT INTO schema_migrations (version) VALUES ('20100510102901');

INSERT INTO schema_migrations (version) VALUES ('20100510111400');

INSERT INTO schema_migrations (version) VALUES ('20100510114218');

INSERT INTO schema_migrations (version) VALUES ('20100510115509');

INSERT INTO schema_migrations (version) VALUES ('20100510121957');

INSERT INTO schema_migrations (version) VALUES ('20100524094930');

INSERT INTO schema_migrations (version) VALUES ('20100527144838');

INSERT INTO schema_migrations (version) VALUES ('20100527144955');

INSERT INTO schema_migrations (version) VALUES ('20100531140834');

INSERT INTO schema_migrations (version) VALUES ('20100602162053');

INSERT INTO schema_migrations (version) VALUES ('20100603100029');

INSERT INTO schema_migrations (version) VALUES ('20100603114458');

INSERT INTO schema_migrations (version) VALUES ('20100603115538');

INSERT INTO schema_migrations (version) VALUES ('20100603121637');

INSERT INTO schema_migrations (version) VALUES ('20100603134827');

INSERT INTO schema_migrations (version) VALUES ('20100607150411');

INSERT INTO schema_migrations (version) VALUES ('20100607162521');

INSERT INTO schema_migrations (version) VALUES ('20100610153811');

INSERT INTO schema_migrations (version) VALUES ('20100610170152');

INSERT INTO schema_migrations (version) VALUES ('20100614082940');

INSERT INTO schema_migrations (version) VALUES ('20100617100003');

INSERT INTO schema_migrations (version) VALUES ('20100617102228');

INSERT INTO schema_migrations (version) VALUES ('20100617103702');

INSERT INTO schema_migrations (version) VALUES ('20100617140830');

INSERT INTO schema_migrations (version) VALUES ('20100617171032');

INSERT INTO schema_migrations (version) VALUES ('20100617171322');

INSERT INTO schema_migrations (version) VALUES ('20100623095334');

INSERT INTO schema_migrations (version) VALUES ('20100623103808');

INSERT INTO schema_migrations (version) VALUES ('20100623134404');

INSERT INTO schema_migrations (version) VALUES ('20100623145916');

INSERT INTO schema_migrations (version) VALUES ('20100624124129');

INSERT INTO schema_migrations (version) VALUES ('20100624172249');

INSERT INTO schema_migrations (version) VALUES ('20100625151820');

INSERT INTO schema_migrations (version) VALUES ('20100629120403');

INSERT INTO schema_migrations (version) VALUES ('20100706102840');

INSERT INTO schema_migrations (version) VALUES ('20100707152350');

INSERT INTO schema_migrations (version) VALUES ('20100720134338');

INSERT INTO schema_migrations (version) VALUES ('20100720140351');

INSERT INTO schema_migrations (version) VALUES ('20100720140904');

INSERT INTO schema_migrations (version) VALUES ('20100720141621');

INSERT INTO schema_migrations (version) VALUES ('20100720145524');

INSERT INTO schema_migrations (version) VALUES ('20100720145907');

INSERT INTO schema_migrations (version) VALUES ('20100803142257');

INSERT INTO schema_migrations (version) VALUES ('20100803154356');

INSERT INTO schema_migrations (version) VALUES ('20100804100334');

INSERT INTO schema_migrations (version) VALUES ('20100809111322');

INSERT INTO schema_migrations (version) VALUES ('20100809133511');

INSERT INTO schema_migrations (version) VALUES ('20100809133812');

INSERT INTO schema_migrations (version) VALUES ('20100810091356');

INSERT INTO schema_migrations (version) VALUES ('20100810130315');

INSERT INTO schema_migrations (version) VALUES ('20100810145722');

INSERT INTO schema_migrations (version) VALUES ('20100810145820');

INSERT INTO schema_migrations (version) VALUES ('20100810151538');

INSERT INTO schema_migrations (version) VALUES ('20100812085502');

INSERT INTO schema_migrations (version) VALUES ('20100812092529');

INSERT INTO schema_migrations (version) VALUES ('20100812100034');

INSERT INTO schema_migrations (version) VALUES ('20100816111840');

INSERT INTO schema_migrations (version) VALUES ('20100816132514');

INSERT INTO schema_migrations (version) VALUES ('20100816141213');

INSERT INTO schema_migrations (version) VALUES ('20100817082005');

INSERT INTO schema_migrations (version) VALUES ('20100817110650');

INSERT INTO schema_migrations (version) VALUES ('20100817114704');

INSERT INTO schema_migrations (version) VALUES ('20100817140829');

INSERT INTO schema_migrations (version) VALUES ('20100817140854');

INSERT INTO schema_migrations (version) VALUES ('20100817193816');

INSERT INTO schema_migrations (version) VALUES ('20100817193959');

INSERT INTO schema_migrations (version) VALUES ('20100819101900');

INSERT INTO schema_migrations (version) VALUES ('20100823093742');

INSERT INTO schema_migrations (version) VALUES ('20100823094838');

INSERT INTO schema_migrations (version) VALUES ('20100823142846');

INSERT INTO schema_migrations (version) VALUES ('20100823151351');

INSERT INTO schema_migrations (version) VALUES ('20100824093701');

INSERT INTO schema_migrations (version) VALUES ('20100824121124');

INSERT INTO schema_migrations (version) VALUES ('20100824135124');

INSERT INTO schema_migrations (version) VALUES ('20100826111651');

INSERT INTO schema_migrations (version) VALUES ('20100831125027');

INSERT INTO schema_migrations (version) VALUES ('20100901122501');

INSERT INTO schema_migrations (version) VALUES ('20100910132651');

INSERT INTO schema_migrations (version) VALUES ('20100921140256');

INSERT INTO schema_migrations (version) VALUES ('20100922103819');

INSERT INTO schema_migrations (version) VALUES ('20100922142112');

INSERT INTO schema_migrations (version) VALUES ('20100922142818');

INSERT INTO schema_migrations (version) VALUES ('20101004162227');

INSERT INTO schema_migrations (version) VALUES ('20101005143539');

INSERT INTO schema_migrations (version) VALUES ('20101005170106');

INSERT INTO schema_migrations (version) VALUES ('20101006152608');

INSERT INTO schema_migrations (version) VALUES ('20101006154957');

INSERT INTO schema_migrations (version) VALUES ('20101006173754');

INSERT INTO schema_migrations (version) VALUES ('20101007090303');

INSERT INTO schema_migrations (version) VALUES ('20101020152126');

INSERT INTO schema_migrations (version) VALUES ('20101025171152');

INSERT INTO schema_migrations (version) VALUES ('20101025181456');

INSERT INTO schema_migrations (version) VALUES ('20101028154945');

INSERT INTO schema_migrations (version) VALUES ('20101028155048');

INSERT INTO schema_migrations (version) VALUES ('20101101110913');

INSERT INTO schema_migrations (version) VALUES ('20101108134714');

INSERT INTO schema_migrations (version) VALUES ('20101110173157');

INSERT INTO schema_migrations (version) VALUES ('20101110173300');

INSERT INTO schema_migrations (version) VALUES ('20101110173541');

INSERT INTO schema_migrations (version) VALUES ('20101111080848');

INSERT INTO schema_migrations (version) VALUES ('20101114163758');

INSERT INTO schema_migrations (version) VALUES ('20101114165116');

INSERT INTO schema_migrations (version) VALUES ('20101115143827');

INSERT INTO schema_migrations (version) VALUES ('20101116113825');

INSERT INTO schema_migrations (version) VALUES ('20101117102058');

INSERT INTO schema_migrations (version) VALUES ('20101117113427');

INSERT INTO schema_migrations (version) VALUES ('20101122124148');

INSERT INTO schema_migrations (version) VALUES ('20101123113410');

INSERT INTO schema_migrations (version) VALUES ('20101123124656');

INSERT INTO schema_migrations (version) VALUES ('20101123134846');

INSERT INTO schema_migrations (version) VALUES ('20101123152735');

INSERT INTO schema_migrations (version) VALUES ('20101123162926');

INSERT INTO schema_migrations (version) VALUES ('20101124104158');

INSERT INTO schema_migrations (version) VALUES ('20101125100624');

INSERT INTO schema_migrations (version) VALUES ('20101130093116');

INSERT INTO schema_migrations (version) VALUES ('20101130170949');

INSERT INTO schema_migrations (version) VALUES ('20101201102200');

INSERT INTO schema_migrations (version) VALUES ('20101201131411');

INSERT INTO schema_migrations (version) VALUES ('20101202130704');

INSERT INTO schema_migrations (version) VALUES ('20101202130852');

INSERT INTO schema_migrations (version) VALUES ('20101206083042');

INSERT INTO schema_migrations (version) VALUES ('20101206162550');

INSERT INTO schema_migrations (version) VALUES ('20101207132710');

INSERT INTO schema_migrations (version) VALUES ('20101207143408');

INSERT INTO schema_migrations (version) VALUES ('20101208084526');

INSERT INTO schema_migrations (version) VALUES ('20101208085140');

INSERT INTO schema_migrations (version) VALUES ('20101208170943');

INSERT INTO schema_migrations (version) VALUES ('20101209103633');

INSERT INTO schema_migrations (version) VALUES ('20101214163049');

INSERT INTO schema_migrations (version) VALUES ('20101215151724');

INSERT INTO schema_migrations (version) VALUES ('20101215153223');

INSERT INTO schema_migrations (version) VALUES ('20101215180659');

INSERT INTO schema_migrations (version) VALUES ('20101216111549');

INSERT INTO schema_migrations (version) VALUES ('20101216183304');

INSERT INTO schema_migrations (version) VALUES ('20101221103609');

INSERT INTO schema_migrations (version) VALUES ('20101221124301');

INSERT INTO schema_migrations (version) VALUES ('20101221150154');

INSERT INTO schema_migrations (version) VALUES ('20110125172044');

INSERT INTO schema_migrations (version) VALUES ('20110208195934');

INSERT INTO schema_migrations (version) VALUES ('20110209121521');

INSERT INTO schema_migrations (version) VALUES ('20110209193129');

INSERT INTO schema_migrations (version) VALUES ('20110210151320');

INSERT INTO schema_migrations (version) VALUES ('20110223105145');

INSERT INTO schema_migrations (version) VALUES ('20110302161101');

INSERT INTO schema_migrations (version) VALUES ('20110309102438');

INSERT INTO schema_migrations (version) VALUES ('20110309141414');

INSERT INTO schema_migrations (version) VALUES ('20110310130119');

INSERT INTO schema_migrations (version) VALUES ('20110310182250');

INSERT INTO schema_migrations (version) VALUES ('20110314185100');

INSERT INTO schema_migrations (version) VALUES ('20110323140249');

INSERT INTO schema_migrations (version) VALUES ('20110323170738');

INSERT INTO schema_migrations (version) VALUES ('20110505103809');