import 'package:vania/vania.dart';

class ProductsModel extends Model {
  String? prodId;
  String? vendId;
  String? prodName;
  int? prodPrice;
  String? prodDesc;

  ProductsModel() {
    super.table('products');
  }

  Map<String, dynamic> toMap() {
    return {
      'prod_id': prodId,
      'vend_id': vendId,
      'prod_name': prodName,
      'prod_price': prodPrice,
      'prod_desc': prodDesc,
    };
  }

  Future<void> save() async {
    if (prodId != null) {
      final existingProduct = await ProductsModel().query().where('prod_id', prodId).first();
      if (existingProduct != null) {
        await ProductsModel().query().where('prod_id', prodId).update(this.toMap());
      } else {
        await ProductsModel().query().create(this.toMap());
      }
    } else {
      await ProductsModel().query().create(this.toMap());
    }
  }
}
