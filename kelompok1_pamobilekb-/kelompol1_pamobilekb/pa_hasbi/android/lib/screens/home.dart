import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pa_hasbi/AUTH.dart';
import 'package:pa_hasbi/model/theme-mode.dart';
import 'package:pa_hasbi/screens/informasi1.dart';
import 'package:pa_hasbi/screens/informasi2.dart';
import 'package:pa_hasbi/screens/login.dart';
import 'package:pa_hasbi/screens/settings.dart';
import 'package:provider/provider.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});
  Future<Map<String, dynamic>?> _fetchUserData() async {
    try {
      Auth auth = Auth();
      return await auth.getUserData();
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Provider.of<ThemeModeData>(context).isDarkModeActive
          ? Colors.black
          : Colors.white,
      appBar: AppBar(
        backgroundColor: Provider.of<ThemeModeData>(context).isDarkModeActive
            ? Color.fromRGBO(33, 64, 91, 1)
            : Color.fromRGBO(147, 198, 231, 1),
        title: Text(
          "NginepMana?",
          style: TextStyle(
              fontSize: 20,
              color: Provider.of<ThemeModeData>(context).isDarkModeActive
                  ? Color.fromRGBO(147, 198, 231, 1)
                  : Color.fromRGBO(33, 64, 91, 1),
              fontWeight: FontWeight.w700),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Provider.of<ThemeModeData>(context).isDarkModeActive
            ? Colors.black
            : Colors.white,
        child: ListView(
          children: [
            FutureBuilder<Map<String, dynamic>?>(
              future: _fetchUserData(),
              builder: (
                context,
                snapshot,
              ) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return UserAccountsDrawerHeader(
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage('assets/'),
                    ),
                    accountName: Text(
                      'Loading...',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    accountEmail: Text('Loading...'),
                    decoration: BoxDecoration(
                      color:
                          Provider.of<ThemeModeData>(context).isDarkModeActive
                              ? Color.fromRGBO(33, 64, 91, 1)
                              : Color.fromRGBO(147, 198, 231, 1),
                    ),
                  );
                } else {
                  final userData = snapshot.data!;
                  return UserAccountsDrawerHeader(
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage('images/profile.jpg'),
                    ),
                    accountName: Text(
                      userData['username'] ?? '',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    accountEmail: Text(userData["email"] ?? ''),
                    decoration: BoxDecoration(
                      color:
                          Provider.of<ThemeModeData>(context).isDarkModeActive
                              ? Color.fromRGBO(33, 64, 91, 1)
                              : Color.fromRGBO(147, 198, 231, 1),
                    ),
                  );
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MySettings();
                    },
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MyLogin();
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 90,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 50, top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FutureBuilder<Map<String, dynamic>?>(
                    future: _fetchUserData(),
                    builder: (
                      context,
                      snapshot,
                    ) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Text('Loading...');
                      } else if (snapshot.hasError) {
                        return const Text('Error');
                      } else {
                        return Text(
                          "Hello, ${snapshot.data?['username']} !",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Provider.of<ThemeModeData>(context)
                                    .isDarkModeActive
                                ? Color.fromRGBO(147, 198, 231, 1)
                                : Color.fromRGBO(33, 64, 91, 1),
                          ),
                        );
                      }
                    },
                  ),
                  Text(
                    "Thank you for choosing us as your destination partner.",
                    style: TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300,
                      color:
                          Provider.of<ThemeModeData>(context).isDarkModeActive
                              ? Color.fromRGBO(147, 198, 231, 1)
                              : Color.fromRGBO(33, 64, 91, 1),
                    ),
                  )
                ],
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
              color: Provider.of<ThemeModeData>(context).isDarkModeActive
                  ? Color.fromRGBO(33, 64, 91, 1)
                  : Color.fromRGBO(147, 198, 231, 1),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            children: [
              Container(
                width: screenWidth * 0.80,
                height: screenHeight * 0.20,
                decoration: BoxDecoration(
                  color: Provider.of<ThemeModeData>(context).isDarkModeActive
                      ? Color.fromRGBO(33, 64, 91, 1)
                      : Color.fromRGBO(147, 198, 231, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 40,
                      left: 20,
                      bottom: 20,
                      child: Container(
                        width: screenWidth * 0.20,
                        height: screenWidth * 0.20,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'images/hotel.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 30,
                      left: (screenWidth * 0.20) + 30,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hotel NginepMana?',
                            style: TextStyle(
                                fontSize: screenWidth * 0.045,
                                fontWeight: FontWeight.w700,
                                color: Provider.of<ThemeModeData>(context)
                                        .isDarkModeActive
                                    ? Color.fromRGBO(147, 198, 231, 1)
                                    : Color.fromRGBO(33, 64, 91, 1)),
                          ),
                          Container(
                            width: 200,
                            child: Text(
                              'hotel pilihan Anda untuk pengalaman menginap yang nyaman dan menyenangkan.',
                              style: TextStyle(
                                  fontSize: screenWidth * 0.030,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w300,
                                  color: Provider.of<ThemeModeData>(context)
                                          .isDarkModeActive
                                      ? Color.fromRGBO(147, 198, 231, 1)
                                      : Color.fromRGBO(33, 64, 91, 1)),
                              textAlign: TextAlign.justify,
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 15,
                      right: 20,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return MyInformasi1();
                              },
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Text(
                              'Lihat detail',
                              style: TextStyle(
                                  fontSize: screenWidth * 0.025,
                                  color: Provider.of<ThemeModeData>(context)
                                          .isDarkModeActive
                                      ? Color.fromRGBO(147, 198, 231, 1)
                                      : Color.fromRGBO(33, 64, 91, 1)),
                            ),
                            Icon(
                              Icons.chevron_right,
                              size: screenWidth * 0.025,
                              color: Provider.of<ThemeModeData>(context)
                                      .isDarkModeActive
                                  ? Color.fromRGBO(147, 198, 231, 1)
                                  : Color.fromRGBO(33, 64, 91, 1),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: screenWidth * 0.80,
                height: screenHeight * 0.20,
                decoration: BoxDecoration(
                  color: Provider.of<ThemeModeData>(context).isDarkModeActive
                      ? Color.fromRGBO(33, 64, 91, 1)
                      : Color.fromRGBO(147, 198, 231, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 20,
                      left: 20,
                      bottom: 20,
                      child: Container(
                        width: screenWidth * 0.20,
                        height: screenWidth * 0.20,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'images/kamarHotel.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 30,
                      left: (screenWidth * 0.20) + 30,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Deluxe Room',
                            style: TextStyle(
                                fontSize: screenWidth * 0.045,
                                fontWeight: FontWeight.w700,
                                color: Provider.of<ThemeModeData>(context)
                                        .isDarkModeActive
                                    ? Color.fromRGBO(147, 198, 231, 1)
                                    : Color.fromRGBO(33, 64, 91, 1)),
                          ),
                          Text(
                            'Deluxe room with city view',
                            style: TextStyle(
                                fontSize: screenWidth * 0.030,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w300,
                                color: Provider.of<ThemeModeData>(context)
                                        .isDarkModeActive
                                    ? Color.fromRGBO(147, 198, 231, 1)
                                    : Color.fromRGBO(33, 64, 91, 1)),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 15,
                      right: 20,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return MyInformasi2();
                              },
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Text(
                              'Lihat detail',
                              style: TextStyle(
                                  fontSize: screenWidth * 0.025,
                                  color: Provider.of<ThemeModeData>(context)
                                          .isDarkModeActive
                                      ? Color.fromRGBO(147, 198, 231, 1)
                                      : Color.fromRGBO(33, 64, 91, 1)),
                            ),
                            Icon(
                              Icons.chevron_right,
                              size: screenWidth * 0.025,
                              color: Provider.of<ThemeModeData>(context)
                                      .isDarkModeActive
                                  ? Color.fromRGBO(147, 198, 231, 1)
                                  : Color.fromRGBO(33, 64, 91, 1),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
