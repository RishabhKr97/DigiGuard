class Level {
  final String id;
  final String name;
  final String description;
  final int rank;

  const Level({
    required this.id,
    required this.name,
    required this.description,
    required this.rank,
  });

  Level.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        name = json['name'] as String,
        description = json['description'] as String,
        rank = json['rank'] as int;
}
