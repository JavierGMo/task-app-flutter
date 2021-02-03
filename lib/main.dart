import 'package:flutter/material.dart';

import 'package:tasks/src/pages/create_items_page.dart';
import 'package:tasks/src/pages/create_task_page.dart';
import 'package:tasks/src/pages/home_page.dart';
import 'package:tasks/src/pages/profile_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home' : (BuildContext context)=>HomePage(),
        'task' : (BuildContext context)=>CreateTaskPage(),
        'profile' : (BuildContext context)=>ProfilePage(),
        'create' : (BuildContext context)=>CreateItemsPage(),
      },
    );
  }
}