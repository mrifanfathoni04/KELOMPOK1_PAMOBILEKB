import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pa_hasbi/model/theme-mode.dart';
import 'package:pa_hasbi/screens/hasil-book-klasifikasi.dart';
import 'package:provider/provider.dart';

import '../controller/controller.dart';

class MyBookClassification extends StatefulWidget {
  const MyBookClassification({super.key});

  @override
  State<MyBookClassification> createState() => _MyBookClassificationState();
}

class _MyBookClassificationState extends State<MyBookClassification> {
  bool _isParkingChecked = false;
  int _valueAdults = 0;
  int _valueChildren = 0;
  int _valueWeekend = 0;
  int _valueWeekday = 0;
  int _valueReq = 0;
  final TextEditingController _valueLeadTime = TextEditingController();
  final TextEditingController _valueCost = TextEditingController();
  String? _selectedRoomTypeValue;
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
          ? Colors.black
          : Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 65,
              width: double.infinity,
              color: Provider.of<ThemeModeData>(context).isDarkModeActive
                  ? Color.fromRGBO(33, 64, 91, 1)
                  : Color.fromRGBO(147, 198, 231, 1),
              child: Padding(
                padding: EdgeInsets.only(left: 40, top: 18),
                child: Text(
                  'Guest Information',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color:
                          Provider.of<ThemeModeData>(context).isDarkModeActive
                              ? Color.fromRGBO(147, 198, 231, 1)
                              : Color.fromRGBO(33, 64, 91, 1)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Adults',
                        style: TextStyle(fontSize: 18),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (_valueAdults > 0) _valueAdults--;
                              });
                              predictionProvider.updateInputData(0, _valueAdults);
                            },
                            icon: Icon(Icons.remove),
                          ),
                          Text(
                            '$_valueAdults',
                            style: TextStyle(fontSize: 18),
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  _valueAdults++;
                                });
                                predictionProvider.updateInputData(0, _valueAdults);
                              },
                              icon: Icon(Icons.add))
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Children',
                        style: TextStyle(fontSize: 18),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (_valueChildren > 0) _valueChildren--;
                              });
                              predictionProvider.updateInputData(1, _valueChildren);
                            },
                            icon: Icon(Icons.remove),
                          ),
                          Text(
                            "$_valueChildren",
                            style: TextStyle(fontSize: 18),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _valueChildren++;
                                predictionProvider.updateInputData(1, _valueChildren);
                              });
                            },
                            icon: Icon(Icons.add),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 65,
              width: double.infinity,
              color: Provider.of<ThemeModeData>(context).isDarkModeActive
                  ? Color.fromRGBO(33, 64, 91, 1)
                  : Color.fromRGBO(147, 198, 231, 1),
              child: Padding(
                padding: EdgeInsets.only(left: 40, top: 18),
                child: Text(
                  'Stay Details',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color:
                          Provider.of<ThemeModeData>(context).isDarkModeActive
                              ? Color.fromRGBO(147, 198, 231, 1)
                              : Color.fromRGBO(33, 64, 91, 1)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Weekend Night",
                        style: TextStyle(fontSize: 18),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (_valueWeekend > 0) _valueWeekend--;
                              });
                            predictionProvider.updateInputData(2, _valueWeekend);
                            },
                            icon: Icon(Icons.remove),
                          ),
                          Text(
                            '$_valueWeekend',
                            style: TextStyle(fontSize: 18),
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  _valueWeekend++;
                                });
                                predictionProvider.updateInputData(2, _valueWeekend);
                              },
                              icon: Icon(Icons.add))
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Weekday Night",
                        style: TextStyle(fontSize: 18),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (_valueWeekday > 0) _valueWeekday--;
                              });
                              predictionProvider.updateInputData(3, _valueWeekday);
                            },
                            icon: Icon(Icons.remove),
                          ),
                          Text(
                            '$_valueWeekday',
                            style: TextStyle(fontSize: 18),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _valueWeekday++;
                              });
                              predictionProvider.updateInputData(3, _valueWeekday);
                            },
                            icon: Icon(Icons.add),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 65,
              width: double.infinity,
              color: Provider.of<ThemeModeData>(context).isDarkModeActive
                  ? Color.fromRGBO(33, 64, 91, 1)
                  : Color.fromRGBO(147, 198, 231, 1),
              child: Padding(
                padding: EdgeInsets.only(left: 40, top: 18),
                child: Text(
                  'Reservation Preferences',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color:
                          Provider.of<ThemeModeData>(context).isDarkModeActive
                              ? Color.fromRGBO(147, 198, 231, 1)
                              : Color.fromRGBO(33, 64, 91, 1)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Parking',
                        style: TextStyle(fontSize: 18),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 28),
                        child: Checkbox(
                          value: _isParkingChecked,
                          onChanged: (bool? newValue) {
                            setState(() {
                              _isParkingChecked = newValue!;
                            });
                            predictionProvider.updateInputData(4,_parkingStatus.indexOf(_isParkingChecked));
                          },
                          activeColor: const Color.fromRGBO(147, 198, 231, 1),
                          checkColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Room Type',
                        style: TextStyle(fontSize: 18),
                      ),
                      DropdownButton<String>(
                        value: _selectedRoomTypeValue,
                        items: _roomType.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedRoomTypeValue = newValue;
                          });
                          predictionProvider.updateInputData(5,_roomType.indexOf(_selectedRoomTypeValue.toString()));
                        },
                        dropdownColor: Provider.of<ThemeModeData>(context).isDarkModeActive
                        ? Colors.black
                        : Colors.white,
                        style: TextStyle(color: Provider.of<ThemeModeData>(context).isDarkModeActive
                        ? Colors.white
                        : Colors.black, fontSize: 18),
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Provider.of<ThemeModeData>(context)
                                  .isDarkModeActive
                              ? Color.fromRGBO(33, 64, 91, 1)
                              : Color.fromRGBO(147, 198, 231, 1),
                        ),
                        underline: Container(
                          height: 2,
                          color: Provider.of<ThemeModeData>(context)
                                  .isDarkModeActive
                              ? Color.fromRGBO(33, 64, 91, 1)
                              : Color.fromRGBO(147, 198, 231, 1),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 65,
              width: double.infinity,
              color: Provider.of<ThemeModeData>(context).isDarkModeActive
                  ? Color.fromRGBO(33, 64, 91, 1)
                  : Color.fromRGBO(147, 198, 231, 1),
              child: Padding(
                padding: EdgeInsets.only(left: 40, top: 18),
                child: Text(
                  'Booking Details',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color:
                          Provider.of<ThemeModeData>(context).isDarkModeActive
                              ? Color.fromRGBO(147, 198, 231, 1)
                              : Color.fromRGBO(33, 64, 91, 1)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order-to-arrival time',
                    style: TextStyle(fontSize: 18),
                  ),
                  TextField(
                    controller: _valueLeadTime,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Provider.of<ThemeModeData>(context)
                                  .isDarkModeActive
                              ? Color.fromRGBO(33, 64, 91, 1)
                              : Color.fromRGBO(147, 198, 231, 1),
                          width: 1,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (value) {
                predictionProvider.updateInputData(6,int.parse(_valueLeadTime.text));
              },
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Special Request Count',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (_valueReq > 0) _valueReq--;
                              });
                              predictionProvider.updateInputData(7,_valueReq);
                            },
                            icon: Icon(Icons.remove),
                          ),
                          Text(
                            '$_valueReq',
                            style: TextStyle(fontSize: 18),
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  _valueReq++;
                                });
                              predictionProvider.updateInputData(7,_valueReq);
                              },
                              icon: Icon(Icons.add))
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 65,
              width: double.infinity,
              color: Provider.of<ThemeModeData>(context).isDarkModeActive
                  ? Color.fromRGBO(33, 64, 91, 1)
                  : Color.fromRGBO(147, 198, 231, 1),
              child: Padding(
                padding: EdgeInsets.only(left: 40, top: 18),
                child: Text(
                  'Pricing Informations',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color:
                          Provider.of<ThemeModeData>(context).isDarkModeActive
                              ? Color.fromRGBO(147, 198, 231, 1)
                              : Color.fromRGBO(33, 64, 91, 1)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Room Cost (Rupiah)',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  TextField(
                    controller: _valueCost,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Provider.of<ThemeModeData>(context)
                                  .isDarkModeActive
                              ? Color.fromRGBO(33, 64, 91, 1)
                              : Color.fromRGBO(147, 198, 231, 1),
                          width: 1,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (value) {
                predictionProvider.updateInputData(8,int.parse(_valueCost.text));
              },
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 25, top: 50, bottom: 50),
                  child: ElevatedButton(
                     onPressed: () async {
                       if (_valueAdults <= 0 ||
                          _valueChildren < 0 ||
                          _valueWeekend < 0 ||
                          _valueWeekday < 0 ||
                          _valueReq < 0 ||
                          _selectedRoomTypeValue == null ||
                          _valueCost.text =='' ||
                          _valueLeadTime.text==''){
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Inputan Tidak Boleh Kosong'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }else{
                            _isParkingChecked = false;
                            _valueAdults = 0 ;
                          _valueChildren = 0 ;
                          _valueWeekend = 0 ;
                          _valueWeekday = 0 ;
                          _valueReq = 0 ;
                          _selectedRoomTypeValue = null;
                          _valueCost.text ='';
                          _valueLeadTime.text='';
                            await predictionProvider.predict();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return MyHasilBookClassification();
                                },
                              ),
                            );
                          };
                    },
                    child: Text(
                      'Predict',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Provider.of<ThemeModeData>(context).isDarkModeActive
                        ? Color.fromRGBO(33, 64, 91, 1)
                        : Color.fromRGBO(147, 198, 231, 1),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
