import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Appy"),),
      body: Center(
        child: Column(
          children: [
            Text("Hi User",style: TextStyle(fontSize: 28,fontStyle:  FontStyle.italic),),
            Text("Your chats will be displayed here! ",style: TextStyle(fontSize: 28,fontStyle:  FontStyle.italic),)

          ],
        ),
      ),
    );
  }

}