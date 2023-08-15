import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter/providers/auth_state.dart'; // Import the Auth and AuthError
import 'package:twitter/screens/forgot_password_screen.dart';
import 'package:twitter/screens/home_screen.dart';
import 'package:twitter/screens/signup_screen.dart';
import 'package:twitter/widgets/entry_field.dart';
import 'package:twitter/widgets/flat_button.dart';

class SignIn extends StatefulWidget {
  const SignIn({
    Key? key,
  }) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Auth auth = Provider.of<Auth>(context);

    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 100, left: 20, right: 20, bottom: 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Sign In',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 100,
                width: 100,
                child: Image.network(
                    'https://assets.stickpng.com/images/580b57fcd9996e24bc43c53e.png'),
              ),
              SizedBox(height: 20),
              CustomEntryField(
                controller: _emailController,
                hint: 'Enter email',
              ),
              CustomEntryField(
                controller: _passwordController,
                hint: 'Enter password',
                isPassword: true,
              ),
              const SizedBox(height: 14),
              CustomFlatButton(
                fontWeight: FontWeight.bold,
                label: 'Submit',
                onPressed: () async {
                  try {
                    final result = await auth.attemptLogin(
                      _emailController.text,
                      _passwordController.text,
                    );

                    print('navigated to the home screen seccefully!!!!');
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'noUserError') {
                      _showErrorSnackbar("No user found for that email!");
                    } else if (e.code == 'wrong-password') {
                      _showErrorSnackbar("Wrong password!");
                    } else {
                      _showErrorSnackbar("Failed to Login! Please try later");
                    }
                  } catch (e) {
                    _showErrorSnackbar("Failed to Login! Please try later");
                    print('unknown error  from login $e');
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                  
                },
              ),
              const SizedBox(height: 20),
              CustomFlatButton(
                fontSize: 20,
                label: 'Sign Up',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUp()),
                  );
                },
              ),
              CustomFlatButton(
                fontSize: 20,
                label: 'Forgot Password?',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ForgetPassword()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showErrorSnackbar(String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          errorMessage,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      ),
    );
  }
}
