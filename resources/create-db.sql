create database polaris;
create user polaris with password 'polaris123';
grant connect on database polaris to polaris;
\c polaris
create schema polaris authorization polaris;
grant all privileges on schema polaris to polaris;
grant all on database polaris to polaris;