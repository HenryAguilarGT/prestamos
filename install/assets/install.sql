/*norman*/
set foreign_key_checks=0;
-- Dumping structure for table loans.c19_app_config
DROP TABLE IF EXISTS `c19_app_config`;
CREATE TABLE IF NOT EXISTS `c19_app_config` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table loans.c19_app_config: ~30 rows (approximately)
/*!40000 ALTER TABLE `c19_app_config` DISABLE KEYS */;
INSERT INTO `c19_app_config` (`key`, `value`) VALUES
	('address', 'Your Address'),
	('company', 'SoftReliance'),
	('currency_side', '0'),
	('currency_symbol', '$'),
	('custom10_name', '0'),
	('custom1_name', '0'),
	('custom2_name', '0'),
	('custom3_name', '0'),
	('custom4_name', '0'),
	('custom5_name', '0'),
	('custom6_name', '0'),
	('custom7_name', '0'),
	('custom8_name', '0'),
	('custom9_name', '0'),
	('default_tax_1_name', '0'),
	('default_tax_1_rate', '0'),
	('default_tax_2_name', '0'),
	('default_tax_2_rate', '0'),
	('email', ''),
	('fax', ''),
	('language', 'en'),
	('logo', 'o_1av64kmfd1r2t1d1c7uiksd19tt7.jpg'),
	('phone', '111-2222'),
	('print_after_sale', '0'),
	('recv_invoice_format', '0'),
	('return_policy', '0'),
	('sales_invoice_format', '0'),
	('tax_included', '0'),
	('timezone', 'America/New_York'),
	('website', '');
/*!40000 ALTER TABLE `c19_app_config` ENABLE KEYS */;


-- Dumping structure for table loans.c19_attachments
DROP TABLE IF EXISTS `c19_attachments`;
CREATE TABLE IF NOT EXISTS `c19_attachments` (
  `attachment_id` int(11) NOT NULL AUTO_INCREMENT,
  `loan_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `filename` varchar(100) NOT NULL,
  `descriptions` varchar(100) NOT NULL,
  `session_id` varchar(100) NOT NULL,
  PRIMARY KEY (`attachment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table loans.c19_attachments: ~1 rows (approximately)
/*!40000 ALTER TABLE `c19_attachments` DISABLE KEYS */;
INSERT INTO `c19_attachments` (`attachment_id`, `loan_id`, `customer_id`, `filename`, `descriptions`, `session_id`) VALUES
	(1, 0, 0, 'o_1av647e1p1q191c5rk5hdrfkc47.jpg', '', 'v674W7tyKAiPgFpT');
/*!40000 ALTER TABLE `c19_attachments` ENABLE KEYS */;


-- Dumping structure for table loans.c19_customers
DROP TABLE IF EXISTS `c19_customers`;
CREATE TABLE IF NOT EXISTS `c19_customers` (
  `person_id` int(10) NOT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `credit_limit` decimal(10,2) NOT NULL,
  `taxable` int(1) NOT NULL DEFAULT '1',
  `deleted` int(1) NOT NULL DEFAULT '0',
  `added_by` int(5) DEFAULT NULL,
  UNIQUE KEY `account_number` (`account_number`),
  KEY `person_id` (`person_id`),
  CONSTRAINT `c19_customers_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `c19_people` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table loans.c19_customers: ~1 rows (approximately)
/*!40000 ALTER TABLE `c19_customers` DISABLE KEYS */;
INSERT INTO `c19_customers` (`person_id`, `account_number`, `credit_limit`, `taxable`, `deleted`, `added_by`) VALUES
	(10, NULL, 0.00, 1, 1, 1);
/*!40000 ALTER TABLE `c19_customers` ENABLE KEYS */;


-- Dumping structure for table loans.c19_emails
DROP TABLE IF EXISTS `c19_emails`;
CREATE TABLE IF NOT EXISTS `c19_emails` (
  `email_id` int(11) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(300) DEFAULT NULL,
  `templates` text,
  `descriptions` text NOT NULL,
  `person_id` int(11) NOT NULL,
  PRIMARY KEY (`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Dumping data for table loans.c19_emails: ~0 rows (approximately)
/*!40000 ALTER TABLE `c19_emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `c19_emails` ENABLE KEYS */;


-- Dumping structure for table loans.c19_employees
DROP TABLE IF EXISTS `c19_employees`;
CREATE TABLE IF NOT EXISTS `c19_employees` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `person_id` int(10) NOT NULL,
  `added_by` int(10) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `username` (`username`),
  KEY `person_id` (`person_id`),
  CONSTRAINT `c19_employees_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `c19_people` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table loans.c19_employees: ~3 rows (approximately)
/*!40000 ALTER TABLE `c19_employees` DISABLE KEYS */;
INSERT INTO `c19_employees` (`username`, `password`, `person_id`, `added_by`, `deleted`) VALUES
	('admin', '0192023a7bbd73250516f069df18b500', 1, 0, 0),
	('norman0194', '5f3cd85febeeefd6c03b6042c19c24bf', 12, 1, 1),
	('user1', '25d55ad283aa400af464c76d713c07ad', 9, 1, 1);
/*!40000 ALTER TABLE `c19_employees` ENABLE KEYS */;


-- Dumping structure for table loans.c19_financial_status
DROP TABLE IF EXISTS `c19_financial_status`;
CREATE TABLE IF NOT EXISTS `c19_financial_status` (
  `financial_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL,
  `income_sources` text NOT NULL,
  PRIMARY KEY (`financial_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table loans.c19_financial_status: ~3 rows (approximately)
/*!40000 ALTER TABLE `c19_financial_status` DISABLE KEYS */;
INSERT INTO `c19_financial_status` (`financial_status_id`, `person_id`, `income_sources`) VALUES
	(1, 5, '["="]'),
	(2, 6, '["="]'),
	(3, 10, '["="]');
/*!40000 ALTER TABLE `c19_financial_status` ENABLE KEYS */;

-- Dumping structure for table loans.c19_guarantee
DROP TABLE IF EXISTS `c19_guarantee`;
CREATE TABLE IF NOT EXISTS `c19_guarantee` (
  `guarantee_id` int(11) NOT NULL AUTO_INCREMENT,
  `loan_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(300) NOT NULL,
  `type` varchar(300) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `make` varchar(50) NOT NULL,
  `serial` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `proof` varchar(1000) NOT NULL,
  `images` varchar(1000) NOT NULL,
  `observations` varchar(1000) NOT NULL,
  PRIMARY KEY (`guarantee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- Dumping data for table loans.c19_guarantee: ~17 rows (approximately)
/*!40000 ALTER TABLE `c19_guarantee` DISABLE KEYS */;
INSERT INTO `c19_guarantee` (`guarantee_id`, `loan_id`, `name`, `type`, `brand`, `make`, `serial`, `price`, `proof`, `images`, `observations`) VALUES
	(1, -1, '', '', '', '', '', 0.00, 'false', 'false', ''),
	(2, -1, '', '', '', '', '', 0.00, 'false', 'false', ''),
	(3, -1, '', '', '', '', '', 0.00, 'false', 'false', ''),
	(4, -1, '', '', '', '', '', 0.00, 'false', 'false', ''),
	(5, -1, '', '', '', '', '', 0.00, 'false', 'false', ''),
	(6, -1, '', '', '', '', '', 0.00, 'false', 'false', ''),
	(7, -1, '', '', '', '', '', 0.00, 'false', 'false', ''),
	(8, -1, '0', '0', '0', '0', '0', 0.00, 'false', 'false', '0'),
	(9, -1, '0', '0', '0', '0', '0', 0.00, 'false', 'false', '0'),
	(10, -1, '0', '0', '0', '0', '0', 0.00, 'false', 'false', '0'),
	(11, -1, '0', '0', '0', '0', '0', 0.00, 'false', 'false', '0'),
	(12, -1, '', '', '', '', '', 0.00, 'false', 'false', ''),
	(13, -1, '', '', '', '', '', 0.00, 'false', 'false', ''),
	(14, -1, '', '', '', '', '', 0.00, 'false', 'false', ''),
	(15, -1, '', '', '', '', '', 0.00, 'false', 'false', ''),
	(16, -1, '', '', '', '', '', 0.00, 'false', 'false', ''),
	(17, -1, '', '', '', '', '', 0.00, 'false', 'false', '');
/*!40000 ALTER TABLE `c19_guarantee` ENABLE KEYS */;


-- Dumping structure for table loans.c19_loans
DROP TABLE IF EXISTS `c19_loans`;
CREATE TABLE IF NOT EXISTS `c19_loans` (
  `loan_id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(50) NOT NULL,
  `description` varchar(300) NOT NULL,
  `remarks` varchar(300) NOT NULL,
  `loan_type_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `loan_amount` decimal(10,2) NOT NULL,
  `loan_balance` decimal(10,2) NOT NULL,
  `loan_status` enum('pending','approved','on going','paid') NOT NULL,
  `loan_agent_id` int(11) NOT NULL,
  `loan_approved_by_id` int(11) NOT NULL,
  `loan_reviewed_by_id` int(11) NOT NULL,
  `loan_applied_date` int(11) NOT NULL,
  `loan_payment_date` int(11) NOT NULL,
  `misc_fees` text NOT NULL,
  `delete_flag` int(11) NOT NULL,
  `payment_scheds` text NOT NULL,
  PRIMARY KEY (`loan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- Dumping data for table loans.c19_loans: ~17 rows (approximately)
/*!40000 ALTER TABLE `c19_loans` DISABLE KEYS */;
INSERT INTO `c19_loans` (`loan_id`, `account`, `description`, `remarks`, `loan_type_id`, `customer_id`, `loan_amount`, `loan_balance`, `loan_status`, `loan_agent_id`, `loan_approved_by_id`, `loan_reviewed_by_id`, `loan_applied_date`, `loan_payment_date`, `misc_fees`, `delete_flag`, `payment_scheds`) VALUES
	(1, '6', '', '', 1, 6, 500.00, 500.00, 'pending', 1, 0, 0, 1456290000, 1456894800, '{"":""}', 1, ''),
	(2, '5', 'ds ', '', 1, 5, 500.00, 400.00, 'pending', 4, 0, 0, 1456290000, 1456921018, '{"":""}', 1, ''),
	(3, '6', 'fsad fsad fsad f', '', 1, 6, 200.00, 200.00, 'pending', 7, 0, 0, 1456290000, 1456894800, '{"":""}', 1, ''),
	(4, '10', 'fasdfs', '', 9, 10, 5000.00, 6048.00, 'pending', 1, 0, 0, 1457326800, 1458003376, '{"":""}', 1, ''),
	(5, '', '', '', 0, 0, 0.00, 0.00, 'pending', 1, 0, 0, 1457326800, 0, '{"":""}', 1, ''),
	(6, '', '', '', 0, 0, 0.00, 0.00, 'pending', 1, 0, 0, 1457326800, 0, '{"":""}', 1, ''),
	(7, '', '', '', 0, 0, 0.00, 0.00, 'pending', 1, 0, 0, 1457326800, 0, '{"":""}', 1, ''),
	(8, '0', '0', '0', 0, 0, 0.00, 0.00, '', 0, 0, 0, 0, 0, '{"":null}', 1, ''),
	(9, '0', '0', '0', 0, 0, 0.00, 0.00, '', 0, 0, 0, 0, 0, '{"":null}', 1, ''),
	(10, '0', '0', '0', 0, 0, 0.00, 0.00, '', 0, 0, 0, 0, 0, '{"":null}', 1, ''),
	(11, '0', '0', '0', 0, 0, 0.00, 0.00, '', 0, 0, 0, 0, 0, '{"":null}', 1, '{"term":false,"term_period":false,"payment_sched":false,"interest_rate":false,"penalty":false,"payment_breakdown":[{"schedule":false,"balance":false,"interest":false,"amount":false}]}'),
	(12, '10', 'fasdfasdfasdf', '', 0, 10, 5000.00, 5000.00, 'pending', 1, 0, 0, 1457326800, 0, '{"":""}', 1, '{"term":"5","term_period":"monthly","payment_sched":false,"interest_rate":"12","penalty":"5","payment_breakdown":[{"schedule":["2016-03-09","2016-03-09"],"balance":["500","600"],"interest":["12","5"],"amount":["5000","6000"]},{"schedule":["2016-03-09","2016-03-09"],"balance":["500","600"],"interest":["12","5"],"amount":["5000","6000"]}]}'),
	(13, '10', 'fasdfasdf asdf as', '', 0, 10, 50000.00, 50000.00, 'pending', 1, 0, 0, 1457326800, 0, '{"":""}', 1, '{"term":"15","term_period":"week","payment_sched":"biweekly","interest_rate":"12","penalty":"5","payment_breakdown":{"schedule":["2016-03-08","2016-03-09"],"balance":["5000","5600"],"interest":["5","5"],"amount":["6000","7000"]}}'),
	(14, '10', 'fasd fasdf asdf as', '', 0, 10, 5000.00, 4000.00, 'pending', 1, 0, 0, 1457413200, 1457499600, '{"":""}', 1, '{"term":"5","term_period":"month","payment_sched":"weekly","interest_rate":"12","penalty":"","payment_breakdown":{"schedule":["2016-03-08","2016-03-09"],"balance":["500","600"],"interest":["5","5"],"amount":["600","700"]}}'),
	(15, '10', 'fsadfasd', '', 0, 10, 5000.00, 5000.00, 'pending', 1, 0, 0, 1457413200, 1457413200, '{"":""}', 1, '{"term":"5","term_period":"month","payment_sched":"weekly","interest_rate":"12","penalty":"10","payment_breakdown":{"schedule":["2016-03-08","","",""],"balance":["5000","","",""],"interest":["","","",""],"amount":["","","",""]}}'),
	(16, '10', 'jhgh', '', 8, 10, 5500.00, 6160.00, 'pending', 1, 0, 0, 1457845200, 1458446400, '{"down payment":"1900"}', 1, '{"term":"","term_period":"day","payment_sched":"daily","interest_rate":"","penalty":"","payment_breakdown":{"schedule":[""],"balance":[""],"interest":[""],"amount":[""]}}'),
	(17, '10', 'test', '', 0, 10, 5000.00, 5000.00, 'pending', 1, 0, 0, 1476590400, 0, '{"":""}', 1, '{"term":"","term_period":"day","payment_sched":"daily","interest_rate":"","penalty":"","payment_breakdown":{"schedule":[""],"balance":[""],"interest":[""],"amount":[""]}}');
/*!40000 ALTER TABLE `c19_loans` ENABLE KEYS */;


-- Dumping structure for table loans.c19_loan_payments
DROP TABLE IF EXISTS `c19_loan_payments`;
CREATE TABLE IF NOT EXISTS `c19_loan_payments` (
  `loan_payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(50) NOT NULL DEFAULT '0',
  `loan_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `balance_amount` decimal(10,2) NOT NULL,
  `paid_amount` decimal(10,2) NOT NULL,
  `teller_id` int(11) NOT NULL,
  `date_paid` int(11) NOT NULL,
  `date_modified` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `remarks` varchar(2000) NOT NULL,
  `delete_flag` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`loan_payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Dumping data for table loans.c19_loan_payments: ~3 rows (approximately)
/*!40000 ALTER TABLE `c19_loan_payments` DISABLE KEYS */;
INSERT INTO `c19_loan_payments` (`loan_payment_id`, `account`, `loan_id`, `customer_id`, `balance_amount`, `paid_amount`, `teller_id`, `date_paid`, `date_modified`, `modified_by`, `remarks`, `delete_flag`) VALUES
	(1, '', 2, 5, 500.00, 100.00, 4, 1456290000, 0, 0, '', 0),
	(2, '', 4, 10, 5600.00, 200.00, 1, 1457326800, 0, 0, '', 1),
	(12, '', 14, 10, 5000.00, 1000.00, 1, 1457413200, 0, 0, '', 1);
/*!40000 ALTER TABLE `c19_loan_payments` ENABLE KEYS */;


-- Dumping structure for table loans.c19_loan_types
DROP TABLE IF EXISTS `c19_loan_types`;
CREATE TABLE IF NOT EXISTS `c19_loan_types` (
  `loan_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `term` int(11) NOT NULL,
  `term_period_type` varchar(50) NOT NULL,
  `payment_schedule` varchar(50) NOT NULL,
  `percent_charge1` decimal(10,2) NOT NULL,
  `period_charge1` int(11) NOT NULL,
  `period_type1` varchar(50) NOT NULL,
  `percent_charge2` decimal(10,2) NOT NULL,
  `period_charge2` int(11) NOT NULL,
  `period_type2` varchar(50) NOT NULL,
  `percent_charge3` decimal(10,2) NOT NULL,
  `period_charge3` int(11) NOT NULL,
  `period_type3` varchar(50) NOT NULL,
  `percent_charge4` decimal(10,2) NOT NULL,
  `period_charge4` int(11) NOT NULL,
  `period_type4` varchar(50) NOT NULL,
  `percent_charge5` decimal(10,2) NOT NULL,
  `period_charge5` int(11) NOT NULL,
  `period_type5` varchar(50) NOT NULL,
  `percent_charge6` decimal(10,2) NOT NULL,
  `period_charge6` int(11) NOT NULL,
  `period_type6` varchar(50) NOT NULL,
  `percent_charge7` decimal(10,2) NOT NULL,
  `period_charge7` int(11) NOT NULL,
  `period_type7` varchar(50) NOT NULL,
  `percent_charge8` decimal(10,2) NOT NULL,
  `period_charge8` int(11) NOT NULL,
  `period_type8` varchar(50) NOT NULL,
  `percent_charge9` decimal(10,2) NOT NULL,
  `period_charge9` int(11) NOT NULL,
  `period_type9` varchar(50) NOT NULL,
  `percent_charge10` decimal(10,2) NOT NULL,
  `period_charge10` int(11) NOT NULL,
  `period_type10` varchar(50) NOT NULL,
  `added_by` int(11) NOT NULL,
  `date_added` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `date_modified` int(11) NOT NULL,
  PRIMARY KEY (`loan_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Dumping data for table loans.c19_loan_types: ~2 rows (approximately)
/*!40000 ALTER TABLE `c19_loan_types` DISABLE KEYS */;
INSERT INTO `c19_loan_types` (`loan_type_id`, `name`, `description`, `term`, `term_period_type`, `payment_schedule`, `percent_charge1`, `period_charge1`, `period_type1`, `percent_charge2`, `period_charge2`, `period_type2`, `percent_charge3`, `period_charge3`, `period_type3`, `percent_charge4`, `period_charge4`, `period_type4`, `percent_charge5`, `period_charge5`, `period_type5`, `percent_charge6`, `period_charge6`, `period_type6`, `percent_charge7`, `period_charge7`, `period_type7`, `percent_charge8`, `period_charge8`, `period_type8`, `percent_charge9`, `period_charge9`, `period_type9`, `percent_charge10`, `period_charge10`, `period_type10`, `added_by`, `date_added`, `modified_by`, `date_modified`) VALUES
	(8, 'test', 'fds fasdfasdf', 5, 'month', 'weekly', 12.00, 0, 'Week', 0.00, 0, 'Week', 0.00, 0, 'Week', 0.00, 0, 'Week', 0.00, 0, 'Week', 0.00, 0, 'Week', 0.00, 0, 'Week', 0.00, 0, 'Week', 0.00, 0, 'Week', 0.00, 0, 'Week', 1, 1456477469, 0, 0),
	(9, 'norman_type', 'fasdfa sdfas', 5, 'month', 'weekly', 12.00, 0, 'Week', 0.00, 0, 'Week', 0.00, 0, 'Week', 0.00, 0, 'Week', 0.00, 0, 'Week', 0.00, 0, 'Week', 0.00, 0, 'Week', 0.00, 0, 'Week', 0.00, 0, 'Week', 0.00, 0, 'Week', 2, 1456477650, 0, 0);
/*!40000 ALTER TABLE `c19_loan_types` ENABLE KEYS */;


-- Dumping structure for table loans.c19_messages
DROP TABLE IF EXISTS `c19_messages`;
CREATE TABLE IF NOT EXISTS `c19_messages` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) NOT NULL DEFAULT '0',
  `recipient_id` int(11) NOT NULL DEFAULT '0',
  `mark_as_read` tinyint(1) NOT NULL DEFAULT '0',
  `header` varchar(300) NOT NULL,
  `body` text NOT NULL,
  `send_date` date NOT NULL,
  `receive_date` date NOT NULL,
  `sender_delete_flag` tinyint(4) NOT NULL DEFAULT '0',
  `recipient_delete_flag` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table loans.c19_messages: ~0 rows (approximately)
/*!40000 ALTER TABLE `c19_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `c19_messages` ENABLE KEYS */;


-- Dumping structure for table loans.c19_modules
DROP TABLE IF EXISTS `c19_modules`;
CREATE TABLE IF NOT EXISTS `c19_modules` (
  `module_id` varchar(255) NOT NULL,
  `name_lang_key` varchar(255) NOT NULL,
  `desc_lang_key` varchar(255) NOT NULL,
  `sort` int(10) NOT NULL,
  `icons` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`module_id`),
  UNIQUE KEY `desc_lang_key` (`desc_lang_key`),
  UNIQUE KEY `name_lang_key` (`name_lang_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table loans.c19_modules: ~11 rows (approximately)
/*!40000 ALTER TABLE `c19_modules` DISABLE KEYS */;
INSERT INTO `c19_modules` (`module_id`, `name_lang_key`, `desc_lang_key`, `sort`, `icons`, `is_active`) VALUES
	('config', 'module_config', 'module_config_desc', 100, '<i class="fa fa-cogs" style="font-size: 50px; color:#26B6AE"></i>', 1),
	('customers', 'module_customers', 'module_customers_desc', 10, '<i class="fa fa-smile-o" style="font-size: 50px; color:#FF5400"></i>', 1),
	('emails', 'module_email', 'module_email_desc', 0, '<i class="fa fa-envelope" style="font-size: 50px; color:#26B6AE"></i>', 1),
	('employees', 'module_employees', 'module_employees_desc', 80, '<i class="fa fa-users" style="font-size: 50px; color:#FF5400"></i>', 1),
	('loans', 'module_loans', 'module_loans_desc', 80, '<i class="fa fa-money" style="font-size: 50px; color:#4EA216"></i>', 1),
	('loan_types', 'module_loan_types', 'module_loan_types_desc', 79, '<i class="fa fa-sitemap" style="font-size: 50px; color:#e80a0a"></i>', 1),
	('messages', 'module_messages', 'module_messages_desc', 80, '<i class="fa fa-envelope" style="font-size: 50px; color:#4EA216"></i>', 1),
	('my_wallets', 'module_my_wallets', 'module_my_wallets_desc', 79, '<i class="fa fa-briefcase" style="font-size: 50px; color:#e80a0a"></i>', 1),
	('overdues', 'module_overdues', 'module_overdues_desc', 80, '<i class="fa fa-file" style="font-size: 50px; color:#1b926c"></i>', 1),
	('payments', 'module_payments', 'module_payments_desc', 80, '<i class="fa fa-paypal" style="font-size: 50px; color:#2B9EC4"></i>', 1),
	('plugins', 'module_plugins', 'module_plugins_desc', 99, '<i class="fa fa-wrench" style="font-size: 50px; color:#2B9EC4"></i>', 1),
	('roles', 'module_roles', 'module_roles_desc', 79, '<i class="fa fa-cogs" style="font-size: 50px; color:#1b926c"></i>', 1);
/*!40000 ALTER TABLE `c19_modules` ENABLE KEYS */;


-- Dumping structure for table loans.c19_payment_schedules
DROP TABLE IF EXISTS `c19_payment_schedules`;
CREATE TABLE IF NOT EXISTS `c19_payment_schedules` (
  `payment_schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `recurrence` int(11) NOT NULL DEFAULT '0',
  `delete_flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`payment_schedule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table loans.c19_payment_schedules: ~4 rows (approximately)
/*!40000 ALTER TABLE `c19_payment_schedules` DISABLE KEYS */;
INSERT INTO `c19_payment_schedules` (`payment_schedule_id`, `name`, `recurrence`, `delete_flag`) VALUES
	(1, 'weekly', 0, 0),
	(2, 'biweekly', 0, 0),
	(3, 'monthly', 0, 0),
	(4, 'bimonthly', 0, 0);
/*!40000 ALTER TABLE `c19_payment_schedules` ENABLE KEYS */;


-- Dumping structure for table loans.c19_people
DROP TABLE IF EXISTS `c19_people`;
CREATE TABLE IF NOT EXISTS `c19_people` (
  `person_id` int(10) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `photo_url` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address_1` varchar(255) NOT NULL,
  `address_2` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `comments` text NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Dumping data for table loans.c19_people: ~4 rows (approximately)
/*!40000 ALTER TABLE `c19_people` DISABLE KEYS */;
INSERT INTO `c19_people` (`person_id`, `first_name`, `last_name`, `photo_url`, `phone_number`, `email`, `address_1`, `address_2`, `city`, `state`, `zip`, `country`, `comments`, `role_id`) VALUES
	(1, 'Admin1', 'Admin', 'o_1av66hk6o1vab10e91eoh1su11r688.jpg', '421-2583', 'admin@loans.com', 'nowhere', '', '', '', '', '', '', 13),
	(9, 'User1', 'One', '', '', '', '', '', '', '', '', '', '', 15),
	(10, 'ron', 'ron', '', '', '', '', '', '', '', '', '', '', 0),
	(12, 'Norman', 'Marino', 'o_1av641afbv6u1t7ktfntq01dh28.jpg', '', 'norman.marino@gmail.com', '', '', '', '', '', '', '', 15);
/*!40000 ALTER TABLE `c19_people` ENABLE KEYS */;


-- Dumping structure for table loans.c19_permissions
DROP TABLE IF EXISTS `c19_permissions`;
CREATE TABLE IF NOT EXISTS `c19_permissions` (
  `permission_id` varchar(255) NOT NULL,
  `module_id` varchar(255) NOT NULL,
  `location_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`permission_id`),
  KEY `module_id` (`module_id`),
  KEY `ospos_permissions_ibfk_2` (`location_id`),
  CONSTRAINT `c19_permissions_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `c19_modules` (`module_id`) ON DELETE CASCADE,
  CONSTRAINT `c19_permissions_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `kpos_stock_locations` (`location_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table loans.c19_permissions: ~11 rows (approximately)
/*!40000 ALTER TABLE `c19_permissions` DISABLE KEYS */;
INSERT INTO `c19_permissions` (`permission_id`, `module_id`, `location_id`) VALUES
	('config', 'config', NULL),
	('customers', 'customers', NULL),
	('emails', 'emails', NULL),
	('employees', 'employees', NULL),
	('loans', 'loans', NULL),
	('loan_types', 'loan_types', NULL),
	('messages', 'messages', NULL),
	('my_wallets', 'my_wallets', NULL),
	('overdues', 'overdues', NULL),
	('payments', 'payments', NULL),
	('plugins', 'plugins', NULL),
	('roles', 'roles', NULL);
/*!40000 ALTER TABLE `c19_permissions` ENABLE KEYS */;

-- Dumping structure for table loans.c19_grants
DROP TABLE IF EXISTS `c19_grants`;
CREATE TABLE IF NOT EXISTS `c19_grants` (
  `permission_id` varchar(255) NOT NULL,
  `person_id` int(10) NOT NULL,
  PRIMARY KEY (`permission_id`,`person_id`),
  KEY `ospos_grants_ibfk_2` (`person_id`),
  CONSTRAINT `c19_grants_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `c19_permissions` (`permission_id`),
  CONSTRAINT `c19_grants_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `c19_employees` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table loans.c19_grants: ~11 rows (approximately)
/*!40000 ALTER TABLE `c19_grants` DISABLE KEYS */;
INSERT INTO `c19_grants` (`permission_id`, `person_id`) VALUES
	('config', 1),
	('customers', 1),
	('emails', 1),
	('employees', 1),
	('loans', 1),
	('loan_types', 1),
	('messages', 1),
	('my_wallets', 1),
	('overdues', 1),
	('payments', 1),
	('plugins', 1),
	('roles', 1);
/*!40000 ALTER TABLE `c19_grants` ENABLE KEYS */;


-- Dumping structure for table loans.c19_plugins
DROP TABLE IF EXISTS `c19_plugins`;
CREATE TABLE IF NOT EXISTS `c19_plugins` (
  `plugin_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(200) NOT NULL,
  `module_desc` varchar(200) NOT NULL,
  `module_settings` text NOT NULL,
  `status_flag` enum('Active','Inactive') NOT NULL DEFAULT 'Inactive',
  PRIMARY KEY (`plugin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;


-- Dumping structure for table loans.c19_roles
DROP TABLE IF EXISTS `c19_roles`;
CREATE TABLE IF NOT EXISTS `c19_roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `low_level` varchar(200) NOT NULL,
  `rights` text NOT NULL,
  `added_by` int(11) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- Dumping data for table loans.c19_roles: ~2 rows (approximately)
/*!40000 ALTER TABLE `c19_roles` DISABLE KEYS */;
INSERT INTO `c19_roles` (`role_id`, `name`, `low_level`, `rights`, `added_by`) VALUES
	(13, 'admin', '["13","15"]', '["emails","customers","roles","loan_types","my_wallets","loans","messages","overdues","payments","employees","config"]', 1),
	(15, 'Staff', 'false', '["customers","roles","loan_types"]', 1);
/*!40000 ALTER TABLE `c19_roles` ENABLE KEYS */;


-- Dumping structure for table loans.c19_sessions
DROP TABLE IF EXISTS `c19_sessions`;
CREATE TABLE IF NOT EXISTS `c19_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table loans.c19_sessions: ~8 rows (approximately)
/*!40000 ALTER TABLE `c19_sessions` DISABLE KEYS */;
INSERT INTO `c19_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
	('19b3acbcc0cf7ac87edc55f4e79a2edf', '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', 1476594341, ''),
	('2be56e964905cdfc808499232b814f7d', '::1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36', 1457925550, ''),
	('573781a90e84892b448238abc6e51686', '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', 1476594341, 'a:2:{s:9:"user_data";s:0:"";s:9:"person_id";s:1:"1";}'),
	('6108c8326f39bed970692f5ec60d0c3e', '::1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36', 1457941852, 'a:2:{s:9:"user_data";s:0:"";s:9:"person_id";s:1:"1";}'),
	('79e2d16b2d4a4347d55f2c986acc987a', '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', 1476603802, 'a:3:{s:9:"person_id";s:1:"1";s:4:"data";a:2:{s:6:"params";a:3:{s:4:"name";s:36:"o_1av66hk6o1vab10e91eoh1su11r688.jpg";s:7:"user_id";s:1:"1";s:9:"softtoken";s:32:"4accd073402639e6b42c62615c464d11";}s:8:"filename";s:36:"o_1av66hk6o1vab10e91eoh1su11r688.jpg";}s:6:"linker";s:16:"v674W7tyKAiPgFpT";}'),
	('9cd728f4fd4455ba79cd698515a697fb', '::1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36', 1458184977, 'a:2:{s:9:"user_data";s:0:"";s:9:"person_id";s:1:"1";}'),
	('ae78b2310cba875b73b8a3e0ebce6741', '::1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36', 1456479807, ''),
	('e62cbed658e0108e3d389077112d735d', '::1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36', 1457426042, 'a:2:{s:9:"user_data";s:0:"";s:9:"person_id";s:1:"1";}');
/*!40000 ALTER TABLE `c19_sessions` ENABLE KEYS */;


-- Dumping structure for table loans.c19_smtp
DROP TABLE IF EXISTS `c19_smtp`;
CREATE TABLE IF NOT EXISTS `c19_smtp` (
  `smtp_id` int(11) NOT NULL AUTO_INCREMENT,
  `smtp_host` varchar(300) NOT NULL,
  `smtp_port` int(11) NOT NULL,
  `smtp_user` varchar(300) NOT NULL,
  `smtp_pass` varchar(300) NOT NULL,
  PRIMARY KEY (`smtp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table loans.c19_smtp: ~1 rows (approximately)
/*!40000 ALTER TABLE `c19_smtp` DISABLE KEYS */;
INSERT INTO `c19_smtp` (`smtp_id`, `smtp_host`, `smtp_port`, `smtp_user`, `smtp_pass`) VALUES
	(1, '', 0, '', '');
/*!40000 ALTER TABLE `c19_smtp` ENABLE KEYS */;


-- Dumping structure for table loans.c19_wallets
DROP TABLE IF EXISTS `c19_wallets`;
CREATE TABLE IF NOT EXISTS `c19_wallets` (
  `wallet_id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,2) NOT NULL,
  `descriptions` varchar(200) NOT NULL,
  `wallet_type` enum('debit','credit','transfer') NOT NULL,
  `trans_date` int(11) NOT NULL,
  `added_by` int(11) NOT NULL,
  `transfer_to` int(11) NOT NULL,
  PRIMARY KEY (`wallet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table loans.c19_wallets: ~0 rows (approximately)
/*!40000 ALTER TABLE `c19_wallets` DISABLE KEYS */;
/*!40000 ALTER TABLE `c19_wallets` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
