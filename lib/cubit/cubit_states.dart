import 'package:shop_app/models/change_favorites/change_favorites_model.dart';
import 'package:shop_app/models/login/login_model.dart';

abstract class ShopStates{}
class ShopInitialState extends ShopStates{}
class ShopChangeBottomNavState extends ShopStates{}
class ShopLoadingHomeState extends ShopStates{}
class ShopSuccessHomeState extends ShopStates{}
class ShopErrorHomeState extends ShopStates{}
class ShopSuccessCategoriesState extends ShopStates{}
class ShopErrorCategoriesState extends ShopStates{}
class ShopSuccessFavoritesState extends ShopStates{
  final ChangeFavoritesModel changeFavoritesModel;

  ShopSuccessFavoritesState(this.changeFavoritesModel);
}
class ShopFavoritesState extends ShopStates{}
class ShopErrorFavoriteState extends ShopStates{}
class ShopSuccessGetFavoriteState extends ShopStates{}
class ShopErrorGetFavoriteState extends ShopStates{}
class ShopLoadingUserDataState extends ShopStates{}
class ShopSuccessUserDataState extends ShopStates{
  final LoginModel userModel;

  ShopSuccessUserDataState(this.userModel);
}
class ShopErrorUserDataState extends ShopStates{}


