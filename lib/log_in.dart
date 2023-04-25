import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_rental_hq/create_account_page.dart';
import 'package:my_rental_hq/home_page.dart';
import 'package:my_rental_hq/tenant_page.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;

Future<void> _signInWithEmail() async {
  setState(() {
    _isLoading = true;
  });

  // Simulate sign-in process (Replace this with your actual sign-in implementation)
  await Future.delayed(const Duration(seconds: 2));

  setState(() {
    _isLoading = false;
  });

  // Replace the below condition with the actual check for user role (e.g., fetched from a server)
  bool isLandlord = true; // This should be replaced by the actual role check.

  if (isLandlord) {
    // Navigate to the landlord screen
    Navigator.pushReplacement(
      context,
      CupertinoPageRoute(builder: (context) => LandLordHomePage()),
    );
  } else {
    // Navigate to the tenant screen
    Navigator.pushReplacement(
      context,
      CupertinoPageRoute(builder: (context) => TenantDashboard()),
    );
  }
}

  @override
Widget build(BuildContext context) {
  return Material(
    child: CupertinoPageScaffold(
      backgroundColor: CupertinoColors.black,
      child: SafeArea(
        child: GestureDetector(
          onTap: () {
            // Dismiss the keyboard when tapping outside input fields
            FocusScope.of(context).unfocus();
          },
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Welcome to My Rental HQ',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5, // 50% of screen width
                    child: CupertinoTextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      placeholder: 'Email',
                      placeholderStyle: const TextStyle(color: CupertinoColors.systemGrey),
                      style: const TextStyle(color: CupertinoColors.white),
                      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: CupertinoColors.systemGrey),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5, // 50% of screen width
                    child: CupertinoTextField(
                      controller: _passwordController,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      placeholder: 'Password',
                      placeholderStyle: const TextStyle(color: CupertinoColors.systemGrey),
                      style: const TextStyle(color: CupertinoColors.white),
                      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: CupertinoColors.systemGrey),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5, // 50% of screen width
                    child: CupertinoButton.filled(
                      onPressed: _isLoading ? null : _signInWithEmail,
                      child: const Text('Sign in'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5, // 50% of screen width
                    child: CupertinoButton(
                      onPressed: () {
                          Navigator.push(
                          context,
                          CupertinoPageRoute(builder: (context) => CreateAccountScreen()),
                          );
                      },
                      child: const Text('Create an Account'),
                    ),
                  ),
                  if (_isLoading)
                    const Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child: CupertinoActivityIndicator(),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

}
