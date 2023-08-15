import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter/screens/home_screen.dart';
import 'package:twitter/widgets/entry_field.dart';
import 'package:twitter/widgets/flat_button.dart';
import '../providers/auth_state.dart';

class SignUp extends StatefulWidget {
  const SignUp({
    super.key,
  });
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Auth auth = Provider.of<Auth>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.blue),
        title: const Text(
          'Sign Up',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        height: MediaQuery.of(context).size.height - 88,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 90,
                width: 90,
                child: Image.network(
                  'http://assets.stickpng.com/images/580b57fcd9996e24bc43c53e.png',
                ),
              ),
              CustomEntryField(
                controller: _nameController,
                hint: 'Enter name',
              ),
              CustomEntryField(
                controller: _emailController,
                hint: 'Enter email',
              ),
              CustomEntryField(
                controller: _passwordController,
                hint: 'Enter password',
                isPassword: true,
              ),
              CustomEntryField(
                controller: _confirmController,
                hint: 'Confirm password',
                isPassword: true,
              ),
              CustomFlatButton(
                fontWeight: FontWeight.bold,
                label: 'Submit',
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      final result = await auth.attemptSignUp(
                        _emailController.text,
                        _nameController.text,
                        _passwordController.text,
                        _confirmController.text,
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: result == Errors.none
                              ? const Text('Account Created!')
                              : result == Errors.weakError
                                  ? const Text(
                                      'The password provided is too weak.')
                                  : result == Errors.matchError
                                      ? const Text('Passwords don’t match')
                                      : result == Errors.existsError
                                          ? const Text(
                                              'An account already exists with that email.')
                                          : const Text(
                                              'Failed to create account! Please try later'),
                          duration: const Duration(seconds: 3),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 16),
                          width: 300,
                          action: SnackBarAction(
                            label: 'Dismiss',
                            onPressed: () {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                            },
                          ),
                        ),
                      );
                    } catch (e) {
                      print(
                          "************* error in signup methods! **************");
                    }
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
