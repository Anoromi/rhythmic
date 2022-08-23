import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:rhythmic/frontend/general/specific/calendar_position.dart';
import 'package:rhythmic/lib.dart';

class CalendarWeekView extends StatefulWidget {
  const CalendarWeekView({Key? key}) : super(key: key);

  @override
  State<CalendarWeekView> createState() => _CalendarWeekViewState();
}

class _CalendarWeekViewState extends State<CalendarWeekView> {
  late final LinkedScrollControllerGroup _controller;
  late final ScrollController _hours, _timings;

  @override
  void initState() {
    super.initState();
    _controller = LinkedScrollControllerGroup();
    _hours = _controller.addAndGet();
    _timings = _controller.addAndGet();
  }

  @override
  void dispose() {
    _hours.dispose();
    _timings.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    const commonHeight = 1500;
    return Row(
      children: [
        SizedBox(
          width: 40,
          child: ListView.builder(
            itemCount: 24,
            controller: _hours,
            itemBuilder: (context, index) => Container(
              height: commonHeight / 24,
              alignment: Alignment.center,
              child: Text(
                index.toString(),
                style: theme.textTheme.titleLarge
                    ?.merge(GoogleFonts.notoSansMono()),
              ),
            ),
          ),
        ),
        Flexible(
          fit: FlexFit.tight,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            controller: _timings,
            child: SizedBox(
                height: commonHeight.toDouble(),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    reverse: true,
                    itemBuilder: (context, index) => CalendarDay(
                          height: commonHeight.toDouble(),
                          dayStart:
                              startOfTheDay().subtract(Duration(days: index)),
                        ))),
          ),
        )
      ],
    );
  }
}

DateTime startOfTheDay() {
  var now = DateTime.now();
  return now.subtract(Duration(
      hours: now.hour,
      minutes: now.minute,
      seconds: now.second,
      milliseconds: now.millisecond,
      microseconds: now.microsecond));
}

class CalendarDay extends StatefulWidget {
  final double height;
  final DateTime dayStart;
  const CalendarDay({
    Key? key,
    required this.height,
    required this.dayStart,
  }) : super(key: key);

  @override
  State<CalendarDay> createState() => _CalendarDayState();
}

class _CalendarDayState extends State<CalendarDay> {
  @override
  Widget build(BuildContext context) {
    // BoxDecoration(
    //   border: t
    // )
    final theme = context.theme;
    return Stack(children: [
      CalendarDaySegment(
        widget.dayStart,
        widget.dayStart.add(const Duration(days: 1)),
        children: const [],
      ),
      Column(children: [
        for (var i = 0; i < 24; i++)
          Flexible(
            fit: FlexFit.loose,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: .0),
              child: Container(
                decoration: DottedDecoration(
                    // linePosition: LinePosition.top,
                    dash: const [3, 1],
                    strokeWidth: 2,
                    // color: Colors.red,
                    color: theme.colorScheme.outline.withOpacity(0.4),
                    shape: Shape.box),
                // height: 30,
                // width: 60,
                child: const SizedBox(
                  width: 100,
                  height: double.infinity,
                  // child: Container(color: Color(Random().nextInt(1 << 32))),
                ),
              ),
            ),
          ),
      ]),
    ]);
  }
}
