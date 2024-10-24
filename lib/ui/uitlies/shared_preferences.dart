import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/models/register/register_model.dart';

class SharedPref{
  static late SharedPreferences prefs;
  static Future<void> init()async{
    prefs = await SharedPreferences.getInstance();
  }
  static void saveUser(Data user){
    prefs.setString("user", jsonEncode(user.toJson()));
  }
  static void saveToken(String token){
    prefs.setString("token", token);
  }

  static void saveUserId(int userId){
    prefs.setInt("userId", userId);
  }
  static void saveUserEmail(String email){
    prefs.setString("email", email);
  }

  static Future<Data?> getUser()async{
    String? userAsString= prefs.getString("user");
    if(userAsString==null) return null;
    return Data.fromJson(jsonDecode(userAsString));
  }
  static String? getToken(){
    String?  token =  prefs.getString("token");
    return token;
  }
  static int? getUserId(){
    return prefs.getInt("userId");
  }
  static String? getUserEmail(){
    return prefs.getString("email");
  }
  /// Remove the Token (Logout): When the user logs out, you can remove the token using:
  static Future<void> removeToken() async {
    await prefs.remove('token');
  }
}