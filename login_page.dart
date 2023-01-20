

import 'package:flutter/material.dart';
import 'package:shared_preference/splace_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController editingController = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  var ishiddenemail = true;
  var ishiddenpass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key:_formkey,
          child: Column(
            children: [
              SizedBox(height: 15.h,),
              Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQov-2dYcPgh8dw-LkgyCAmS-Yp1EbHyQ_WFQ&usqp=CAU"),
              SizedBox(height: 5.h,),
              Container(
                height: 55.h,
                width: 100.w,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(topLeft:Radius.circular(30),topRight:Radius.circular(30)),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(

                    children: [
                      Icon(Icons.keyboard_arrow_up_outlined),
                      SizedBox(height: 2.h,),
                      TextFormField(
                        // obscureText: ishiddenemail,
                        controller:editingController,
                        validator: (val){

                          if(val!.isEmpty){
                            return "enter email or phone";
                          }
                          else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(val!)){
                              return "enter valid email";
                          }
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor:Colors.black12,
                          border: OutlineInputBorder(
                           borderRadius:BorderRadius.circular(10),
                          ),
                          hintText: "Enter Email",
                           suffixIcon:IconButton(
                             icon: Icon(ishiddenemail? Icons.manage_accounts_sharp:Icons.add_card,color: Colors.white,),
                             onPressed: (){
                               ishiddenemail=!ishiddenemail;
                               setState(() {

                               });
                             },
                           )
                        ),
                      ),

                      SizedBox(height: 2.h,),

                      TextFormField(
                        obscureText: ishiddenpass,
                        controller:passwordcontroller,
                        validator: (val){
                          if(val!.isEmpty){
                            return "enter pass";
                          }
                          else if (val.length<=1){
                            return "enter 10 cher";
                          }
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor:Colors.black12,
                            border: OutlineInputBorder(
                              borderRadius:BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          hintText: "Enter pasword",
                          suffixIcon: IconButton(
                            icon: Icon(ishiddenpass? Icons.lock:Icons.lock_clock_outlined,color: Colors.white,),
                            onPressed: (){
                              ishiddenpass=!ishiddenpass;
                              setState(() {

                              });
                            },
                          )
                        ),
                      ),

                      SizedBox(height: 1.h,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Forget password?",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                        ],
                      ),

                      SizedBox(height: 2.h,),

                      GestureDetector(
                        onTap: ()async{
                          // final prefs=await SharedPreferences.getInstance();
                          // prefs.setString("name","login");
                          if(_formkey.currentState!.validate()){
                            print("Hello");
                            final prefs=await SharedPreferences.getInstance();
                            prefs.setBool('isLogin',true);
                            // var name;
                            print("${prefs.getBool('isLogin').toString()}");
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                            Get.to(HomePage());
                          }
                        },
                        child: Container(
                          height: 8.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(child: Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),)),
                        ),
                      )

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
