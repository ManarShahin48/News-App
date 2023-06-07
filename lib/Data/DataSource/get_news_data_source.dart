import 'package:dio/dio.dart';
import 'package:news_app/Core/Error/error_model.dart';
import 'package:news_app/Core/Error/exception.dart';
import 'package:news_app/Core/Resources/apis_manager.dart';
import 'package:news_app/Data/Models/news_model.dart';

abstract class BaseNewsDataSource {
  Future<List<NewModel>> getNews({
    required String lang,
    required String text,
    required String location,
    required String person,
    required String organization,
  });
}

// {"LOC": location, "PER": person, "ORG": organization}

class GetNewsDataSource extends BaseNewsDataSource {
  GetNewsDataSource();

  /// Check and Get News from API
  @override
  Future<List<NewModel>> getNews({
    required String lang,
    required String text,
    required String location,
    required String person,
    required String organization,
  }) async {
    final response = await Dio().get(
      APIsManager.searchNews,
      queryParameters: {
        "language": lang,
        "text": text,
        "entities": 'LOC:$location,ORG:$organization,PER:$person'
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
