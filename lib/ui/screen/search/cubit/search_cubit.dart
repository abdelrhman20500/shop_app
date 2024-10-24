import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/cubit.dart';
import 'package:shop_app/helper/dio_helper.dart';
import 'package:shop_app/models/search/search_model.dart';
import 'package:shop_app/ui/screen/search/cubit/search_state.dart';
import 'package:shop_app/ui/uitlies/endpiont.dart';

class SearchCubit extends Cubit<SearchState>{
  SearchCubit() :super(SearchInitialState());
  static SearchCubit get(context)=>BlocProvider.of(context);
  SearchModel? searchModel;
  void search(String text){
    emit(SearchLoadingState());
    DioHelper.postData(url: searchUrl, data: {
      "text" :text,
      token:"StIUUCoBrqU1xsiGBvP6MNeVztUWYS6kom22EGMGQzG2QoGlBXHz2txYhgMqwZ3ueafByi"
    }).then((value) {
      searchModel = SearchModel.fromJson(value.data);
      print(value.data);
      emit(SearchSuccessState(searchModel!));
    }).catchError((error){
      print(error.toString());
      emit(SearchErrorState());
    });
  }
}