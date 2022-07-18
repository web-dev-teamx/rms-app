import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sv_rms_mobile/ui/authentication/profile_setup/multi_step_form.dart';

import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String route = "signin";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    emailController.text = 'mkashifali541@gmail.com';
    passwordController.text = 'asdf1234';
    super.initState();
  }

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
            )),
            const Text("Enter your login details to\n    access your account",
                style: TextStyle(fontSize: 16)),
            const SizedBox(height: 110),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SizedBox(
                height: 70,
                child: Material(
                  //color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: TextField(
                      controller: emailController,
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
                  // color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16.0),
                    bottomRight: Radius.circular(16.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
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
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    child: CupertinoButton.filled(
                      child: const Text("SIGN-IN"),
                      onPressed: () {
                        // Navigator.pushReplacementNamed(
                        //   context,
                        //   HomeScreen.route,
                        // );
                        // login(
                        //   emailController.text,
                        //   passwordController.text,
                        // ).then((value) {
                        //   Navigator.pushReplacementNamed(
                        //     context,
                        //     HomeScreen.route,
                        //   );
                        // }).catchError((err) {
                        //   if (kDebugMode) {
                        //     print(err);
                        //   }
                        // });
                        showModalBottomSheet(
                          isScrollControlled: true,
                          isDismissible: false,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (BuildContext context) => Container(
                            height: MediaQuery.of(context).size.height * 0.9,
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
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Dont Have An Account?"),
                CupertinoButton(
                  child: const Text("Sign-Up"),
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
