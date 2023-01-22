void main(List<String> args) {}

class Database {
  bool _isDbOpen = false;

  Future open() {
    return Future.delayed(const Duration(seconds: 1), () {
      _isDbOpen = true;
      print('Database opened');
    });
  }

   Future close() {
    return Future.delayed(const Duration(seconds: 1), () {
      _isDbOpen = false;
      print('Database closed');
    });
  }
  Future<String> getData() {
    if (!_isDbOpen) {
      throw DatabaseNotOpenException();
    }
    return Future.delayed(const Duration(seconds: 1), () => 'Data');
  }
}

class DatabaseNotOpenException implements Exception {
  @override
  String toString() => 'Database not open exception caught';
}
