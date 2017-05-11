/*
============================================================
File name   : mysql_db_upgrade_11to12.sql
Begin       : 2012-11-22
Last Update : 2012-12-26

Description : TCExam database structure upgrade commands
              (from version 11 to 11.5).
Database    : MySQL 4.1+

Author: Nicola Asuni

(c) Copyright:
              Nicola Asuni
              Tecnick.com LTD
              www.tecnick.com
              info@tecnick.com

License:
   Copyright (C) 2004-2013 Nicola Asuni - Tecnick.com LTD

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU Affero General Public License as
   published by the Free Software Foundation, either version 3 of the
   License, or (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU Affero General Public License for more details.

   You should have received a copy of the GNU Affero General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.

   Additionally, you can't remove, move or hide the original TCExam logo,
   copyrights statements and links to Tecnick.com and TCExam websites.

   See LICENSE.TXT file for more information.
//============================================================+
*/

ALTER TABLE tce_users ADD user_otpkey Varchar(255);
ALTER TABLE tce_tests ADD test_questions_order_mode Smallint(3) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE tce_tests ADD test_answers_order_mode Smallint(3) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE tce_tests ADD test_password Varchar(255);
ALTER TABLE tce_tests_users DROP KEY ak_testuser;
ALTER TABLE tce_tests_users ADD UNIQUE ak_testuser (testuser_test_id,testuser_user_id,testuser_status);
CREATE TABLE IF NOT EXISTS tce_testuser_stat (tus_id Bigint UNSIGNED NOT NULL AUTO_INCREMENT, tus_date Datetime NOT NULL, PRIMARY KEY (tus_id)) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_unicode_ci;
