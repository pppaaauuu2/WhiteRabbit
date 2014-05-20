CREATE DATABASE IF NOT EXISTS `VOCABULARY`;
USE `VOCABULARY`;

CREATE TABLE IF NOT EXISTS `CONCEPT` (
	`CONCEPT_ID` INT NOT NULL,
	`CONCEPT_NAME` VARCHAR(260) NULL,
	`VOCABULARY_ID` INT NULL,
	`CONCEPT_LEVEL` INT NULL,
	`CONCEPT_CODE` VARCHAR(20) NULL,
	`CONCEPT_CLASS` VARCHAR(60) NULL,
	`VALID_START_DATE` DATE NULL,
	`VALID_END_DATE` DATE NULL,
	`INVALID_REASON` CHAR(1) NULL,
	PRIMARY KEY (`CONCEPT_ID`)
);	

CREATE TABLE IF NOT EXISTS `CONCEPT_ANCESTOR` (
	`ANCESTOR_CONCEPT_ID` INT NOT NULL,
	`DESCENDANT_CONCEPT_ID` INT NOT NULL,
	`MAX_LEVELS_OF_SEPARATION` INT NULL,
	`MIN_LEVELS_OF_SEPARATION` INT NULL,
	PRIMARY KEY (`ANCESTOR_CONCEPT_ID`,`DESCENDANT_CONCEPT_ID`)
);

CREATE TABLE IF NOT EXISTS `CONCEPT_RELATIONSHIP` (
	`RELATIONSHIP_ID` INT NOT NULL,
	`CONCEPT_ID_1` INT NOT NULL,
	`CONCEPT_ID_2` INT NOT NULL,
	`VALID_START_DATE` DATE NOT NULL,
	`VALID_END_DATE` DATE NOT NULL,
	`INVALID_REASON` CHAR(1) NULL,
	PRIMARY KEY (`CONCEPT_ID_1`,`CONCEPT_ID_2`,`RELATIONSHIP_ID`)
);

CREATE TABLE IF NOT EXISTS `CONCEPT_SYNONYM` (
	`CONCEPT_SYNONYM_ID` INT NOT NULL,
	`CONCEPT_ID` INT NOT NULL,
	`CONCEPT_SYNONYM_NAME` VARCHAR(1000) NOT NULL,
	PRIMARY KEY (`CONCEPT_SYNONYM_ID`)
);

CREATE TABLE IF NOT EXISTS `RELATIONSHIP` (
	`RELATIONSHIP_ID` INT NOT NULL,
	`RELATIONSHIP_NAME` VARCHAR(256) NOT NULL,
	`IS_HIERARCHICAL` CHAR(1) NULL,
	`DEFINES_ANCESTRY` CHAR(1) NULL,
	`REVERSE_RELATIONSHIP` INT NULL,
	PRIMARY KEY (`RELATIONSHIP_ID`)
);

CREATE TABLE IF NOT EXISTS `SOURCE_TO_CONCEPT_MAP` (
	`SOURCE_TO_CONCEPT_MAP_ID` INT NOT NULL,
	`SOURCE_CODE` VARCHAR(20) NOT NULL,
	`SOURCE_CODE_DESCRIPTION` VARCHAR(256) NULL,
	`MAPPING_TYPE` VARCHAR(20) NOT NULL,
	`TARGET_CONCEPT_ID` INT NOT NULL,
	`TARGET_VOCABULARY_ID` INT NOT NULL,
	`SOURCE_VOCABULARY_ID` INT NOT NULL,
	`PRIMARY_MAP` CHAR(1) NULL,
	`VALID_START_DATE` DATE NOT NULL,
	`VALID_END_DATE` DATE NOT NULL,
	`INVALID_REASON` CHAR(1) NULL,
	PRIMARY KEY (`SOURCE_TO_CONCEPT_MAP_ID`)
);

CREATE TABLE IF NOT EXISTS `VOCABULARY` (
	`VOCABULARY_ID` INT NOT NULL,
	`VOCABULARY_NAME` VARCHAR(256) NOT NULL,
	PRIMARY KEY (`VOCABULARY_ID`)
);
