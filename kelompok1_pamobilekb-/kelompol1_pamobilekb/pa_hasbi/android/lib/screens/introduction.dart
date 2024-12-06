import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:pa_hasbi/screens/login.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class MyIntroductionPage extends StatelessWidget {
  const MyIntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      back: Text("Kembali",
          style: TextStyle(
              color: Color.fromRGBO(33, 64, 91, 1),
              fontWeight: FontWeight.w500,
              fontSize: 18)),
      next: Text("Selanjutnya",
          style: TextStyle(
              color: Color.fromRGBO(33, 64, 91, 1),
              fontWeight: FontWeight.w500,
              fontSize: 18)),
      done: Text("Selesai",
          style: TextStyle(
              color: Color.fromRGBO(33, 64, 91, 1),
              fontWeight: FontWeight.w500,
              fontSize: 18)),
      showBackButton: true,
      dotsDecorator: DotsDecorator(
        size: const Size(12, 12),
        color: Colors.grey,
        activeSize: const Size(30, 12),
        activeColor: Color.fromRGBO(147, 198, 231, 1),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      onDone: () {
        Navigator.of(context).pop();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return MyLogin(); // Ganti dengan halaman login Anda
            },
          ),
        );
      },
      pages: [
        // Halaman 1 tetap seperti sebelumnya
        PageViewModel(
          titleWidget: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(147, 198, 231, 1),
                  Color.fromRGBO(33, 64, 91, 1),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Welcome to',
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 5,
                      shadows: [
                        Shadow(
                          color: Colors.black45,
                          offset: Offset(4, 4),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25),
                  DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 55, // Larger size for better impact
                      fontWeight: FontWeight.bold,
                      letterSpacing: 4,
                      color: Colors.yellowAccent,
                      shadows: [
                        Shadow(
                          color: Colors.black45,
                          offset: Offset(5, 5),
                          blurRadius: 15,
                        ),
                      ],
                    ),
                    child: AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        FadeAnimatedText('Worth it Ga?'),
                        FadeAnimatedText('Find Your Criteria'),
                        FadeAnimatedText('Comfort & Happiness'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          bodyWidget: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: Text(
              'Your trusted partner in finding the perfect stay for your journey.',
              style: TextStyle(
                fontSize: 22,
                fontStyle: FontStyle.italic,
                color: Colors.grey[200],
                fontWeight: FontWeight.w600, // Slightly bolder
                letterSpacing: 1.5, // Adds some spacing between characters
              ),
              textAlign: TextAlign.center,
            ),
          ),
          decoration: PageDecoration(
            pageColor: Colors.transparent, // Gradient effect on background
            titlePadding: EdgeInsets.zero,
            contentMargin:
                EdgeInsets.symmetric(horizontal: 30), // Righter margin
          ),
        ),

        // Halaman 2 - Panduan Penggunaan Aplikasi: Input Data & Mendapatkan Rekomendasi Hotel
        PageViewModel(
          title: 'Panduan Penggunaan Aplikasi',
          body:
              'Ikuti langkah-langkah berikut untuk mendapatkan rekomendasi hotel berdasarkan data yang Anda input.',
          decoration: PageDecoration(
            pageColor: Colors.white,
            titleTextStyle: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(33, 64, 91, 1),
            ),
            bodyTextStyle: TextStyle(
              fontSize: 18,
              color: Colors.grey[700],
            ),
          ),
        ),

        // Langkah 1 - Masukkan Lokasi
        PageViewModel(
          title: 'Langkah 1: REGISTRASI',
          body: 'Masukkan Gmail, Username, dan Password.',
          image: Container(
            height: 250, // Ukuran lebih kecil untuk foto
            width: 250, // Lebar foto juga disesuaikan
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'images/dutaregis.jpeg', // Ganti dengan gambar dutaregis.jpg
                fit: BoxFit.cover,
              ),
            ),
          ),
          decoration: PageDecoration(
            pageColor: Colors.white,
          ),
        ),

        // Langkah 2 - Input Data
        PageViewModel(
          title: 'Langkah 2: Input Data',
          body: 'Anda dapat menginputkan data yang sesuai kebutuhan Anda.',
          image: Container(
            height: 400, // Ukuran lebih kecil untuk foto
            width: 200, // Lebar foto juga disesuaikan
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'images/dutainput.jpeg', // Ganti dengan gambar kedua
                fit: BoxFit.cover,
              ),
            ),
          ),
          decoration: PageDecoration(
            pageColor: Colors.white,
          ),
        ),

        // Langkah 3 - Menampilkan Hasil
        PageViewModel(
          title: 'Langkah 3: Menampilkan Hasil',
          body: 'Menampilkan hasil prediksi berdasarkan inputan Anda.',
          image: Container(
            height: 400,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'images/dutasabul.jpeg', // Ganti dengan gambar ketiga
                fit: BoxFit.cover,
              ),
            ),
          ),
          decoration: PageDecoration(
            pageColor: Colors.white,
          ),
        ),
      ],
    );
  }
}