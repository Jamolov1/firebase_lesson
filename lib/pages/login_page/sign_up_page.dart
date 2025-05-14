import 'package:firebase_lesson/pages/login_page/sign_in_page.dart';
import 'package:firebase_lesson/service/shared_pref.dart';
import 'package:flutter/material.dart';


import '../../service/auth_service.dart';
import '../main_page/home_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>(); // Form key qo'shildi
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cfPasswordController = TextEditingController();
  bool isLoading = false;

  void login() {
    if (!_formKey.currentState!.validate()) {
      return; // Agar form invalid bo'lsa, hech narsa qilmaydi
    }

    setState(() {
      isLoading = true;
    });

    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String cfPassword = _cfPasswordController.text.trim();

    AuthService.signUp(email, password, cfPassword)
        .then((value) {
          setState(() {
            isLoading = false;
          });
          SharedPref.storeName(email);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) {
                return HomePage();
              },
            ),
          );
        })
        .catchError((error) {
          setState(() {
            isLoading = false;
          });
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Loginda xatolik: $error')));
        });
  }

  void error() {
    if (_passwordController.text != _cfPasswordController.text) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey, // Formni formKey bilan bog'lash
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.90,
                    child: ListView(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.90,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    // Logo va nom
                                    Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                                          Container(
                                            height: 100,
                                            width: 100,
                                            child: Image.asset(
                                              "assets/splash.png",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Text(
                                            "Taomlar Retsepti",
                                            style: TextStyle(
                                              color: Color(0xFFF1C623),
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  MediaQuery.of(
                                                    context,
                                                  ).size.height *
                                                  0.03,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(),
                                    Text("Ro'yxatdan o'tish", style: TextStyle(
                                      color: Colors.grey.shade800,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,),),

                                    // Row(
                                    //   children: [
                                    //     Expanded(
                                    //       child: Container(
                                    //         margin: EdgeInsets.symmetric(
                                    //           vertical: 20,
                                    //         ),
                                    //         height: 46,
                                    //         decoration: BoxDecoration(
                                    //           color: Color(0xFFF1C623),
                                    //           borderRadius: BorderRadius.circular(
                                    //             15,
                                    //           ),
                                    //         ),
                                    //         child: Center(
                                    //           child: Text(
                                    //             "Email",
                                    //             style: TextStyle(
                                    //               color: Colors.white,
                                    //               fontWeight: FontWeight.bold,
                                    //             ),
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //     SizedBox(width: 20),
                                    //     Expanded(
                                    //       child: Container(
                                    //         height: 46,
                                    //         decoration: BoxDecoration(
                                    //           borderRadius: BorderRadius.circular(
                                    //             15,
                                    //           ),
                                    //           border: Border.all(
                                    //             width: 1.5,
                                    //             color: Color(0xFFF1C623),
                                    //           ),
                                    //         ),
                                    //         child: Center(
                                    //           child: Text(
                                    //             "Phone No",
                                    //             style: TextStyle(
                                    //               color: Color(0xFFF1C623),
                                    //
                                    //               fontWeight: FontWeight.bold,
                                    //             ),
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ],
                                    // ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Text(
                                            "Email",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                    TextFormField(
                                      controller: _emailController,
                                      // Controller qo'shildi
                                      validator:
                                          (email) =>
                                              email!.contains("@")
                                                  ? null
                                                  : "Emailda @ belgisi yuq",
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        labelText: "Email",
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        hintText: "Enter your email",
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Text(
                                            "Password",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                    TextFormField(
                                      controller: _passwordController,
                                      // Controller qo'shildi
                                      validator:
                                          (password) =>
                                              password!.length >= 6
                                                  ? null
                                                  : "Kamida 6ta belgidan kam bo'lmasligi kerak",
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        labelText: "Password",
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        hintText: "Enter Password",
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Text(
                                            "Confirm Password",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                    TextFormField(
                                      controller: _cfPasswordController,
                                      // Controller qo'shildi
                                      validator: (password) {
                                        if (password!.length >= 6) {
                                          return null;
                                        } else {
                                          return "Kamida 6ta belgidan kam bo'lmasligi kerak";
                                        }
                                      },
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        labelText: "Confirm Password",
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        hintText: "Enter Confirm Password",
                                      ),
                                    ),
                                    // SignUp havolasi
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "I accept the terms & Condition",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (_) {
                                                  return SignInPage();
                                                },
                                              ),
                                            );
                                          },
                                          child: Text(
                                            "Login",
                                            style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Continue tugmasi
                                    InkWell(
                                      onTap: login,
                                      child:
                                          isLoading
                                              ? Container(
                                                height: 50,
                                                child: Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                              )
                                              : Container(
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFF1C623),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "Continue",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
