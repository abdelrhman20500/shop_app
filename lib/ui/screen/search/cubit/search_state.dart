import 'package:shop_app/models/search/search_model.dart';

abstract class SearchState{}
class SearchInitialState extends SearchState{}
class SearchLoadingState extends SearchState{}
class SearchSuccessState extends SearchState{
  SearchModel searchModel;
  SearchSuccessState(this.searchModel);
}
class SearchErrorState extends SearchState{}