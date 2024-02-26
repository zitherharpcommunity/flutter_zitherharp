extension $ObjectExtension<T extends Object> on T {
  /// Marks this object as hardcoded and it will be replaced in the near future.
  T get hardcoded => this;
}
