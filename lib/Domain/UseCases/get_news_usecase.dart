import 'package:dartz/dartz.dart';
import '../../Core/Error/failure.dart';
import '../../Data/Models/news_model.dart';
import '../Repositories/get_news_repo.dart';

class GetNewsUseCase {
  final GetNewsRepository getNewsRepository;
  final String lang;
  final String text;
  final String location;
  final String person;
  final String organization;

  GetNewsUseCase(
    this.getNewsRepository,
    this.lang,
    this.text,
    this.location,
    this.person,
    this.organization,
  );

  /// Get News Data
  Future<Either<Failure, List<NewModel>>> execute() async {
    return await getNewsRepository.getNews(
      lang,
      text,
      location,
      person,
      organization,
    );
  }
}
