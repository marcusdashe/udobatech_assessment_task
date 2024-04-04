
class BlogPost {
  final String featuredImage;
  final String heading;
  final String authorName;
  final String content;

  BlogPost({
    required this.featuredImage,
    required this.heading,
    required this.authorName,
    required this.content,
  });

  factory BlogPost.fromJson(Map<String, dynamic> json) {
    return BlogPost(
      featuredImage: json['featured_image'] as String,
      heading: json['heading'] as String,
      authorName: json['author_name'] as String,
      content: json['content'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'featured_image': featuredImage,
      'heading': heading,
      'author_name': authorName,
      'content': content,
    };
  }
}
