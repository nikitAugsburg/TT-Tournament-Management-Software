import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'screens/home_screen.dart';
import 'services/database_service.dart';
import 'services/tab_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize FFI for Windows
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  final databaseService = DatabaseService();
  await databaseService.initializeDatabase();

  runApp(
    MultiProvider(
      providers: [
        Provider<DatabaseService>(create: (_) => databaseService),
        ChangeNotifierProvider<TabManager>(create: (_) => TabManager()),
      ],
      child: const TournamentTrackerApp(),
    ),
  );
}

class TournamentTrackerApp extends StatelessWidget {
  const TournamentTrackerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tournament Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
    );
  }
}
