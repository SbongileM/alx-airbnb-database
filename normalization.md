**First Normal Form**
The schema meets 1NF normalization requirements because all the tables have a primary key, and all columns store atomic values.

**Second Normal Form**
All non-key attributes fully depend on the primary key in each table, therefore 2NF is also satisfied.

**Third Normal Form**
- For 3NF we check for indirect dependencies of non-key attributes on the primary key. 
- Are there any non-key attributes that depend on other non-key attributes? Yes, the **total_price** attribute in the Booking table depends on the **start_date** and **end_date** attributes. It also depends on the **price*per*night** attribute which is guaranteed to change in the future, which could lead to update anomalies. Therefore **total_price** should be calculated using logic and returned dynamically upon request.


**Updated Booking Table**
- *booking_id*: Primary Key, UUID, Indexed
- *property_id*: Foreign Key, references Property(property_id)
- *user_id*: Foreign Key, references User(user_id)
- *start_date*: DATE, NOT NULL
- *end_date*: DATE, NOT NULL
- *status*: ENUM (pending, confirmed, canceled), NOT NULL
- *created_at*: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP