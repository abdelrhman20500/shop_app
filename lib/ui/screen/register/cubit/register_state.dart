import 'package:shop_app/models/register/register_model.dart';

abstract class RegisterState{}
class RegisterInitialState extends RegisterState{}
class RegisterLoadingState extends RegisterState{}
class RegisterSuccessState extends RegisterState{
  final RegisterModel registerModel;

  RegisterSuccessState(this.registerModel);
}
class RegisterErrorState extends RegisterState{
  final String error;

  RegisterErrorState(this.error);
}

