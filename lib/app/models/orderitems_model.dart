import 'package:vania/vania.dart';

class OrderitemsModel extends Model {
  String? orderItem;
  String? orderNum;
  String? prodId;
  String? quality;
  String? size;

  OrderitemsModel() {
    super.table('order_items');
  }

  Map<String, dynamic> toMap() {
    return {
      'order_item': orderItem,
      'order_num': orderNum,
      'prod_id': prodId,
      'quality': quality,
      'size': size,
    };
  }

  Future<void> save() async {
    if (orderItem != null) {
      final existingOrderItem = await OrderitemsModel()
          .query()
          .where('order_item', orderItem)
          .first();
      if (existingOrderItem != null) {
        await OrderitemsModel()
            .query()
            .where('order_item', orderItem)
            .update(this.toMap());
      } else {
        await OrderitemsModel().query().create(this.toMap());
      }
    } else {
      await OrderitemsModel().query().create(this.toMap());
    }
  }
}
