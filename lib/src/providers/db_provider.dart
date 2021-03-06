
import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qrreader_app/src/models/scan_model.dart';

class DBProvider {

  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future <Database>get database async {

    if( _database != null ) return _database;

    _database = await initDB();
    return _database;

  }


  initDB() async {

    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    final path = join (documentsDirectory.path, 'ScansDB.db');
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db){},
      onCreate: ( Database db, int version ) async {
        await db.execute(
          'CREATE TABLE Scans('
          ' id INTEGER PRIMARY KEY,'
          ' tipo TEXT,'
          ' valor TEXT'
          ')'
        );
      }
    );

  }

  //Crear Registros o inserciones en DB Manera 1
  nuevoScanRaw( ScanModel nuevoScan ) async {
    
    final db = await database;

    final res = await db.rawInsert(
      "INSERT into Scans (id, tipo, valor) "
      "VALUES ( ${ nuevoScan.id }, '${nuevoScan.tipo}', '${nuevoScan.valor}' )"
    );
    return res;
  }

  //Crear Registros o inserciones en DB Manera 2
  nuevoScan ( ScanModel nuevoScan ) async {

    final db = await database;
    final res = db.insert('Scans', nuevoScan.toJson());

    return res;

  }

}

