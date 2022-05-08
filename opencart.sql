#1.05
SELECT CONCAT(CONCAT(UCASE(LEFT(`firstname`, 1)), LCASE(SUBSTRING(`firstname`, 2))),
              ' ',
              CONCAT(UCASE(LEFT(`lastname`, 1)), LCASE(SUBSTRING(`lastname`, 2)))) FROM oc_customer;

#1.21
UPDATE oc_product_special ps JOIN oc_product_to_category pc ON ps.product_id = pc.product_id
JOIN oc_category_description cd ON cd.category_id=pc.category_id
SET price=price+10
WHERE cd.name LIKE 'Monitors';

#3.02
SELECT p.price,p.quantity,pd.name, pd.description FROM `oc_product` p LEFT JOIN oc_product_description pd ON pd.product_id=p.product_id AND pd.language_id=5
WHERE p.product_id=35;

#1.11
SELECT COUNT(order_id) num, SUM(total) order_total,AVG(total)  order_average
FROM oc_order GROUP BY customer_id;

#1.18
SELECT ord.total, ord.order_id, GROUP_CONCAT(op.name) products FROM oc_order ord  JOIN oc_order_product op ON ord.order_id=op.order_id
WHERE email LIKE 'test@test.com' AND date_added >= DATE_SUB(NOW(),INTERVAL 1 YEAR) GROUP BY ord.order_id