import 'dart:math';

extension $IterableExtension<T> on Iterable<T> {
  /// A cryptographically secure random number generator.
  static final Random _random = Random.secure();

  /// Creates a [List] containing the elements of this [Iterable].
  List<T> get _list => toList();

  /// Returns the elements of this [Iterable] randomly.
  List<T> get shuffled => _list..shuffle(_random);

  /// Returns an element of this [Iterable] randomly.
  T get random => _random.nextBool() ? shuffled.first : shuffled.last;

  /// Returns an element of this [Iterable] randomly
  /// or `null` if this [Iterable] is empty.
  T? get randomOrNull =>
      _random.nextBool() ? shuffled.firstOrNull : shuffled.lastOrNull;

  /// Clear the list and add a single [value].
  void assign(T value) {
    _list.clear();
    _list.add(value);
  }

  /// Clear the list and add all [values].
  void assignAll(Iterable<T> values) {
    _list.clear();
    _list.addAll(values);
  }

  /// The first element that satisfies the given predicate [test].
  ///
  /// If no element satisfies [test], return `null`.
  T? firstWhereOrNull(bool Function(T? value) test) {
    return cast<T?>().firstWhere(test, orElse: () => null);
  }

  /// The single element that satisfies the given predicate [test].
  ///
  /// If no element satisfies [test], return `null`.
  T? singleWhereOrNull(bool Function(T? value) test) {
    return cast<T?>().singleWhere(test, orElse: () => null);
  }

  /// The last element that satisfies the given predicate [test].
  ///
  /// If no element satisfies [test], return `null`.
  T? lastWhereOrNull(bool Function(T? value) test) {
    return cast<T?>().lastWhere(test, orElse: () => null);
  }

  /// Appends all objects of [others] to the end of this list.
  Iterable<T> operator +(Iterable<T> others) => _list..addAll(others);

  /// Removes all objects from this list that satisfy [others].
  Iterable<T> operator -(Iterable<T> others) =>
      _list..removeWhere((e) => others.contains(e));
}

extension $IterablesExtension<T> on Iterable<Iterable<T>> {
  /// Reduces a multiple iterable to a single iterable by iteratively combining elements of the collection.
  Iterable<T> get reduced => reduce((a, b) => a + b).toSet();
}
