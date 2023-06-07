import 'package:dartz/dartz.dart';
import '../../Core/Error/failure.dart';
import '../../Data/Models/news_model.dart';
import '../Repositories/get_news_repo.dart';

class GetNewsUseCase {
  final GetNewsRepository getNewsRepository;
  final String lang;
  final String text;

  GetNewsUseCase(this.getNewsRepository, this.lang, this.text);

  /// Get News Data
  Future<Either<Failure, List<NewModel>>> execute() async {
    return await getNewsRepository.getNews(lang, text);
  }
}
