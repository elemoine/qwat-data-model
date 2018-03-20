

-- add extra fields to qwat_od tables

ALTER TABLE qwat_od.pipe ADD COLUMN IF NOT EXISTS qwat_ext_ch_vd_sire_etat_exploitation smallint;
ALTER TABLE qwat_od.pipe ADD COLUMN IF NOT EXISTS qwat_ext_ch_vd_sire_adesafecter smallint;
ALTER TABLE qwat_od.pipe ADD COLUMN IF NOT EXISTS qwat_ext_ch_vd_sire_diametre double precision;
ALTER TABLE qwat_od.pipe ADD COLUMN IF NOT EXISTS qwat_ext_ch_vd_sire_remarque text;

ALTER TABLE qwat_od.network_element ADD COLUMN IF NOT EXISTS qwat_ext_ch_vd_sire_etat_exploitation smallint;
ALTER TABLE qwat_od.network_element ADD COLUMN IF NOT EXISTS qwat_ext_ch_vd_sire_adesafecter smallint;
ALTER TABLE qwat_od.network_element ADD COLUMN IF NOT EXISTS qwat_ext_ch_vd_sire_remarque text;

ALTER TABLE qwat_od.valve ADD COLUMN IF NOT EXISTS qwat_ext_ch_vd_sire_etat_exploitation smallint;
ALTER TABLE qwat_od.valve ADD COLUMN IF NOT EXISTS qwat_ext_ch_vd_sire_remarque text;
ALTER TABLE qwat_od.valve ADD COLUMN IF NOT EXISTS qwat_ext_ch_vd_sire_adesafecter smallint;
