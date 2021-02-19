extension Serialization on Map {

  Map<String, dynamic> removeNullValues() {
    removeWhere((key, value) => value == null);
    return this;
  }
}