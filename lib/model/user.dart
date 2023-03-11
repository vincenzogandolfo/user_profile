// Elenco dei componenti da Visualizzare
// e Salvare in Database con JSON

class User {
  final String imagePath;
  final String name;
  final String email;
  final String work;
  final String city;

  const User({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.work,
    required this.city,
  });

  User copy({
    String? imagePath,
    String? name,
    String? email,
    String? work,
    String? city,
  }) =>
      User(
        imagePath: imagePath ?? this.imagePath,
        name: name ?? this.name,
        email: email ?? this.email,
        work: work ?? this.work,
        city: city ?? this.city,
      );

  static User fromJson(Map<String, dynamic> json) => User(
        imagePath: json['imagePath'],
        name: json['name'],
        email: json['email'],
        work: json['work'],
        city: json['city'],
      );

  Map<String, dynamic> toJson() => {
        'imagePath': imagePath,
        'name': name,
        'email': email,
        'work': work,
        'city': city,
      };
}
