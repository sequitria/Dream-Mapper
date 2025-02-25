import 'package:dream_mapper/pages/home_page.dart';
import 'package:dream_mapper/services/journal_services.dart';
import 'package:flutter/material.dart';

void main() async {
  // Ensures DB is initialised at startup
  // All JournalService calls are the same instance no matter what file it's called from
  // Avoids multiple initialisation conflicts for the Isar DB
  WidgetsFlutterBinding.ensureInitialized();
  await JournalServices.initialize();
  runApp(const DreamMapper());
}

class DreamMapper extends StatelessWidget {
  const DreamMapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // TODO: ESTABLISH THEME
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
