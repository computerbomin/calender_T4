import 'package:flutter/material.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:calendar_view/src/event_controller.dart';
import 'package:line_icons/line_icon.dart';
import 'package:flutter/src/material/tab_controller.dart';
import 'package:line_icons/line_icons.dart';

import 'calendar_view.dart';
import './src/event_controller.dart';
import './src/create_view/creat_view/create_event_page.dart';
import 'extension.dart';
import './src/model/event.dart';

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
          title: const Text('T4 Demo Scheduler'),
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
          floatingActionButton: FloatingActionButton(
            child: Icon(LineIcons.plus),
            elevation: 8,
              onPressed: () async {
                final event =
                await context.pushRoute<CalendarEventData<Event>>(CreateEventPage(
                  withDuration: true,
                ));
                if (event == null) return;
                CalendarControllerProvider.of<dynamic>(context).controller.add(event);
              },
          )
        ),
      );
  }
}