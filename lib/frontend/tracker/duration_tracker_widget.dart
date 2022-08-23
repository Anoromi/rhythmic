import 'package:rhythmic/backend/tracker/timer_tracker.dart';
import 'package:rhythmic/frontend/general/timer_widget.dart';
import 'package:rhythmic/lib.dart';

class DurationTrackerModel with ChangeNotifier {
  Tracker tracker;
  DurationTrackerDisplay durationTrackerDisplay;
  final DurationTimelineProvider _provider;
  DurationTrackerModel(
    this.tracker,
    this.durationTrackerDisplay,
    this._provider,
  );

  void calculate() {
    var now = DateTime.now();
    if (durationTrackerDisplay.hasStarted()) {
      var updatedTracker = tracker.copyWith(
          trackerData: TrackerUnion.duration(DurationTrackerDisplay(
              now.difference(durationTrackerDisplay.start!), null)));
      _provider.updateSegmentTracker(
          updatedTracker,
          DurationTimelinesCompanion.insert(
              trackerId: updatedTracker.id,
              start: durationTrackerDisplay.start!,
              end: now));
    } else {
      var trackerCopy = tracker.copyWith(
          trackerData:
              TrackerUnion.duration(DurationTrackerDisplay(null, now)));
      _provider.updateSegmentTracker(trackerCopy, null);
    }
    notifyListeners();
  }
}

class DurationTrackerWidget extends StatefulWidget {
  const DurationTrackerWidget({Key? key}) : super(key: key);

  @override
  State<DurationTrackerWidget> createState() => _DurationTrackerWidgetState();
}

class _DurationTrackerWidgetState extends State<DurationTrackerWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final model = context.watch<DurationTrackerModel>();
    final textColor = model.durationTrackerDisplay.start != null
        ? theme.colorScheme.onSurface
        : theme.colorScheme.onSurface.withOpacity(0.7);
    final timerStyle = theme.textTheme.titleLarge
        ?.merge(GoogleFonts.notoSansMono())
        .copyWith(fontWeight: FontWeight.w500, color: textColor);
    final textStyle = theme.textTheme.titleMedium
        ?.merge(GoogleFonts.overpass())
        .copyWith(fontWeight: FontWeight.w500, color: textColor);

    return SizedBox(
      width: double.infinity,
      child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: model.durationTrackerDisplay.start != null
                  ? TimerWidget(
                      model.durationTrackerDisplay.start,
                      textStyle: textStyle,
                      hmsStyle: timerStyle,
                    )
                  : FormattedDuration(
                      model.durationTrackerDisplay.previousEntry ??
                          Duration.zero,
                      textStyle: textStyle,
                      hmsStyle: timerStyle,
                    ),
            ),
            Container(
              alignment: Alignment.topRight,
              child: OutlinedButton(
                onPressed: model.calculate,
                child: Icon(model.durationTrackerDisplay.start == null
                    ? Icons.play_arrow
                    : Icons.pause),
              ),
            )
          ]),
    );
  }
}
