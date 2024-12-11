import 'package:vania/vania.dart';

class VendorsModel extends Model {
  String? vendorId;
  String? vendorName;
  String? address;
  String? city;
  String? state;
  String? zip;
  String? country;

  VendorsModel() {
    super.table('vendors');
  }

  Map<String, dynamic> toMap() {
    return {
      'vend_id': vendorId,
      'vend_name': vendorName,
      'vend_address': address,
      'vend_kota': city,
      'vend_state': state,
      'vend_zip': zip,
      'vend_country': country,
    };
  }

  Future<void> save() async {
    if (vendorId != null) {
      final existingVendor = await VendorsModel().query().where('vend_id', vendorId).first();
      if (existingVendor != null) {
        await VendorsModel().query().where('vend_id', vendorId).update(this.toMap());
      } else {
        await VendorsModel().query().create(this.toMap());
      }
    } else {
      await VendorsModel().query().create(this.toMap());
    }
  }
}
