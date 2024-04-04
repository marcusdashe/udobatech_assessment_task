import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mysql1/mysql1.dart';

import '../../../common/constants/colors.dart';
import '../../../util/database_helper.dart';


class BlogPostScreen extends StatefulWidget {

  static const routeName = '/blog-post';

  const BlogPostScreen({super.key});

  @override
  State<BlogPostScreen> createState() => _BlogPostScreenState();
}

class _BlogPostScreenState extends State<BlogPostScreen>{

  late MySqlConnection conn;
  late Results results;

  List<Widget> allPosts = [];

  @override
  void initState() {
    super.initState();
    debugPrint("Before fetching Posts...");
    _fetchPosts();
    debugPrint("After fetching Posts...");
  }

  void _fetchPosts() async {

    conn = (await DatabaseHelper.getConnection());
     var resultsTemp = await conn.query('SELECT featured_image, heading, author_name, content FROM blog_posts LIMIT 0, 1000');
    debugPrint("${resultsTemp.isEmpty}");

    // if(resultsTemp.isNotEmpty){
    //   setState(() {
    //     results = resultsTemp;
    //   });
    // }

    setState(() {
      results = resultsTemp;
    });

    allPosts.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.9, // 80% of screen width
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage("https://s.france24.com/media/display/b986b964-f02f-11ee-98db-005056a97e36/w:980/p:16x9/ff7156a65caa896d8e3930b2a8cd5ea462901df4.webp"),
                    fit: BoxFit.cover
                ),
              ),
            ),
            const SizedBox(height: 10,),
            const Text("Senegal's incomming president to take office with two first ladies.",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10,),
            const Text("Marcus Dashe",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20,),

            const Text( textAlign: TextAlign.justify, "Labore sunt veniam amet est. Minim nisi dolor eu ad incididunt cillum elit ex ut. Dolore exercitation nulla tempor consequat aliquip occaecat. Nisi id ipsum irure aute. Deserunt sit aute irure quis nulla eu consequat fugiat Lorem sunt magna et consequat labore. Laboris incididunt id Lorem est duis deserunt nisi dolore eiusmod culpa exercitation consectetur.Fugiat do aliqua laboris cillum sint dolor officia adipisicing excepteur fugiat officia. Cupidatat ut elit consequat ea laborum occaecat laborum aute consectetur Lorem exercitation. Lorem anim minim officia aliquip commodo deserunt mollit. Duis deserunt quis cillum voluptate duis ipsum quis incididunt elit excepteur excepteur labore duis cillum. Voluptate sint nulla minim eiusmod in nulla. Ea id ad duis esse adipisicing culpa ex esse ea dolore consequat. Reprehenderit eu minim veniam aliquip do ipsum duis do qui adipisicing aliquip ad occaecat. Enim reprehenderit sunt do do. Ex fugiat nisi sit anim culpa nisi. Non labore fugiat culpa magna. Commodo esse Lorem ex duis do et do. Est laboris cupidatat ad est anim adipisicing sit labore do dolor officia. Fugiat consequat in excepteur reprehenderit id aliquip voluptate sint enim proident aliquip occaecat quis non. Ad nulla aliqua est amet aliqua sint est occaecat amet sunt. Ullamco laborum qui sint officia officia ad Lorem culpa minim voluptate occaecat id duis esse. Ullamco sunt magna consectetur excepteur. Id cupidatat proident ex ad elit laboris. Nulla aute sit occaecat laboris. Laboris minim aliquip exercitation elit commodo ipsum et fugiat sit anim laborum proident cillum laboris. Et cillum tempor esse sit anim et veniam. Tempor magna irure ex ea id fugiat. Ex eu sint tempor quis exercitation amet ut deserunt sit fugiat aliquip nostrud nulla. Eu sunt laborum elit consectetur tempor sunt dolore in sunt reprehenderit voluptate dolore adipisicing. Proident eiusmod reprehenderit quis sint exercitation voluptate non labore. Sunt non sint in Lorem occaecat dolore tempor ipsum et proident sit Lorem ipsum officia.")
          ],
        )
    );

    for(var row in results){
      allPosts.add(
          buildPost(
              size: MediaQuery.of(context).size,
              imageUrl: row[0],
              title: row[1],
              author: row[2],
              content: row[3]
          )
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: UdobaTechColors.whiteColor,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    // final h = MediaQuery.of(context).size.height, w = MediaQuery.of(context).size.width;
    final size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
          backgroundColor: UdobaTechColors.whiteColor,
          body: SingleChildScrollView(
            child: buildBlogPostContent(size),
          ),
        )
    );
  }

  Widget buildBlogPostContent(Size size){
    return SizedBox(
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            ...allPosts
            // buildPost(size),
          ],
        ),
      ),
    );
  }

  Column buildPost({
  required Size size,
    required String imageUrl,
    required String title,
    required String author,
    required String content,
  }) {
    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: size.width * .9,
            height: size.height * .25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Text(title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10,),
          Text(author,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 20,),

          Text(content, textAlign: TextAlign.justify,)
        ],
      );
  }
}
