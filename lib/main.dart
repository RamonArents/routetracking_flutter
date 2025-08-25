import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF659bad),
          title: Text(
            'Login',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35.0,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(25.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onEditingComplete: () {
                  setState(() {});
                },
              ),
              SizedBox(height: 15.0),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onEditingComplete: () {
                  setState(() {});
                },
              ),
              SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //TODO: Add dark mode
                  Text('No account?', style: TextStyle(color: Colors.black)),
                  InkWell(
                    onTap: () {
                      //TODO: Go to register page
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.0),
              FilledButton(
                onPressed: () {
                  //TODO: Login functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF659bad),
                  padding: EdgeInsets.symmetric(horizontal: 130.0, vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(10.0),
                  )
                ),
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
