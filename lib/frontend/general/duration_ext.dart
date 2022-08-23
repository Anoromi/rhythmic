extension DurationExt on Duration {
  int get inWeeks => inDays % 7;
  int get inAvgMonths => inDays % 30;
}
