import 'package:flutter/material.dart';
import 'package:minimal_notes_app/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(

      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50), topRight: Radius.circular(50)),
      child: Container(
        color: Theme.of(context).colorScheme.background,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: SwitchListTile(
                value:
                    Provider.of<ThemeProvider>(context, listen: false).isDarkMode,
                onChanged: (v) {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheme();
                },
                title: const Text("Dark Mode"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
