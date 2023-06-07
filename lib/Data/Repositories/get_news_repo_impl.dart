import 'package:dartz/dartz.dart';
import 'package:news_app/Core/Error/exception.dart';
import 'package:news_app/Core/Error/failure.dart';
import 'package:news_app/Data/DataSource/get_news_data_source.dart';
import 'package:news_app/Data/Models/news_model.dart';
import 'package:news_app/Domain/Repositories/get_news_repo.dart';

class GetNewsRepositoryImp extends GetNewsRepository {
  final GetNewsDataSource dataSource;

  GetNewsRepositoryImp(this.dataSource);

  @override
  Future<Either<Failure, List<NewModel>>> getNews(
    String lang,
    String text,
  ) async {
    final result = await dataSource.getNews(
      lang: lang,
      text: text,
    );
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorModel.message));
    }
  }
}
