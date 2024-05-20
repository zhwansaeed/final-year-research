import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/database/account_repository.dart';
import 'package:flutter_application_1/database/duplicate_exception.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/model/account_model.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController password1Controller = TextEditingController();
  TextEditingController password2Controller = TextEditingController();

  Future<void> _signup() async {
    String username = usernameController.text;
    String email = emailController.text;
    String password1 = password1Controller.text;
    String password2 = password2Controller.text;

    if (password1 == password2 && password1.isNotEmpty) {
      try {
        final accountRepository = await AccountRepository.create();

        final AccountModel account = AccountModel(
          username: username,
          email: email,
          password: password1,
        );
        Navigator.pop(context);

        try {
          await accountRepository.insert(account);
        } on DuplicateException catch (e) {
          if (e.field == "username") {
            print("Duplicate username !!!!!");
          } else if (e.field == "email") {
            print("Duplicate email !!!!!");
          }
        }

        accountRepository.close();
      } catch (e) {
        print('Error during signup: $e');
      }
    } else {
      print("Passwords do not match or are empty.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            height: MediaQuery.of(context).size.height - 50,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Column(
                  children: <Widget>[
                    SizedBox(height: 60.0),
                    Text(
                      "  Sign Up",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                          hintText: "UserName ",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none),
                          fillColor: Colors.blueAccent.withOpacity(0.1),
                          filled: true,
                          prefixIcon: const Icon(Icons.person)),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          hintText: "Email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none),
                          fillColor: Colors.blueAccent.withOpacity(0.1),
                          filled: true,
                          prefixIcon: const Icon(Icons.email)),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: password1Controller,
                      decoration: InputDecoration(
                        hintText: "Password  ",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none),
                        fillColor: Colors.blueAccent.withOpacity(0.1),
                        filled: true,
                        prefixIcon: const Icon(Icons.password),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: password2Controller,
                      decoration: InputDecoration(
                        hintText: "  Rewrite password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none),
                        fillColor: Colors.blueAccent.withOpacity(0.1),
                        filled: true,
                        prefixIcon: const Icon(Icons.password),
                      ),
                      obscureText: true,
                    ),
                  ],
                ),
                Container(
                    padding: const EdgeInsets.only(top: 3, left: 3),
                    child: ElevatedButton(
                      onPressed: () {
                        _signup();
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Colors.blueAccent,
                      ),
                    )),
                Container(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "You have un account ",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Login_page(),
                                  ));
                            },
                            child: const Text(
                              " Sign In",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blue),
                            )))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
