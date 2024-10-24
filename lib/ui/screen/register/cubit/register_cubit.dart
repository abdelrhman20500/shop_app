import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/register/register_model.dart';
import 'package:shop_app/ui/screen/register/cubit/register_state.dart';
import 'package:shop_app/ui/uitlies/endpiont.dart';
import 'package:shop_app/ui/uitlies/shared_preferences.dart';

import '../../../../helper/dio_helper.dart';

class RegisterCubit extends Cubit<RegisterState>{
  RegisterCubit() :super(RegisterLoadingState());
  static RegisterCubit get(context) =>BlocProvider.of(context);

  RegisterModel? registerModel;
  void userRegister({required String userName, required String phone,
    required String email, required String password})
  {
    emit(RegisterLoadingState());
    DioHelper.postData(
        url: registers,
        data:
        {
          "name" :userName,
          "email": email,
          "phone" :phone,
          "password": password
        }
    ).then((value) {
      registerModel = RegisterModel.fromJson(value.data);
      print("22222");
      // print(registerModel!.data);
      SharedPref.saveToken(registerModel!.data!.token!);
      print(registerModel!.data!.token!);
      print(registerModel!.data!.name!);
      print(registerModel!.data!.email!);

      emit(RegisterSuccessState(registerModel!));
    }).catchError((error){
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
  }
}