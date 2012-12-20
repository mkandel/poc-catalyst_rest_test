SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `machinedb` ;
CREATE SCHEMA IF NOT EXISTS `machinedb` DEFAULT CHARACTER SET latin1 ;
SHOW WARNINGS;
USE `machinedb` ;

-- -----------------------------------------------------
-- Table `machinedb`.`machine`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `machinedb`.`machine` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `machinedb`.`machine` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '                    ' ,
  `hostname` VARCHAR(45) NOT NULL ,
  `datacenter` VARCHAR(45) NOT NULL ,
  `ip_addr` VARCHAR(45) NOT NULL ,
  `service` VARCHAR(45) NULL ,
  `product` VARCHAR(45) NULL ,
  `asset_tag` VARCHAR(45) NULL ,
  `comments` VARCHAR(45) NULL ,
  `console_hostname` VARCHAR(45) NULL ,
  `console_mac` VARCHAR(45) NULL ,
  `console_server` VARCHAR(45) NULL ,
  `console_port` INT NULL ,
  `cpu_speed` INT NULL ,
  `cpu_count` INT NULL ,
  `default_route` VARCHAR(45) NULL ,
  `dns_domain` VARCHAR(45) NULL DEFAULT 'ariba.com' ,
  `hardware_type` VARCHAR(45) NULL ,
  `hardware_arch` VARCHAR(45) NULL ,
  `hardware_vendor` VARCHAR(45) NULL ,
  `ip_addr_secondary` VARCHAR(45) NULL ,
  `last_updated` DATETIME NULL ,
  `mac_addr` VARCHAR(45) NULL ,
  `mac_addr_2` VARCHAR(45) NULL ,
  `mac_addr_3` VARCHAR(45) NULL ,
  `mac_addr_4` VARCHAR(45) NULL ,
  `maintenance` VARCHAR(45) NULL ,
  `memory_size` INT NULL ,
  `monserver` VARCHAR(45) NULL ,
  `netmask` VARCHAR(45) NULL ,
  `switch` VARCHAR(45) NULL ,
  `switch_2` VARCHAR(45) NULL ,
  `switch_port` INT NULL ,
  `switch_2_port` INT NULL ,
  `os` VARCHAR(45) NULL ,
  `os_patch_level` VARCHAR(45) NULL ,
  `os_version` VARCHAR(45) NULL ,
  `owner` VARCHAR(45) NULL ,
  `owner_tmid` INT NULL ,
  `provides_services` VARCHAR(45) NULL ,
  `rack_num` VARCHAR(45) NULL ,
  `rack_ports` VARCHAR(45) NULL ,
  `rack_pos` VARCHAR(45) NULL ,
  `serial_num` VARCHAR(45) NULL ,
  `cage_num` VARCHAR(45) NULL ,
  `status` VARCHAR(45) NULL ,
  `snmp_vers` VARCHAR(45) NULL ,
  `mon_datacenter` VARCHAR(45) NULL ,
  `use_ssh` INT NULL ,
  `ip_addr_ternary` VARCHAR(45) NULL ,
  `ip_addr_standby_inside` VARCHAR(45) NULL ,
  `snmp_community` VARCHAR(45) NULL ,
  `ether_channel_1_ports` VARCHAR(45) NULL ,
  `ilo_ap_license` VARCHAR(45) NULL ,
  `ether_channel_2_ports` VARCHAR(45) NULL ,
  `console_ip_addr` VARCHAR(45) NULL ,
  `ip_addr_quadrary` VARCHAR(45) NULL ,
  `veritas_cluster_role` VARCHAR(45) NULL ,
  `switch_3_port` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `mach_id_UNIQUE` ON `machinedb`.`machine` (`id` ASC) ;

SHOW WARNINGS;
CREATE UNIQUE INDEX `hostname_UNIQUE` ON `machinedb`.`machine` (`hostname` ASC) ;

SHOW WARNINGS;

grant INSERT on TABLE `machinedb`.`machine` to machinedb_dba;
grant SELECT on TABLE `machinedb`.`machine` to machinedb_dba;
grant UPDATE on TABLE `machinedb`.`machine` to machinedb_dba;
grant ALL on TABLE `machinedb`.`machine` to machinedb_dba;
grant INSERT on TABLE `machinedb`.`machine` to machinedb;
grant SELECT on TABLE `machinedb`.`machine` to machinedb;
grant UPDATE on TABLE `machinedb`.`machine` to machinedb;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
