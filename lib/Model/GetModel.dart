// models/post_model.dart

class Getmodel {
  final String strLeague;
  final String strTeam; // Menambahkan atribut description
  final String intFormedYear; // Menambahkan atribut price
  final String strBadge; // Menambahkan atribut price

  Getmodel({
    required this.strLeague,
    required this.strTeam,
    required this.intFormedYear,
    required this.strBadge,
  });

  // Factory method to create an instance of PostModel from JSON
  factory Getmodel.fromJson(Map<String, dynamic> json) {
    return Getmodel(
      strLeague: json['strLeague'],
      strTeam: json['strTeam'],
      intFormedYear: json['intFormedYear'],
      strBadge: json['strBadge'],
    );
  }
}
