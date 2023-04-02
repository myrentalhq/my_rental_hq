import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_rental_hq/create_account_page.dart';
import 'package:my_rental_hq/home_page.dart';
import 'package:my_rental_hq/log_in.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
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

    // Navigate to the homepage
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => RentalHomePage()),
    );
  }

@override
Widget build(BuildContext context) {
  return CupertinoPageScaffold(
    backgroundColor: CupertinoColors.black,
    navigationBar: CupertinoNavigationBar(
      backgroundColor: CupertinoColors.black,
      middle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CupertinoButton(
            onPressed: () {}, // Add the onPressed functionality
            child: const Text(
              'My Rental HQ',
              style: TextStyle(color: CupertinoColors.activeBlue, fontSize: 20),
            ),
            padding: EdgeInsets.zero,
          ),
          CupertinoButton(
            onPressed: () {}, // Add the onPressed functionality
            child: const Text(
              'Home',
              style: TextStyle(color: CupertinoColors.activeBlue),
            ),
            padding: EdgeInsets.zero,
          ),
          CupertinoButton(
            onPressed: () {}, // Add the onPressed functionality
            child: const Text(
              'Services',
              style: TextStyle(color: CupertinoColors.activeBlue),
            ),
            padding: EdgeInsets.zero,
          ),
          CupertinoButton(
            onPressed: () {}, // Add the onPressed functionality
            child: const Text(
              'About',
              style: TextStyle(color: CupertinoColors.activeBlue),
            ),
            padding: EdgeInsets.zero,
          ),
        ],
      ),
      trailing: CupertinoButton(
        onPressed: () {
              Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => LoginScreen()),
              );
        }, // Add the onPressed functionality
        child: const Text(
          'Log In',
          style: TextStyle(color: CupertinoColors.activeBlue),
        ),
        padding: EdgeInsets.zero,
      ),
    ),
    child: SafeArea(
      child: GestureDetector(
        onTap: () {
          // Dismiss the keyboard when tapping outside input fields
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              top: MediaQuery.of(context).padding.top + kMinInteractiveDimensionCupertino,
              child: Image.asset(
                'assets/images/myrentalhq-image.png', // Replace with the path to your image
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ... Rest of the existing code for the login form
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

}
