import 'package:flutter/rendering.dart';
import 'package:rhythmic/lib.dart';

class Dateful extends ParentDataWidget<CalendarDayPositioningData> {
  final DateTime start;
  final DateTime finish;

  const Dateful({
    super.key,
    required this.start,
    required this.finish,
    required super.child,
  });

  @override
  void applyParentData(RenderObject renderObject) {
    final data = renderObject.parentData! as CalendarDayPositioningData;
    var needUpdate = false;
    if (data.finish != finish) {
      data.finish = finish;
      needUpdate = true;
    }
    if (data.start != start) {
      data.start = start;
      needUpdate = true;
    }
    if (needUpdate) {
      final parent = renderObject.parent;
      if (parent is RenderObject) {
        parent.markNeedsLayout();
      }
    }
  }

  @override
  Type get debugTypicalAncestorWidgetClass => CalendarDaySegment;
}

class CalendarDaySegment extends MultiChildRenderObjectWidget {
  final DateTime rangeStart;
  final DateTime rangeFinish;

  CalendarDaySegment(this.rangeStart, this.rangeFinish,
      {Key? key, required List<Dateful> children})
      : super(key: key, children: children);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return CalendarDayPositioningDelegate(rangeStart, rangeFinish);
  }
}

class CalendarDayPositioningData extends ContainerBoxParentData<RenderBox> {
  DateTime? start;
  DateTime? finish;
  CalendarDayPositioningData(this.start, this.finish);
  CalendarDayPositioningData.empty();
}

class CalendarDayPositioningDelegate extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, CalendarDayPositioningData>,
        RenderBoxContainerDefaultsMixin<RenderBox, CalendarDayPositioningData> {
  final DateTime rangeStart;
  final DateTime rangeFinish;

  CalendarDayPositioningDelegate(this.rangeStart, this.rangeFinish);

  @override
  void setupParentData(covariant RenderObject child) {
    if (child.parentData is! CalendarDayPositioningData) {
      child.parentData = CalendarDayPositioningData.empty();
    }
  }

  @override
  void performLayout() {
    var cChild = firstChild;
    final boxConstraints = BoxConstraints(
        maxWidth: constraints.maxWidth,
        minHeight: constraints.biggest.height,
        maxHeight: constraints.biggest.height);
    var height = constraints.biggest.height;
    var biggestWidth = .0;
    while (cChild != null) {
      var data = cChild.parentData as CalendarDayPositioningData;
      final realStart =
          rangeStart.isBefore(data.start!) ? data.start! : rangeStart;
      final realFinish =
          rangeFinish.isAfter(data.finish!) ? data.finish! : rangeFinish;
      final hourOffset = height / 24;
      final minuteOffset = hourOffset / 60;

      final startConstraint =
          realStart.minute * minuteOffset + realStart.hour * hourOffset;
      final endConstraint =
          realFinish.minute * minuteOffset + realFinish.hour * hourOffset;

      cChild.layout(boxConstraints.copyWith(
          minHeight: endConstraint - startConstraint,
          maxHeight: endConstraint - startConstraint));
      if (cChild.size.width > biggestWidth) biggestWidth = cChild.size.width;
      cChild = childAfter(cChild);
    }
    size = boxConstraints.constrain(Size.fromWidth(biggestWidth));
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    var height = size.height;
    var cChild = firstChild;
    while (cChild != null) {
      var data = cChild.parentData as CalendarDayPositioningData;
      final realStart =
          rangeStart.isBefore(data.start!) ? data.start! : rangeStart;
      final hourOffset = height / 24;
      final minuteOffset = hourOffset / 60;

      final startConstraint =
          realStart.minute * minuteOffset + realStart.hour * hourOffset;
      context.paintChild(cChild, offset + Offset(0, startConstraint));
    }
  }
}
