import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> regis(String email, String username, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      String uid = userCredential.user!.uid;
      await _firestore.collection('users').doc(uid).set({
        'email': email,
        'username': username,
      });
    } catch (e) {
      print('error dalam proses registrasi: $e');
      rethrow;
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print('error dalam proses login:" $e');
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> getUserData() async {
    try {
      User? currentUser = _auth.currentUser;

      if (currentUser == null) {
        throw Exception('Pengguna Belum Login');
      }

      DocumentSnapshot docUser =
          await _firestore.collection('users').doc(currentUser.uid).get();

      if (!docUser.exists) {
        throw Exception('Data pengguna Belum Ada');
      }

      return docUser.data() as Map<String, dynamic>;
    } catch (e) {
      print("Error mengambil data pengguna");
      return null;
    }
  }
}
