import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Appy"),),
      body: Center(
        child: Column(
          children: [
            Card(
              child: Column(
                children: [
                  Text("My Profile Section ",style: TextStyle(fontSize: 28,fontStyle:  FontStyle.italic),),
                  Text("Name = Anandita ")

                ]



              ),
            )
          ],
        ),
      ),
    );
  }

}