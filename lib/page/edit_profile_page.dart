import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:user_profile/model/user.dart';
import 'package:user_profile/utils/user_preferences.dart';
import 'package:user_profile/widget/button_widget.dart';
import 'package:user_profile/widget/profile_widget.dart';
import 'package:user_profile/widget/textfield_widget.dart';
import 'package:path/path.dart';

// Schermata dove Modificare e Salvare i Dati Utente
class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late User user;

  @override
  void initState() {
    super.initState();

    user = UserPreferences.getUser();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 12),

                  // Inserimento Immagine dalla Galleria

                  ProfileWidget(
                    imagePath: user.imagePath,
                    isEdit: true,
                    onClicked: () async {
                      final image = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      if (image == null) return;
                      final directory =
                          await getApplicationDocumentsDirectory();
                      final name = basename(image.path);
                      final imageFile = File('${directory.path}/$name');
                      final newImage =
                          await File(image.path).copy(imageFile.path);
                      setState(
                          () => user = user.copy(imagePath: newImage.path));
                    },
                  ),
                  const SizedBox(height: 24),

                  // Inserimento Dati Utente con Tastiera

                  TextFieldWidget(
                    label: 'Nome e Cognome',
                    text: user.name,
                    onChanged: (name) => user = user.copy(name: name),
                  ),
                  const SizedBox(height: 24),
                  TextFieldWidget(
                    label: 'Email',
                    text: user.email,
                    onChanged: (email) => user = user.copy(email: email),
                  ),
                  const SizedBox(height: 24),
                  TextFieldWidget(
                    label: 'Professione',
                    text: user.work,
                    onChanged: (work) => user = user.copy(work: work),
                  ),
                  const SizedBox(height: 24),
                  TextFieldWidget(
                    label: 'Città',
                    text: user.city,
                    onChanged: (city) => user = user.copy(city: city),
                  ),
                  const SizedBox(height: 24),

                  // Pulsante che Salva i dati nel Database
                  // e li trasferisce alla schermata ProfilePage

                  ButtonWidget(
                    text: 'Salva',
                    onClicked: () {
                      UserPreferences.setUser(user);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
