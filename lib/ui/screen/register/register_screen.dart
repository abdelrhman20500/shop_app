import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/ui/screen/register/cubit/register_cubit.dart';
import 'package:shop_app/ui/screen/register/cubit/register_state.dart';
import '../../../widgets/custom_material_button.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../home/home_screen.dart';


class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  static const String routeName = "Register Screen";

  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if(state is RegisterLoadingState){
            const Center(child: CircularProgressIndicator());
          }else if(state is RegisterErrorState){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
                duration: const Duration(seconds: 3),
              ),);
          }else if(state is RegisterSuccessState){
            print("%%%^%%%%%%");
            print(state.registerModel);
            if(state.registerModel.status!){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
            }else{
              showToast(state.registerModel.message!,
                  ToastStates.ERROR);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Register",
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        const Text(
                          "register now to browser our hot offers",
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.06),
                        CustomTextFormField(
                            controller: nameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "please enter your name";
                              }
                              return null;
                            },
                            labelText: "User Name",
                            prefixIcon: Icons.person,
                            keyboardType: TextInputType.text),
                        const SizedBox(
                          height: 15.0,
                        ),
                        CustomTextFormField(
                            controller: emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "please enter your email address";
                              }
                              return null;
                            },
                            labelText: "Email Address",
                            prefixIcon: Icons.email_outlined,
                            keyboardType: TextInputType.emailAddress),
                        const SizedBox(
                          height: 15.0,
                        ),
                        CustomTextFormField(
                            controller: phoneController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "please enter your phone";
                              }
                              return null;
                            },
                            labelText: "Phone",
                            prefixIcon: Icons.phone,
                            keyboardType: TextInputType.number),
                        const SizedBox(
                          height: 15.0,
                        ),
                        CustomTextFormField(
                          controller: passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "password is too short";
                            }
                            return null;
                          },
                          labelText: "Password",
                          prefixIcon: Icons.lock,
                          keyboardType: TextInputType.text,
                          /// this code because when user login and write password don,t still to click login button
                          onFieldSubmitted: (value) {
                            if (formKey.currentState!.validate()) {
                              RegisterCubit.get(context).userRegister(
                                email: emailController.text,
                                password: passwordController.text,
                                phone: phoneController.text,
                                userName: nameController.text,
                              );
                            }
                          },
                          suffixIcon: Icons.remove_red_eye,
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        CustomMaterialButton(
                            text: "Register",
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                RegisterCubit.get(context).userRegister(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  phone: phoneController.text,
                                  userName: nameController.text,
                                );
                              }
                            }),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an account? ",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                            const Spacer(),
                            InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const HomeScreen()));
                                },
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
  void showToast(String text,ToastStates state )=> Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0
  );
  Color chooseToastColor(ToastStates state){
    Color color;
    switch(state)
    {
      case ToastStates.SUCCESS:
        color= Colors.green;
        break;
      case ToastStates.ERROR:
        color= Colors.red;
        break;
      case ToastStates.WARNING:
        color= Colors.amber;
        break;
    }
    return color;
  }
}
enum ToastStates{SUCCESS, ERROR, WARNING}
