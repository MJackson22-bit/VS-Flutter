import 'package:sqflite/sqflite.dart';
import 'package:vaint_service/model/user.dart';
class UserDatabase {
  static final UserDatabase instance = UserDatabase._init();
  static Database? _database;
  UserDatabase._init();

  Future<Database> get databse async {
    if (_database != null) return _database!;
    _database = await _initDB('users.db');
    return _database!;
  }

  Future<Database> _initDB(String s) async {
    final dbPath = await getDatabasesPath();
    final path = dbPath + s;
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    await db.execute('''
CREATE TABLE $tableUser ( 
  ${UserFields.id} $idType,
  ${UserFields.nombre} $textType,
  ${UserFields.correo} $textType,
  ${UserFields.passwd} $textType
  )
''');
  }

  Future<User> create(User user) async{
    final db = await instance.databse;
    final id = await db.insert(tableUser, user.toJson());
    return user.copy(id: id);
  }

  Future<List<User>> readUsers() async{
    final db = await instance.databse;
    final result = await db.query(tableUser);
    return result.map((json) => User.froomJson(json)).toList();
  }

  Future close() async{
    final db = await instance.databse;
    db.close();
  }
}