import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

String birthDate = "";
int age = -1;
TextStyle valueTextStyle = TextStyle(
  fontSize: 22,
);
TextStyle textTextStyle = TextStyle(
  fontSize: 20,
);
TextStyle buttonTextStyle = TextStyle(
  backgroundColor: Color.fromARGB(103, 255, 77, 77),
  fontSize: 20,
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calendar Age',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  CalendarState createState() => CalendarState();
}

class CalendarState extends State<MyHomePage> {
  DateTime? selectedEvents;

  void _presentDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1990),
        lastDate: DateTime.now())
        .then((selectDate) {
      if (selectDate == null) {
        return;
      }
      setState(() {
        selectedEvents = selectDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('My application'),
        backgroundColor: Colors.black12,
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            (age > -1)
                ? Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.all(Radius.elliptical(15, 15)),
                      border: Border.all(
                          color: Color.fromARGB(253, 122, 7, 7))),
                  padding: EdgeInsets.all(20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'BirthDate:',
                        style: textTextStyle,
                      ),
                      Text(
                        '$birthDate',
                        style: valueTextStyle,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.all(Radius.elliptical(15, 15)),
                      border: Border.all(
                          color: Color.fromARGB(253, 122, 7, 7))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Age:',
                        style: textTextStyle,
                      ),
                      Text(
                        "$age",
                        style: valueTextStyle,
                      )
                    ],
                  ),
                ),
              ],
            )
                : Text(
              'PLEASE SELECT YOUR BIRTHDATE',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: _presentDatePicker,
              child: const Text(
                "SELECT DATE",
                style: TextStyle(
                    backgroundColor: Colors.black,
                    fontSize: 30,
                    color: Color.fromARGB(255, 243, 243, 243)),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              selectedEvents != null ? selectedEvents.toString() : '',
              style: TextStyle(
                  fontSize: 22, color: Color.fromARGB(255, 218, 81, 81)),
            ),
          ],
        ),
      ),
    ),
  );
}
