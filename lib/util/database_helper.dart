

import 'package:mysql1/mysql1.dart';

import '../data/models/blog_post_model.dart';

class DatabaseHelper {
  static Future<MySqlConnection> getConnection() async {
    final settings = ConnectionSettings(
    ); // Replace with your database name
    return await MySqlConnection.connect(settings);
  }
}

