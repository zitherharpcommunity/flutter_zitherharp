import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_zitherharp/flutter_zitherharp.dart';
import 'package:http/http.dart' as http;

abstract base class FlutterDatabase {
  @protected
  late final Map<String, dynamic> shelf = {};
  late final FirebaseDatabase _database = FirebaseDatabase.instance;

  bool get enableLogging => false;

  String? get databaseURL;

  FlutterDatabase() {

    _database.setLoggingEnabled(enableLogging);    
    if (!kIsWeb) _database.setPersistenceEnabled(true);
  }

  @protected
  @nonVirtual
  Future<List<T>> get<T>({
    bool cache = true,
    required String name,
    required JsonParser<T> parser,
  }) async {
    if (cache && shelf.containsKey(name)) return shelf[name];
    Map<dynamic, dynamic> data;
    if (!cache) {
      final response = await http.get(
        Uri.parse('$databaseURL/$name.json'),
      );
      if (response.statusCode != 200) return [];
      data = Map.from(jsonDecode(response.body));
    } else {
      final snapshot = await _database.ref(name).get();
      data = snapshot.value as Map<Object?, Object?>;
    }
    return shelf[name] =
        data.entries.map((e) => parser.call(e.key, e.value)).toList();
  }
}

typedef JsonParser<T> = T Function(String id, dynamic json);
