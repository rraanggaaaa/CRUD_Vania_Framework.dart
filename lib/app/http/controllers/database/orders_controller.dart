import 'package:vania/vania.dart';
import 'package:paml_backend_vania/app/models/orders_model.dart'; // Adjust the import path as needed

class OrdersController extends Controller {
  Future<Response> index() async {
    try {
      final orders = await OrdersModel().query().get();
      return Response.json(orders);
    } catch (e) {
      return Response.json(400);
    }
  }

  Future<Response> create(Request request) async {
    try {
      final body = await request.body;

      if (body['order_num'] == null ||
          body['customer_id'] == null ||
          body['order_date'] == null) {
        return Response.json(
          {'error': 'Missing required fields'},
        );
      }

      final order = OrdersModel()
        ..orderNum = body['order_num']
        ..customerId = body['customer_id']
        ..orderDate = body['order_date'];

      await order.query().insert({
        'order_num': order.orderNum,
        'customer_id': order.customerId,
        'order_date': order.orderDate,
      });

      return Response.json({'success': true, 'data': order.toMap()});
    } catch (e) {
      print('Error in create: $e');
      return Response.json(
        {'error': 'Failed to create order', 'details': e.toString()},
      );
    }
  }

  Future<Response> show(Request request, int id) async {
    try {
      final order =
          await OrdersModel().query().where('order_num', '=', id).first();

      return Response.json({'success': true, 'data': order});
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

      final order = OrdersModel()
        ..orderNum = body['order_num']
        ..customerId = body['customer_id']
        ..orderDate = body['order_date'];

      await OrdersModel()
          .query()
          .where('order_num', '=', order.orderNum)
          .update({
        'customer_id': order.customerId,
        'order_date': order.orderDate,
      });

      return Response.json({'success': true, 'data': order.toMap()});
    } catch (e) {
      return Response.json({'error': 'Bad Request', 'message': e.toString()});
    }
  }

  Future<Response> destroy(Request request, int id) async {
    try {
      final order =
          await OrdersModel().query().where('order_num', '=', id).delete();

      if (order == 0) {
        return Response.json({
          'error': 'Not Found',
          'message': 'Order with id $id not found',
        });
      }

      return Response.json({'message': 'Order deleted successfully'});
    } catch (e) {
      return Response.json({
        'error': 'Bad Request',
        'message': e.toString(),
      });
    }
  }
}

final OrdersController ordersController = OrdersController();
