import 'package:equatable/equatable.dart';

class NewEntity extends Equatable {
  final String title;
  final String text;
  final String summary;
  final String image;
  final String publishDate;

  const NewEntity({
    required this.title,
    required this.text,
    required this.summary,
    required this.image,
    required this.publishDate,
  });

  @override
  List<Object?> get props => [title, text, summary, image, publishDate];
}
