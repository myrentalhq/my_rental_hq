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
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CupertinoPageScaffold(
        backgroundColor: CupertinoColors.black,
        navigationBar: CupertinoNavigationBar(
          backgroundColor: CupertinoColors.black,
          middle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // ... Existing code for the navigation bar
              CupertinoButton(
                onPressed: () {}, // Add the onPressed functionality
                child: const Text(
                  'My Rental HQ',
                  style: TextStyle(
                      color: CupertinoColors.activeBlue, fontSize: 20),
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
            },
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
                  top: MediaQuery.of(context).padding.top +
                      kMinInteractiveDimensionCupertino,
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
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: CupertinoColors.systemGrey5.withOpacity(0.6),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Welcome to My Rental HQ',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                'Your one-stop solution for managing rentals',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 32),
                              CupertinoButton.filled(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => LoginScreen()),
                                  );
                                },
                                child: const Text('Get Started'),
                              ),
                            ],
                          ),
                        ),
                      ],
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
