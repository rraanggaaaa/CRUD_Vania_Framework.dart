import 'package:mysql1/mysql1.dart';

Future<void> createDatabase() async {
  // Configure the connection to MySQL
  final settings = ConnectionSettings(
    host: 'localhost',  // Replace with your DB host if different
    port: 3306,         // MySQL port
    user: 'root',       // Your MySQL username
    password: 'password',  // Your MySQL password
    db: 'mysql',        // Default database to connect to
  );

  // Open connection to MySQL
  final conn = await MySqlConnection.connect(settings);

  // Create the database if it doesn't exist
  await conn.query('CREATE DATABASE IF NOT EXISTS order_entry');

  // Use the newly created database
  await conn.query('USE order_entry');

  // Create tables
  await conn.query('''  
    CREATE TABLE IF NOT EXISTS customers (
      cust_id CHAR(5) PRIMARY KEY,
      cust_name VARCHAR(50),
      cust_address VARCHAR(50),
      cust_city VARCHAR(20),
      cust_zip VARCHAR(5),
      cust_country VARCHAR(25),
      cust_telp VARCHAR(15)
    );
  ''');

  await conn.query('''  
    CREATE TABLE IF NOT EXISTS vendors (
      vend_id CHAR(5) PRIMARY KEY,
      vend_name VARCHAR(50),
      vend_address TEXT,
      vend_kota VARCHAR(25),
      vend_state VARCHAR(25),
      vend_zip VARCHAR(5),
      vend_country VARCHAR(25)
    );
  ''');

  await conn.query('''  
    CREATE TABLE IF NOT EXISTS products (
      prod_id VARCHAR(10) PRIMARY KEY,
      vend_id CHAR(5),
      prod_name VARCHAR(50),
      prod_price DECIMAL(10, 2),
      prod_desc TEXT,
      FOREIGN KEY (vend_id) REFERENCES vendors(vend_id)
    );
  ''');

  await conn.query('''  
    CREATE TABLE IF NOT EXISTS orderitems (
      order_num INT NOT NULL,
      order_item INT,
      prod_id VARCHAR(10),
      quantity INT,
      size INT,
      PRIMARY KEY (order_num, order_item),
      FOREIGN KEY (prod_id) REFERENCES products(prod_id)
    );
  ''');

  await conn.query('''  
    CREATE TABLE IF NOT EXISTS ordertotnotes (
      note_id VARCHAR(5) PRIMARY KEY,
      prod_id VARCHAR(10),
      vend_id CHAR(5),
      note_text TEXT,
      FOREIGN KEY (prod_id) REFERENCES products(prod_id),
      FOREIGN KEY (vend_id) REFERENCES vendors(vend_id)
    );
  ''');

  // Print confirmation message
  print('Database and tables created successfully!');

  // Close the connection
  await conn.close();
}

void main() async {
  // Call the createDatabase function to set up the database and tables
  await createDatabase();
}
