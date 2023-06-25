
Orders and Items Schema
Description
Sample products, orders, and items schema with sample data.

Statement 1
Create a sequence for use with the customers table.
create sequence DEMO_CUST_SEQ start with 100
Sequence created.
Statement 2
create sequence DEMO_ORD_SEQ start with 100
Sequence created.
Statement 3
create sequence DEMO_PROD_SEQ start with 100
Sequence created.
Statement 4
create sequence DEMO_ORDER_ITEMS_SEQ start with 100
Sequence created.
Statement 5
Create a table to hold tags.
CREATE TABLE demo_tags ( 
    id                      number primary key, 
    tag                     varchar2(255) not null, 
    content_id              number, 
    content_type            varchar2(30) 
                            constraint demo_tags_ck check 
                            (content_type in ('CUSTOMER','ORDER','PRODUCT')), 
    -- 
    created                 timestamp with local time zone, 
    created_by              varchar2(255), 
    updated                 timestamp with local time zone, 
    updated_by              varchar2(255) 
)
Table created.
Statement 6
create or replace trigger demo_tags_biu 
   before insert or update on demo_tags 
   for each row 
   begin 
      if inserting then 
         if :NEW.ID is null then 
           select to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') 
           into :new.id 
           from dual; 
         end if; 
         :NEW.CREATED := localtimestamp; 
         :NEW.CREATED_BY := USER; 
      end if; 
 
      if updating then 
         :NEW.UPDATED := localtimestamp; 
         :NEW.UPDATED_BY := USER; 
      end if; 
end
Trigger created.
Statement 7
create table demo_tags_type_sum ( 
    tag                             varchar2(255), 
    content_type                    varchar2(30), 
    tag_count                       number, 
    constraint demo_tags_type_sum_pk primary key (tag,content_type) 
)
Table created.
Statement 8
create table demo_tags_sum ( 
    tag                             varchar2(255), 
    tag_count                       number, 
    constraint demo_tags_sum_pk primary key (tag) 
)
Table created.
Statement 9
CREATE TABLE  "DEMO_CUSTOMERS" (     
    "CUSTOMER_ID"          NUMBER       NOT NULL ENABLE, 
    "CUST_FIRST_NAME"      VARCHAR2(20) NOT NULL ENABLE, 
    "CUST_LAST_NAME"       VARCHAR2(20) NOT NULL ENABLE, 
    "CUST_STREET_ADDRESS1" VARCHAR2(60), 
    "CUST_STREET_ADDRESS2" VARCHAR2(60), 
    "CUST_CITY"            VARCHAR2(30), 
    "CUST_STATE"           VARCHAR2(2), 
    "CUST_POSTAL_CODE"     VARCHAR2(10), 
    "CUST_EMAIL"           VARCHAR2(30), 
    "PHONE_NUMBER1"        VARCHAR2(25), 
    "PHONE_NUMBER2"        VARCHAR2(25), 
    "URL"                  VARCHAR2(100), 
    "CREDIT_LIMIT"         NUMBER(9,2), 
    "TAGS"                 VARCHAR2(4000), 
    CONSTRAINT "DEMO_CUST_CREDIT_LIMIT_MAX" CHECK (credit_limit <= 5000) ENABLE, 
    CONSTRAINT "DEMO_CUSTOMERS_PK" PRIMARY KEY ("CUSTOMER_ID") ENABLE, 
    CONSTRAINT "DEMO_CUSTOMERS_UK" UNIQUE ("CUST_FIRST_NAME","CUST_LAST_NAME") 
 )
Table created.
Statement 10
CREATE INDEX  "DEMO_CUST_NAME_IX" ON  "DEMO_CUSTOMERS" ("CUST_LAST_NAME", "CUST_FIRST_NAME")
Index created.
Statement 11
CREATE OR REPLACE TRIGGER  "DEMO_CUSTOMERS_BIU" 
  before insert or update ON demo_customers FOR EACH ROW 
DECLARE 
  cust_id number; 
BEGIN 
  if inserting then   
    if :new.customer_id is null then 
      select demo_cust_seq.nextval 
        into cust_id 
        from dual; 
      :new.customer_id := cust_id; 
    end if; 
  end if; 
END; 
Trigger created.
Statement 12
CREATE TABLE  "DEMO_ORDERS" (     
    "ORDER_ID"           NUMBER NOT NULL ENABLE, 
    "CUSTOMER_ID"        NUMBER NOT NULL ENABLE, 
    "ORDER_TOTAL"        NUMBER(8,2), 
    "ORDER_TIMESTAMP"    TIMESTAMP with local time zone, 
    "USER_NAME"          VARCHAR2(100), 
    "TAGS"               VARCHAR2(4000), 
    CONSTRAINT "DEMO_ORDER_TOTAL_MIN" CHECK (order_total >= 0) ENABLE, 
    CONSTRAINT "DEMO_ORDER_PK" PRIMARY KEY ("ORDER_ID") ENABLE, 
    CONSTRAINT "DEMO_ORDERS_CUSTOMER_ID_FK" FOREIGN KEY ("CUSTOMER_ID") 
    REFERENCES  "DEMO_CUSTOMERS" ("CUSTOMER_ID") ON DELETE CASCADE ENABLE 
)
Table created.
Statement 13
CREATE INDEX  "DEMO_ORD_CUSTOMER_IX" ON  "DEMO_ORDERS" ("CUSTOMER_ID")
Index created.
Statement 14
CREATE OR REPLACE TRIGGER  "DEMO_ORDERS_BIU" 
  before insert or update ON demo_orders FOR EACH ROW 
DECLARE 
  order_id number; 
BEGIN 
  if inserting then   
    if :new.order_id is null then 
      select demo_ord_seq.nextval 
        INTO order_id 
        FROM dual; 
      :new.order_id := order_id; 
    end if; 
  end if; 
 
END; 
Trigger created.
Statement 15
CREATE TABLE  "DEMO_PRODUCTS" (     
    "PRODUCT_ID"          NUMBER NOT NULL ENABLE, 
    "PRODUCT_NAME"        VARCHAR2(50), 
    "PRODUCT_DESCRIPTION" VARCHAR2(2000), 
    "CATEGORY"            VARCHAR2(30), 
    "PRODUCT_AVAIL"       VARCHAR2(1), 
    "LIST_PRICE"          NUMBER(8,2), 
    "PRODUCT_IMAGE"       BLOB, 
    "MIMETYPE"            VARCHAR2(255), 
    "FILENAME"            VARCHAR2(400), 
    "IMAGE_LAST_UPDATE"   TIMESTAMP with local time zone, 
    "TAGS"                VARCHAR2(4000), 
    CONSTRAINT "demo_products_PK" primary key ("PRODUCT_ID") ENABLE, 
    CONSTRAINT "demo_products_UK" unique ("PRODUCT_NAME") ENABLE 
)
Table created.
Statement 16
CREATE OR REPLACE TRIGGER  "demo_products_BIU" 
  before insert or update ON demo_products FOR EACH ROW 
DECLARE 
  prod_id number; 
BEGIN 
  if inserting then   
    if :new.product_id is null then 
      select demo_prod_seq.nextval 
        into prod_id 
        from dual; 
      :new.product_id := prod_id; 
    end if; 
  end if; 
END; 
Trigger created.
Statement 17
CREATE TABLE  "DEMO_ORDER_ITEMS" ( 
    "ORDER_ITEM_ID" NUMBER(3,0) NOT NULL ENABLE, 
    "ORDER_ID" NUMBER NOT NULL ENABLE, 
    "PRODUCT_ID" NUMBER NOT NULL ENABLE, 
    "UNIT_PRICE" NUMBER(8,2) NOT NULL ENABLE, 
    "QUANTITY" NUMBER(8,0) NOT NULL ENABLE, 
    CONSTRAINT "DEMO_ORDER_ITEMS_PK" PRIMARY KEY ("ORDER_ITEM_ID") ENABLE, 
    CONSTRAINT "DEMO_ORDER_ITEMS_UK" UNIQUE ("ORDER_ID","PRODUCT_ID") ENABLE, 
    CONSTRAINT "DEMO_ORDER_ITEMS_FK" FOREIGN KEY ("ORDER_ID") 
     REFERENCES  "DEMO_ORDERS" ("ORDER_ID") ON DELETE CASCADE ENABLE, 
    CONSTRAINT "DEMO_ORDER_ITEMS_PRODUCT_ID_FK" FOREIGN KEY ("PRODUCT_ID") 
     REFERENCES  "DEMO_PRODUCTS" ("PRODUCT_ID") ON DELETE CASCADE ENABLE 
)
Table created.
Statement 18
CREATE OR REPLACE TRIGGER  "DEMO_ORDER_ITEMS_BI" 
  BEFORE insert on "DEMO_ORDER_ITEMS" for each row 
declare 
  order_item_id number; 
begin 
  if :new.order_item_id is null then 
    select demo_order_items_seq.nextval  
      into order_item_id  
      from dual; 
    :new.order_item_id := order_item_id; 
  end if; 
end; 
Trigger created.
Statement 19
CREATE OR REPLACE TRIGGER  "DEMO_ORDER_ITEMS_AIUD_TOTAL" 
  after insert or update or delete on demo_order_items 
begin 
  -- Update the Order Total when any order item is changed 
  update demo_orders set order_total = 
  (select sum(unit_price*quantity) from demo_order_items 
    where demo_order_items.order_id = demo_orders.order_id); 
end; 
Trigger created.
Statement 20
CREATE OR REPLACE TRIGGER  "DEMO_ORDER_ITEMS_BIU_GET_PRICE" 
  before insert or update on demo_order_items for each row 
declare 
  l_list_price number; 
begin 
  if :new.unit_price is null then 
    -- First, we need to get the current list price of the order line item 
    select list_price 
    into l_list_price 
    from demo_products 
    where product_id = :new.product_id; 
    -- Once we have the correct price, we will update the order line with the correct price 
    :new.unit_price := l_list_price; 
  end if; 
end; 
Trigger created.
Statement 21
CREATE TABLE  "DEMO_STATES" ( 
    "ST" VARCHAR2(30), 
    "STATE_NAME" VARCHAR2(30) 
 )
Table created.
Statement 22
create table DEMO_CONSTRAINT_LOOKUP 
( 
  CONSTRAINT_NAME VARCHAR2(30)   primary key, 
  MESSAGE         VARCHAR2(4000) not null 
)
Table created.
Statement 23
INSERT INTO demo_products (product_id, product_name, product_description, category,product_avail, list_price, product_image, mimetype, filename, image_last_update, tags) 
    VALUES(1, 'Business Shirt', 'Wrinkle-free cotton business shirt', 'Mens', 'Y', 50, null,'image/jpeg','shirt.jpg',systimestamp,'Top seller')
1 row(s) inserted.
Statement 24
INSERT INTO demo_products (product_id, product_name, product_description, category,product_avail, list_price, product_image, mimetype, filename, image_last_update, tags) 
    VALUES(2, 'Trousers', 'Black trousers suitable for every business man', 'Mens', 'Y', 80, null,'image/jpeg','pants.jpg',systimestamp,'Top seller')
1 row(s) inserted.
Statement 25
INSERT INTO demo_products (product_id, product_name, product_description, category,product_avail, list_price, product_image, mimetype, filename, image_last_update, tags) 
    VALUES(3, 'Jacket', 'Fully lined jacket which is both professional and extremely comfortable to wear', 'Mens', 'Y', 150, null,'image/jpeg','jacket.jpg',systimestamp,null)
1 row(s) inserted.
Statement 26
INSERT INTO demo_products (product_id, product_name, product_description, category,product_avail, list_price, product_image, mimetype, filename, image_last_update, tags) 
    VALUES(4, 'Blouse', 'Silk blouse ideal for all business women', 'Womens', 'Y', 60, null,'image/jpeg','blouse.jpg',systimestamp,null)
1 row(s) inserted.
Statement 27
INSERT INTO demo_products (product_id, product_name, product_description, category,product_avail, list_price, product_image, mimetype, filename, image_last_update, tags) 
    VALUES(5, 'Skirt', 'Wrinkle free skirt', 'Womens', 'Y', 80,null,'image/jpeg','skirt.jpg',systimestamp,null)
1 row(s) inserted.
Statement 28
INSERT INTO demo_products (product_id, product_name, product_description, category,product_avail, list_price, product_image, mimetype, filename, image_last_update, tags) 
    VALUES(6, 'Ladies Shoes', 'Low heel and cushioned interior for comfort and style in simple yet elegant shoes', 'Womens', 'Y', 120, null,'image/jpeg','heels.jpg',systimestamp,null)
1 row(s) inserted.
Statement 29
INSERT INTO demo_products (product_id, product_name, product_description, category,product_avail, list_price, product_image, mimetype, filename, image_last_update, tags) 
    VALUES(7, 'Belt', 'Leather belt', 'Accessories', 'Y', 30, null,'image/jpeg','belt.jpg',systimestamp,null)
1 row(s) inserted.
Statement 30
INSERT INTO demo_products (product_id, product_name, product_description, category,product_avail, list_price, product_image, mimetype, filename, image_last_update, tags) 
    VALUES(8, 'Bag', 'Unisex bag suitable for carrying laptops with room for many additional items', 'Accessories', 'Y', 125, null,'image/jpeg','bag.jpg',systimestamp,null)
1 row(s) inserted.
Statement 31
INSERT INTO demo_products (product_id, product_name, product_description, category,product_avail, list_price, product_image, mimetype, filename, image_last_update, tags) 
    VALUES(9, 'Mens Shoes', 'Leather upper and lower lace up shoes', 'Mens', 'Y', 110, null,'image/jpeg','shoes.jpg',systimestamp,null)
1 row(s) inserted.
Statement 32
INSERT INTO demo_products (product_id, product_name, product_description, category,product_avail, list_price, product_image, mimetype, filename, image_last_update, tags) 
    VALUES(10, 'Wallet', 'Travel wallet suitable for men and women. Several compartments for credit cards, passports and cash', 'Accessories', 'Y', 50, null,'image/jpeg','wallet.jpg',systimestamp,null)
1 row(s) inserted.
Statement 33
INSERT INTO demo_customers (customer_id, cust_first_name, cust_last_name, cust_street_address1, cust_street_address2, cust_city, cust_state, cust_postal_code, cust_email, phone_number1, phone_number2, url, credit_limit, tags) 
 VALUES(1, 'John', 'Dulles', '45020 Aviation Drive', null, 'Sterling', 'VA', '20166', 'john.dulles@email.com', '703-555-2143', '703-555-8967', 'http://www.johndulles.com', 1000, null)
1 row(s) inserted.
Statement 34
INSERT INTO demo_customers (customer_id, cust_first_name, cust_last_name, cust_street_address1, cust_street_address2, cust_city, cust_state, cust_postal_code, cust_email, phone_number1, phone_number2, url, credit_limit, tags) 
  VALUES(2, 'William', 'Hartsfield', '6000 North Terminal Parkway', null, 'Atlanta', 'GA', '30320', null, '404-555-3285', null, null, 1000, 'Repeat customer')
1 row(s) inserted.
Statement 35
INSERT INTO demo_customers (customer_id, cust_first_name, cust_last_name, cust_street_address1, cust_street_address2, cust_city, cust_state, cust_postal_code, cust_email, phone_number1, phone_number2, url, credit_limit, tags) 
  VALUES(3, 'Edward', 'Logan', '1 Harborside Drive', null, 'East Boston', 'MA', '02128', null, '617-555-3295', null, null, 1000, 'Repeat customer')
1 row(s) inserted.
Statement 36
INSERT INTO demo_customers (customer_id, cust_first_name, cust_last_name, cust_street_address1, cust_street_address2, cust_city, cust_state, cust_postal_code, cust_email, phone_number1, phone_number2, url, credit_limit, tags) 
  VALUES(4, 'Frank', 'OHare', '10000 West OHare', null, 'Chicago', 'IL', '60666', null, '773-555-7693', null, null, 1000, null)
1 row(s) inserted.
Statement 37
INSERT INTO demo_customers (customer_id, cust_first_name, cust_last_name, cust_street_address1, cust_street_address2, cust_city, cust_state, cust_postal_code, cust_email, phone_number1, phone_number2, url, credit_limit, tags) 
  VALUES(5, 'Fiorello', 'LaGuardia', 'Hangar Center', 'Third Floor', 'Flushing', 'NY', '11371', null, '212-555-3923', null, null, 1000, null)
1 row(s) inserted.
Statement 38
INSERT INTO demo_customers (customer_id, cust_first_name, cust_last_name, cust_street_address1, cust_street_address2, cust_city, cust_state, cust_postal_code, cust_email, phone_number1, phone_number2, url, credit_limit, tags) 
  VALUES(6, 'Albert', 'Lambert', '10701 Lambert International Blvd.', null, 'St. Louis', 'MO', '63145', null, '314-555-4022', null, null, 1000, null)
1 row(s) inserted.
Statement 39
INSERT INTO demo_customers (customer_id, cust_first_name, cust_last_name, cust_street_address1, cust_street_address2, cust_city, cust_state, cust_postal_code, cust_email, phone_number1, phone_number2, url, credit_limit, tags) 
  VALUES(7, 'Eugene', 'Bradley', 'Schoephoester Road', null, 'Windsor Locks', 'CT', '06096', null, '860-555-1835', null, null, 1000, 'Repeat customer')
1 row(s) inserted.
Statement 40
INSERT INTO demo_orders (order_id, customer_id, order_total, order_timestamp, user_name, tags) VALUES(1, 7,0, systimestamp-65,'DEMO', null)
1 row(s) inserted.
Statement 41
INSERT INTO demo_orders (order_id, customer_id, order_total, order_timestamp, user_name, tags) VALUES(2, 1,0, systimestamp-51,'DEMO', 'Large Order')
1 row(s) inserted.
Statement 42
INSERT INTO demo_orders (order_id, customer_id, order_total, order_timestamp, user_name, tags) VALUES(3, 2,0, systimestamp-40,'DEMO', null)
1 row(s) inserted.
Statement 43
INSERT INTO demo_orders (order_id, customer_id, order_total, order_timestamp, user_name, tags) VALUES(4, 5,0, systimestamp-38,'DEMO', null)
1 row(s) inserted.
Statement 44
INSERT INTO demo_orders (order_id, customer_id, order_total, order_timestamp, user_name, tags) VALUES(5, 6,0, systimestamp-28,'DEMO', null)
1 row(s) inserted.
Statement 45
INSERT INTO demo_orders (order_id, customer_id, order_total, order_timestamp, user_name, tags) VALUES(6, 3,0, systimestamp-23,'DEMO', null)
1 row(s) inserted.
Statement 46
INSERT INTO demo_orders (order_id, customer_id, order_total, order_timestamp, user_name, tags) VALUES(7, 3,0, systimestamp-18,'DEMO', null)
1 row(s) inserted.
Statement 47
INSERT INTO demo_orders (order_id, customer_id, order_total, order_timestamp, user_name, tags) VALUES(8, 4,0, systimestamp-10,'DEMO', null)
1 row(s) inserted.
Statement 48
INSERT INTO demo_orders (order_id, customer_id, order_total, order_timestamp, user_name, tags) VALUES(9, 2,0, systimestamp-4,'DEMO', null)
1 row(s) inserted.
Statement 49
INSERT INTO demo_orders (order_id, customer_id, order_total, order_timestamp, user_name, tags) VALUES(10, 7,0, systimestamp-1,'DEMO', null)
1 row(s) inserted.
Statement 50
INSERT INTO demo_order_items (order_item_id, order_id, product_id, unit_price, quantity) VALUES(null, 1, 1, null, 10)
1 row(s) inserted.
Statement 51
INSERT INTO demo_order_items (order_item_id, order_id, product_id, unit_price, quantity) VALUES(null, 1, 2, null, 8)
1 row(s) inserted.
Statement 52
INSERT INTO demo_order_items (order_item_id, order_id, product_id, unit_price, quantity) VALUES(null, 1, 3, null, 5)
1 row(s) inserted.
Statement 53
INSERT INTO demo_order_items (order_item_id, order_id, product_id, unit_price, quantity) VALUES(null, 2, 1, null, 3)
1 row(s) inserted.
Statement 54
INSERT INTO demo_order_items (order_item_id, order_id, product_id, unit_price, quantity) VALUES(null, 2, 2, null, 3)
1 row(s) inserted.
Statement 55
INSERT INTO demo_order_items (order_item_id, order_id, product_id, unit_price, quantity) VALUES(null, 2, 3, null, 3)
1 row(s) inserted.
Statement 56
INSERT INTO demo_order_items (order_item_id, order_id, product_id, unit_price, quantity) VALUES(null, 2, 4, null, 3)
1 row(s) inserted.
Statement 57
INSERT INTO demo_order_items (order_item_id, order_id, product_id, unit_price, quantity) VALUES(null, 2, 5, null, 3)
1 row(s) inserted.
Statement 58
INSERT INTO demo_order_items (order_item_id, order_id, product_id, unit_price, quantity) VALUES(null, 2, 6, null, 2)
1 row(s) inserted.
Statement 59
INSERT INTO demo_order_items (order_item_id, order_id, product_id, unit_price, quantity) VALUES(null, 2, 7, null, 2)
1 row(s) inserted.
Statement 60
INSERT INTO demo_order_items (order_item_id, order_id, product_id, unit_price, quantity) VALUES(null, 2, 8, null, 4)
1 row(s) inserted.
Statement 61
INSERT INTO demo_order_items (order_item_id, order_id, product_id, unit_price, quantity) VALUES(null, 2, 9, null, 2)
1 row(s) inserted.
Statement 62
INSERT INTO demo_order_items (order_item_id, order_id, product_id, unit_price, quantity) VALUES(null, 2, 10, null, 2)
1 row(s) inserted.
Statement 63
INSERT INTO demo_order_items (order_item_id, order_id, product_id, unit_price, quantity) VALUES(null, 3, 4, null, 4)
1 row(s) inserted.
Statement 64
INSERT INTO demo_order_items (order_item_id, order_id, product_id, unit_price, quantity) VALUES(null, 3, 5, null, 4)
1 row(s) inserted.
Statement 65
INSERT INTO demo_order_items (order_item_id, order_id, product_id, unit_price, quantity) VALUES(null, 3, 6, null, 4)
1 row(s) inserted.
Statement 66
INSERT INTO demo_order_items (order_item_id, order_id, product_id, unit_price, quantity) VALUES(null, 3, 8, null, 4)
1 row(s) inserted.
Statement 67
INSERT INTO demo_order_items (order_item_id, order_id, product_id, unit_price, quantity) VALUES(null, 3, 10, null, 2)
1 row(s) inserted.
Statement 68
INSERT INTO demo_order_items (order_item_id, order_id, product_id, unit_price, quantity) VALUES(null, 4, 6, null, 2)
1 row(s) inserted.
Statement 69
INSERT INTO demo_order_items (order_item_id, order_id, product_id, unit_price, quantity) VALUES(null, 4, 7, null, 6)
1 row(s) inserted.
Statement 70
INSERT INTO demo_order_items (order_item_id, order_id, product_id, unit_price, quantity) VALUES(null, 4, 8, null, 2)
1 row(s) inserted.
Statement 71
INSERT INTO demo_order_items (order_item_id, order_id, product_id, unit_price, quantity) VALUES(null, 4, 9, null, 2)
1 row(s) inserted.
Statement 72
INSERT INTO demo_order_items (order_item_id, order_id, product_id, unit_price, quantity) VALUES(null, 4, 10, null, 4)
1 row(s) inserted.
Statement 73
INSERT INTO demo_order_items (order_item_id, order_id, product_id, unit_price, quantity) VALUES(null, 5, 1, null, 3)
1 row(s) inserted.
Statement 74
INSERT INTO demo_order_items (order_item_id, order_id, product_id, unit_price, quantity) VALUES(null, 5, 2, null, 2)
1 row(s) inserted.
Statement 75
INSERT INTO demo_order_items (order_item_id, order_id, product_id, unit_price, quantity) VALUES(null, 5, 3, null, 2)
1 row(s) inserted.
Statement 76
INSERT INTO demo_order_items (order_item_id, order_id, product_id, unit_price, quantity) VALUES(null, 5, 4, null, 3)
1 row(s) inserted.
Statement 77
INSERT INTO demo_order_items (order_item_id, order_id, product_id, unit_price, quantity) VALUES(null, 5, 5, null, 2)
1 row(s) inserted.
Statement 78
INSERT INTO demo_order_items (order_item_id, order_id, product_id, unit_price, quantity) VALUES(null, 6, 3, null, 3)
1 row(s) inserted.
Statement 79
INSERT INTO demo_order_items (order_item_id, order_id, product_id, unit_price, quantity) VALUES(null, 6, 6, null, 3)
1 row(s) inserted.
Statement 80
INSERT INTO demo_order_items (order_item_id, order_id, product_id, unit_price, quantity) VALUES(null, 6, 8, null, 3)
1 row(s) inserted.
Statement 81
INSERT INTO demo_order_items (order_item_id, order_id, product_id, unit_price, quantity) VALUES(null, 6, 9, null, 3)
1 row(s) inserted.
Statement 82
INSERT INTO demo_order_items (order_item_id, order_id, product_id, unit_price, quantity) VALUES(null, 7, 1, null, 2)
1 row(s) inserted.
Statement 83
INSERT INTO demo_order_items (order_item_id, order_id, product_id, unit_price, quantity) VALUES(null, 7, 2, null, 2)
1 row(s) inserted.
Statement 84
INSERT INTO demo_order_items (order_item_id, order_id, product_id, unit_price, quantity) VALUES(null, 7, 4, null, 2)
1 row(s) inserted.
Statement 85
INSERT INTO demo_order_items (order_item_id, order_id, product_id, unit_price, quantity) VALUES(null, 7, 5, null, 2)
1 row(s) inserted.
Statement 86
INSERT INTO demo_order_items (order_item_id, order_id, product_id, unit_price, quantity) VALUES(null, 7, 7, null, 3)
1 row(s) inserted.
Statement 87
INSERT INTO demo_order_items (order_item_id, order_id, product_id, unit_price, quantity) VALUES(null, 7, 8, null, 1)
1 row(s) inserted.
Statement 88
INSERT INTO demo_order_items (order_item_id, order_id, product_id, unit_price, quantity) VALUES(null, 7, 10, null, 3)
1 row(s) inserted.
Statement 89
INSERT INTO demo_order_items (order_item_id, order_id, product_id, unit_price, quantity) VALUES(null, 8, 2, null, 2)
1 row(s) inserted.
Statement 90
INSERT INTO demo_order_items (order_item_id, order_id, product_id, unit_price, quantity) VALUES(null, 8, 3, null, 3)
1 row(s) inserted.
Statement 91
INSERT INTO demo_order_items (order_item_id, order_id, product_id, unit_price, quantity) VALUES(null, 8, 6, null, 1)
1 row(s) inserted.
Statement 92
INSERT INTO demo_order_items (order_item_id, order_id, product_id, unit_price, quantity) VALUES(null, 8, 9, null, 3)
1 row(s) inserted.
Statement 93
INSERT INTO demo_order_items (order_item_id, order_id, product_id, unit_price, quantity) VALUES(null, 9, 4, null, 4)
1 row(s) inserted.
Statement 94
INSERT INTO demo_order_items (order_item_id, order_id, product_id, unit_price, quantity) VALUES(null, 9, 5, null, 3)
1 row(s) inserted.
Statement 95
INSERT INTO demo_order_items (order_item_id, order_id, product_id, unit_price, quantity) VALUES(null, 9, 8, null, 2)
1 row(s) inserted.
Statement 96
INSERT INTO demo_order_items (order_item_id, order_id, product_id, unit_price, quantity) VALUES(null, 10, 1, null, 5)
1 row(s) inserted.
Statement 97
INSERT INTO demo_order_items (order_item_id, order_id, product_id, unit_price, quantity) VALUES(null, 10, 2, null, 4)
1 row(s) inserted.
Statement 98
INSERT INTO demo_order_items (order_item_id, order_id, product_id, unit_price, quantity) VALUES(null, 10, 3, null, 2)
1 row(s) inserted.
Statement 99
INSERT INTO demo_states (st, state_name) VALUES ('AK','ALASKA')
1 row(s) inserted.
Statement 100
INSERT INTO demo_states (st, state_name) VALUES ('AL','ALABAMA')
1 row(s) inserted.
Statement 101
INSERT INTO demo_states (st, state_name) VALUES ('AR','ARKANSAS')
1 row(s) inserted.
Statement 102
INSERT INTO demo_states (st, state_name) VALUES ('AZ','ARIZONA')
1 row(s) inserted.
Statement 103
INSERT INTO demo_states (st, state_name) VALUES ('CA','CALIFORNIA')
1 row(s) inserted.
Statement 104
INSERT INTO demo_states (st, state_name) VALUES ('CO','COLORADO')
1 row(s) inserted.
Statement 105
INSERT INTO demo_states (st, state_name) VALUES ('CT','CONNECTICUT')
1 row(s) inserted.
Statement 106
INSERT INTO demo_states (st, state_name) VALUES ('DC','DISTRICT OF COLUMBIA')
1 row(s) inserted.
Statement 107
INSERT INTO demo_states (st, state_name) VALUES ('DE','DELAWARE')
1 row(s) inserted.
Statement 108
INSERT INTO demo_states (st, state_name) VALUES ('FL','FLORIDA')
1 row(s) inserted.
Statement 109
INSERT INTO demo_states (st, state_name) VALUES ('GA','GEORGIA')
1 row(s) inserted.
Statement 110
INSERT INTO demo_states (st, state_name) VALUES ('HI','HAWAII')
1 row(s) inserted.
Statement 111
INSERT INTO demo_states (st, state_name) VALUES ('IA','IOWA')
1 row(s) inserted.
Statement 112
INSERT INTO demo_states (st, state_name) VALUES ('ID','IDAHO')
1 row(s) inserted.
Statement 113
INSERT INTO demo_states (st, state_name) VALUES ('IL','ILLINOIS')
1 row(s) inserted.
Statement 114
INSERT INTO demo_states (st, state_name) VALUES ('IN','INDIANA')
1 row(s) inserted.
Statement 115
INSERT INTO demo_states (st, state_name) VALUES ('KS','KANSAS')
1 row(s) inserted.
Statement 116
INSERT INTO demo_states (st, state_name) VALUES ('KY','KENTUCKY')
1 row(s) inserted.
Statement 117
INSERT INTO demo_states (st, state_name) VALUES ('LA','LOUISIANA')
1 row(s) inserted.
Statement 118
INSERT INTO demo_states (st, state_name) VALUES ('MA','MASSACHUSETTS')
1 row(s) inserted.
Statement 119
INSERT INTO demo_states (st, state_name) VALUES ('MD','MARYLAND')
1 row(s) inserted.
Statement 120
INSERT INTO demo_states (st, state_name) VALUES ('ME','MAINE')
1 row(s) inserted.
Statement 121
INSERT INTO demo_states (st, state_name) VALUES ('MI','MICHIGAN')
1 row(s) inserted.
Statement 122
INSERT INTO demo_states (st, state_name) VALUES ('MN','MINNESOTA')
1 row(s) inserted.
Statement 123
INSERT INTO demo_states (st, state_name) VALUES ('MO','MISSOURI')
1 row(s) inserted.
Statement 124
INSERT INTO demo_states (st, state_name) VALUES ('MS','MISSISSIPPI')
1 row(s) inserted.
Statement 125
INSERT INTO demo_states (st, state_name) VALUES ('MT','MONTANA')
1 row(s) inserted.
Statement 126
INSERT INTO demo_states (st, state_name) VALUES ('NC','NORTH CAROLINA')
1 row(s) inserted.
Statement 127
INSERT INTO demo_states (st, state_name) VALUES ('ND','NORTH DAKOTA')
1 row(s) inserted.
Statement 128
INSERT INTO demo_states (st, state_name) VALUES ('NE','NEBRASKA')
1 row(s) inserted.
Statement 129
INSERT INTO demo_states (st, state_name) VALUES ('NH','NEW HAMPSHIRE')
1 row(s) inserted.
Statement 130
INSERT INTO demo_states (st, state_name) VALUES ('NJ','NEW JERSEY')
1 row(s) inserted.
Statement 131
INSERT INTO demo_states (st, state_name) VALUES ('NM','NEW MEXICO')
1 row(s) inserted.
Statement 132
INSERT INTO demo_states (st, state_name) VALUES ('NV','NEVADA')
1 row(s) inserted.
Statement 133
INSERT INTO demo_states (st, state_name) VALUES ('NY','NEW YORK')
1 row(s) inserted.
Statement 134
INSERT INTO demo_states (st, state_name) VALUES ('OH','OHIO')
1 row(s) inserted.
Statement 135
INSERT INTO demo_states (st, state_name) VALUES ('OK','OKLAHOMA')
1 row(s) inserted.
Statement 136
INSERT INTO demo_states (st, state_name) VALUES ('OR','OREGON')
1 row(s) inserted.
Statement 137
INSERT INTO demo_states (st, state_name) VALUES ('PA','PENNSYLVANIA')
1 row(s) inserted.
Statement 138
INSERT INTO demo_states (st, state_name) VALUES ('RI','RHODE ISLAND')
1 row(s) inserted.
Statement 139
INSERT INTO demo_states (st, state_name) VALUES ('SC','SOUTH CAROLINA')
1 row(s) inserted.
Statement 140
INSERT INTO demo_states (st, state_name) VALUES ('SD','SOUTH DAKOTA')
1 row(s) inserted.
Statement 141
INSERT INTO demo_states (st, state_name) VALUES ('TN','TENNESSEE')
1 row(s) inserted.
Statement 142
INSERT INTO demo_states (st, state_name) VALUES ('TX','TEXAS')
1 row(s) inserted.
Statement 143
INSERT INTO demo_states (st, state_name) VALUES ('UT','UTAH')
1 row(s) inserted.
Statement 144
INSERT INTO demo_states (st, state_name) VALUES ('VA','VIRGINIA')
1 row(s) inserted.
Statement 145
INSERT INTO demo_states (st, state_name) VALUES ('VT','VERMONT')
1 row(s) inserted.
Statement 146
INSERT INTO demo_states (st, state_name) VALUES ('WA','WASHINGTON')
1 row(s) inserted.
Statement 147
INSERT INTO demo_states (st, state_name) VALUES ('WI','WISCONSIN')
1 row(s) inserted.
Statement 148
INSERT INTO demo_states (st, state_name) VALUES ('WV','WEST VIRGINIA')
1 row(s) inserted.
Statement 149
INSERT INTO demo_states (st, state_name) VALUES ('WY','WYOMING')
1 row(s) inserted.
Statement 150
INSERT INTO demo_constraint_lookup (constraint_name, message) VALUES ('DEMO_CUST_CREDIT_LIMIT_MAX','Credit Limit must not exceed $5,000.')
1 row(s) inserted.
Statement 151
INSERT INTO demo_constraint_lookup (constraint_name, message) VALUES ('DEMO_CUSTOMERS_UK','Customer Name must be unique.')
1 row(s) inserted.
Statement 152
INSERT INTO demo_constraint_lookup (constraint_name, message) VALUES ('demo_products_UK','Product Name must be unique.')
1 row(s) inserted.
Statement 153
INSERT INTO demo_constraint_lookup (constraint_name, message) VALUES ('DEMO_ORDER_ITEMS_UK','Product can only be entered once for each order.')
1 row(s) inserted.
Statement 154
select count(*) demo_states_count from demo_states
 
DEMO_STATES_COUNT
51
Statement 155
select count(*) demo_products_count from DEMO_PRODUCTS
 
DEMO_PRODUCTS_COUNT
10
Statement 156
select count(*) demo_orders_count from demo_orders
 
DEMO_ORDERS_COUNT
10
Statement 157
select count(*) demo_order_item_count from demo_order_items
 
DEMO_ORDER_ITEM_COUNT
49
