import 'package:rhythmic/frontend/general/specific/week_calendar.dart';
import 'package:rhythmic/lib.dart';

class CalendarEvent<Event> {
  DateTime start;
  DateTime end;
  Event event;
  CalendarEvent(this.start, this.end, this.event);
}

mixin CalendarEventProvider<Event> {
  Stream<List<CalendarEvent<Event>>> getForDates(DateTime start, DateTime end);
}

class CalendarView extends StatefulWidget {
  final CalendarEventProvider provider;
  const CalendarView({Key? key, required this.provider}) : super(key: key);

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  @override
  Widget build(BuildContext context) {
    return const CalendarWeekView();
  }
}

class CalendarTest extends StatelessWidget {
  const CalendarTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = _CalendarTestProvider.test();
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Container(),
        ),
        body: CalendarView(
          provider: provider,
        ));
  }
}

class _CalendarTestProvider implements CalendarEventProvider<void> {
  const _CalendarTestProvider(this.events);

  @override
  Stream<List<CalendarEvent<void>>> getForDates(
      DateTime start, DateTime end) async* {
    bool isBetween(DateTime date, DateTime start, DateTime end) =>
        date.isAfter(start) && date.isBefore(end);
    yield events
        .where((element) =>
            isBetween(element.start, start, end) ||
            isBetween(element.end, start, end))
        .toList();
  }

  final List<CalendarEvent<void>> events;

  _CalendarTestProvider.test()
      : this([
          CalendarEvent(DateTime(2022, 8, 15), DateTime(2022, 8, 15), null),
          CalendarEvent(DateTime(2022, 8, 16), DateTime(2022, 8, 16), null),
          CalendarEvent(DateTime(2022, 8, 15), DateTime(2022, 8, 15), null),
          CalendarEvent(DateTime(2022, 8, 15), DateTime(2022, 8, 15), null),
        ]);
}
