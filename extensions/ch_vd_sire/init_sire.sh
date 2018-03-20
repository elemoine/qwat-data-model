#!/usr/bin/env bash

GNUGETOPT="getopt"
if [[ "$OSTYPE" =~ FreeBSD* ]] || [[ "$OSTYPE" =~ darwin* ]]; then
  GNUGETOPT="/usr/local/bin/getopt"
elif [[ "$OSTYPE" =~ openbsd* ]]; then
  GNUGETOPT="gnugetopt"
fi

# Exit on error
set -e

usage() {
cat << EOF
Usage: $0 [options]

-p|--pgservice       PG service to connect to the database.
-s|--srid            PostGIS SRID. Default to 21781 (ch1903)
-d|--drop-schema     Drop schema (cascaded) if it exists
EOF
}

ARGS=$(${GNUGETOPT} -o p:s:d -l "pgservice:,srid:,drop-schema" -- "$@");
if [[ $? -ne 0 ]]
then
  usage
  exit 1
fi

eval set -- "$ARGS";

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Default values
SRID=21781
DROPSCHEMA=0

while true; do
  case "$1" in
    -p|--pgservice)
      shift
      if [[ -n "$1" ]]
      then
        PGSERVICE=$1
        shift
      fi
      ;;
    -s|--srid)
      shift;
      if [ -n "$1" ]; then
        SRID=$1
        shift;
      fi
      ;;
    -d|--drop-schema)
      DROPSCHEMA=1
      shift;
      ;;
    --)
      shift
      break
      ;;
  esac
done

if [[ -z $PGSERVICE ]]
then
  echo "Error: no PG service provided"
  exit 1
fi

if [[ "$DROPSCHEMA" -eq 1 ]]; then
	psql service=${PGSERVICE} -v ON_ERROR_STOP=1 \
         -c "DROP SCHEMA IF EXISTS qwat_ch_vd_sire CASCADE"
fi

psql service=$PGSERVICE -v ON_ERROR_STOP=1 -c "CREATE SCHEMA IF NOT EXISTS qwat_ch_vd_sire"
psql service=$PGSERVICE -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/sire_columns.sql

QWAT_REPO=$(git rev-parse --show-toplevel)
QWAT_VIEWS=${QWAT_REPO}/ordinary_data/views

PGSERVICE=${PGSERVICE} SRID=${SRID} ${QWAT_VIEWS}/rewrite_views.sh
PGSERVICE=${PGSERVICE} SRID=${SRID} ${DIR}/insert_views.sh

exit 0
