

import 'package:mysql1/mysql1.dart';

import '../data/models/blog_post_model.dart';

class DatabaseHelper {
  static Future<MySqlConnection> getConnection() async {
    final settings = ConnectionSettings(
        host: 'mysql-3803ff8-marcusdashe-bc5b.a.aivencloud.com', // Replace with your MySQL server host
        port: 24533,
        user: 'avnadmin', // Replace with your MySQL username
        password: 'AVNS_lhroSKGJ4Yd7w3RdK_s', // Replace with your MySQL password
        db: 'udobatech_blogpost'); // Replace with your database name
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

