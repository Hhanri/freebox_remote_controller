extension FpExtensions<I> on I {
  T map<T>(T Function(I) f) {
    return f(this);
  }
}
