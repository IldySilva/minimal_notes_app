import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minimal_notes_app/components/note_tile.dart';
import 'package:minimal_notes_app/repo/notes_repo.dart';
import 'package:provider/provider.dart';

import '../components/custom_drawer.dart';
import '../models/note.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final controller = TextEditingController();
  createNote() async {
    await showDialog(
        context: context,
        builder: (c) {
          return AlertDialog(
            title: const Text("New Note"),

            backgroundColor: Theme.of(context).colorScheme.background,
            content: TextField(
              controller: controller,
            ),
            actions: [

              MaterialButton(
                  onPressed: () {
                    context.read<NotesDb>().addNote(controller.text);
                    Navigator.pop(context);
                    controller.clear();
                  },
                  child: const Text("Ok"))
              ,
              MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    controller.clear();
                  },
                  child: const Text("Cancel")),
            ],
          );
        });
  }

  void reaNotes() {
    context.read<NotesDb>().fetchNotes();
  }

  updateNote(Note note) async {
    controller.text = note.text;
    await showDialog(
        context: context,
        builder: (c) {
          return AlertDialog(
            title: const Text("Edit Note"),
            backgroundColor: Theme.of(context).colorScheme.background,
            content: TextField(
              controller: controller,
            ),
            actions: [

              ElevatedButton(
                  onPressed: () {
                    context.read<NotesDb>().update(note.id, controller.text);
                    Navigator.pop(context);
                    controller.clear();
                  },
                  child: const Text("Save")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    controller.clear();
                  },
                  child: const Text("Cancel")),
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
    reaNotes();
  }

  @override
  Widget build(BuildContext context) {
    var currentNotes = context.watch<NotesDb>().currentNotes;

    return Scaffold(
      drawer: const CustomDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        onPressed: () => createNote(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              "N O T E S",
              style: GoogleFonts.dmSerifDisplay(
                  fontSize: 48,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: currentNotes.length,
                itemBuilder: (c, index) {
                  Note note = currentNotes[index];
                  return NoteTile(
                      note: note,
                      onEdit: () => updateNote(note),
                      onDelete: () => context.read<NotesDb>().delete(note.id));
                }),
          ),
        ],
      ),
    );
  }
}
