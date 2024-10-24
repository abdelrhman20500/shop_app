import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/helper/dio_helper.dart';
import 'package:shop_app/models/login/login_model.dart';
import 'package:shop_app/ui/screen/login/cubit/login_states.dart';
import 'package:shop_app/ui/uitlies/endpiont.dart';
import 'package:shop_app/ui/uitlies/shared_preferences.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit() :super(LoginInitialState());
 LoginModel? loginModel;
   static LoginCubit get(context) =>BlocProvider.of(context);
   void userLogin({required String email, required String password})
   {
     emit(LoginLoadingState());
     DioHelper.postData(
         url: login,
         data:
         {
           "email": email,
           "password": password
         }
     ).then((value) {
       loginModel = LoginModel.fromJson(value.data);
       // print("22222");
       // print(loginModel!.status);
       emit(LoginSuccessState(loginModel!));
       SharedPref.saveToken(loginModel!.data!.token!);
       print(loginModel!.data!.token!);
       print(loginModel!.data!.email!.toString());
     }).catchError((error){
       print(error.toString());
       emit(LoginErrorState(error.toString()));
     });
   }

}