import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_zitherharp/flutter_zitherharp.dart';
import 'package:http/http.dart' as http;

abstract base class FlutterDatabase {
  static final _database = FirebaseDatabase.instance;

  @protected
  final FirebaseOptions options;

  @protected
  late final Map<String, dynamic> shelf = {};

  bool get enableLogging => false;

  FlutterDatabase({required this.options}) {
    _database.setLoggingEnabled(enableLogging);
    if (!kIsWeb) _database.setPersistenceEnabled(true);
  }

  @protected
  @nonVirtual
  Future<Map> get<T>({
    bool useHttp = false,
    required String name,
  }) async {
    if (useHttp) {
      final response = await http.get(
        Uri.parse('${options.databaseURL}/$name.json'),
      );
      if (response.statusCode != 200) return {};
      return Map.from(jsonDecode(response.body));
    } else {
      final snapshot = await _database.ref(name).get();
      return snapshot.value as Map<Object?, Object?>;
    }
  }
}
