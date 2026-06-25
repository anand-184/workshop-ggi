import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workshopggi/Chats.dart';
import 'package:workshopggi/calls.dart';
import 'package:workshopggi/profile.dart';

class Homeappscreen extends StatefulWidget {
  const Homeappscreen({super.key});

  @override
  State<Homeappscreen> createState() => _HomeAppScreenState();
}

class _HomeAppScreenState extends State<Homeappscreen>{
  List<Widget> myScreens = [ChatsScreen(),CallsScreen(), ProfileScreen()] ;
  int current_index = 0 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Appy"),),
      body: myScreens[current_index],
      bottomNavigationBar:
      BottomNavigationBar(onTap:(int index){
        setState(() {
          current_index = index;
        });
      },items:[
        BottomNavigationBarItem(icon:Icon(Icons.call), label: "Calls"),
        BottomNavigationBarItem(icon:Icon(Icons.message), label: "Message"),
        BottomNavigationBarItem(icon:Icon(Icons.person), label: "Person"),

      ]
      )

    );
  }
  
}