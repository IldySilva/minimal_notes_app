import 'package:flutter/material.dart';
import 'package:minimal_notes_app/theme/theme_provider.dart';

class DrawerTile extends StatelessWidget {
  DrawerTile(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});

  final String title;
  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
        leading: Icon(icon),
        onTap: onTap,
      ),
    );
  }
}
