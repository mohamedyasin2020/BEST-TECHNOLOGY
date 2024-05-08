import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Helperdb {
  static const databaseName = "PersonDetails";
  static const databaseVersion = 4;
  static const personDetailsTable = "PersonTable";
  static const Id = "PersonId";
  static const Name = "PersonName";
  static const Mobile = "PersonMobile";
  static const Gmail = "PersonGmail";
  static const Course = "Personcourse";
  static const Department = "PersonDepartment";

  late Database _db;

  Future<void> initialization() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, databaseName);

    _db = await openDatabase(
      path,
      version: databaseVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onCreate(Database database, int version) async {
    await database.execute('''
      CREATE TABLE $personDetailsTable(
      $Id INTEGER PRIMARY KEY,
      $Mobile TEXT,
      $Name TEXT,
      $Gmail TEXT,
      $Course TEXT,
      $Department TEXT
      )
   ''');
  }

  Future<void> _onUpgrade(
      Database database, int oldVersion, int newVersion) async {
    await database.execute("drop table $personDetailsTable");
    _onCreate(database, newVersion);
  }

  Future<int> insertpersondeatils(Map<String, dynamic> row) async {

    return await _db.insert(personDetailsTable, row);
  }
  Future<List<Map<String,dynamic>>> getStudentRecord() async{
    print("-------------------->getsudentRecord");
    return await _db.query(personDetailsTable);
  }
  Future<int>updatepersondetails(Map<String, dynamic> row)async{
    int id=row[Id];
    return await _db.update(
      personDetailsTable,
      row,
      where:"$Id=?",
      whereArgs:[id],
    );
  }
  Future<int>delectpersondetails(int id)async{
    return await _db.delete(
      personDetailsTable,
      where: "$Id=?",
      whereArgs: [id],
    );

  }


}




