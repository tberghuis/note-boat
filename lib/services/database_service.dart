import 'dart:io';
import 'package:notes/models/note_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static final DatabaseService instance = DatabaseService._instance();
  static Database _db;

  DatabaseService._instance();

  // table note
  // cols:
  // note_id
  // note_text
  // // created_date
  // modified_date

  Future<Database> get db async {
    if (_db == null) {
      _db = await _initDb();
    }
    return _db;
  }

  Future<Database> _initDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + '/notes.db';

    print('notes path: $path');

    final todoListDb =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return todoListDb;
  }

  Future<void> _createDb(Database db, int version) async {
    await db.execute(
      'CREATE TABLE note(note_id INTEGER PRIMARY KEY AUTOINCREMENT, note_text TEXT, modified_date TEXT)',
    );
  }


  // should i contain this here.... better to put in bloc if not 
  // reused by multiple screens
  // nah just copy from simple example for now

  // Future<List<Note>> getNoteList() async {
  //   // TODO
  // delete empty notes
  //   Database db = await this.db;
  //   final List<Note> noteList = [];

  //   return noteList;
  // }



  Future<int> insertNote(Note note) async {
    Database db = await this.db;
    final int result = await db.insert('note', note.toMap());
    return result;
  }

}
