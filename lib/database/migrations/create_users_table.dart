import 'package:vania/vania.dart';

class CreateUsersTable extends Migration {
  @override
  Future<void> up() async {
    super.up();
    await createTableNotExists('users', () {
      string('id', length: 36);
      string('name', length: 50);
      string('username', length: 50);
      string('email', length: 100);
      string('password', length: 255);
      string('role', length: 20);
      dateTime('created_at', nullable: true);
      dateTime('updated_at', nullable: true);
      dateTime('deleted_at', nullable: true);
      primary('id');
      
      index(ColumnIndex.unique, 'id', ['id']);
    });
  }

  @override
  Future<void> down() async {
    super.down();
    await dropIfExists('users');
  }
}
