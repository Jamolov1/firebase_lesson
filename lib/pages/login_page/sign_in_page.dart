import 'package:firebase_lesson/pages/login_page/sign_up_page.dart';
import 'package:flutter/material.dart';

import '../../service/auth_service.dart';
import '../main_page/home_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>(); // Form key qo'shildi
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;
  bool isSelected = false;

  void login() {
    if (!_formKey.currentState!.validate()) {
      return; // Agar form invalid bo'lsa, hech narsa qilmaydi
    }

    setState(() {
      isLoading = true;
    });

    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    AuthService.loginUser(email, password).then((value) {
      setState(() {
        isLoading = false;
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) {
            return HomePage();
          },
        ),
      );
    }).catchError((error) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Loginda xatolik: $error')));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey, // Formni formKey bilan bog'lash
            child: Container(
              color: Colors.orange,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.85,
                    child: ListView(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.85,
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
                                          Container(
                                            height: 80,
                                            width: 80,
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
                                              fontSize: MediaQuery.of(
                                                    context,
                                                  ).size.height *
                                                  0.03,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(),
                                    Text(
                                      "Tizimga kirish",
                                      style: TextStyle(
                                        color: Colors.grey.shade800,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),

                                    // Row(
                                    //   children: [
                                    //     Expanded(
                                    //       child: InkWell(
                                    //         onTap: (){},
                                    //         child: Container(
                                    //           margin: EdgeInsets.symmetric(
                                    //             vertical: 20,
                                    //           ),
                                    //           height: 46,
                                    //           decoration: BoxDecoration(
                                    //             color: Color(0xFFF1C623),
                                    //             borderRadius: BorderRadius.circular(
                                    //               15,
                                    //             ),
                                    //           ),
                                    //           child: Center(
                                    //             child: Text(
                                    //               "Email",
                                    //               style: TextStyle(
                                    //                 color: Colors.white,
                                    //                 fontWeight: FontWeight.bold,
                                    //               ),
                                    //             ),
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //     SizedBox(width: 20),
                                    //     Expanded(
                                    //       child: InkWell(
                                    //         onTap: (){
                                    //           setState(() {
                                    //             isSelected = true;
                                    //           });
                                    //         },
                                    //         child: Container(
                                    //           height: 46,
                                    //           decoration: BoxDecoration(
                                    //             color: isSelected ? Color(0xFFF1C623):Colors.white,
                                    //             borderRadius: BorderRadius.circular(
                                    //               15,
                                    //             ),
                                    //             border: Border.all(
                                    //               width: 1.5,
                                    //               color: Color(0xFFF1C623),
                                    //             ),
                                    //           ),
                                    //           child: Center(
                                    //             child: Text(
                                    //               "Phone No",
                                    //               style: TextStyle(
                                    //                 color: Color(0xFFF1C623),
                                    //
                                    //                 fontWeight: FontWeight.bold,
                                    //               ),
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
                                      validator: (email) {
                                        if (email!.contains("@")) {
                                          return null;
                                        } else if (email.isEmpty) {
                                          return "Emailni kiriting";
                                        } else {
                                          return "Emailda @ belgisi yuq";
                                        }
                                      },

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
                                      validator: (password) {
                                        if (password!.length >= 6) {
                                          return null;
                                        } else if (password.isEmpty) {
                                          return "Parolni kiriting";
                                        } else {
                                          return "Kamida 6ta belgidan kam bo'lmasligi kerak";
                                        }
                                      },
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        labelText: "Password",
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        hintText: "Enter Password",
                                      ),
                                    ),

                                    // SignUp havolasi
                                    Padding(
                                      padding:
                                          const EdgeInsets.symmetric(vertical: 10),
                                      child: Row(
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
                                                    return SignUpPage();
                                                  },
                                                ),
                                              );
                                            },
                                            child: Text(
                                              "SignUp",
                                              style: TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Continue tugmasi
                                    InkWell(
                                      onTap: login,
                                      child: isLoading
                                          ? Container(
                                              height: 50,
                                              child: Center(
                                                child: CircularProgressIndicator(),
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
