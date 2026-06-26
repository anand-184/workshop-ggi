import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 1. SIMPLE DASHBOARD
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  double total = 0;

  void calculateTotal() async {
    final prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString('my_list');
    if (data != null) {
      List list = jsonDecode(data);
      double sum = 0;
      for (var item in list) {
        sum = sum + double.parse(item['amount'].toString());
      }
      setState(() { total = sum; });
    }
  }

  @override
  Widget build(BuildContext context) {
    calculateTotal(); 
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Text("Hello Anandita!", style: TextStyle(fontSize: 24)),
          const SizedBox(height: 20),
          Card(
            color: Colors.blue,
            child: ListTile(
              title: const Text("Total Money Spent", style: TextStyle(color: Colors.white)),
              trailing: Text("\$$total", style: const TextStyle(color: Colors.white, fontSize: 20)),
            ),
          ),
          const SizedBox(height: 20),
          const Text("Categories", style: TextStyle(fontWeight: FontWeight.bold)),
          const Card(child: ListTile(leading: Icon(Icons.fastfood), title: Text("Food"))),
          const Card(child: ListTile(leading: Icon(Icons.bus_alert), title: Text("Travel"))),
          const Card(child: ListTile(leading: Icon(Icons.book), title: Text("Books"))),
        ],
      ),
    );
  }
}

// 2. SIMPLE EXPENSE LIST
class ExpenseListScreen extends StatefulWidget {
  const ExpenseListScreen({super.key});
  @override
  State<ExpenseListScreen> createState() => _ExpenseListScreenState();
}

class _ExpenseListScreenState extends State<ExpenseListScreen> {
  List expenses = [];
  var nameController = TextEditingController();
  var amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    final prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString('my_list');
    if (data != null) {
      setState(() { expenses = jsonDecode(data); });
    }
  }

  void saveData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('my_list', jsonEncode(expenses));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, i) {
          return ListTile(
            title: Text(expenses[i]['name']),
            subtitle: Text("\$" + expenses[i]['amount'].toString()),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  expenses.removeAt(i);
                  saveData();
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Add Expense"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(controller: nameController, decoration: const InputDecoration(hintText: "What for?")),
                  TextField(controller: amountController, decoration: const InputDecoration(hintText: "How much?")),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      expenses.add({'name': nameController.text, 'amount': amountController.text});
                      saveData();
                    });
                    nameController.clear();
                    amountController.clear();
                    Navigator.pop(context);
                  },
                  child: const Text("Add"),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
