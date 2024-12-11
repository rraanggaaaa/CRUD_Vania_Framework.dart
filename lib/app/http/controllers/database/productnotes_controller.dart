import 'package:paml_backend_vania/app/models/productnotes_model.dart';
import 'package:vania/vania.dart';

class ProductnotesController extends Controller {
  Future<Response> index() async {
    try {
      final productNotes = await ProductnotesModel().query().get();
      return Response.json(productNotes);
    } catch (e) {
      return Response.json(400);
    }
  }

  Future<Response> create(Request request) async {
    try {
      final body = await request.body;

      if (body['note_id'] == null ||
          body['product_id'] == null ||
          body['note_text'] == null ||
          body['note_date'] == null) {
        return Response.json(
          {'error': 'Missing required fields'},
        );
      }

      final productNote = ProductnotesModel()
        ..noteId = body['note_id']
        ..productId = body['product_id']
        ..note = body['note_text']
        ..createdAt = DateTime.parse(body['note_date']);

      await productNote.query().insert({
        'note_id': productNote.noteId,
        'product_id': productNote.productId,
        'note_text': productNote.note,
        'note_date': productNote.createdAt,
      });

      return Response.json({'success': true, 'data': productNote.toMap()});
    } catch (e) {
      print('Error in create: $e');
      return Response.json(
        {'error': 'Failed to create product note', 'details': e.toString()},
      );
    }
  }

  Future<Response> show(Request request, int id) async {
    try {
      final productNote =
          await ProductnotesModel().query().where('note_id', '=', id).first();

      return Response.json({'success': true, 'data': productNote});
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

      final productNote = ProductnotesModel()
        ..noteId = body['note_id']
        ..productId = body['product_id']
        ..note = body['note_text']
        ..createdAt = DateTime.parse(body['note_date']);

      await ProductnotesModel()
          .query()
          .where('note_id', '=', productNote.noteId)
          .update({
        'product_id': productNote.productId,
        'note_text': productNote.note,
        'note_date': productNote.createdAt,
      });

      return Response.json({'success': true, 'data': productNote.toMap()});
    } catch (e) {
      return Response.json({'error': 'Bad Request', 'message': e.toString()});
    }
  }

  Future<Response> destroy(Request request, int id) async {
    try {
      final productNote =
          await ProductnotesModel().query().where('note_id', '=', id).delete();

      if (productNote == 0) {
        return Response.json({
          'error': 'Not Found',
          'message': 'Product note with id $id not found',
        });
      }

      return Response.json({'message': 'Product note deleted successfully'});
    } catch (e) {
      return Response.json({
        'error': 'Bad Request',
        'message': e.toString(),
      });
    }
  }
}

final ProductnotesController productnotesController = ProductnotesController();
