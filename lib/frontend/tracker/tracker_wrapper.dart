import 'package:rhythmic/frontend/general/single_animator.dart';
import 'package:rhythmic/lib.dart';

class ExpansionModel extends ChangeNotifier {
  bool _expanded;

  bool get expanded => _expanded;

  set expanded(bool expanded) {
    _expanded = expanded;
    notifyListeners();
  }

  ExpansionModel([this._expanded = false]);
}

class TrackerWrapperWidget extends StatefulWidget {
  final Tracker tracker;
  final VoidCallback onDelete;
  final void Function() onSelect;
  final Widget child;
  const TrackerWrapperWidget(
    this.tracker,
    this.onDelete,
    this.onSelect, {
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<TrackerWrapperWidget> createState() => _TrackerWrapperWidgetState();
}

class _TrackerWrapperWidgetState extends State<TrackerWrapperWidget>
    with SingleTickerProviderStateMixin, SingleAnimatorMixin {
  void expand(ExpansionModel model) {
    model.expanded = !model.expanded;
  }

  void deleteDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          final theme = context.theme;
          final normalText = theme.textTheme.headlineSmall
              ?.copyWith(color: theme.colorScheme.onSurface);
          // print("normal text color $");
          final boldText = theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold, color: theme.colorScheme.onSurface);
          final loc = AppLocalizations.of(context)!;
          return AlertDialog(
            title: RichText(
              text: TextSpan(children: [
                TextSpan(text: loc.delete.toCapitalized(), style: normalText),
                TextSpan(text: " ", style: normalText),
                TextSpan(text: widget.tracker.name, style: boldText),
                TextSpan(text: "?", style: normalText)
              ]),
            ),
            actions: [
              TextButton(
                child: Text(loc.cancel.toCapitalized()),
                onPressed: () => Navigator.pop(context),
              ),
              TextButton(
                child: Text(loc.ok.toCapitalized()),
                onPressed: () {
                  widget.onDelete();
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final nameText =
        theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700);
    return ChangeNotifierProvider(
      create: (_) => ExpansionModel(),
      builder: (context, _) => Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          splashFactory: InkSparkle.splashFactory,
          onTap: () => expand(context.read<ExpansionModel>()),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.tracker.name,
                    style: nameText,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  alignment: Alignment.centerLeft,
                  child: widget.child,
                ),
                Consumer<ExpansionModel>(builder: (context, expansionModel, _) {
                  animator.updateAnimation(expansionModel.expanded);
                  return SizeTransition(
                    sizeFactor: animator.animation,
                    axisAlignment: 1,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      alignment: Alignment.centerRight,
                      child: Wrap(
                        alignment: WrapAlignment.end,
                        spacing: 10,
                        children: [
                          Material(
                            type: MaterialType.circle,
                            color: Colors.transparent,
                            clipBehavior: Clip.antiAlias,
                            child: IconButton(
                              onPressed: widget.onSelect,
                              icon: const Icon(Icons.open_in_full_rounded),
                              iconSize: 22,
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                          Material(
                            type: MaterialType.circle,
                            color: Colors.transparent,
                            clipBehavior: Clip.antiAlias,
                            child: IconButton(
                              onPressed: () => deleteDialog(context),
                              icon: const Icon(Icons.delete),
                              iconSize: 22,
                              color: theme.colorScheme.onSurface,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Animator createAnimator() {
    return AnimatorBuilder(
            vsync: this,
            duration: const Duration(milliseconds: 400),
            reverseDuration: const Duration(milliseconds: 200))
        .create((parent) => CurvedAnimation(
            parent: parent,
            curve: Curves.easeOutQuart,
            reverseCurve: Curves.decelerate));
  }
}
