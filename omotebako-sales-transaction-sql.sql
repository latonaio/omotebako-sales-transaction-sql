CREATE TABLE `sales_transaction` (
  `id` int(11) AUTO_INCREMENT,
  `reservation_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `price_master_id` int(11) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_wo_tax` int(11) GENERATED ALWAYS AS (`price` * `quantity`) STORED,
  `tax` int(11) NOT NULL,
  `total` int(11) GENERATED ALWAYS AS (`total_wo_tax` + `tax`) STORED,
  `is_paid` tinyint(1) DEFAULT 0 NOT NULL,
  `payment_method` int(11) DEFAULT NULL,
  `delete_flag` tinyint(1) GENERATED ALWAYS AS (`deleted_at` IS NOT NULL) STORED,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `sales_transaction_id_old` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `reservation_id_fk` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`reservation_id`),
  CONSTRAINT `price_master_id_fk` FOREIGN KEY (`price_master_id`) REFERENCES `price_master_id` (`price_id`),
  CONSTRAINT `sales_transaction_id_old` FOREIGN KEY (`sales_transaction_id`) REFERENCES `sales_transaction` (`id`),
);