
/*-----------------------------SPRINT 1----------------------------*/

/*SUMAS*/


CREATE TABLE `lis_sumas` (
  `SUBSCRIBER_ID` int(5) NOT NULL,
  `SUBSCRIBER_NAME` varchar(150) NOT NULL,
  `SUBSCRIBER_ADDRESS` varchar(250) DEFAULT NULL,
  `CREATED_TIMESTAMP` timestamp NOT NULL,
  `CREATED_BY` varchar(50) NOT NULL,
  `UPDATED_TIMESTAMP` timestamp NULL DEFAULT NULL,
  `UPDATED_BY` varchar(50) DEFAULT NULL,
  `IS_ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`SUBSCRIBER_ID`)
) ;


/*UTMCS*/


CREATE TABLE `lis_utmcs` (
  `USER_TYPE_ID` int(3) NOT NULL,
  `USER_TYPE_NAME` varchar(30) NOT NULL,
  `CREATED_TIMESTAMP` timestamp NOT NULL,
  `CREATED_BY` varchar(50) NOT NULL,
  `UPDATED_TIMESTAMP` timestamp NULL DEFAULT NULL,
  `UPDATED_BY` varchar(50) DEFAULT NULL,
  `SUBSCRIBER_ID` int(5) NOT NULL,
  `IS_ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`USER_TYPE_ID`),
  CONSTRAINT `lis_utmcs_ibfk_1` FOREIGN KEY (`SUBSCRIBER_ID`) REFERENCES `lis_sumas` (`subscriber_id`)
) ;



/*UMACS*/



CREATE TABLE `lis_umacs` (
  `USER_ID` varchar(10) NOT NULL,
  `SUBSCRIBER_ID` int(5) NOT NULL,
  `USER_NAME` varchar(20) NOT NULL,
  `OLD_PASSWORD2` varchar(100) DEFAULT NULL,
  `OLD_PASSWORD1` varchar(100) DEFAULT NULL,
  `ACTIVE_PASSWORD` varchar(100) NOT NULL,
  `CREATED_TIMESTAMP` timestamp NOT NULL,
  `CREATED_BY` varchar(50) NOT NULL,
  `UPDATED_TIMESTAMP` timestamp NULL DEFAULT NULL,
  `UPDATED_BY` varchar(50) DEFAULT NULL,
  `IS_ACTIVE` char(1) NOT NULL,
  `USER_TYPE_ID` int(3) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  CONSTRAINT `lis_umacs_ibfk_1` FOREIGN KEY (`SUBSCRIBER_ID`) REFERENCES `lis_sumas` (`subscriber_id`)
);


/*LOGIN*/



CREATE TABLE `lis_login` (
  `LOGIN_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SUBSCRIBER_ID` int(5) NOT NULL,
  `PASSWORD` varchar(100) NOT NULL,
  `CREATED_TIMESTAMP` timestamp NOT NULL,
  `CREATED_BY` varchar(50) NOT NULL,
  `UPDATED_TIMESTAMP` timestamp NULL DEFAULT NULL,
  `UPDATED_BY` varchar(50) DEFAULT NULL,
  `USER_ID` varchar(10) NOT NULL,
  `IS_ACTIVE` CHAR(1) DEFAULT 'Y',
  PRIMARY KEY (`LOGIN_ID`),
  CONSTRAINT `lis_login_ibfk_1` FOREIGN KEY (`SUBSCRIBER_ID`) REFERENCES `lis_sumas` (`subscriber_id`),
  CONSTRAINT `lis_login_ibfk_2` FOREIGN KEY (`USER_ID`) REFERENCES `lis_umacs` (`user_id`)
) ;



/*CMDCS*/

CREATE TABLE `lis_cmdcs` (
  `CMDCS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `COMP_PROD_DRAW_NUM` varchar(50) NOT NULL,
  `CUST_NAME_ADDR` varchar(250) NOT NULL,
  `COMP_PROD_NAME` varchar(50) NOT NULL,
  `COMP_PROD_NUM` varchar(50) NOT NULL,
  `COMP_PROD_MATERIAL` varchar(50) NOT NULL,
  `COMP_PROD_MANUFAC_UNITS` varchar(5) NOT NULL,
  `COMP_PROD_NOTES` varchar(250) DEFAULT NULL,
  `CREATED_TIMESTAMP` varchar(50) NOT NULL,
  `CREATED_BY` varchar(50) NOT NULL,
  `UPDATED_TIMESTAMP` timestamp NULL DEFAULT NULL,
  `UPDATED_BY` varchar(50) DEFAULT NULL,
  `IS_ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `SUBSCRIBER_ID` int(5) NOT NULL,
  `USER_ID` varchar(10) NOT NULL,
  PRIMARY KEY (`COMP_PROD_DRAW_NUM`),
  UNIQUE KEY(`CMDCS_ID`),
  CONSTRAINT `lis_CMDCS_ibfk_1` FOREIGN KEY (`SUBSCRIBER_ID`) REFERENCES `lis_sumas` (`subscriber_id`),
  CONSTRAINT `lis_CMDCS_ibfk_2` FOREIGN KEY (`USER_ID`) REFERENCES `lis_umacs` (`user_id`)
);

  

  /*CPMCS*/



CREATE TABLE `lis_cpmcs` (
  `customer_po_id` int(11) NOT NULL AUTO_INCREMENT,
  `SUBSCRIBER_ID` int(5) NOT NULL,
  `USER_ID` varchar(10) NOT NULL,
  `customerpo_number` VARCHAR(30) NOT NULL,
  `customerpo_date` timestamp NOT NULL,
  `customerpo_quantity` int(5) NOT NULL,
  `notes_po` varchar(250) DEFAULT NULL,
  `created_timestamp` timestamp NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `updated_timestamp` timestamp NULL DEFAULT NULL,
  `UPDATED_BY` varchar(50) DEFAULT NULL,
  `COMP_PROD_DRAW_NUM` varchar(50) NOT NULL,
  `IS_ACTIVE` CHAR(1) DEFAULT 'Y',
  PRIMARY KEY (`customerpo_number`),
  UNIQUE KEY (`customer_po_id`),
  CONSTRAINT `lis_CPMCS_ibfk_1`  FOREIGN KEY (`USER_ID`) REFERENCES `lis_umacs` (`user_id`),
  CONSTRAINT `lis_CPMCS_ibfk_2`  FOREIGN KEY (`SUBSCRIBER_ID`) REFERENCES `lis_sumas` (`subscriber_id`),
  CONSTRAINT `lis_CPMCS_ibfk_3` FOREIGN KEY (`COMP_PROD_DRAW_NUM`) REFERENCES `lis_cmdcs` (`COMP_PROD_DRAW_NUM`)
);
  

/*---------------------SPRINT 2---------------------------*/

/*ITMCS*/


CREATE TABLE `lis_itmcs` (
  `INSPECTION_TYPE_ID` int(5) NOT NULL,
  `SUBSCRIBER_ID` int(5) NOT NULL,
  `INSPECTION_TYPE_NAME` varchar(150) NOT NULL,
  `CREATED_TIMESTAMP` timestamp NOT NULL,
  `CREATED_BY` varchar(50) NOT NULL,
  `UPDATED_TIMESTAMP` timestamp NULL DEFAULT NULL,
  `UPDATED_BY` varchar(50) DEFAULT NULL,
  `IS_ACTIVE` CHAR(1) DEFAULT 'Y',
  PRIMARY KEY (`INSPECTION_TYPE_ID`),
  CONSTRAINT `lis_itmcs_ibfk_1` FOREIGN KEY (`SUBSCRIBER_ID`) REFERENCES `lis_sumas` (`SUBSCRIBER_ID`)  
) ;


/*ISMCS*/


CREATE TABLE `lis_ismcs` (
  `INSPECTION_STAGE_ID` int(5) NOT NULL,
  `SUBSCRIBER_ID` int(5) NOT NULL,
  `INSPECTION_STAGE_NAME` varchar(150) NOT NULL,
  `CREATED_TIMESTAMP` timestamp NOT NULL,
  `CREATED_BY` varchar(50) NOT NULL,
  `UPDATED_TIMESTAMP` timestamp NULL DEFAULT NULL,
  `UPDATED_BY` varchar(50) DEFAULT NULL,
  `IS_ACTIVE` CHAR(1) DEFAULT 'Y',
  PRIMARY KEY (`INSPECTION_STAGE_ID`),
  CONSTRAINT `lis_ismcs_ibfk_1` FOREIGN KEY (`SUBSCRIBER_ID`) REFERENCES `lis_sumas` (`SUBSCRIBER_ID`)  
) ;


/*FMACS*/



CREATE TABLE `lis_fmacs` (
  `FACILITY_NUMBER` varchar(10) NOT NULL,
  `SUBSCRIBER_ID` int(5) NOT NULL,
  `FACILITY_NAME` varchar(150) NOT NULL,
  `CREATED_TIMESTAMP` timestamp NOT NULL,
  `CREATED_BY` varchar(50) NOT NULL,
  `UPDATED_TIMESTAMP` timestamp NULL DEFAULT NULL,
  `UPDATED_BY` varchar(50) DEFAULT NULL,
  `IS_ACTIVE` CHAR(1) DEFAULT 'Y',
  PRIMARY KEY (`FACILITY_NUMBER`),
  CONSTRAINT `lis_fmacs_ibfk_1` FOREIGN KEY (`SUBSCRIBER_ID`) REFERENCES `lis_sumas` (`SUBSCRIBER_ID`)  
) ;



/*SHMCS*/


CREATE TABLE `lis_shmcs` (
  `SHIFT_ID` varchar(10) NOT NULL,
  `SUBSCRIBER_ID` int(5) NOT NULL,
  `SHIFT_NAME` varchar(150) NOT NULL,
  `CREATED_TIMESTAMP` timestamp NOT NULL,
  `CREATED_BY` varchar(50) NOT NULL,
  `UPDATED_TIMESTAMP` timestamp NULL DEFAULT NULL,
  `UPDATED_BY` varchar(50) DEFAULT NULL,
  `IS_ACTIVE` CHAR(1) DEFAULT 'Y',
  PRIMARY KEY (`SHIFT_ID`),
  CONSTRAINT `lis_shmcs_ibfk_1` FOREIGN KEY (`SUBSCRIBER_ID`) REFERENCES `lis_sumas` (`SUBSCRIBER_ID`)  
) ;


/*WOMCS*/

CREATE TABLE `LIS_WOMCS`(

  `WORK_ORDER_JOB_NUM` VARCHAR(30) NOT NULL,
  `SUBSCRIBER_ID` INT(5) NOT NULL,
  `COMP_PROD_DRAW_NUM` varchar(50) NOT NULL,
  `CREATED_TIMESTAMP` timestamp NOT NULL,
  `CREATED_BY` varchar(50) NOT NULL,
  `UPDATED_TIMESTAMP` timestamp NULL DEFAULT NULL,
  `UPDATED_BY` varchar(50) DEFAULT NULL,
  `customerpo_number` VARCHAR(30) NOT NULL,
   `WORK_JOB_ORDER_DATE` DATE, 
  `LOT_NUMBER` VARCHAR(10) NOT NULL,
   `LOT_SIZE` INT(5) NOT NULL,
   `LOT_SIZE_UNITS` INT(5) NOT NULL,
   `MANUFACTURING_BATCH_NUM` VARCHAR(30) NOT NULL ,
   `MANUFACTURING_BATCH_SIZE` INT(5) NOT NULL,
   `NOTES` VARCHAR(250) ,
   `IS_ACTIVE` CHAR(1) DEFAULT 'Y',
  PRIMARY KEY(`WORK_ORDER_JOB_NUM`),
  CONSTRAINT `lis_WOMCS_ibfk_1` FOREIGN KEY (`customerpo_number`) REFERENCES `lis_CPMCS` (`customerpo_number`),
  CONSTRAINT `lis_WOMCS_ibfk_2` FOREIGN KEY (`SUBSCRIBER_ID`) REFERENCES `LIS_SUMAS`(`SUBSCRIBER_ID`),
  CONSTRAINT `lis_WOMCS_ibfk_3`FOREIGN KEY (`COMP_PROD_DRAW_NUM`) REFERENCES `lis_cmdcs` (`COMP_PROD_DRAW_NUM`)

);

/*--------------------SPRINT 3-------------------------*/


/*INMDC*/

CREATE TABLE `lis_inmdc` (
  `INSPECTION_ID` int(10) NOT NULL  AUTO_INCREMENT,
  `SUBSCRIBER_ID` int(5) NOT NULL,
  `COMP_PROD_DRAW_NUM` varchar(50) NOT NULL,
  `COMPONENT_NAME` varchar(50) NOT NULL,
  `COMPONENT_NUM` varchar(50) NOT NULL,
  `COMPONENT_MATERIAL` varchar(50) NOT NULL,
  `COMPONENT_NOTES` varchar(250) NOT NULL,
  `INSPECTION_TYPE_ID` int(10) NOT NULL,
  `INSPECTION_STAGE_ID` int(5) NOT NULL,
  `CREATED_TIMESTAMP` timestamp NOT NULL,
  `CREATED_BY` varchar(50) NOT NULL,
  `UPDATED_TIMESTAMP` timestamp NULL DEFAULT NULL,
  `UPDATED_BY` varchar(50) DEFAULT NULL,
  `IS_ACTIVE` CHAR(1) DEFAULT 'Y',
  PRIMARY KEY (`INSPECTION_ID`),
  CONSTRAINT `lis_inmdc_ibfk_1` FOREIGN KEY (`SUBSCRIBER_ID`) REFERENCES `lis_sumas` (`SUBSCRIBER_ID`),
  CONSTRAINT `lis_inmdc_ibfk_2` FOREIGN KEY (`COMP_PROD_DRAW_NUM`) REFERENCES `lis_cmdcs` (`COMP_PROD_DRAW_NUM`)
) ;


/*ILIMC*/

CREATE TABLE `LIS_ILIMC` (
 `SUBSCRIBER_ID` INT(5) NOT NULL ,
 `INSPECTION_LINE_ID` INT(11) NOT NULL  AUTO_INCREMENT,
  PRIMARY KEY (`INSPECTION_LINE_ID`),
  `INSPECTION_ID` int(10) NOT NULL,
  `COMP_PROD_DRAW_NUM` varchar(50) NOT NULL,
   `MEASUREMENT_NAME`  VARCHAR(50) NOT NULL,
   `BASE_MEASUREMENT`  VARCHAR(5) NOT NULL,
   `BASE_MEASUREMENT_UNITS`  VARCHAR(5) NOT NULL ,
   `UPPER_LIMIT`  NUMERIC(8) NOT NULL,
   `IS_ACTIVE` CHAR(1) DEFAULT 'Y',
   `LOWER_LIMIT`  NUMERIC(8) NOT NULL, 
  CONSTRAINT `lis_ILIMC_ibfk_1` FOREIGN KEY (`INSPECTION_ID`)REFERENCES `lis_inmdc` (`INSPECTION_ID`),
  CONSTRAINT `lis_ILIMC_ibfk_2` FOREIGN KEY (`SUBSCRIBER_ID`) REFERENCES `lis_sumas` (`SUBSCRIBER_ID`),
  CONSTRAINT `lis_ILIMC_ibfk_3` FOREIGN KEY (`COMP_PROD_DRAW_NUM`) REFERENCES `lis_cmdcs` (`COMP_PROD_DRAW_NUM`)
)
  
  
;

/*IRMCS*: Here inspection stage and type are two fields not present in the resp master tables */


CREATE TABLE `LIS_IRMCS` (
 `SUBSCRIBER_ID` INT(5) NOT NULL ,
 `COMP_PROD_DRAW_NUM` varchar(50) NOT NULL,
 `COMP_PROD_NAME` varchar(50) NOT NULL,
 `WORK_ORDER_JOB_NUM` VARCHAR(30) NOT NULL,
   `LOT_NUMBER` VARCHAR(10) NOT NULL,
   `LOT_SIZE` INT(5) NOT NULL,
   `LOT_SIZE_UNITS` INT(5) NOT NULL,
   `MANUFACTURING_BATCH_NUM` VARCHAR(30) NOT NULL ,
   `MANUFACTURING_BATCH_SIZE` INT(5) NOT NULL,
   `CUST_NAME_ADDR` varchar(250) NOT NULL,
   `customerpo_number` VARCHAR(30) NOT NULL,
  `customerpo_date` timestamp NOT NULL,
  `customerpo_quantity` int(11) NOT NULL,
  `IS_ACTIVE` CHAR(1) DEFAULT 'Y',
  `INSPECTION_TYPE` varchar(30) NOT NULL,
  `INSPECTION_STAGE` varchar(10) NOT NULL,
  `INSPECTION_REPORT_NUM` varchar(30) NOT NULL,
  PRIMARY KEY (`INSPECTION_REPORT_NUM`)
  )
;




CREATE TABLE `LIS_IMDES` (
	`SUBSCRIBER_ID` INT(5) NOT NULL ,
 `COMP_PROD_DRAW_NUM` varchar(50) NOT NULL,
  `INSPECTION_REPORT_NUM` varchar(30) NOT NULL,
   `WORK_ORDER_JOB_NUM` VARCHAR(30) NOT NULL,
    `LOT_NUMBER` VARCHAR(10) NOT NULL,
   `LOT_SIZE` INT(5) NOT NULL,
   `LOT_SIZE_UNITS` INT(5) NOT NULL,
   `MANUFACTURING_BATCH_NUM` VARCHAR(30) NOT NULL ,
   `MANUFACTURING_BATCH_SIZE` INT(5) NOT NULL,
   `COMP_PROD_NAME` varchar(50) NOT NULL,
     `INSPECTION_TYPE` varchar(30) NOT NULL,
  `INSPECTION_STAGE` varchar(10) NOT NULL,
   `FACILITY_NUMBER` varchar(10) NOT NULL,
    `FACILITY_NAME` varchar(150) NOT NULL,
    `USER_NAME` varchar(20) NOT NULL,
    `INSPECTION_DATE` DATETIME  DEFAULT CURRENT_TIMESTAMP ,
      `SHIFT_ID` varchar(10) NOT NULL,
  `SHIFT_NAME` varchar(150) NOT NULL,
  `CUST_NAME_ADDR` varchar(250) NOT NULL,
   `customerpo_number` VARCHAR(30) NOT NULL,
  `customerpo_date` timestamp NOT NULL,
  `customerpo_quantity` int(11) NOT NULL,
  `PART_IDENTIFICATION_NUM` VARCHAR(30) NOT NULL,
   `MEASUREMENT_NAME`  VARCHAR(50) NOT NULL,
   `MEASUREMENT_VALUE` numeric(8) NOT NULL,
    `BASE_MEASUREMENT`  VARCHAR(5) NOT NULL,
     `UPPER_LIMIT`  numeric(8) NOT NULL,
   `IS_ACTIVE` CHAR(1) DEFAULT 'Y',
   `LOWER_LIMIT`  numeric(8) NOT NULL, 
   `DEVIATION` NUMERIC(8),
   `STATUS` VARCHAR(8),
   `PART_STATUS` VARCHAR(10) NOT NULL,
   `INSPECTION_QTY` INT(3),
   `PRODUCED _QTY` INT(3),
	PRIMARY KEY (`PART_IDENTIFICATION_NUM`)
    );






