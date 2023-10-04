import 'package:flutter/material.dart';

class TimeRangePickerDemo extends StatefulWidget {
  const TimeRangePickerDemo({super.key});

  @override
  State<TimeRangePickerDemo> createState() => _TimeRangePickerDemoState();
}

class _TimeRangePickerDemoState extends State<TimeRangePickerDemo> {
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  Future<void> _selectStartTime(BuildContext context) async {
    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (selectedTime != null) {
      setState(() {
        startTime = selectedTime;
      });
    }
  }

  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (selectedTime != null) {
      setState(() {
        endTime = selectedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time Range Picker Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Waktu Awal: ${startTime?.format(context) ?? "Pilih Waktu Awal"}',
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectStartTime(context),
              child: const Text('Pilih Waktu Awal'),
            ),
            const SizedBox(height: 40),
            Text(
              'Waktu Akhir: ${endTime?.format(context) ?? "Pilih Waktu Akhir"}',
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectEndTime(context),
              child: const Text('Pilih Waktu Akhir'),
            ),
          ],
        ),
      ),
    );
  }
}






