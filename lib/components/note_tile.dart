import 'package:flutter/material.dart';
import 'package:minimal_notes_app/models/note.dart';
import 'package:popover/popover.dart';

class NoteTile extends StatelessWidget {
  const NoteTile(
      {super.key,
      required this.note,
      required this.onDelete,
      required this.onEdit});
  final Note note;
  final void Function() onDelete;
  final void Function() onEdit;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 25, right: 25),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).colorScheme.primary),
      child: ListTile(
        trailing: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () => showPopover(
                  width: 100,
                  height: 100,
                  backgroundColor: Theme.of(context).colorScheme.background,
                  context: context,
                  bodyBuilder: (context) {
                    return Column(
                      children: [
                        MaterialButton(
                          onPressed: (){

                            Navigator.pop(context);
                            onEdit;
                    },
                          child: const Text("Edit"),
                        ),
                        MaterialButton(
                          onPressed:(){
                            Navigator.pop(context);
                            onDelete;

                          },
                          child: const Text("Delete"),
                        )
                      ],
                    );
                  }),
            );
          }
        ),
        title: Text(note.text),
      ),
    );
  }
}
