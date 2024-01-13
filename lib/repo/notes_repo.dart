import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:minimal_notes_app/models/note.dart';
import 'package:path_provider/path_provider.dart';

class NotesDb extends ChangeNotifier {
  static late Isar isar;
  static Future<void> initializeDb() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([NoteSchema], directory: dir.path);
  }

  List<Note> currentNotes = [];

  /// Initialize DB;
  ///   Create

  Future<void> addNote(String textFromUser) async {
    final note = Note()..text = textFromUser;
    await isar.writeTxn(() => isar.notes.put(note));
fetchNotes();
  }

  ///   Read
  Future<void> fetchNotes() async {
    List<Note> fetchedNotes = await isar.notes.where().findAll();
    currentNotes.clear();
    currentNotes.addAll(fetchedNotes.toList());
    notifyListeners();

  }

  ///   Update
  Future update(int id,String text) async {
    final note = await isar.notes.get(id);
    if (note != null) {
      note.text=text;
      await isar.writeTxn(() => isar.notes.put(note));
      await fetchNotes();
    }
  }

  ///   Delete
  Future<void> delete(int id) async {
    final note = await isar.notes.get(id);

    if (note != null) {
      await isar.writeTxn(() => isar.notes.delete(id));
      await fetchNotes();

    }
  }
}
