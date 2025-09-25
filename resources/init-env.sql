INSTALL iceberg;

LOAD iceberg;

.mode trash

CREATE SECRET iceberg_secret (
    TYPE ICEBERG,
    TOKEN 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJwb2xhcmlzIiwic3ViIjoiNDcwMjE3NDM3Nzc5OTIwMDk4OSIsImlhdCI6MTc1ODgzNDcwNSwiZXhwIjoxNzU4ODM4MzA1LCJqdGkiOiI1YmZhMzE3OC0wOTI0LTQwYTAtODQ1YS04MTczMjRmNmNjZDEiLCJhY3RpdmUiOnRydWUsImNsaWVudF9pZCI6InJvb3QiLCJwcmluY2lwYWxJZCI6NDcwMjE3NDM3Nzc5OTIwMDk4OSwic2NvcGUiOiJQUklOQ0lQQUxfUk9MRTpBTEwifQ.FZl8GFnFC1eapL39RhZl_98n7VRNvC0Yojf5eD8snkO_1daAVy_kgtNkJIvnoWDb0WlRPOGa4Pj-0ir2P0cZb7__LnF2EyJnMtr6lBtsLbF88rdNfm0vDudYsaCicHqLve-tuOjEQuQsqraG9oLuYko95bhh0oyGpjcIOmOehfe7hcrTwJmrwq59iKYowq6WHwXiWh9eqKxnwfn5V0jIqBzOo1n73ugUSlMn8c6rzKHm9zP3mxCtaaViJdnuckRatFM844vZaG02nORY58GGdMeHB1zc6I1-0d95dji8j9c3yfzDkj9VAfslVssXAASx0snsoqHD6U6ZTLPq8Tg05w'
);

.mode table

ATTACH 'redpanda_catalog' AS iceberg_catalog (
  TYPE iceberg,
  SECRET 'iceberg_secret',
  ENDPOINT 'http://polaris.polaris.svc.cluster.local:8181/api/catalog'
);

SET s3_endpoint='local-minio.minio.svc.cluster.local:9000';
SET s3_use_ssl='false';
SET s3_access_key_id='admin';
SET s3_secret_access_key='pOwtMoJBEN';
SET s3_region='dummy-region';
SET s3_url_style='path';
