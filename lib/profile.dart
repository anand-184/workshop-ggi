import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.person, size: 100, color: Colors.blue),
            const SizedBox(height: 20),
            const Text("Name: Anandita", style: TextStyle(fontSize: 22)),
            const Text("College: GGI", style: TextStyle(fontSize: 18, color: Colors.grey)),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Logout"),
            )
          ],
        ),
      ),
    );
  }
}
