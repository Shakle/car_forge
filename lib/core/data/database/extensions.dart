extension Serialization on Map {

  Map<String, dynamic> removeNullValues() {
    removeWhere((key, value) => values == null);
    return this;
  }
}