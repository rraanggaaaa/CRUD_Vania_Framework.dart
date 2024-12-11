import 'package:vania/vania.dart';
import 'package:paml_backend_vania/app/models/products_model.dart'; // Adjust the import path as needed

class ProductController extends Controller {
  Future<Response> index() async {
    try {
      final products = await ProductsModel().query().get();
      return Response.json(products);
    } catch (e) {
      return Response.json(400);
    }
  }

  Future<Response> create(Request request) async {
    try {
      final body = await request.body;

      if (body['prod_id'] == null ||
          body['vend_id'] == null ||
          body['prod_name'] == null ||
          body['prod_price'] == null ||
          body['prod_desc'] == null) {
        return Response.json(
          {'error': 'Missing required fields'},
        );
      }

      final product = ProductsModel()
        ..prodId = body['prod_id']
        ..vendId = body['vend_id']
        ..prodName = body['prod_name']
        ..prodPrice = body['prod_price']
        ..prodDesc = body['prod_desc'];

      await product.query().insert({
        'prod_id': product.prodId,
        'vend_id': product.vendId,
        'prod_name': product.prodName,
        'prod_price': product.prodPrice,
        'prod_desc': product.prodDesc,
      });

      return Response.json({'success': true, 'data': product.toMap()});
    } catch (e) {
      print('Error in create: $e');
      return Response.json(
        {'error': 'Failed to create product', 'details': e.toString()},
      );
    }
  }

  Future<Response> show(Request request, int id) async {
    try {
      final product =
          await ProductsModel().query().where('prod_id', '=', id).first();

      return Response.json({'success': true, 'data': product});
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

      final product = ProductsModel()
        ..prodId = body['prod_id']
        ..vendId = body['vend_id']
        ..prodName = body['prod_name']
        ..prodPrice = body['prod_price']
        ..prodDesc = body['prod_desc'];

      await ProductsModel()
          .query()
          .where('prod_id', '=', product.prodId)
          .update({
        'vend_id': product.vendId,
        'prod_name': product.prodName,
        'prod_price': product.prodPrice,
        'prod_desc': product.prodDesc,
      });

      return Response.json({'success': true, 'data': product.toMap()});
    } catch (e) {
      return Response.json({'error': 'Bad Request', 'message': e.toString()});
    }
  }

  Future<Response> destroy(Request request, int id) async {
    try {
      final product =
          await ProductsModel().query().where('prod_id', '=', id).delete();

      if (product == 0) {
        return Response.json({
          'error': 'Not Found',
          'message': 'Product with id $id not found',
        });
      }

      return Response.json({'message': 'Product deleted successfully'});
    } catch (e) {
      return Response.json({
        'error': 'Bad Request',
        'message': e.toString(),
      });
    }
  }
}

final ProductController productController = ProductController();