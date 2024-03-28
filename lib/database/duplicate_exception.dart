class DuplicateException implements Exception {
  final String field;
  final String message;

  const DuplicateException(this.field, this.message);

  @override
  String toString() => message;

}