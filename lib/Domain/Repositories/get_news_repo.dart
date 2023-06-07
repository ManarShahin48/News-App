import 'package:dartz/dartz.dart';
import '../../Core/Error/failure.dart';
import '../../Data/Models/news_model.dart';

abstract class GetNewsRepository {
  Future<Either<Failure, List<NewModel>>> getNews(
    String lang,
    String text,
    String location,
    String person,
    String organization,
  );
}
