INSTALL iceberg;

LOAD iceberg;

.mode trash

CREATE SECRET iceberg_secret (
    TYPE ICEBERG,
    TOKEN '$TOKEN'
);

.mode table

ATTACH 'redpanda_catalog' AS iceberg_catalog (
  TYPE iceberg,
  SECRET 'iceberg_secret',
  ENDPOINT '$POLARIS_ENDPOINT'
);

SET s3_endpoint='$MINIO_ENDPOINT';
SET s3_use_ssl='false';
SET s3_access_key_id='admin';
SET s3_secret_access_key='pOwtMoJBEN';
SET s3_region='dummy-region';
SET s3_url_style='path';
