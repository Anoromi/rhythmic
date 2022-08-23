mixin MemoizationLayer<T, G> {
  T get(G value);
}

bool _equal<G>(G prev, G next) => prev == next;

class SingleMemoization<T, G> implements MemoizationLayer<T, G> {
  G? previousInput;
  late T? value;
  T Function(G value) map;
  bool Function(G prev, G next)? equal = _equal;

  SingleMemoization(this.map, {this.equal});

  @override
  T get(G input) {
    if (previousInput != null &&
        !(equal?.call(previousInput as G, input) ?? true)) {
      return value!;
    }
    previousInput = input;
    value = map(input);
    return value!;
  }
}
