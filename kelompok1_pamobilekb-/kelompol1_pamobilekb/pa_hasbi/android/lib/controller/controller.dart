import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PredictionProvider with ChangeNotifier {
  List<int> inputData = [0, 0, 0, 0,0, 0, 0,0, 0];
  String? predictionMessage;

  // Fungsi untuk mengupdate input data
  void updateInputData(int index, int value) {
    inputData[index] = value;
    notifyListeners();
  }

  // Fungsi untuk mengirim data ke API dan mendapatkan respons
  Future<void> predict() async {
    final url = Uri.parse('http://127.0.0.1:8000/api/predict'); // Ganti dengan URL API kamu
    final body = jsonEncode({
      'data': inputData,
    });
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: body,
      );
      if (response.statusCode == 200) {
        // predictionMessage = 'Berhasil';
        final data = jsonDecode(response.body);
        String classPrediction = data['prediction'];
        predictionMessage =_mapPrediction(classPrediction);
      } else {
        predictionMessage = 'Failed to get prediction';
      }
    } catch (e) {
      predictionMessage = 'Error: $e';
    }
    notifyListeners();
  }

  String _mapPrediction(String classPrediction) {
    if (classPrediction == '["Recommended"]') {
        return 'Recommended';
     }else{
        return 'Not Recommended';
    }
  }

  void clearInputData() {
    inputData = [0, 0, 0, 0,0, 0, 0,0, 0];
    notifyListeners();
  }
}
