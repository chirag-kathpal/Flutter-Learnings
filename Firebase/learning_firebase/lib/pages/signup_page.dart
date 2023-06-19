import 'package:flutter/material.dart';
import 'package:learning_firebase/services/firebase_helper.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text('Sign up using email and password'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: TextField(
                  controller: emailController,
                  onChanged: (value) {
                    emailController.text = value;
                  },
                  decoration: const InputDecoration(
                    hintText: 'example@email.com',
                    labelText: 'Enter your E-mail',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: TextField(
                  controller: passwordController,
                  onChanged: (value) {
                    passwordController.text = value;
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: '********',
                    labelText: 'Enter your Password',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: TextField(
                  controller: nameController,
                  onChanged: (value) {
                    nameController.text = value;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Guest',
                    labelText: 'Enter your Name',
                  ),
                ),
              ),
              isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        if (!isValidForm()) {
                          setState(() {
                            isLoading = false;
                          });
                          return;
                        }
                        final isSaved = await FirebaseHelper.saveUser(
                          email: emailController.text,
                          password: passwordController.text,
                          context: context,
                          name: nameController.text,
                        );
                        print(isSaved);
                        setState(() {
                          isLoading = false;
                        });
                      },
                      child: const Text(
                        'Sign up',
                      ))
            ],
          ),
        ),
      ),
    );
  }

  bool isValidForm() {
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Enter all Fields"),
        ),
      );
      return false;
    }
    if (passwordController.text.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password must be atleast of 8 characters"),
        ),
      );
      return false;
    }
    return true;
  }
}
