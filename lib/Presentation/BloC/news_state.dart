abstract class NewsStates {
  const NewsStates();
}

class NewsInitial extends NewsStates {}

class GetNewsState extends NewsStates {}

class GetLangState extends NewsStates {}

class NewsGetLoadingSearchState extends NewsStates {}
