import 'package:vania/vania.dart';
import 'package:paml_backend_vania/app/models/vendors_model.dart'; // Adjust the import path as needed

class VendorsController extends Controller {
  Future<Response> index() async {
    try {
      final vendors = await VendorsModel().query().get();
      return Response.json(vendors);
    } catch (e) {
      return Response.json(400);
    }
  }

  Future<Response> create(Request request) async {
    try {
      final body = await request.body;

      if (body['vend_id'] == null ||
          body['vend_name'] == null ||
          body['vend_address'] == null ||
          body['vend_kota'] == null ||
          body['vend_state'] == null ||
          body['vend_zip'] == null ||
          body['vend_country'] == null) {
        return Response.json(
          {'error': 'Missing required fields'},
        );
      }

      final vendor = VendorsModel()
        ..vendorId = body['vend_id']
        ..vendorName = body['vend_name']
        ..address = body['vend_address']
        ..city = body['vend_kota']
        ..state = body['vend_state']
        ..zip = body['vend_zip']
        ..country = body['vend_country'];

      await vendor.query().insert({
        'vend_id': vendor.vendorId,
        'vend_name': vendor.vendorName,
        'vend_address': vendor.address,
        'vend_kota': vendor.city,
        'vend_state': vendor.state,
        'vend_zip': vendor.zip,
        'vend_country': vendor.country,
      });
      return Response.json({'success': true, 'data': vendor.toMap()});
    } catch (e) {
      print('Error in store: $e');
      return Response.json(
        {'error': 'Failed to create vendor', 'details': e.toString()},
      );
    }
  }

  Future<Response> show(Request request, int id) async {
    try {
      final vendor =
          await VendorsModel().query().where('vend_id', '=', id).first();

      return Response.json({'success': true, 'data': vendor});
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

      final vendor = VendorsModel()
        ..vendorId = body['vend_id']
        ..vendorName = body['vend_name']
        ..address = body['vend_address']
        ..city = body['vend_kota']
        ..state = body['vend_state']
        ..zip = body['vend_zip']
        ..country = body['vend_country'];

      await VendorsModel()
          .query()
          .where('vend_id', '=', vendor.vendorId)
          .update({
        'vend_name': vendor.vendorName,
        'vend_address': vendor.address,
        'vend_kota': vendor.city,
        'vend_state': vendor.state,
        'vend_zip': vendor.zip,
        'vend_country': vendor.country,
      });

      return Response.json({'success': true, 'data': vendor.toMap()});
    } catch (e) {
      return Response.json({'error': 'Bad Request', 'message': e.toString()});
    }
  }

  Future<Response> destroy(Request request, int id) async {
    try {
      final vendor =
          await VendorsModel().query().where('vend_id', '=', id).delete();

      if (vendor == 0) {
        return Response.json({
          'error': 'Not Found',
          'message': 'Vendor with id $id not found',
        });
      }

      return Response.json({'message': 'Vendor deleted successfully'});
    } catch (e) {
      return Response.json({
        'error': 'Bad Request',
        'message': e.toString(),
      });
    }
  }
}

final VendorsController vendorsController = VendorsController();
