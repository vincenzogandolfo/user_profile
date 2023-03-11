import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_profile/model/user.dart';

// Elenco dei Dati iniziali

class UserPreferences {
  static late SharedPreferences _preferences;

  static const _keyUser = 'user';
  static const myUser = User(
    imagePath: 'https://freesvg.org/img/abstract-user-flat-4.png',
    name: 'Utente',
    email: 'info@email.it',
    work: 'Professione',
    city: 'Città',
  );

  // Creazione Database (init)
  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  // Salvataggio dei dati inseriti nel Database (setUser)
  static Future setUser(User user) async {
    final json = jsonEncode(user.toJson());
    await _preferences.setString(_keyUser, json);
  }

  // Restituzione dati dal Database per mostrarli (getUser)
  static User getUser() {
    final json = _preferences.getString(_keyUser);
    return json == null ? myUser : User.fromJson(jsonDecode(json));
  }
}
