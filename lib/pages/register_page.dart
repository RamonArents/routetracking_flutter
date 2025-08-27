import 'package:flutter/material.dart';
import 'package:routetracking_flutter/data/notifiers.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? menuItem = 'Driver';
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkModeNotifier,
      builder: (context, isDarkMode, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Color(0xFF659bad),
              brightness: isDarkMode ? Brightness.light : Brightness.dark,
            ),
          ),
          home: Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xFF659bad),
              title: Text(
                'Register',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35.0,
                  color: Colors.white,
                ),
              ),
              centerTitle: true,
              leading: BackButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Colors.white,
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    isDarkModeNotifier.value = !isDarkModeNotifier.value;
                  },
                  icon: ValueListenableBuilder(
                    valueListenable: isDarkModeNotifier,
                    builder: (context, isDarkMode, child) {
                      return isDarkMode
                          ? Icon(Icons.dark_mode)
                          : Icon(Icons.light_mode);
                    },
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: EdgeInsets.all(25.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name*:'),
                      SizedBox(height: 5.0),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onEditingComplete: () {
                          setState(() {});
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Name is required';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.0),
                      Text('Surname*:'),
                      SizedBox(height: 5.0),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onEditingComplete: () {
                          setState(() {});
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Surname is required';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.0),
                      Text('Company*:'),
                      SizedBox(height: 5.0),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onEditingComplete: () {
                          setState(() {});
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Company is required';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.0),
                      Text('Role*:'),
                      SizedBox(height: 5.0),
                      DropdownButtonFormField<String>(
                        value: menuItem,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        items: [
                          DropdownMenuItem(
                            value: 'Driver',
                            child: Text('Driver'),
                          ),
                          DropdownMenuItem(
                            value: 'Operator',
                            child: Text('Operator'),
                          ),
                        ],
                        onChanged: (String? value) {
                          setState(() {
                            menuItem = value;
                          });
                        },
                      ),
                      SizedBox(height: 15.0),
                      Text('Phone number*:'),
                      SizedBox(height: 5.0),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onEditingComplete: () {
                          setState(() {});
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Phone number is required';
                          }
                          //Check if phone number is valid
                          if (!RegExp(r'^\+?[0-9]{7,15}$').hasMatch(value)) {
                            return 'Invalid phone number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.0),
                      Text('Email*:'),
                      SizedBox(height: 5.0),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onEditingComplete: () {
                          setState(() {});
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          }
                          //Check if email is valid
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Invalid email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.0),
                      Text('Password*:'),
                      SizedBox(height: 5.0),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),
                        obscureText: _obscurePassword,
                        onEditingComplete: () {
                          setState(() {});
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }
                          if (value.length < 8) {
                            return 'Password must be at least 8 characters long';
                          }
                          if (!RegExp(r'[A-Z]').hasMatch(value)) {
                            return 'Must contain at least one uppercase letter';
                          }
                          if (!RegExp(r'[0-9]').hasMatch(value)) {
                            return 'Must contain at least one number';
                          }
                          if (!RegExp(
                            r'[!@#$%^&*(),.?":{}|<>]',
                          ).hasMatch(value)) {
                            return 'Must contain at least one special character';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 45.0),
                      FilledButton(
                        onPressed: () {
                          //Check if fields are valid
                          if (_formKey.currentState!.validate()) {
                            //TODO: Register functionality
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF659bad),
                          padding: EdgeInsets.symmetric(
                            horizontal: 130.0,
                            vertical: 16.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(10.0),
                          ),
                        ),
                        child: Text('Submit'),
                      ),
                      SizedBox(height: 45.0),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
