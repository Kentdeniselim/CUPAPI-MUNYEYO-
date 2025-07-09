import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:country_picker/country_picker.dart';
import 'package:praktek2/josh/screen/navigation.dart';
import 'package:praktek2/josh/Provider/login%20provider/signup_provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<SignUpProvider>(context, listen: false).startLoading());
  }

  @override
  Widget build(BuildContext context) {
    final signUp = context.watch<SignUpProvider>();
    final country = signUp.selectedCountry;

    if (signUp.isLoading) {
      return const Scaffold(
        backgroundColor: Colors.white,
        body: _LoadingScreen(),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Sign Up"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text(
                "Create Your Account",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
              const SizedBox(height: 30),
              _buildTextField(
                  "Email",
                  signUp.setEmail,
                  (v) => v == null || v.isEmpty
                      ? "Email is required"
                      : !v.contains('@')
                          ? "Enter a valid email"
                          : null),
              _buildTextField("Username", signUp.setUsername,
                  (v) => v == null || v.isEmpty ? "Username required" : null),
              TextFormField(
                keyboardType: TextInputType.phone,
                onChanged: signUp.setPhone,
                decoration: InputDecoration(
                  labelText:
                      "Phone (${country.flagEmoji} +${country.phoneCode})",
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.flag),
                    onPressed: () => showCountryPicker(
                      context: context,
                      showPhoneCode: true,
                      onSelect: signUp.setCountry,
                    ),
                  ),
                ),
                validator: (v) =>
                    v == null || v.isEmpty ? "Phone is required" : null,
              ),
              const SizedBox(height: 20),
              TextFormField(
                obscureText: _obscurePassword,
                onChanged: signUp.setPassword,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(_obscurePassword
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onPressed: () =>
                        setState(() => _obscurePassword = !_obscurePassword),
                  ),
                ),
                validator: (v) => v == null || v.isEmpty
                    ? "Password required"
                    : v.length < 5
                        ? "Password must be at least 5 characters"
                        : null,
              ),
              const SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                onChanged: signUp.setConfirmPassword,
                decoration: const InputDecoration(
                  labelText: "Confirm Password",
                  border: OutlineInputBorder(),
                ),
                validator: (v) => v == null || v.isEmpty
                    ? "Password required"
                    : v != signUp.password
                        ? "Passwords do not match"
                        : null,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () async {
                  if (signUp.validateForm(_formKey) &&
                      signUp.isPasswordMatch()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Pembuatan akun berhasil"),
                        backgroundColor: Colors.green,
                        duration: Duration(milliseconds: 200),
                      ),
                    );
                    await Future.delayed(const Duration(milliseconds: 200));
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => MainNavigationpro()),
                    );
                  }
                },
                child: const Text("Sign Up",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, Function(String) onChanged,
      String? Function(String?) validator) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        decoration: InputDecoration(
            labelText: label, border: const OutlineInputBorder()),
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}

class _LoadingScreen extends StatelessWidget {
  const _LoadingScreen();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/loading.png', width: 350, height: 350),
          const SizedBox(height: 20),
          const CircularProgressIndicator(color: Colors.green),
          const SizedBox(height: 10),
          const Text("Loading...",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
        ],
      ),
    );
  }
}
