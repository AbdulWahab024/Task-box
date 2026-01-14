

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_box/view/home_screen.dart';

import '../view/login_view.dart';

class SplashServices{
  void isLoggedIn(BuildContext context){
    FirebaseAuth _auth = FirebaseAuth.instance;
    final user = _auth.currentUser;
    if(user != null){
      Timer(Duration(seconds: 3), (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      });
    }
    else{
      Timer(Duration(seconds: 3), (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginView()));
      });
    }
  }
}
