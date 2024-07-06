import 'package:flutter/material.dart';
import 'package:myroddee/pages/loginPage.dart';

void main() {
  runApp(const MyRegisterPage());
}

class MyRegisterPage extends StatelessWidget {
  const MyRegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegisterForm(),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool _isButtonDisabled = true;
  bool _formSubmitted = false;

  @override
  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: Opacity(
              opacity: 0.15,
              child: Container(
                width: 500,
                height: 500,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/MainPicRod.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Register',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Text color
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 230),
            child: Form(
              key: _formKey,
              onChanged: () {
                setState(() {
                  _isButtonDisabled = !_formKey.currentState!.validate();
                });
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (_formSubmitted) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        // Basic email validation
                        if (!value.contains('@')) {
                          return 'Enter a valid email address';
                        }
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Email',
                      filled: true,
                      fillColor: Colors.grey[300],
                      contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: usernameController,
                    validator: (value) {
                      if (_formSubmitted) {
                        if (value == null || value.isEmpty) {
                          return 'Username is required';
                        }
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Username',
                      filled: true,
                      fillColor: Colors.grey[300],
                      contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: passwordController,
                    validator: (value) {
                      if (_formSubmitted) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      filled: true,
                      fillColor: Colors.grey[300],
                      contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: confirmPasswordController,
                    validator: (value) {
                      if (_formSubmitted) {
                        if (value == null || value.isEmpty) {
                          return 'Confirm Password is required';
                        }
                        if (value != passwordController.text) {
                          return 'Passwords do not match';
                        }
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      filled: true,
                      fillColor: Colors.grey[300],
                      contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _isButtonDisabled
                          ? null
                          : () {
                              setState(() {
                                _formSubmitted = true; // Enable validation display
                              });
                              // Validate all fields before proceeding
                              if (_formKey.currentState!.validate()) {
                                // Form is valid, proceed with action
                                print('Email: ${emailController.text}');
                                print('Username: ${usernameController.text}');
                                print('Password: ${passwordController.text}');
                                print('Confirm Password: ${confirmPasswordController.text}');
                                Navigator.push(context,MaterialPageRoute(builder: (context)=> const MyLoginPage()));
                              }
                            },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        textStyle: TextStyle(fontSize: 18),
                        backgroundColor: _isButtonDisabled ? Colors.grey : Colors.blue,
                      ),
                      child: const Text(
                        'NEXT',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
