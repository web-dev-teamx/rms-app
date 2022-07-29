import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sv_rms_mobile/main.dart';
import 'package:sv_rms_mobile/services/base_services.dart';
import 'package:sv_rms_mobile/ui/authentication/profile_setup/multi_step_form.dart';

import 'package:http/http.dart' as http;
import 'package:sv_rms_mobile/utils/app_theme.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String route = "signin";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  Map<String, dynamic> loginForm = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(244, 247, 254, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Center(
              child: Text(
                "Log In",
                style: TextStyle(fontSize: 18),
              ),
            ),
            const Text("Enter your login details to\n    access your account",
                style: TextStyle(fontSize: 16)),
            const SizedBox(height: 110),
            Form(
              key: _formkey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: SizedBox(
                      height: 70,
                      child: Material(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          child: TextField(
                            onChanged: (value) {
                              loginForm['username'] = value;
                            },
                            decoration: const InputDecoration(
                              hintText: "Your Email Here",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Divider(
                      height: 2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: SizedBox(
                      height: 70,
                      child: Material(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(16.0),
                          bottomRight: Radius.circular(16.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          child: TextField(
                            obscureText: true,
                            onChanged: (value) {
                              loginForm['password'] = value;
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Your Pass Here",
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.lock),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 8.0),
              child: ElevatedButton(
                onPressed: () async {
                  if (_formkey.currentState!.validate()) {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return const AlertDialog(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          content: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      },
                    );
                    loginForm['auth_token'] = authToken;
                    try {
                      await http
                          .post(Uri.parse("${baseURL}process_login.php"),
                              body: loginForm)
                          .then((response) {
                        if (jsonDecode(response.body)['code'] == 200) {
                          Navigator.of(context).pop();
                          var userDetails =
                              jsonDecode(response.body)['user_detail'];

                          if (userDetails['approved'] == '0') {
                            prefs?.setString(
                                'city_country_lat', userDetails['lat']);
                            prefs?.setString(
                                'city_country_lng', userDetails['lng']);
                            prefs?.setString('city', userDetails['city']);
                            prefs?.setString('country', userDetails['country']);
                            prefs?.setString(
                                'city_country',
                                userDetails['city'] +
                                    ', ' +
                                    userDetails['country']);
                            prefs?.setString('contact_number_primary',
                                userDetails['contact_number_primary']);
                            prefs?.setString(
                                'email_address', userDetails['email_address']);
                            prefs?.setString(
                                'first_name', userDetails['first_name']);
                            prefs?.setString(
                                'last_name', userDetails['last_name']);
                            prefs?.setString(
                                'vendor_type', userDetails['vendor_type_id']);
                            prefs?.setInt('user_id', int.parse(userDetails['id']));
                            showModalBottomSheet(
                              isScrollControlled: true,
                              isDismissible: false,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (BuildContext context) => Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.9,
                                clipBehavior: Clip.hardEdge,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25.0),
                                    topRight: Radius.circular(25.0),
                                  ),
                                ),
                                child: const MultiStepForm(),
                              ),
                            );
                          }
                        } else if (jsonDecode(response.body)['code'] == 1) {
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('Invaild user details'),
                              backgroundColor: AppTheme.primaryColor,
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        }
                      });
                    } catch (e) {
                      if (kDebugMode) {
                        print(e.toString());
                      }
                    }
                  }
                },
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.all(15),
                  ),
                  minimumSize: MaterialStateProperty.all(
                    Size(MediaQuery.of(context).size.width, 50),
                  ),
                ),
                child: const Text('Sign In'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an Account?"),
                CupertinoButton(
                  child: const Text("Sign Up"),
                  onPressed: () {
                    Navigator.pushNamed(context, SignupScreen.route);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
