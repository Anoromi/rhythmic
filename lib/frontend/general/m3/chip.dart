import 'dart:developer';

import 'package:rhythmic/lib.dart';

class M3FilterChip extends StatefulWidget {
  final Widget child;
  final bool isSelected;
  final bool enabled;
  final VoidCallback onPressed;
  final ChipMaterialStyle? style;
  const M3FilterChip(
      {Key? key,
      required this.child,
      required this.onPressed,
      this.isSelected = false,
      this.enabled = true,
      this.style})
      : super(key: key);

  @override
  State<M3FilterChip> createState() => _M3FilterChipState();
}

class _M3FilterChipState extends State<M3FilterChip>
    with TickerProviderStateMixin, MaterialStateMixin {
  late Animator selectedAnimation;
  late ChipMaterialStyle style;

  @override
  void initState() {
    super.initState();
    selectedAnimation = AnimatorBuilder(
            vsync: this,
            duration: const Duration(milliseconds: 300),
            reverseDuration: const Duration(milliseconds: 300))
        .create((parent) => CurvedAnimation(
            parent: parent,
            curve: Curves.easeOut,
            reverseCurve: Curves.easeIn));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    style = widget.style ?? ChipMaterialStyle.normal(context);
  }

  @override
  void dispose() {
    selectedAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final color = theme.colorScheme;

    setMaterialState(MaterialState.disabled, !widget.enabled);
    setMaterialState(MaterialState.selected, widget.isSelected);

    selectedAnimation.updateAnimation(widget.isSelected);

    final container = style.containerColor.resolve(materialStates);
    final shape = style.containerOutline.resolve(materialStates);
    final elevation = style.containerElevation.resolve(materialStates);
    final shadowColor = style.containerShadowColor.resolve(materialStates);

    return Container(
      constraints: const BoxConstraints(minHeight: 32),
      child: Material(
        shape: shape,
        color: container,
        type: MaterialType.button,
        surfaceTintColor: color.surfaceTint,
        elevation: elevation,
        textStyle: theme.textTheme.labelLarge
            ?.copyWith(color: color.onSecondaryContainer),
        clipBehavior: Clip.antiAlias,
        shadowColor: shadowColor,
        child: InkWell(
          onTap: widget.onPressed,
          onHover: (b) => setMaterialState(MaterialState.hovered, b),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                SizeTransition(
                  sizeFactor: selectedAnimation.animation,
                  axis: Axis.horizontal,
                  child: ScaleTransition(
                    scale: selectedAnimation.animation,
                    child: const Icon(
                      Icons.check,
                      size: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: widget.child,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChipTest extends StatefulWidget {
  const ChipTest({Key? key}) : super(key: key);

  @override
  State<ChipTest> createState() => _ChipTestState();
}

class _ChipTestState extends State<ChipTest> {
  var selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          for (var i = 0; i < 3; i++)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: M3FilterChip(
                onPressed: () => setState(() {
                  log("selected $i");
                  selected = i;
                }),
                isSelected: selected == i,
                child: Text("Hello $i"),
              ),
            ),
          for (var i = 0; i < 3; i++)
            Padding(
              padding: const EdgeInsets.all(8),
              child: FilterChip(
                onSelected: (b) {},
                selected: true,
                label: const Text("Hello"),
              ),
            )
        ],
      ),
    );
  }
}

class ChipMaterialStyle {
  final MaterialStateProperty<Color> containerColor;
  final MaterialStateProperty<ShapeBorder> containerOutline;
  final MaterialStateProperty<Color?> containerShadowColor;
  final MaterialStateProperty<double> containerElevation;
  ChipMaterialStyle({
    required this.containerColor,
    required this.containerOutline,
    required this.containerShadowColor,
    required this.containerElevation,
  });

  factory ChipMaterialStyle.normal(BuildContext context) {
    final color = context.color;
    return ChipMaterialStyle(
      containerColor: MaterialStateProperty.resolveWith((states) {
        if (states.isDisabled && states.isSelected) {
          return Colors.transparent;
        }
        if (states.isDisabled) {
          return color.onSurface.withOpacity(0.12);
        }
        if (states.isHovered && states.isSelected) {
          return color.secondaryContainer;
        }
        if (states.isHovered) {
          return Colors.transparent;
        }
        if (states.isSelected) {
          return color.secondaryContainer;
        }
        return Colors.transparent;
      }),
      containerOutline: MaterialStateProperty.resolveWith((states) {
        final normalOutline = RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), side: BorderSide.none);

        if (states.isDisabled && states.isSelected) {
          return normalOutline;
        }
        if (states.isDisabled) {
          return normalOutline.copyWith(
              side: BorderSide(color: color.outline.withOpacity(0.12)));
        }
        if (states.isHovered && states.isSelected) {
          return normalOutline;
        }
        if (states.isHovered) {
          return normalOutline.copyWith(side: BorderSide(color: color.outline));
        }
        if (states.isSelected) {
          return normalOutline;
        }
        return normalOutline.copyWith(side: BorderSide(color: color.outline));
      }),
      containerShadowColor: MaterialStateProperty.all(Colors.transparent),
      containerElevation: MaterialStateProperty.resolveWith((states) {
        if (states.isHovered && states.isSelected) {
          return ElevationLevels.level1;
        }
        if (states.isHovered) {
          return ElevationLevels.level0;
        }
        if (states.isSelected) {
          return ElevationLevels.level0;
        }
        return ElevationLevels.level0;
      }),
    );
  }
}
