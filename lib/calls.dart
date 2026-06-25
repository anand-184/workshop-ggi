import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CallsScreen extends StatefulWidget {
  const CallsScreen({super.key});

  @override
  State<CallsScreen> createState() => _CallsScreenState();
}

class _CallsScreenState extends State<CallsScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Appy"),),
      body: Center(
        child: Column(
          children: [
            Text("Hi User",style: TextStyle(fontSize: 28,fontStyle:  FontStyle.italic),),
            Text("Your calls will be displayed here! ",style: TextStyle(fontSize: 28,fontStyle:  FontStyle.italic),)

          ],
        ),
      ),
    );
  }

}