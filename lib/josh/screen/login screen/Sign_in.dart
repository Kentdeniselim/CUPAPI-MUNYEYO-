import 'package:flutter/material.dart';
import 'package:praktek2/josh/widget/screen/loading_screen.dart';
import 'package:provider/provider.dart';
import 'package:praktek2/josh/Provider/login%20provider/signin_provider.dart';
import 'package:praktek2/josh/screen/navigation.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    Provider.of<SigninProvider>(context, listen: false).startLoading();
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<SigninProvider>(context);

    return auth.isLoading
        ? const LoadingScreen() // ✅ Pakai widget loading
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text("Sign In"),
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Name",
                          border: OutlineInputBorder(),
                        ),
                        onChanged: auth.setName,
                        validator: (value) => value == null || value.isEmpty
                            ? "Name required"
                            : null,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(),
                        ),
                        onChanged: auth.setPassword,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password required";
                          } else if (value.length < 5) {
                            return "Password must be at least 5 characters";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Sign In Success!"),
                                  backgroundColor: Colors.green,
                                ),
                              );
                              Future.delayed(
                                const Duration(milliseconds: 500),
                                () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => MainNavigationpro(),
                                  ),
                                ),
                              );
                            }
                          },
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
