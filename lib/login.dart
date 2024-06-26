import 'package:flutter/material.dart';
//import 'package:flutter_application_1/bottom.dart';
import 'package:flutter_application_1/database/account_repository.dart';
import 'package:flutter_application_1/database/account_singleton.dart';
import 'package:flutter_application_1/language.dart';
//import 'package:flutter_application_1/database/mongo.dart';
import 'package:flutter_application_1/model/account_model.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter_application_1/signup.dart';

class Login_page extends StatefulWidget {
  const Login_page({Key? key}) : super(key: key);

  @override
  _Login_pageState createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  Future<void> _login() async {
    String email = emailController.text;
    String password = passwordController.text;

    final accountRepository = await AccountRepository.create();

    AccountModel? accountModel = await accountRepository.login(email, password);

    setState(() {
      if (accountModel != null) {
        var account = SingletonAccount();
        account.username = accountModel.username;
        account.email = accountModel.email;
        account.password = accountModel.password;

        account.favoritePlaces =
            accountModel.favoritePlaces!.map((e) => e.toString()).toList();
        account.favoriteEvents =
            accountModel.favoriteEvents!.map((e) => e.toString()).toList();

        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LanguagePage()));
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text(
              'Sorry !',
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
            content:
                const Text('Your password or email must be incorrect  '),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    });
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isEmailInvalid = false;
  bool isPasswordInvalid = false;

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenh = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Center(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [Colors.lightGreen, Colors.lightBlue],
            )),
            child: Form(
              child: ListView(
                children: [
                  Container(
                    width: double.infinity,
                    height: screenh / 3,
                    /*decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage("https://t4.ftcdn.net/jpg/01/19/11/55/360_F_119115529_mEnw3lGpLdlDkfLgRcVSbFRuVl6sMDty.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),*/
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(top: 30, left: screenwidth / 3),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 110, left: 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                  child: Icon(
                                CommunityMaterialIcons.airplane_takeoff,
                                size: 100,
                                color: Colors.white,
                              ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Container(
                      child: Column(
                        children: [
                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 20,
                                left: 50,
                                right: 50,
                              ),
                              child: TextFormField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.5),
                                  
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                      color: isEmailInvalid
                                          ? Colors.red
                                          : Color(0xff023e8a),
                                    ),
                                  ),
                                  labelText: 'Email',
                                  labelStyle: TextStyle(
                                    color: isEmailInvalid
                                        ? Colors.red
                                        : Color(0xff023e8a),
                                  ),
                                  errorText: isEmailInvalid
                                      ? 'Write down your email'
                                      : null,
                                ),
                              ),
                            ),
                          ),
                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 20,
                                left: 50,
                                right: 50,
                              ),
                              child: TextFormField(
                                onFieldSubmitted: (value) {
                                  _login();
                                },
                                controller: passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.5),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                      color: isPasswordInvalid
                                          ? Colors.red
                                          : Color(0xff023e8a),
                                    ),
                                  ),
                                  labelText: 'Password',
                                  labelStyle: TextStyle(
                                    color: isPasswordInvalid
                                        ? Colors.red
                                        : Color(0xff023e8a),
                                  ),
                                  errorText: isPasswordInvalid
                                      ? '  Write down your password'
                                      : null,
                                ),
                              ),
                            ),
                          ),
                          //  if (isPasswordInvalid) // Show warning if password is invalid
                          //   const Padding(
                          //     padding: EdgeInsets.only(top: 8),
                          //     child: Text(
                          //       'Password is too simple. Use characters and symbols.',
                          //       style: TextStyle(
                          //         color: Colors.red,
                          //         fontSize: 12,
                          //       ),
                          //     ),
                          //   ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: _login,
                          child: Container(
                            width: screenwidth * 0.5,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Text(
                                "Sign In ",
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignupPage()),
                        );
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            " Sign Up   ",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
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
      ),
    );
  }
}
