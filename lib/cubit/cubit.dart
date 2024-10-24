import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/cubit_states.dart';
import 'package:shop_app/helper/dio_helper.dart';
import 'package:shop_app/models/category/categories_model.dart';
import 'package:shop_app/models/change_favorites/change_favorites_model.dart';
import 'package:shop_app/models/favorite/favorites_model.dart';
import 'package:shop_app/models/home/home_model.dart';
import 'package:shop_app/models/login/login_model.dart';
import 'package:shop_app/ui/screen/home/tabs/categories.dart';
import 'package:shop_app/ui/screen/home/tabs/favourite.dart';
import 'package:shop_app/ui/screen/home/tabs/product.dart';
import 'package:shop_app/ui/screen/home/tabs/settings.dart';
import 'package:shop_app/ui/uitlies/endpiont.dart';
import 'package:shop_app/ui/uitlies/shared_preferences.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> bottomScreen = [
    const ProductTab(),
    const CategoriesTab(),
    FavouriteTab(),
    SettingsTab(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }

  HomeModel? homeModel;
  CategoriesModel? categoriesModel;
  ChangeFavoritesModel? changeFavoritesModel;
  FavoritesModel? favoritesModel;

  /// عملت ماب بتاخد id بتاع favorite وهو true or false
  Map<int, bool> favorites= {};
  void getHomeData() {
    emit(ShopLoadingHomeState());
    DioHelper.getData(
        endPoint: home,
        token: token
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      homeModel?.data?.products?.forEach((element) {
        favorites.addAll({
          element.id! :element.inFavorites!,
        });
        // print(favorites.toString());
      });
      // print("FFFFF");
      // print(homeModel!.data!.products![0].image);
      emit(ShopSuccessHomeState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorHomeState());
    });
  }
  void getCategories(){
    DioHelper.getData(
        endPoint: getCategory,
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      // print("FFFFF");
      // print(categoriesModel);
      emit(ShopSuccessCategoriesState());
    }).catchError((error) {
      // print(error.toString());
      emit(ShopErrorCategoriesState());
    });
  }

  void changeFavorite(int productId){
    favorites[productId] = !favorites[productId]!;
    emit(ShopFavoritesState());
    DioHelper.postData(
        url: addOrDeleteFavorite,
        data: {
          "product_id": productId,
        },
      token: "StIUUCoBrqU1xsiGBvP6MNeVztUWYS6kom22EGMGQzG2QoGlBXHz2txYhgMqwZ3ueafByi",
        ).then((value)
    {
      changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
      print(value.data);
      if(!changeFavoritesModel!.status!){
        favorites[productId] = !favorites[productId]!;
      }
      emit(ShopSuccessFavoritesState(changeFavoritesModel!));
    }).catchError((error)
    {
      emit(ShopErrorFavoriteState());
    });
  }


  void getFavorites(){
    DioHelper.getData(
      endPoint: addOrDeleteFavorite,
      token: "StIUUCoBrqU1xsiGBvP6MNeVztUWYS6kom22EGMGQzG2QoGlBXHz2txYhgMqwZ3ueafByi",
    ).then((value) {
      favoritesModel = FavoritesModel.fromJson(value.data);
      print("FFFFF");
      print(value.data);
      emit(ShopSuccessGetFavoriteState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorGetFavoriteState());
    });
  }
  LoginModel? userModel;
  void getUserData(){
    emit(ShopLoadingUserDataState());
    DioHelper.getData(
      endPoint: profiles,
      token: SharedPref.getToken()
      // token: "StIUUCoBrqU1xsiGBvP6MNeVztUWYS6kom22EGMGQzG2QoGlBXHz2txYhgMqwZ3ueafByi",
    ).then((value) {
      userModel = LoginModel.fromJson(value.data);
      print("name");
      print(userModel!.data!.name);
      emit(ShopSuccessUserDataState(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorUserDataState());
    });
  }
}