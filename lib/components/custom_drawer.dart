import 'package:flutter/material.dart';
import 'package:minimal_notes_app/Pages/settings_page.dart';
import 'package:minimal_notes_app/components/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          const DrawerHeader(child: Icon(Icons.list_alt)),
          DrawerTile(
              title: 'Notes',
              icon: Icons.note,
              onTap: () {
                Navigator.pop(context);
              }),
          DrawerTile(
              title: 'Settings',
              icon: Icons.settings,
              onTap: () {
                Navigator.pop(context);
                showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (ctx) {
                      return const SettingsPage();
                    });
              })
        ],
      ),
    );
  }
}
