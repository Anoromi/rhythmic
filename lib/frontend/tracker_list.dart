import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:rhythmic/backend/tables/database_model.dart';
import 'package:rhythmic/backend/tables/tracker_tables.dart';
import 'package:rhythmic/frontend/tracker/duration_tracker_widget.dart';
import 'package:rhythmic/frontend/tracker/point_tracker_widget.dart';
import 'package:rhythmic/frontend/tracker/tracker_wrapper.dart';

class TrackerListWidget extends StatefulWidget {
  final void Function(int id) onSelect;
  const TrackerListWidget(this.onSelect, {Key? key}) : super(key: key);

  @override
  State<TrackerListWidget> createState() => _TrackerListWidgetState();
}

class TrackerListModel {
  final StreamController<void> _refresh = StreamController.broadcast();
  Stream<void> get refresh => _refresh.stream;

  void refreshItems() {
    _refresh.add(null);
  }
}

class _TrackerListWidgetState extends State<TrackerListWidget> {
  Map<int, _TrackerListItemWidget> itemWidgets = {};
  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: TrackerListModel(),
      child: Consumer<TrackerProviderModel>(
        builder: (context, value, child) => StreamBuilder<List<int>>(
            stream: value.trackerProvider.watchTrackerIds(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var list = snapshot.data!;

                return RefreshIndicator(

                  onRefresh: () async {
                    context.read<TrackerListModel>().refreshItems();
                    await Future.delayed(const Duration(seconds: 1));
                  },
                  child: MasonryGridView.custom(
                    gridDelegate:
                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    childrenDelegate: SliverChildBuilderDelegate(
                      (context, index) {
                        var id = list[index];
                        return _TrackerListItemWidget(id,
                            key: ValueKey(id),
                            onDelete: () => value.deleteTracker(id),
                            onSelect: () => widget.onSelect(id));
                      },
                      childCount: list.length,
                      findChildIndexCallback: (key) =>
                          list.indexOf((key as ValueKey<int>).value),
                    ),
                  ),
                );
              } else {
                return const CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}

class _TrackerListItemWidget extends StatefulWidget {
  final int id;
  final VoidCallback onDelete;
  final VoidCallback onSelect;
  const _TrackerListItemWidget(
    this.id, {
    Key? key,
    required this.onDelete,
    required this.onSelect,
  }) : super(key: key);

  @override
  State<_TrackerListItemWidget> createState() => __TrackerListItemWidgetState();
}

class __TrackerListItemWidgetState extends State<_TrackerListItemWidget> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TrackerProviderModel>(
      builder: (context, model, child) => StreamBuilder<Tracker>(
          stream: model.trackerProvider.watchTracker(widget.id),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Container();
            } else {
              var data = snapshot.data!;
              log("data updated for ${data.id}");
              return TrackerWrapperWidget(
                  data, widget.onDelete, widget.onSelect,
                  child: data.trackerData.map(
                      duration: (value) => ChangeNotifierProvider(
                            create: (_) => DurationTrackerModel(
                                data, value.entity, model.durationProvider),
                            key: ValueKey(data),
                            child: const DurationTrackerWidget(),
                          ),
                      point: (value) {
                        model.pointProvider
                            .updateDevalidation(data, value.entity);
                        return ChangeNotifierProvider(
                          create: (context) => PointTrackerModel(
                              data,
                              value.entity,
                              model.pointProvider,
                              context.read<TrackerListModel>().refresh),
                          builder: (context, child) {
                            context
                                .read<PointTrackerModel>()
                                .updateData(data, value.entity);
                            return child!;
                          },
                          child: const PointTrackerWidget(),
                        );
                      }));
            }
          }),
    );
  }
}
