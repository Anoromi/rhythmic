import 'dart:async';
import 'dart:developer';

import 'package:rhythmic/frontend/general/single_animator.dart';
import 'package:rhythmic/lib.dart';

class PointTrackerModel with ChangeNotifier {
  Tracker tracker;
  PointTrackerDisplay pointTrackerDisplay;
  final PointTimelineProvider _provider;
  PeriodOptions cPeriodOption = PeriodOptions.normal;
  final _displayedNumber = StreamController<Option<int>>.broadcast(sync: true);
  StreamSubscription<int>? _numberStream;
  late StreamSubscription update;

  PointTrackerModel(this.tracker, this.pointTrackerDisplay, this._provider,
      Stream<void> updateStream) {
    Future.microtask(() => lookCountFor(cPeriodOption, true));
    update = updateStream.listen((event) {
      updateDevalidation();
    });
  }

  @override
  void dispose() {
    update.cancel();
    super.dispose();
  }

  Future updateDevalidation() async {
    await _provider.updateDevalidation(tracker, pointTrackerDisplay);
  }

  void calculate() {
    _provider.updatePointTracker(
        tracker.copyWith(trackerData: TrackerUnion.point(pointTrackerDisplay)),
        PointTimelinesCompanion.insert(
            trackerId: tracker.id, point: DateTime.now()));
  }

  Stream<Option<int>> get displayedNumber => _displayedNumber.stream;

  Future lookCountFor(PeriodOptions v, [bool updateOnEqual = false]) async {
    if (!updateOnEqual && cPeriodOption == v) return;
    notifyListeners();
    cPeriodOption = v;
    _displayedNumber.add(const None());
    // _displayedNumber.ad
    _numberStream?.cancel();
    _numberStream =
        _provider.lookCountFor(tracker, pointTrackerDisplay, v).listen((event) {
      _displayedNumber.add(Some(event));
    });
    log("changed look count");
    notifyListeners();
  }

  void updateData(Tracker tracker, PointTrackerDisplay display) {
    if (this.tracker == tracker) return;
    this.tracker = tracker;
    pointTrackerDisplay = display;
    Future.microtask(() => lookCountFor(cPeriodOption, true));
  }
}

class PointTrackerWidget extends StatefulWidget {
  const PointTrackerWidget({Key? key}) : super(key: key);

  @override
  State<PointTrackerWidget> createState() => _PointTrackerWidgetState();
}

class _PointTrackerWidgetState extends State<PointTrackerWidget>
    with SingleTickerProviderStateMixin, SingleAnimatorMixin {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final counterStyle =
        theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600);
    return Column(
      children: [
        Consumer<ExpansionModel>(
          builder: (context, expansion, child) {
            animator.updateAnimation(expansion.expanded);
            return SizeTransition(
              sizeFactor: animator.animation,
              child: ScaleTransition(
                scale: animator.animation,
                alignment: Alignment.topLeft,
                child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: TimingChips()),
              ),
            );
          },
        ),
        SizedBox(
          width: double.infinity,
          child: Wrap(
            spacing: 10,
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              StreamBuilder<Option<int>>(
                stream: context.read<PointTrackerModel>().displayedNumber,
                builder: (context, snapshot) {
                  final data = snapshot.data;
                  if (data?.isNone() != false) {
                    return Text(
                      "",
                      style: counterStyle,
                    );
                  }
                  return Text(
                    data!.toNullable()!.toString(),
                    style: counterStyle,
                  );
                },
              ),
              OutlinedButton(
                  onPressed: context.read<PointTrackerModel>().calculate,
                  child: const Icon(
                    Icons.add_rounded,
                  ))
            ],
          ),
        ),
      ],
    );
  }

  @override
  Animator createAnimator() =>
      AnimatorBuilder(vsync: this, duration: const Duration(milliseconds: 300))
          .create(
        (parent) => CurvedAnimation(
            parent: parent,
            curve: Curves.easeOutExpo,
            reverseCurve: Curves.decelerate),
      );
}

class TimingChips extends StatefulWidget {
  const TimingChips({Key? key}) : super(key: key);

  @override
  State<TimingChips> createState() => _TimingChipsState();
}

enum PeriodOptions {
  normal,
  day,
  week,
  month;

  String localize(AppLocalizations l) {
    switch (this) {
      case PeriodOptions.day:
        return l.this_day;
      case PeriodOptions.week:
        return l.this_week;
      case PeriodOptions.month:
        return l.this_month;
      case PeriodOptions.normal:
        return l.normal;
    }
  }
}

class _TimingChipsState extends State<TimingChips> {

  @override
  Widget build(BuildContext context) {
    final model = context.watch<PointTrackerModel>();
    final loc = AppLocalizations.of(context)!;
    var availableTimings = PeriodOptions.values;
    switch (model.pointTrackerDisplay.devalidationTimings) {
      case null:
      case DevalidationTimings.hours:
      case DevalidationTimings.years:
        break;
      case DevalidationTimings.days:
        availableTimings.remove(PeriodOptions.day);
        break;
      case DevalidationTimings.weeks:
        availableTimings.remove(PeriodOptions.week);
        break;
      case DevalidationTimings.months:
        availableTimings.remove(PeriodOptions.month);
        break;
    }
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        for (var v in availableTimings)
          M3FilterChip(
            onPressed: () {
              model.lookCountFor(v);
            },
            isSelected: model.cPeriodOption == v,
            child: Text(v.localize(loc)),
          )
      ],
    );
  }
}
