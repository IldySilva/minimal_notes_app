import 'package:flutter/material.dart';
import 'package:minimal_notes_app/models/note.dart';

class NoteTile extends StatelessWidget {
  const NoteTile({super.key,required this.note,required this.onDelete, required this.onEdit});
final Note note;
  final  void Function()  onDelete;
final  void Function() onEdit;
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.only(top:15,left: 25,right: 25),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: Theme.of(context).colorScheme.primary),
      child: ListTile(
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: onEdit
            ),
            IconButton(
              icon: const Icon(
                Icons.delete,
              ),
              onPressed:onDelete
            ),
          ],
        ),
        title: Text(note.text),
      ),
    );
  }
}
