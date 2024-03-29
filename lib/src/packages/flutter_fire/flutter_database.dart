import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_zitherharp/flutter_zitherharp.dart';
import 'package:http/http.dart' as http;

abstract base class FlutterDatabase {
  @protected
  late final Map<String, dynamic> shelf = {};

  late final FirebaseDatabase _database = FirebaseDatabase.instance;

  late final String _baseUrl = '$projectId-default-rtdb.firebaseio.com';

  FlutterDatabase() {
    _database.setLoggingEnabled(kDebugMode);
    _database.setPersistenceEnabled(kIsMobile);
  }

  String get projectId;

  @protected
  @nonVirtual
  Future<List<T>> get<T>({
    required String name,
    required T Function(String id, Map<String, dynamic> json) builder,
  }) async {
    if (shelf.containsKey(name)) return shelf[name];
    Map data;
    if (kIsDesktop) {
      final response = await http.get(
        Uri.parse('https://$_baseUrl/$name.json'),
      );
      if (response.statusCode != 200) return [];
      data = Map.from(jsonDecode(response.body));
    } else {
      final snapshot = await _database.ref(name).get();
      data = snapshot.value as Map<Object?, Object?>;
    }
    return data.entries.map((e) => builder.call(e.key, e.value)).toList();
  }
}
