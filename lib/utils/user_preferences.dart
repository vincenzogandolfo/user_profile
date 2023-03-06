import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_profile/model/user.dart';

// Elenco dei Dati iniziali

class UserPreferences {
  static late SharedPreferences _preferences;

  static const _keyUser = 'user';
  static const myUser = User(
    imagePath:
        'https://img.favpng.com/2/24/4/user-profile-computer-icons-png-favpng-6CB3By2TFDKyEjfXFbx3LaRR5.jpg',
    name: 'Utente',
    email: 'info@email.it',
    work: 'Professione',
    city: 'Città',
  );

  // Salvataggio dei dati inseriti nel Database (setUser)
  // restituzione dati dal Database per mostrarli (getUser)

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(User user) async {
    final json = jsonEncode(user.toJson());
    await _preferences.setString(_keyUser, json);
  }

  static User getUser() {
    final json = _preferences.getString(_keyUser);
    return json == null ? myUser : User.fromJson(jsonDecode(json));
  }
}
