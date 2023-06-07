import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Presentation/BloC/news_state.dart';
import '../../Core/Resources/enums.dart';
import '../../Data/DataSource/get_news_data_source.dart';
import '../../Data/Models/news_model.dart';
import '../../Data/Repositories/get_news_repo_impl.dart';
import '../../Domain/UseCases/get_news_usecase.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitial());

  static NewsCubit get(context) => BlocProvider.of(context);

  String lang = "en";
  List<NewModel> newsList = [];
  RequestState getNewsState = RequestState.loading;
  String message = "";
  TextEditingController searchController = TextEditingController();
  String searchedText = '';

  void getNewsData() async {
    emit(NewsGetLoadingSearchState());

    GetNewsDataSource getNewsDataSource = GetNewsDataSource();
    GetNewsRepositoryImp getNewsRepository =
        GetNewsRepositoryImp(getNewsDataSource);

    final result = await GetNewsUseCase(
      getNewsRepository,
      lang,
      searchedText,
    ).execute();

    result.fold(
      (l) {
        getNewsState = RequestState.error;
        message = l.message;
        emit(GetNewsState());
      },
      (r) {
        getNewsState = RequestState.loaded;
        newsList = r;
        emit(GetNewsState());
      },
    );
  }

  void setLang(String language) {
    lang = language;
    getNewsData();
    emit(GetLangState());
  }

}
