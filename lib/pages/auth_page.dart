import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 250, // Set a specific width for the text fields
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                      
                    ),
                    style: TextStyle(
                      color: Colors.white70,
                    )
                  ),
                ),
                const SizedBox(height: 16.0),
                const SizedBox(
                  width: 250, // Set a specific width for the text fields
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      
                    ),
                    style: TextStyle(
                      color: Colors.white70,
                    )
                  ),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: 150, // Set a specific width for the button
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your login logic here
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor:
                          Colors.blueGrey, // Set a less bright color
                    ),
                    child: const Text('Login'),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
