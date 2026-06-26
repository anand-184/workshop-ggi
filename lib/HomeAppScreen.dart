import 'package:flutter/material.dart';
import 'package:workshopggi/profile.dart';
import 'package:workshopggi/expense_tracker.dart';

class Homeappscreen extends StatefulWidget {
  const Homeappscreen({super.key});

  @override
  State<Homeappscreen> createState() => _HomeAppScreenState();
}

class _HomeAppScreenState extends State<Homeappscreen>{
  // List of screens for the 3 tabs
  List<Widget> myScreens = [
    const DashboardScreen(), 
    const ExpenseListScreen(), 
    const ProfileScreen()
  ];
  
  int current_index = 0 ;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Expense Tracker"),
        backgroundColor: Colors.blue,
      ),
      body: myScreens[current_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: current_index,
        onTap: (index) {
          setState(() {
            current_index = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Expenses"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
