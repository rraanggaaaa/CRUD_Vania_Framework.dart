import 'package:paml_backend_vania/app/models/customers_model.dart';
import 'package:paml_backend_vania/app/models/orderitems_model.dart';
import 'package:paml_backend_vania/app/models/orders_model.dart';
import 'package:paml_backend_vania/app/models/productnotes_model.dart';
import 'package:paml_backend_vania/app/models/products_model.dart';
import 'package:paml_backend_vania/app/models/vendors_model.dart';

class Seeders {
  Future<void> seed() async {
    await CustomersModel().query().insert({
      "cust_id": "054",
      "cust_name": "Dwi Rangga Okta Zuhdiyanto",
      "cust_address": "Sleman",
      "cust_city": "Yogyakarta",
      "cust_state": "DIY",
      "cust_zip": "666",
      "cust_country": "Indonesia",
      "cust_telp": "6281326298750"
    });

    await VendorsModel().query().insert({
      "vend_id":"12345",
      "vend_name":"Rangga",
      "vend_address":"Gamping",
      "vend_kota":"Yogyakarta",
      "vend_state":"DIY",
      "vend_zip":"665",
      "vend_country":"Indonesia"
    });

    await OrdersModel().query().insert({
      "order_num":"521",
      "order_date":DateTime.now(),
      "cust_id":"054"
    });
    
    await ProductsModel().query().insert({
      "prod_id":"001",
      "vend_id":"12345",
      "prod_name":"Laptop",
      "prod_price":"15000000",
      "prod_desc":"Macbook Pro M2"
    });

    await OrderitemsModel().query().insert({
      "order_item":"1",
      "order_num":"521",
      "prod_id":"001",
      "quantity":"5",
      "size":"999"
    });

    await ProductnotesModel().query().insert({
      "note_id":"100",
      "prod_id":"001",
      "note_date":DateTime.now(),
      "note_text":"Sold Out"
    });
  }
}
