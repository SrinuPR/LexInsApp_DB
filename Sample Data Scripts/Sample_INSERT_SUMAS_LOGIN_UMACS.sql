INSERT INTO `lis_sumas`
(`SUBSCRIBER_ID`,
`SUBSCRIBER_NAME`,
`SUBSCRIBER_ADDRESS`,
`CREATED_TIMESTAMP`,
`CREATED_BY`,
`UPDATED_TIMESTAMP`,
`UPDATED_BY`)
VALUES
(12345,
'Srinu',
'Kadapa',
sysdate(),
'Srinu',
null,
null);


INSERT INTO `lis_umacs`
(`USER_ID`,
`SUBSCRIBER_ID`,
`USER_NAME`,
`OLD_PASSWORD2`,
`OLD_PASSWORD1`,
`ACTIVE_PASSWORD`,
`CREATED_TIMESTAMP`,
`CREATED_BY`,
`UPDATED_TIMESTAMP`,
`UPDATED_BY`,
`IS_ACTIVE`,
`USER_TYPE_ID`)
VALUES
('Srinu123',
12345,
'SrinuReddy',
'Srinu123',
'Srinu123',
'Srinu123',
sysdate(),
'Srinu',
null,
null,
'Y',
NULL);

INSERT INTO `lis_login`
(`login_id`,
`SUBSCRIBER_ID`,
`password`,
`created_timestamp`,
`created_by`,
`updated_timestamp`,
`updated_by`,
`USER_ID`)
VALUES
(111,
12345,
'JXCnMnnIa480b3N3jTO24w==',
sysdate(),
'Srinu',
null,
null,
'Srinu123');



INSERT INTO `lis_cmdcs`
(
 `cmdcs_id`,
`COMP_PROD_DRAW_NUM`,
`CUST_NAME_ADDR`,
`COMP_PROD_NAME`,
`COMP_PROD_NUM`,
`COMP_PROD_MATERIAL`,
`COMP_PROD_MANUFAC_UNITS`,
`COMP_PROD_NOTES`,
`CREATED_TIMESTAMP`,
`CREATED_BY`,
`UPDATED_TIMESTAMP`,
`UPDATED_BY`,
`SUBSCRIBER_ID`,
`USER_ID`,
`IS_ACTIVE`,
`SUBSCRIBER_NAME`
)
VALUES
(111,
'draw first',
'us -7567',
'prod name',
'prod num',
'prod',
'units',
'notes',
sysdate(),
'Srinu123',
null,
null,
12345,
'Srinu123',
'Y',
'Srinu');


