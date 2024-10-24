import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/cubit.dart';
import 'package:shop_app/ui/screen/home/home_screen.dart';
import 'package:shop_app/ui/screen/ob_boarding_screen/on_boarding.dart';
import 'package:shop_app/ui/uitlies/shared_preferences.dart';
import 'helper/dio_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init(); // Initialize DioHelper
  await SharedPref.init();

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key, this.onBoarding, this.startWidget});

  final bool? onBoarding;
  final Widget? startWidget;

   @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> ShopCubit()
          ..getHomeData()..getCategories()..getFavorites()
        ..getUserData()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SharedPref.getToken()== null ?OnBoarding(): HomeScreen(),
        // routes: {
        //   OnBoarding.routeName:(_)=>OnBoarding(),
        //   LoginScreen.routeName:(_)=>LoginScreen(),
        //   RegisterScreen.routeName:(_)=>RegisterScreen()
        // },
        // initialRoute: startWidget,
      ),
    );
  }
}