import 'package:vania/vania.dart';

class ProductnotesModel extends Model {
  String? noteId;
  String? productId;
  String? note;
  DateTime? createdAt;

  ProductnotesModel() {
    super.table('productnotes');
  }

  Map<String, dynamic> toMap() {
    return {
      'note_id': noteId,
      'product_id': productId,
      'note_text': note,
      'note_date': createdAt?.toIso8601String(),
    };
  }

  Future<void> save() async {
    if (noteId != null) {
      final existingNote = await ProductnotesModel().query().where('note_id', noteId).first();
      if (existingNote != null) {
        await ProductnotesModel().query().where('note_id', noteId).update(this.toMap());
      } else {
        await ProductnotesModel().query().create(this.toMap());
      }
    } else {
      await ProductnotesModel().query().create(this.toMap());
    }
  }
}
