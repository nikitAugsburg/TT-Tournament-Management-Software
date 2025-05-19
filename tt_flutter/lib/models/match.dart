class Match {
  final int? id;
  final int tournamentId;
  final int player1Id;
  final int player2Id;
  final int? player1Score;
  final int? player2Score;
  final int? winnerId;
  final int round;
  final MatchStatus status;

  Match({
    this.id,
    required this.tournamentId,
    required this.player1Id,
    required this.player2Id,
    this.player1Score,
    this.player2Score,
    this.winnerId,
    required this.round,
    required this.status,
  });

  factory Match.fromMap(Map<String, dynamic> map) {
    return Match(
      id: map['id'] as int,
      tournamentId: map['tournament_id'] as int,
      player1Id: map['player1_id'] as int,
      player2Id: map['player2_id'] as int,
      player1Score: map['player1_score'] as int?,
      player2Score: map['player2_score'] as int?,
      winnerId: map['winner_id'] as int?,
      round: map['round'] as int,
      status: MatchStatus.fromString(map['status'] as String),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'tournament_id': tournamentId,
      'player1_id': player1Id,
      'player2_id': player2Id,
      'player1_score': player1Score,
      'player2_score': player2Score,
      'winner_id': winnerId,
      'round': round,
      'status': status.toString(),
    };
  }

  Match copyWith({
    int? id,
    int? tournamentId,
    int? player1Id,
    int? player2Id,
    int? player1Score,
    int? player2Score,
    int? winnerId,
    int? round,
    MatchStatus? status,
  }) {
    return Match(
      id: id ?? this.id,
      tournamentId: tournamentId ?? this.tournamentId,
      player1Id: player1Id ?? this.player1Id,
      player2Id: player2Id ?? this.player2Id,
      player1Score: player1Score ?? this.player1Score,
      player2Score: player2Score ?? this.player2Score,
      winnerId: winnerId ?? this.winnerId,
      round: round ?? this.round,
      status: status ?? this.status,
    );
  }
}

enum MatchStatus {
  scheduled,
  inProgress,
  completed,
  cancelled;

  @override
  String toString() {
    switch (this) {
      case MatchStatus.scheduled:
        return 'scheduled';
      case MatchStatus.inProgress:
        return 'in_progress';
      case MatchStatus.completed:
        return 'completed';
      case MatchStatus.cancelled:
        return 'cancelled';
    }
  }

  static MatchStatus fromString(String value) {
    switch (value) {
      case 'scheduled':
        return MatchStatus.scheduled;
      case 'in_progress':
        return MatchStatus.inProgress;
      case 'completed':
        return MatchStatus.completed;
      case 'cancelled':
        return MatchStatus.cancelled;
      default:
        throw ArgumentError('Invalid match status: $value');
    }
  }
}
