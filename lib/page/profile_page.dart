import 'package:flutter/material.dart';
import 'package:user_profile/model/user.dart';
import 'package:user_profile/page/edit_profile_page.dart';
import 'package:user_profile/utils/user_preferences.dart';
import 'package:user_profile/widget/profile_widget.dart';

// Schermata Principale Utente
// mostra immagine e dati inseriti
// dopo click sul tasto "Salva"

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Mostra l'Immagine scelta dalla Galleria

          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const EditProfilePage(),
                ),
              );
              setState(() {});
            },
          ),
          const SizedBox(height: 24),

          // Mostra i Dati Utente inseriti

          buildUser(user),
        ],
      ),
    );
  }

  Widget buildUser(User user) => Column(
        children: [
          Text(
            user.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 24),
          Text(
            user.work,
            style: const TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          const SizedBox(height: 4),
          Text(
            user.city,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      );
}
