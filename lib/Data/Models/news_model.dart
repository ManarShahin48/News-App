import 'package:news_app/Domain/Entities/news_entity.dart';

class NewModel extends NewEntity {
  const NewModel({
    required super.title,
    required super.text,
    required super.summary,
    required super.image,
    required super.publishDate,
  });

  factory NewModel.fromJson(Map<String, dynamic> json) {
    return NewModel(
      title: json["title"],
      text: json["text"],
      summary: json["summary"] ?? "",
      image: json['image'],
      publishDate: json['publish_date'],
    );
  }

  @override
  String toString() {
    return '{title: $title,text: $text, summary: $summary, image: $image, publishDate:$publishDate}';
  }
}
