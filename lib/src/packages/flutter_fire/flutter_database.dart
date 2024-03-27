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

  Uri _getUrl(String name) => Uri.parse('https://$_baseUrl/$name.json');

  @protected
  @nonVirtual
  Future<Map<String, dynamic>> get(String name) async {
    if (kIsDesktop) {
      final response = await http.get(_getUrl(name));
      if (response.statusCode != 200) return {};
      return Map.from(jsonDecode(response.body));
    }
    final snapshot = await _database.ref(name).get();
    return snapshot.value as Map<String, dynamic>;
  }
}
