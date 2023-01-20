import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preference/home_page.dart';
import 'package:shared_preference/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplaceScreen extends StatefulWidget {
  const SplaceScreen({Key? key}) : super(key: key);

  @override
  State<SplaceScreen> createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen> {
  bool? getStringvalue;

  @override
  void initState() {
    getValue();
    Timer(Duration (seconds:4),() {
      // print("GETVALUE :::: ${getStringvalue}");

      if(getStringvalue==true && getStringvalue !=null) {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => HomePage()));
        Get.to(HomePage());
      }else {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => LoginPage()));
        Get.to(LoginPage());
      }
    });
    // TODO: implement initState
    super.initState();
  }



  getValue()async{
    final prefs = await SharedPreferences.getInstance();
    getStringvalue = prefs.getBool("isLogin");
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
    );
  }
}
