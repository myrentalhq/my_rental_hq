import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_rental_hq/home_page.dart';
import 'package:my_rental_hq/tenant_page.dart';
import 'package:my_rental_hq/welcome_page_.dart';

class CreateAccountScreen extends StatefulWidget {
  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  bool _isLoading = false;
  String _userType = 'Tenant';

  Future<void> createAccount(String role) async {
    setState(() {
      _isLoading = true;
    });

    // Simulate account creation process (Replace this with your actual account creation implementation)
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isLoading = false;
    });

    if (role == 'Landlord') {
      // Navigate to the landlord screen
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(builder: (context) => LandLordHomePage()),
      );
    } else if (role == 'Tenant') {
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
        backgroundColor: Colors.black,
        child: SafeArea(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Create an Account',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: CupertinoTextField(
                        controller: _fullNameController,
                        keyboardType: TextInputType.text,
                        placeholder: 'Full Name',
                        placeholderStyle:
                            const TextStyle(color: CupertinoColors.systemGrey),
                        style: const TextStyle(color: CupertinoColors.white),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: CupertinoColors.systemGrey),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: CupertinoTextField(
                        controller: _phoneNumberController,
                        keyboardType: TextInputType.phone,
                        placeholder: 'Phone Number',
                        placeholderStyle:
                            const TextStyle(color: CupertinoColors.systemGrey),
                        style: const TextStyle(color: CupertinoColors.white),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: CupertinoColors.systemGrey),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: CupertinoTextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        placeholder: 'Email',
                        placeholderStyle:
                            const TextStyle(color: CupertinoColors.systemGrey),
                        style: const TextStyle(color: CupertinoColors.white),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: CupertinoColors.systemGrey),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: CupertinoTextField(
                        controller: _passwordController,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        placeholder: 'Password',
                        placeholderStyle:
                            const TextStyle(color: CupertinoColors.systemGrey),
                        style: const TextStyle(color: CupertinoColors.white),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: CupertinoColors.systemGrey),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Tenant',
                          style: TextStyle(color: Colors.white),
                        ),
                        Radio<String>(
                          value: 'Tenant',
                          groupValue: _userType,
                          activeColor: Colors.blue,
                          onChanged: (value) {
                            setState(() {
                              _userType = value!;
                            });
                          },
                        ),
                        Text(
                          'Landlord',
                          style: TextStyle(color: Colors.white),
                        ),
                        Radio<String>(
                          value: 'Landlord',
                          groupValue: _userType,
                          activeColor: Colors.blue,
                          onChanged: (value) {
                            setState(() {
                              _userType = value!;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: CupertinoButton.filled(
                        onPressed:
                            _isLoading ? null : () => createAccount(_userType),
                        child: const Text('Create Account'),
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
