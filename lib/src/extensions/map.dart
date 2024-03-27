extension $MapExtension<K, V> on Map<K, V> {
  /// Reverses the keys and values of this map.
  Map<V, K> get reversed {
    return map((key, value) {
      return MapEntry(value, key);
    });
  }
}
