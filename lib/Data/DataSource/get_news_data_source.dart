import 'package:dio/dio.dart';
import 'package:news_app/Core/Error/error_model.dart';
import 'package:news_app/Core/Error/exception.dart';
import 'package:news_app/Core/Resources/apis_manager.dart';
import 'package:news_app/Data/Models/news_model.dart';

abstract class BaseNewsDataSource {
  Future<List<NewModel>> getNews({required String lang});
}

class GetNewsDataSource extends BaseNewsDataSource {
  GetNewsDataSource();

  /// Check and Get News from API
  @override
  Future<List<NewModel>> getNews({required String lang}) async {
    final response = await Dio().get(
      APIsManager.searchNews,
      queryParameters: {
        "language": lang,
      },
    );
    if (response.statusCode == 200) {
      return List<NewModel>.from(
          (response.data["news"] as List).map((e) => NewModel.fromJson(e)));
    } else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }
}
