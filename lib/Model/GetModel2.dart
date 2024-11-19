class PostModel {
  final String strTeam;
  final String strLeague;
  final String strBadge;

  PostModel({
    required this.strTeam,
    required this.strLeague,
    required this.strBadge,
  });

  // Method untuk memetakan JSON ke objek PostModel
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      strTeam: json['strTeam'] as String,
      strLeague: json['strLeague'] as String,
      strBadge: json['strBadge'] as String,
    );
  }

  // Method untuk memetakan objek PostModel ke map (untuk menyimpan ke DB)
  Map<String, dynamic> toMap() {
    return {
      'strTeam': strTeam,
      'strLeague': strLeague,
      'strBadge': strBadge,
    };
  }
}
