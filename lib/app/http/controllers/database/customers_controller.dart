import 'package:vania/vania.dart';
import 'package:paml_backend_vania/app/models/customers_model.dart'; // Adjust the import path as needed

class CustomersController extends Controller {
  Future<Response> index() async {
    try {
      final customers = await CustomersModel().query().get();
      return Response.json(customers);
    } catch (e) {
      return Response.json(400);
    }
  }

  Future<Response> create(Request request) async {
    try {
      final body = await request.body;

      if (body['cust_id'] == null ||
          body['cust_name'] == null ||
          body['cust_address'] == null ||
          body['cust_city'] == null ||
          body['cust_state'] == null ||
          body['cust_zip'] == null ||
          body['cust_country'] == null ||
          body['cust_telp'] == null) {
        return Response.json(
          {'error': 'Missing required fields'},
        );
      }

      final customer = CustomersModel()
        ..custId = body['cust_id']
        ..custName = body['cust_name']
        ..custAddress = body['cust_address']
        ..custCity = body['cust_city']
        ..custState = body['cust_state']
        ..custZip = body['cust_zip']
        ..custCountry = body['cust_country']
        ..custTelp = body['cust_telp'];

      await customer.query().insert({
        'cust_id': customer.custId,
        'cust_name': customer.custName,
        'cust_address': customer.custAddress,
        'cust_city': customer.custCity,
        'cust_state': customer.custState,
        'cust_zip': customer.custZip,
        'cust_country': customer.custCountry,
        'cust_telp': customer.custTelp,
      });
      return Response.json({'success': true, 'data': customer.toMap()});
    } catch (e) {
      print('Error in create: $e');
      return Response.json(
        {'error': 'Failed to create customer', 'details': e.toString()},
      );
    }
  }

  Future<Response> show(Request request, int id) async {
    try {
      final customer =
          await CustomersModel().query().where('cust_id', '=', id).first();

      if (customer == null) {
        return Response.json({
          'error': 'Not Found',
          'message': 'Customer with id $id not found',
        });
      }

      return Response.json({'success': true, 'data': customer});
    } catch (e) {
      return Response.json({
        'error': 'Bad Request',
        'message': e.toString(),
      });
    }
  }

  Future<Response> update(Request request, int id) async {
    try {
      final body = await request.body;

      final customer = CustomersModel()
        ..custId = body['cust_id']
        ..custName = body['cust_name']
        ..custAddress = body['cust_address']
        ..custCity = body['cust_city']
        ..custState = body['cust_state']
        ..custZip = body['cust_zip']
        ..custCountry = body['cust_country']
        ..custTelp = body['cust_telp'];

      await CustomersModel()
          .query()
          .where('cust_id', '=', id)
          .update({
        'cust_name': customer.custName,
        'cust_address': customer.custAddress,
        'cust_city': customer.custCity,
        'cust_state': customer.custState,
        'cust_zip': customer.custZip,
        'cust_country': customer.custCountry,
        'cust_telp': customer.custTelp,
      });

      return Response.json({'success': true, 'data': customer.toMap()});
    } catch (e) {
      return Response.json({'error': 'Bad Request', 'message': e.toString()});
    }
  }

  Future<Response> destroy(Request request, int id) async {
    try {
      final customer =
          await CustomersModel().query().where('cust_id', '=', id).delete();

      if (customer == 0) {
        return Response.json({
          'error': 'Not Found',
          'message': 'Customer with id $id not found',
        });
      }

      return Response.json({'message': 'Customer deleted successfully'});
    } catch (e) {
      return Response.json({
        'error': 'Bad Request',
        'message': e.toString(),
      });
    }
  }
}

final CustomersController customersController = CustomersController();
