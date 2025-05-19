import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static const String dbName = 'tournament_tracker.db';
  static const int dbVersion = 1;

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initializeDatabase();
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, dbName);

    return await openDatabase(
      path,
      version: dbVersion,
      onCreate: _createTables,
      onUpgrade: _upgradeTables,
    );
  }

  Future<void> _createTables(Database db, int version) async {
    // Tournaments table
    await db.execute('''
      CREATE TABLE tournaments (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        date TEXT NOT NULL,
        location TEXT,
        description TEXT,
        status TEXT NOT NULL,
        type TEXT NOT NULL
      )
    ''');

    // Players table
    await db.execute('''
      CREATE TABLE players (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        email TEXT,
        phone TEXT,
        rating INTEGER
      )
    ''');

    // Matches table
    await db.execute('''
      CREATE TABLE matches (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        tournament_id INTEGER NOT NULL,
        player1_id INTEGER NOT NULL,
        player2_id INTEGER NOT NULL,
        player1_score INTEGER,
        player2_score INTEGER,
        winner_id INTEGER,
        round INTEGER NOT NULL,
        status TEXT NOT NULL,
        FOREIGN KEY (tournament_id) REFERENCES tournaments (id) ON DELETE CASCADE,
        FOREIGN KEY (player1_id) REFERENCES players (id) ON DELETE CASCADE,
        FOREIGN KEY (player2_id) REFERENCES players (id) ON DELETE CASCADE
      )
    ''');

    // Tournament Players table (join table)
    await db.execute('''
      CREATE TABLE tournament_players (
        tournament_id INTEGER NOT NULL,
        player_id INTEGER NOT NULL,
        seed INTEGER,
        PRIMARY KEY (tournament_id, player_id),
        FOREIGN KEY (tournament_id) REFERENCES tournaments (id) ON DELETE CASCADE,
        FOREIGN KEY (player_id) REFERENCES players (id) ON DELETE CASCADE
      )
    ''');
  }

  Future<void> _upgradeTables(
      Database db, int oldVersion, int newVersion) async {
    // Handle database upgrades here when needed
  }

  // Tournament methods
  Future<int> insertTournament(Map<String, dynamic> tournament) async {
    final db = await database;
    return await db.insert('tournaments', tournament);
  }

  Future<List<Map<String, dynamic>>> getTournaments() async {
    final db = await database;
    return await db.query('tournaments');
  }

  Future<Map<String, dynamic>?> getTournament(int id) async {
    final db = await database;
    final results = await db.query(
      'tournaments',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    return results.isNotEmpty ? results.first : null;
  }

  Future<int> updateTournament(Map<String, dynamic> tournament) async {
    final db = await database;
    return await db.update(
      'tournaments',
      tournament,
      where: 'id = ?',
      whereArgs: [tournament['id']],
    );
  }

  Future<int> deleteTournament(int id) async {
    final db = await database;
    return await db.delete(
      'tournaments',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Player methods
  Future<int> insertPlayer(Map<String, dynamic> player) async {
    final db = await database;
    return await db.insert('players', player);
  }

  Future<List<Map<String, dynamic>>> getPlayers() async {
    final db = await database;
    return await db.query('players');
  }

  Future<Map<String, dynamic>?> getPlayer(int id) async {
    final db = await database;
    final results = await db.query(
      'players',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    return results.isNotEmpty ? results.first : null;
  }

  Future<int> updatePlayer(Map<String, dynamic> player) async {
    final db = await database;
    return await db.update(
      'players',
      player,
      where: 'id = ?',
      whereArgs: [player['id']],
    );
  }

  Future<int> deletePlayer(int id) async {
    final db = await database;
    return await db.delete(
      'players',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Match methods
  Future<int> insertMatch(Map<String, dynamic> match) async {
    final db = await database;
    return await db.insert('matches', match);
  }

  Future<List<Map<String, dynamic>>> getMatchesByTournament(
      int tournamentId) async {
    final db = await database;
    return await db.query(
      'matches',
      where: 'tournament_id = ?',
      whereArgs: [tournamentId],
    );
  }

  Future<int> updateMatch(Map<String, dynamic> match) async {
    final db = await database;
    return await db.update(
      'matches',
      match,
      where: 'id = ?',
      whereArgs: [match['id']],
    );
  }

  // Tournament Player methods
  Future<void> addPlayerToTournament(int tournamentId, int playerId,
      {int? seed}) async {
    final db = await database;
    await db.insert('tournament_players', {
      'tournament_id': tournamentId,
      'player_id': playerId,
      'seed': seed,
    });
  }

  Future<List<Map<String, dynamic>>> getPlayersInTournament(
      int tournamentId) async {
    final db = await database;
    return await db.rawQuery('''
      SELECT p.*, tp.seed
      FROM players p
      JOIN tournament_players tp ON p.id = tp.player_id
      WHERE tp.tournament_id = ?
      ORDER BY tp.seed
    ''', [tournamentId]);
  }

  Future<void> removePlayerFromTournament(
      int tournamentId, int playerId) async {
    final db = await database;
    await db.delete(
      'tournament_players',
      where: 'tournament_id = ? AND player_id = ?',
      whereArgs: [tournamentId, playerId],
    );
  }
}
