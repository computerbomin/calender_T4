import 'package:flutter/material.dart';
import 'package:calendar_view/calendar_view.dart';
import 'calendar_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
          controller: EventController(),
          child: MaterialApp(
            home:
              Scaffold(
                body: MonthView(),
              ),
            ),
          );
  }
}