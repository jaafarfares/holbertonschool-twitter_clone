import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
                controller: _emailController,
                hint: 'Enter name',
              ),
              CustomEntryField(
                controller: _emailController,
                hint: 'Enter email',
              ),
              CustomEntryField(
                controller: _emailController,
                hint: 'Enter password',
                isPassword: true,
              ),
              CustomEntryField(
                controller: _emailController,
                hint: 'Confirm password',
                isPassword: true,
              ),
              CustomFlatButton(
                fontWeight: FontWeight.bold,
                label: 'Submit',
                onPressed: () async {
                  try {
                    final result = await auth.attemptSignUp(
                        _emailController.text,
                        _nameController.text,
                        _passwordController.text,
                        _confirmController.text);

                    if (result == Errors.none) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Account Created!')));
                    } else if (result == Errors.weakError) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('The password provided is too weak.')));
                    } else if (result == Errors.matchError) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Passwords don’t match')));
                    } else if (result == Errors.existsError) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                              'An account already exists with that email.')));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                              'Failed to create account! Please try later')));
                    }
                  } catch (e) {
                    print(
                        "************* error in umbit methods !  **************");
                  }
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
