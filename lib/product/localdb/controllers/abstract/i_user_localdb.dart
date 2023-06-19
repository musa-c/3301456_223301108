import 'package:sqflite/sqflite.dart';

import '../../user_model.dart/localdb_user_model.dart';

abstract class IUserLocalDb {
  // C R U D
  Future<Database> initializeDb();
  Future<void> createUser(LocalDbUserModel user);
  Future<LocalDbUserModel?> getUser();
  Future<int> updateUser(LocalDbUserModel user);
  Future<void> deleteUser();
}
