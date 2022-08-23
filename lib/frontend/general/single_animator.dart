import 'package:flutter/material.dart';
import 'package:rhythmic/frontend/general/animator.dart';

mixin SingleAnimatorMixin<T extends StatefulWidget> on State<T>
    implements SingleTickerProviderStateMixin<T> {
  Animator createAnimator();
  late Animator animator;

  @override
  void initState() {
    animator = createAnimator();
    super.initState();
  }

  @override
  void dispose() {
    animator.dispose();
    super.dispose();
  }
}
