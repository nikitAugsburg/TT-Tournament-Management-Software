class TournamentTab {
  final int id;
  final String name;
  bool hasUnsavedChanges;

  TournamentTab({
    required this.id,
    required this.name,
    this.hasUnsavedChanges = false,
  });
}
