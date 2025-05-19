class Player {
  final int? id;
  final String name;
  final String? email;
  final String? phone;
  final int? rating;

  Player({
    this.id,
    required this.name,
    this.email,
    this.phone,
    this.rating,
  });

  factory Player.fromMap(Map<String, dynamic> map) {
    return Player(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String?,
      phone: map['phone'] as String?,
      rating: map['rating'] as int?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'rating': rating,
    };
  }

  Player copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    int? rating,
  }) {
    return Player(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      rating: rating ?? this.rating,
    );
  }
}
