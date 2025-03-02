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
      debugShowCheckedModeBanner: false,
      title: 'Dream Mapper',
      // Light theme (white background, black text and elements)
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(
          // Primary colors
          primary: Colors.black, // Main brand color
          onPrimary: Colors.white, // Text/icons on primary color
          // Surface colors (cards, sheets, etc.)
          surface: Colors.white,
          onSurface: Colors.black,
          // Error colors (keep red for errors)
          error: Colors.red,
          onError: Colors.white,
        ),
        // Making buttons consistently black
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
          ),
        ),
        // Making text buttons black
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
          ),
        ),
        // Making icon buttons black
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            foregroundColor: Colors.black,
          ),
        ),
        // Making icons black by default
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),

      // Dark theme (black background, white text and elements)
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
          // Primary colors
          primary: Colors.white, // Main brand color
          onPrimary: Colors.black, // Text/icons on primary color
          // Surface colors (cards, sheets, etc.)
          surface:  Color.fromARGB(255, 15, 14, 14),
          onSurface: Colors.white,
          // Error colors (keep red for errors)
          error: Colors.red,
          onError: Colors.white,
          // Making cards slightly off-black for better distinction
          surfaceContainerHighest: Color(0xFF121212),
        ),
        // Making buttons consistently white
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
        ),
        // Making text buttons white
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
          ),
        ),
        // Making icon buttons white
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            foregroundColor: Colors.white,
          ),
        ),
        // Making icons white by default
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),

      // Default to dark theme regardless of system settings
      themeMode: ThemeMode.dark,

      home: HomePage(),
    );
  }
}
