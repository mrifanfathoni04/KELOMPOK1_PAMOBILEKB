import 'package:flutter/material.dart';
import 'package:pa_hasbi/layout/bottomnavbar.dart';
import 'package:pa_hasbi/model/theme-mode.dart';
import 'package:provider/provider.dart';

class MyInformasi1 extends StatelessWidget {
  const MyInformasi1({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Provider.of<ThemeModeData>(context).isDarkModeActive
                        ? Color.fromRGBO(33, 64, 91, 1)
                        : Color.fromRGBO(147, 198, 231, 1),
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
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Hotel NginepMana?"),
        backgroundColor: Provider.of<ThemeModeData>(context).isDarkModeActive
                        ? Color.fromRGBO(33, 64, 91, 1)
                        : Color.fromRGBO(147, 198, 231, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
          height: 800,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Provider.of<ThemeModeData>(context).isDarkModeActive
                        ? Colors.black
                        : Colors.white,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'images/hotel.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Hotel NginepMana?",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Selamat datang di NginepMana?, hotel pilihan Anda untuk pengalaman menginap yang nyaman dan menyenangkan. Terletak di pusat kota dengan akses mudah ke berbagai destinasi populer, NginepMana? menawarkan penginapan berkualitas tinggi untuk liburan atau perjalanan bisnis Anda. Dengan desain modern dan fasilitas lengkap, hotel ini menyediakan kenyamanan maksimal bagi setiap tamu yang menginap.",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Fitur-fitur yang Tersedia di NginepMana?",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 16, right: 16, left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.wifi, color: Colors.blue),
                          SizedBox(width: 10),
                          Text("Wi-Fi Gratis"),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.pool, color: Colors.blue),
                          SizedBox(width: 10),
                          Text("Kolam Renang"),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.restaurant, color: Colors.blue),
                          SizedBox(width: 10),
                          Text("Restoran"),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.fitness_center, color: Colors.blue),
                          SizedBox(width: 10),
                          Text("Gym 24 Jam"),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.room_service, color: Colors.blue),
                          SizedBox(width: 10),
                          Text("Layanan Kamar 24 Jam"),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.spa, color: Colors.blue),
                          SizedBox(width: 10),
                          Text("Spa dan Pijat"),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.local_parking, color: Colors.blue),
                          SizedBox(width: 10),
                          Text("Parkir Luas"),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.business_center, color: Colors.blue),
                          SizedBox(width: 10),
                          Text("Ruang Pertemuan"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
