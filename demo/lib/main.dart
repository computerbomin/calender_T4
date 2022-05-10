import 'package:flutter/material.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:line_icons/line_icon.dart';
import 'package:flutter/src/material/tab_controller.dart';
import 'package:line_icons/line_icons.dart';
import 'calendar_view.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'T4 Demo';

  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
      controller: EventController(),
      child: MaterialApp(
        title: _title,
        home: MyStatelessWidget(),
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('T4 Scheduler'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(LineIcons.clock),
              ),
              Tab(
                icon: Icon(LineIcons.calendar),
              ),
              Tab(
                icon: Icon(LineIcons.medicalNotes),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: DayView(),
            ),
            Center(
              child: MonthView(),
            ),
            Center(
              child: WeekView(),
            ),
          ],
        ),
      ),
    );
  }
}
