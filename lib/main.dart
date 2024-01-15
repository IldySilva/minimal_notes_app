import 'package:flutter/material.dart';
import 'package:minimal_notes_app/repo/notes_repo.dart';
import 'package:minimal_notes_app/theme/theme_provider.dart';
import 'package:provider/provider.dart';

import 'Pages/notes_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotesDb.initializeDb();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (c)=>NotesDb()),
      ChangeNotifierProvider(create: (c)=>ThemeProvider()),

    ],
    child: const App(),
  ));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const NotesPage(),
      theme: Provider.of<ThemeProvider>(context).themeData
    );
  }
}
