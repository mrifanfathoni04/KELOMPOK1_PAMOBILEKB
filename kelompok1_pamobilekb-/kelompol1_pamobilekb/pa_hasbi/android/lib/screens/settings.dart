import 'package:flutter/material.dart';
import 'package:pa_hasbi/layout/bottomnavbar.dart';
import 'package:pa_hasbi/model/theme-mode.dart';
import 'package:pa_hasbi/screens/home.dart';
import 'package:provider/provider.dart';

class MySettings extends StatefulWidget {
  const MySettings({super.key});

  @override
  State<MySettings> createState() => _MySettingsState();
}

class _MySettingsState extends State<MySettings> {
  bool isDarkModeActive = false;

  void changeTheme(bool value) {
    setState(() {
      isDarkModeActive = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Provider.of<ThemeModeData>(context).isDarkModeActive
                        ? Colors.black
                        : Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return MyBottomNavBar();
                  },
                ),
              );
            },
            icon: Icon(Icons.arrow_back)),
        title: Text("Settings"),
        backgroundColor: Provider.of<ThemeModeData>(context).isDarkModeActive
                        ? Color.fromRGBO(33, 64, 91, 1)
                        : Color.fromRGBO(147, 198, 231, 1),
      ),
      body: Column(
        children: [
          ListTile(
            leading: Icon(
              Provider.of<ThemeModeData>(context).isDarkModeActive
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
            title: Text("Change Theme"),
            trailing: Switch(
              value: Provider.of<ThemeModeData>(context).isDarkModeActive,
              onChanged: (bool value) {
                Provider.of<ThemeModeData>(context, listen: false).changeTheme(
                  value ? ThemeMode.dark : ThemeMode.light,
                );
              },
            ),
            onTap: () {
              Provider.of<ThemeModeData>(context, listen: false).changeTheme(
                Provider.of<ThemeModeData>(context, listen: false)
                        .isDarkModeActive
                    ? ThemeMode.light
                    : ThemeMode.dark,
              );
            },
          )
        ],
      ),
    );
  }
}
