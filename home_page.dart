import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("shared preference"),
        
        actions: [
          Center(child: GestureDetector(
              onTap:()async{
                final prefs = await SharedPreferences.getInstance();
                await prefs.remove("isLogin");
                // Navigator.push(context,MaterialPageRoute(builder:(context)=>LoginPage()));
                Get.to(LoginPage());
              },
              child: Text("LogOut",style: TextStyle(fontWeight: FontWeight.bold),))),
        ],
      ),
      body :
      ListView.separated(itemBuilder: (context,position){
        return Card(
          child: ListTile(
            leading: Icon(Icons.call),
            title: Row(
              children: [
                // Icon(Icons.call),
                SizedBox(width: 10),
                Text(
                  position.toString(),
                  // 'list $position',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    Text('jgdhsg'),
                    Text('jhsdghd'),
                  ],
                ),

              ],
            ),
          ),
        );
      }, separatorBuilder: (context,position){
        return Card(
          color: Colors.red,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
                'hagsh $position'
            ),
          ),
        );
      }, itemCount: 20),



    );
  }
}
