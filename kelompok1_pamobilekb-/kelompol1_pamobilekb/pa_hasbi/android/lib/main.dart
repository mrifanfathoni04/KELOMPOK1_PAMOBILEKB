import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pa_hasbi/firebase_options.dart';
import 'package:pa_hasbi/model/theme-mode.dart';
import 'package:pa_hasbi/screens/introduction.dart';
import 'package:provider/provider.dart';

import 'controller/controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
      create: (context) => PredictionProvider(),
      child: const MainApp(),
    ),);
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => ThemeModeData(),
        ),
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp(
            themeMode: Provider.of<ThemeModeData>(context).themeMode,
            darkTheme: ThemeData.dark(useMaterial3: true),
            home: Scaffold(
              body: MyIntroductionPage(),
            ),
          );
        },
      ),
    );
  }
}
