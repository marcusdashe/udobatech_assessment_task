

import 'package:mysql1/mysql1.dart';

import '../data/models/blog_post_model.dart';

class DatabaseHelper {
  static Future<MySqlConnection> getConnection() async {
    final settings = ConnectionSettings(
    ); // Replace with your database name
    return await MySqlConnection.connect(settings);
  }

  // Add methods for CRUD operations
  // Future<List<BlogPost>> fetchPosts() async {
  //   final conn = await getConnection();
  //   final results = await conn.query('SELECT * FROM your_blog_table');
  //   // return results.map((row) => BlogPost.fromJson(row)).toList();
  //   return results.map((row) => BlogPost.fromJson(row.toMap())).toList();
  // }
}

