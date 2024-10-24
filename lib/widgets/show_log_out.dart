import 'package:flutter/material.dart';
import 'package:shop_app/ui/screen/ob_boarding_screen/on_boarding.dart';
import 'package:shop_app/ui/uitlies/shared_preferences.dart';

import '../ui/screen/login/login_screen.dart';

void showLogout(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Logout"),
        content: const Text("Are you sure you want to logout?"),
        actions: <Widget>[
          TextButton(
            child: const Text("Cancel"),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
          TextButton(
            child: const Text("Logout"),
            onPressed: () {
              SharedPref.removeToken();
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const OnBoarding()));
            },
          ),
        ],
      );
    },
  );
}