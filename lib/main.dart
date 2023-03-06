import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:user_profile/page/profile_page.dart';
import 'package:user_profile/themes.dart';
import 'package:user_profile/utils/user_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Schermo sempre in Verticale
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Database
  await UserPreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemes.lightTheme,
      title: 'User Profile',
      home: const ProfilePage(),
    );
  }
}
