class Tournament {
  final int? id;
  final String name;
  final String date;
  final String? location;
  final String? description;
  final TournamentStatus status;
  final TournamentType type;

  Tournament({
    this.id,
    required this.name,
    required this.date,
    this.location,
    this.description,
    required this.status,
    required this.type,
  });

  factory Tournament.fromMap(Map<String, dynamic> map) {
    return Tournament(
      id: map['id'] as int,
      name: map['name'] as String,
      date: map['date'] as String,
      location: map['location'] as String?,
      description: map['description'] as String?,
      status: TournamentStatus.fromString(map['status'] as String),
      type: TournamentType.fromString(map['type'] as String),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'date': date,
      'location': location,
      'description': description,
      'status': status.toString(),
      'type': type.toString(),
    };
  }

  Tournament copyWith({
    int? id,
    String? name,
    String? date,
    String? location,
    String? description,
    TournamentStatus? status,
    TournamentType? type,
  }) {
    return Tournament(
      id: id ?? this.id,
      name: name ?? this.name,
      date: date ?? this.date,
      location: location ?? this.location,
      description: description ?? this.description,
      status: status ?? this.status,
      type: type ?? this.type,
    );
  }
}

enum TournamentStatus {
  upcoming,
  inProgress,
  completed,
  cancelled;

  @override
  String toString() {
    switch (this) {
      case TournamentStatus.upcoming:
        return 'upcoming';
      case TournamentStatus.inProgress:
        return 'in_progress';
      case TournamentStatus.completed:
        return 'completed';
      case TournamentStatus.cancelled:
        return 'cancelled';
    }
  }

  static TournamentStatus fromString(String value) {
    switch (value) {
      case 'upcoming':
        return TournamentStatus.upcoming;
      case 'in_progress':
        return TournamentStatus.inProgress;
      case 'completed':
        return TournamentStatus.completed;
      case 'cancelled':
        return TournamentStatus.cancelled;
      default:
        throw ArgumentError('Invalid tournament status: $value');
    }
  }
}

enum TournamentType {
  swiss,
  grups,
  groupWithPlayOff;

  @override
  String toString() {
    switch (this) {
      case TournamentType.swiss:
        return 'swiss';
      case TournamentType.grups:
        return 'grups';
      case TournamentType.groupWithPlayOff:
        return 'group_with_play_off';
    }
  }

  static TournamentType fromString(String value) {
    switch (value) {
      case 'swiss':
        return TournamentType.swiss;
      case 'grups':
        return TournamentType.grups;
      case 'group_with_play_off':
        return TournamentType.groupWithPlayOff;
      default:
        throw ArgumentError('Invalid tournament type: $value');
    }
  }
}
