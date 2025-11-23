USE petstore_order;

INSERT INTO `lineitem` VALUES (1000, 1, 'EST-19', 1, 15.50);
INSERT INTO `lineitem` VALUES (1001, 1, 'EST-19', 1, 15.50);
INSERT INTO `lineitem` VALUES (1002, 1, 'EST-22', 1, 135.50);
INSERT INTO `lineitem` VALUES (1003, 1, 'EST-19', 1, 15.50);

INSERT INTO `orders` VALUES (1000, 'j2ee', '2024-10-29', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', '901 San Antonio Road', '901 San Antonio Road', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 15.50, 'ABC', 'XYX', 'ABC', 'XYX', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1001, 'j2ee', '2024-10-29', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', '901 San Antonio Road', '901 San Antonio Road', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 15.50, 'ABC', 'XYX', 'ABC', 'XYX', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1002, 'j2ee', '2024-10-29', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', '901 San Antonio Road', '901 San Antonio Road', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 135.50, 'ABC', 'XYX', 'ABC', 'XYX', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1003, 'j2ee', '2024-10-29', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', '901 San Antonio Road', '901 San Antonio Road', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', 15.50, 'ABC', 'XYX', 'ABC', 'XYX', '999 9999 9999 9999', '12/03', 'Visa', 'CA');

INSERT INTO `orderstatus` VALUES (1000, 1, '2024-10-30', 'P');
INSERT INTO `orderstatus` VALUES (1001, 1, '2024-10-30', 'W');
INSERT INTO `orderstatus` VALUES (1002, 1, '2024-10-30', 'N');
INSERT INTO `orderstatus` VALUES (1003, 1, '2024-10-30', 'F');