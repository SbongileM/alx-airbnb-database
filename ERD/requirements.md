### Entities and Attributes
**User**
- *user_id*: Primary Key, UUID, Indexed
- *first_name*: VARCHAR, NOT NULL
- *last_name*: VARCHAR, NOT NULL
- *email*: VARCHAR, UNIQUE, NOT NULL
- *password_hash*: VARCHAR, NOT NULL
- *phone_number*: VARCHAR, NULL
- *role*: ENUM (guest, host, admin), NOT NULL
- *created_at*: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

**Property**
- *property_id*: Primary Key, UUID, Indexed
- *host_id*: Foreign Key, references User(user_id)
- *name*: VARCHAR, NOT NULL
- *description*: TEXT, NOT NULL
- *location*: VARCHAR, NOT NULL
- *pricepernight*: DECIMAL, NOT NULL
- *created_at*: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- *updated_at*: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP

**Booking**
- *booking_id*: Primary Key, UUID, Indexed
- *property_id*: Foreign Key, references Property(property_id)
- *user_id*: Foreign Key, references User(user_id)
- *start_date*: DATE, NOT NULL
- *end_date*: DATE, NOT NULL
- *total_price*: DECIMAL, NOT NULL
- *status*: ENUM (pending, confirmed, canceled), NOT NULL
- *created_at*: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

**Payment**
- *payment_id*: Primary Key, UUID, Indexed
- *booking_id*: Foreign Key, references Booking(booking_id)
- *amount*: DECIMAL, NOT NULL
- *payment_date*: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- *payment_method*: ENUM (credit_card, paypal, stripe), NOT NULL

**Review**
- *review_id*: Primary Key, UUID, Indexed
- *property_id*: Foreign Key, references Property(property_id)
- *user_id*: Foreign Key, references User(user_id)
- *rating*: INTEGER, CHECK: rating >= 1 AND rating <= 5, NOT NULL
- *comment*: TEXT, NOT NULL
- *created_at*: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

**Message**
- *message_id*: Primary Key, UUID, Indexed
- *sender_id*: Foreign Key, references User(user_id)
- *recipient_id*: Foreign Key, references User(user_id)
- *message_body*: TEXT, NOT NULL
- *sent_at*: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP


### Entity Relationships
- **User -> Property** (One-to-Many): Optional unless the user is a host
- **Property -> User** (Many-to-One): Mandatory (host_id is a FOREIGN KEY with NOT NULL implied since it references User(user_id))

- **User -> Booking** (One-to-Many): Mandatory (A user must be associated with a booking)
- **Booking -> User** (Many-to-One): Mandatory (user_id is a FOREIGN KEY referencing User(user_id))

- **Propery -> Booking** (One-to-Many): Mandatory (A booking must be for a property)
- **Booking -> Property** (Many-yo-One): Mandatory (property_id is a FOREIGN KEY referencing Property(property_id))


- **Booking -> Payment** (One-to-One): Optional (A booking might not have a payment yet if status is pending)
- **Payment -> Booking** (One-to-One): Mandatory (booking_id is a FOREIGN KEY referencing Booking(booking_id))

- **User -> Review** (One-to-Many): Optional (A user doesn’t have to leave reviews)
- **Review -> User**(Many-to-One): Mandatory (user_id is a FOREIGN KEY referencing User(user_id))

- **Property -> Review** (One-to-Many): Optional (A property might not have reviews yet)
- **Review -> Property** (Many-to-One): Mandatory (property_id is a FOREIGN KEY referencing Property(property_id))

- **User  -> Message** (One-to-Many): Mandatory (sender_id and recipient_id are FOREIGN KEYS referencing User(user_id))
- **Message -> User** (Many-to-One): Mandatory (A message must have both a sender and recipient)


### Entity Relationship Diagram
<img src="Entity Relationship Diagram.png" alt="Entity Relationship Diagram" width="500" height="300">
