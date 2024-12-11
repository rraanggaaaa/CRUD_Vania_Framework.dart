import 'package:vania/vania.dart';
import 'package:paml_backend_vania/app/models/orderitems_model.dart'; // Adjust the import path as needed

class OrderitemsController extends Controller {
  Future<Response> index() async {
    try {
      final orderItems = await OrderitemsModel().query().get();
      return Response.json(orderItems);
    } catch (e) {
      return Response.json(400);
    }
  }

  Future<Response> create(Request request) async {
    try {
      final body = await request.body;

      if (body['order_item'] == null ||
          body['order_num'] == null ||
          body['prod_id'] == null ||
          body['quality'] == null ||
          body['size'] == null) {
        return Response.json(
          {'error': 'Missing required fields'},
        );
      }

      final orderItem = OrderitemsModel()
        ..orderItem = body['order_item']
        ..orderNum = body['order_num']
        ..prodId = body['prod_id']
        ..quality = body['quality']
        ..size = body['size'];

      await orderItem.query().insert({
        'order_item': orderItem.orderItem,
        'order_num': orderItem.orderNum,
        'prod_id': orderItem.prodId,
        'quality': orderItem.quality,
        'size': orderItem.size,
      });

      return Response.json({'success': true, 'data': orderItem.toMap()});
    } catch (e) {
      print('Error in create: $e');
      return Response.json(
        {'error': 'Failed to create order item', 'details': e.toString()},
      );
    }
  }

  Future<Response> show(Request request, int id) async {
    try {
      final orderItem =
          await OrderitemsModel().query().where('order_item', '=', id).first();

      return Response.json({'success': true, 'data': orderItem});
    } catch (e) {
      return Response.json({
        'error': 'Bad Request',
        'message': e.toString(),
      });
    }
  }

  Future<Response> update(Request request) async {
    try {
      final body = await request.body;

      final orderItem = OrderitemsModel()
        ..orderItem = body['order_item']
        ..orderNum = body['order_num']
        ..prodId = body['prod_id']
        ..quality = body['quality']
        ..size = body['size'];

      await OrderitemsModel()
          .query()
          .where('order_item', '=', orderItem.orderItem)
          .update({
        'order_num': orderItem.orderNum,
        'prod_id': orderItem.prodId,
        'quality': orderItem.quality,
        'size': orderItem.size,
      });

      return Response.json({'success': true, 'data': orderItem.toMap()});
    } catch (e) {
      return Response.json({'error': 'Bad Request', 'message': e.toString()});
    }
  }

  Future<Response> destroy(Request request, int id) async {
    try {
      final orderItem =
          await OrderitemsModel().query().where('order_item', '=', id).delete();

      if (orderItem == 0) {
        return Response.json({
          'error': 'Not Found',
          'message': 'Order item with id $id not found',
        });
      }

      return Response.json({'message': 'Order item deleted successfully'});
    } catch (e) {
      return Response.json({
        'error': 'Bad Request',
        'message': e.toString(),
      });
    }
  }
}

final OrderitemsController orderItemsController = OrderitemsController();
