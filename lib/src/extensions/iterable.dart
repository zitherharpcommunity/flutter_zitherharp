import 'dart:math';

extension $IterableExtension<T> on Iterable<T> {
  /// A cryptographically secure random number generator.
  static final Random _random = Random.secure();

  /// Creates a [List] containing the elements of this [Iterable].
  List<T> get _list => toList();

  /// Returns the elements of this [Iterable] randomly.
  Iterable<T> get shuffled => _list..shuffle(_random);

  /// Returns an element of this [Iterable] randomly.
  T get random => _random.nextBool() ? shuffled.first : shuffled.last;

  void assign(T value) {
    _list.clear();
    _list.add(value);
  }

  void assignAll(List<T> values) {
    _list.clear();
    _list.addAll(values);
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
