import 'package:flutter/material.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multiple Date Picker Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Multiple Date Picker Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<DateTime?> _selectedDates = [];

Future<void> _selectDates(BuildContext context) async {

  // Create a custom dialog
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: const EdgeInsets.all(0.0),
        content: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: CalendarDatePicker2(
            config: CalendarDatePicker2Config(
              calendarType: CalendarDatePicker2Type.multi,
              firstDate: DateTime.now(),
              selectableDayPredicate: (DateTime day) {
                // Batasi hanya 4 tanggal yang dapat dipilih
                return _selectedDates.length < 4 || _selectedDates.contains(day);
              },
            ),
            value: _selectedDates,
            onValueChanged: (List<DateTime?> dates) {
              setState(() {
                _selectedDates = dates;
              });
            },
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("OK"),
          ),
        ],
      );
    },
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                _selectDates(context);
              },
              child: const Text('Open Multi Date Picker'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _selectedDates.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding( 
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Selected Date ${index + 1}: ${_selectedDates[index] != null ? _selectedDates[index]!.toString() : "No Date Selected"}',
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
