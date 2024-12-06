import 'package:flutter/material.dart';
import 'package:pa_hasbi/layout/bottomnavbar.dart';
import 'package:pa_hasbi/model/theme-mode.dart';
import 'package:provider/provider.dart';

import '../controller/controller.dart';

class MyHasilBookClassification extends StatefulWidget {
  const MyHasilBookClassification({super.key});

  @override
  State<MyHasilBookClassification> createState() =>
      _MyHasilBookClassificationState();
}

class _MyHasilBookClassificationState extends State<MyHasilBookClassification> {
  List<String> _roomType = [
    'Deluxe Room',
    'Executive Room',
    'Presidential Room',
    'Family Room',
    'Single Room',
    'Twin Room',
    'Honeymoon Room'
  ];
  List<bool> _parkingStatus = [
    false,true
  ];
  

  @override
  Widget build(BuildContext context) {
    final predictionProvider = Provider.of<PredictionProvider>(context);
    return Scaffold(
      backgroundColor: Provider.of<ThemeModeData>(context).isDarkModeActive
          ? Color.fromRGBO(33, 64, 91, 1)
          : Color.fromRGBO(147, 198, 231, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 30),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Prediction Result',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color:
                            Provider.of<ThemeModeData>(context).isDarkModeActive
                                ? Color.fromRGBO(147, 198, 231, 1)
                                : Color.fromRGBO(33, 64, 91, 1)),
                  ),
                  Text(
                    'Booking is ${predictionProvider.predictionMessage}',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color:
                            Provider.of<ThemeModeData>(context).isDarkModeActive
                                ? Color.fromRGBO(147, 198, 231, 1)
                                : Color.fromRGBO(33, 64, 91, 1)),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, right: 12, left: 12),
            child: Container(
              height: 500,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Provider.of<ThemeModeData>(context).isDarkModeActive
                    ? Colors.black
                    : Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 13, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Adults',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(predictionProvider.inputData[0].toString()),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey[300],
                    thickness: 2,
                    indent: 12,
                    endIndent: 12,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 13, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Children',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(predictionProvider.inputData[1].toString()),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey[300],
                    thickness: 2,
                    indent: 12,
                    endIndent: 12,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 13, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Weekend Night',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(predictionProvider.inputData[2].toString()),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey[300],
                    thickness: 2,
                    indent: 12,
                    endIndent: 12,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 13, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Weekday Night',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(predictionProvider.inputData[3].toString()),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey[300],
                    thickness: 2,
                    indent: 12,
                    endIndent: 12,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 13, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Parking',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(_parkingStatus[predictionProvider.inputData[4]].toString()),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey[300],
                    thickness: 2,
                    indent: 12,
                    endIndent: 12,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 13, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Room Type',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(_roomType[predictionProvider.inputData[5]].toString()),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey[300],
                    thickness: 2,
                    indent: 12,
                    endIndent: 12,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 13, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Order-to-Arrival Time',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(predictionProvider.inputData[6].toString()),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey[300],
                    thickness: 2,
                    indent: 12,
                    endIndent: 12,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 13, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Special Request Count',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(predictionProvider.inputData[7].toString()),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey[300],
                    thickness: 2,
                    indent: 12,
                    endIndent: 12,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 13, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Room Cost',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(predictionProvider.inputData[8].toString()),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey[300],
                    thickness: 2,
                    indent: 12,
                    endIndent: 12,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              predictionProvider.clearInputData();
              Navigator.pop(
                context,
                MaterialPageRoute(
                  builder: (builder) {
                    return MyBottomNavBar();
                  },
                ),
              );
            },
            child: Text(
              'Back to home',
              style: TextStyle(
                fontSize: 18,
                color: Provider.of<ThemeModeData>(context).isDarkModeActive
                        ? Color.fromRGBO(33, 64, 91, 1)
                        : Color.fromRGBO(147, 198, 231, 1),
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Provider.of<ThemeModeData>(context).isDarkModeActive
                        ? Colors.black
                        : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
