import 'package:flutter/material.dart';
import 'package:pa_hasbi/layout/bottomnavbar.dart';
import 'package:pa_hasbi/model/theme-mode.dart';
import 'package:provider/provider.dart';

class MyInformasi2 extends StatelessWidget {
  const MyInformasi2({super.key});

  @override
  Widget build(BuildContext context) {
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
        title: Text("Deluxe Room"),
        backgroundColor: Provider.of<ThemeModeData>(context).isDarkModeActive
            ? Color.fromRGBO(33, 64, 91, 1)
            : Color.fromRGBO(147, 198, 231, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 8, left: 8, bottom: 12),
        child: Container(
          padding: EdgeInsets.only(bottom: 20),
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Provider.of<ThemeModeData>(context).isDarkModeActive
                ? Colors.black
                : Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(12),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'images/kamarHotel.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  "Deluxe Room",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  "Deluxe Room adalah pilihan sempurna bagi tamu yang menginginkan kenyamanan ekstra dan fasilitas premium. Kamar ini dilengkapi dengan tempat tidur king-size, pemandangan indah, dan fasilitas mewah untuk pengalaman menginap yang tak terlupakan.",
                  style: TextStyle(fontSize: 12),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(height: 9),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Fasilitas Deluxe Room",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.king_bed,
                          color: Provider.of<ThemeModeData>(context)
                                  .isDarkModeActive
                              ? Color.fromRGBO(33, 64, 91, 1)
                              : Color.fromRGBO(147, 198, 231, 1),
                        ),
                        SizedBox(width: 10),
                        Text("King-Size Bed"),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.wifi,
                          color: Provider.of<ThemeModeData>(context)
                                  .isDarkModeActive
                              ? Color.fromRGBO(33, 64, 91, 1)
                              : Color.fromRGBO(147, 198, 231, 1),
                        ),
                        SizedBox(width: 10),
                        Text("WIFI"),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.local_dining,
                          color: Provider.of<ThemeModeData>(context)
                                  .isDarkModeActive
                              ? Color.fromRGBO(33, 64, 91, 1)
                              : Color.fromRGBO(147, 198, 231, 1),
                        ),
                        SizedBox(width: 10),
                        Text("Layanan Makanan 24 Jam"),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.bathtub,
                          color: Provider.of<ThemeModeData>(context)
                                  .isDarkModeActive
                              ? Color.fromRGBO(33, 64, 91, 1)
                              : Color.fromRGBO(147, 198, 231, 1),
                        ),
                        SizedBox(width: 10),
                        Text("Kamar Mandi Mewah dengan Bathtub"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
