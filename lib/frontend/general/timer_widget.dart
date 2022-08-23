import 'package:rhythmic/frontend/general/memoization.dart';
import 'package:rhythmic/lib.dart';

class TimerWidget extends StatefulWidget {
  final DateTime? start;
  final TextStyle? textStyle;
  final TextStyle? hmsStyle;

  const TimerWidget(this.start, {Key? key, this.textStyle, this.hmsStyle}) : super(key: key);

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  Future<void>? update;
  bool working = true;
  late Duration currentDuration;

  @override
  void initState() {
    super.initState();
    update = updateContinuously();
    currentDuration = widget.start == null
        ? Duration.zero
        : DateTime.now().difference(widget.start!);
  }

  @override
  void dispose() {
    super.dispose();
    working = false;
  }

  Future<void> updateContinuously() async {
    var nextDuration = widget.start != null
        ? Duration(
            milliseconds: 1000 -
                DateTime.now().millisecond % 1000 +
                widget.start!.millisecond % 1000)
        : const Duration(seconds: 1);
    while (working) {
      if (widget.start != null) {
        setState(() {
          currentDuration = DateTime.now().difference(widget.start!);
        });
      }
      await Future.delayed(nextDuration);
      nextDuration = widget.start != null
          ? Duration(
              milliseconds: 1000 -
                  DateTime.now().millisecond % 1000 +
                  widget.start!.millisecond % 1000)
          : const Duration(seconds: 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormattedDuration(currentDuration, textStyle: widget.textStyle, hmsStyle: widget.hmsStyle,);
  }
}

class FormattedDuration extends StatelessWidget {
  late final SingleMemoization<FormattedDurationData, AppLocalizations>
      formattedDuration =
      SingleMemoization(((value) => FormattedDurationData(duration, value)));
  final Duration duration;
  final TextStyle? textStyle;
  final TextStyle? hmsStyle;
  FormattedDuration(this.duration, {this.textStyle, this.hmsStyle, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = formattedDuration.get(AppLocalizations.of(context)!);
    return Wrap(
        spacing: 10,
        runAlignment: WrapAlignment.center,
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (data.months != null)
                Text(
                  data.months!,
                  style: textStyle,
                ),
              if (data.days != null)
                Text(
                  data.days!,
                  style: textStyle,
                )
            ],
          ),
          Text(
            data.hms,
            style: hmsStyle,
          )
        ]);
  }
}

class FormattedDurationData {
  final String? months;
  final String? days;
  final String hms;

  FormattedDurationData._(this.months, this.days, this.hms);

  factory FormattedDurationData(
      Duration duration, AppLocalizations localizations) {
    return FormattedDurationData._(formatMonths(duration, localizations),
        formatDays(duration, localizations), formatHms(duration));
  }

  static String? formatMonths(
      Duration duration, AppLocalizations localizations) {
    final months = duration.inDays ~/ 30;
    switch (months) {
      case 0:
        return null;
      case 1:
        return "1 ${localizations.month}";
      default:
        return "$months ${localizations.months}";
    }
  }

  static String? formatDays(Duration duration, AppLocalizations localizations) {
    final days =
        duration.inDays % 30; // months are rounded to 30 to avoid complexity
    switch (days) {
      case 0:
        return null;
      case 1:
        return "1 ${localizations.day}";
      default:
        return "$days ${localizations.days}";
    }
  }

  static String formatHms(Duration dif) {
    final hours = dif.inHours % 24;
    final formattedHours =
        hours == 0 ? "" : (hours < 10 ? "0$hours:" : "$hours:");
    final minutes = dif.inMinutes % 60;
    final formattedMinutes = minutes < 10 ? "0$minutes:" : "$minutes:";
    final seconds = dif.inSeconds % 60;
    final formattedSeconds = seconds < 10 ? "0$seconds" : "$seconds";
    return "$formattedHours$formattedMinutes$formattedSeconds";
  }
}
