import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:rhythmic/backend/tracker/tracker_union.dart';

class TrackerUnionConverter extends TypeConverter<TrackerUnion, String>
    with JsonTypeConverter<TrackerUnion, String> {
  @override
  TrackerUnion? mapToDart(String? fromDb) {
    if (fromDb == null) {
      return null;
    }
    return TrackerUnion.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String? mapToSql(TrackerUnion? value) {
    if (value == null) {
      return null;
    }
    return json.encode(value.toJson());
  }
}
