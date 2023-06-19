import 'package:abc/product/localdb/controllers/abstract/i_user_localdb.dart';
import 'package:abc/product/localdb/user_model.dart/localdb_user_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class UserLocalDb implements IUserLocalDb {
  @override
  Future<Database> initializeDb() async {
    String path = join(await getDatabasesPath(), 'user.db');
    Database dbUser = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE User (id INTEGER PRIMARY KEY, username TEXT, email TEXT, password TEXT)');
    });
    return dbUser;
  }

  @override
  Future<void> createUser(LocalDbUserModel user) async {
    Database db = await initializeDb();
    db.insert(
      "User",
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> deleteUser() async {
    Database db = await initializeDb();
    db.delete("User");
  }

  @override
  Future<LocalDbUserModel?> getUser() async {
    Database db = await initializeDb();
    List<Map> list = await db.rawQuery('SELECT * FROM User');
    for (var row in list) {
      return LocalDbUserModel.fromMap(row as Map<String, dynamic>);
    }
    return null;
  }

  Future<int> getUserId() async {
    Database db = await initializeDb();
    int id = (await db.rawQuery('SELECT id FROM User')) as int;

    return id;
  }

  @override
  Future<int> updateUser(LocalDbUserModel user) async {
    Database db = await initializeDb();
    int id = await getUserId();
    return await db
        .update("User", user.toMap(), where: "id = ?", whereArgs: [id]);
  }
}
