import 'package:flutter/material.dart';
import 'package:pa_hasbi/AUTH.dart';
import 'package:pa_hasbi/layout/bottomnavbar.dart';
import 'package:pa_hasbi/model/theme-mode.dart';
import 'package:pa_hasbi/screens/home.dart';
import 'package:pa_hasbi/screens/register.dart';
import 'package:provider/provider.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  bool isObsecured = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final Auth _authService = Auth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Provider.of<ThemeModeData>(context).isDarkModeActive
                        ? Colors.black
                        : Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 300,
                height: 100,
                alignment: Alignment.centerLeft,
                child: Text(
                  'WELCOME!',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Provider.of<ThemeModeData>(context).isDarkModeActive
                        ? Color.fromRGBO(33, 64, 91, 1)
                        : Color.fromRGBO(147, 198, 231, 1),),
                )),
            SizedBox(
              width: 300,
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Masukkan Email',
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.grey),
                  floatingLabelStyle:
                      TextStyle(color: Provider.of<ThemeModeData>(context).isDarkModeActive
                        ? Color.fromRGBO(33, 64, 91, 1)
                        : Color.fromRGBO(147, 198, 231, 1),),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Provider.of<ThemeModeData>(context).isDarkModeActive
                        ? Color.fromRGBO(33, 64, 91, 1)
                        : Color.fromRGBO(147, 198, 231, 1),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            SizedBox(
              width: 300,
              child: TextFormField(
                controller: _passwordController,
                obscureText: isObsecured,
                decoration: InputDecoration(
                  hintText: 'Masukkan Password',
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.grey),
                  floatingLabelStyle:
                      TextStyle(color: Provider.of<ThemeModeData>(context).isDarkModeActive
                        ? Color.fromRGBO(33, 64, 91, 1)
                        : Color.fromRGBO(147, 198, 231, 1),),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Provider.of<ThemeModeData>(context).isDarkModeActive
                        ? Color.fromRGBO(33, 64, 91, 1)
                        : Color.fromRGBO(147, 198, 231, 1),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isObsecured = !isObsecured;
                      });
                    },
                    icon: Icon(
                        isObsecured ? Icons.visibility_off : Icons.visibility),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Provider.of<ThemeModeData>(context).isDarkModeActive
                        ? Color.fromRGBO(33, 64, 91, 1)
                        : Color.fromRGBO(147, 198, 231, 1),),
                onPressed: () async {
                  try {
                    await _authService.login(
                      _emailController.text,
                      _passwordController.text,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Login Berhasil!")));
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const MyBottomNavBar();
                        },
                      ),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Login Gagal: $e")));
                  }
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                )),
            SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return MyRegister();
                        },
                      ),
                    );
                  },
                  child: Text("Sign up"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
