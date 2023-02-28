import 'package:demo47/screens/login/view/login_page.dart';
import 'package:demo47/screens/registration/controller/registration_controller.dart';
import 'package:demo47/utility/sharePreference.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistationPage extends StatefulWidget {
  const RegistationPage({super.key});

  @override
  State<RegistationPage> createState() => _RegistationPageState();
}

class _RegistationPageState extends State<RegistationPage> {
  RegistrationController registrationController =
      Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: registrationController.formKey,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.lightBlue),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 160, right: 15, left: 15),
                child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height / 1.5,
                  width: MediaQuery.of(context).size.width / 1.1,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Registration",
                          style:
                              GoogleFonts.acme(letterSpacing: .5, fontSize: 30),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                          controller: registrationController.txtRegEmail,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "PLease Enter Your Email";
                            }
                            if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                              return "Please enter a valid email address";
                            } else {
                              return null;
                            }
                          },
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "Enter The Email",
                            hintStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(Icons.email),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            border: new OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              borderSide: new BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              borderSide:
                                  BorderSide(width: 1, color: Colors.grey),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: registrationController.txtRegPassword,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "PLease Enter Your Password";
                            }
                            if (!RegExp(
                                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                .hasMatch(value)) {
                              return "Please enter a valid Password";
                            } else {
                              return null;
                            }
                          },
                          obscureText: true,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: 'Enter Password',
                            hintStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.grey,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            border: new OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              borderSide: new BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              borderSide:
                                  BorderSide(width: 1, color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: registrationController.txtRegRePassword,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "PLease Enter Your Password";
                            }
                            if (!RegExp(
                                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                .hasMatch(value)) {
                              return "Please enter a valid Password";
                            } else {
                              return null;
                            }
                          },
                          obscureText: true,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: 'Enter Re Password',
                            hintStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.grey,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            border: new OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              borderSide: new BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              borderSide:
                                  BorderSide(width: 1, color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 19),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 14.7,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              onPressed: () {
                                if (registrationController.formKey.currentState!
                                    .validate()) {
                                  if (registrationController
                                          .txtRegPassword.text !=
                                      registrationController
                                          .txtRegRePassword.text) {
                                    Fluttertoast.showToast(
                                        msg:
                                            "Password and re password are not same",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.TOP,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.black,
                                        fontSize: 14.0);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        duration: Duration(seconds: 2),
                                        content:
                                            Text("SucessFull Registration !!"),
                                      ),
                                    );
                                    save(
                                        registrationController.txtRegEmail.text,
                                        registrationController
                                            .txtRegPassword.text,
                                        registrationController
                                            .txtRegRePassword.text);
                                    Get.to(
                                      LoginPage(),
                                    );
                                  }
                                }
                              },
                              // onPressed: () {},

                              // onPressed: () async {
                              //   // String? email = await readEmail();
                              //   // String? password = await readPassword();

                              //   if (providerTrue!.formKey.currentState!
                              //       .validate()) {
                              //     if (providerTrue!.login_email.text != email) {
                              //       Fluttertoast.showToast(
                              //           msg: "Email Id Not Same",
                              //           toastLength: Toast.LENGTH_SHORT,
                              //           timeInSecForIosWeb: 1,
                              //           backgroundColor: Style.black,
                              //           textColor: Style.white,
                              //           fontSize: 14.0);
                              //     }

                              //     else if (providerTrue!.login_password.text !=
                              //         password) {
                              //       Fluttertoast.showToast(
                              //           msg: "Password Not Same",
                              //           toastLength: Toast.LENGTH_SHORT,
                              //           timeInSecForIosWeb: 1,
                              //           backgroundColor: Style.black,
                              //           textColor: Style.white,
                              //           fontSize: 14.0);
                              //     } else {
                              //       login();
                              //       bool? checkLogin = await loginCheck();
                              //       print(checkLogin);
                              //       Navigator.pushReplacement(
                              //         context,
                              //         MaterialPageRoute(
                              //           builder: (context) => HomePage(),
                              //         ),
                              //       );
                              //     }

                              //     // Navigator.pushReplacement(
                              //     //   context,
                              //     //   MaterialPageRoute(
                              //     //     builder: (context) => HomePage(),
                              //     //   ),
                              //     // );
                              //   }

                              //   // else if (providerTrue!.login_email.text !=
                              //   //     email) {
                              //   //   Fluttertoast.showToast(
                              //   //       msg: "Email Id Not Same",
                              //   //       toastLength: Toast.LENGTH_SHORT,
                              //   //       timeInSecForIosWeb: 1,
                              //   //       backgroundColor: Style.white,
                              //   //       textColor: Style.black,
                              //   //       fontSize: 14.0);
                              //   // } else if (providerTrue!.login_password.text !=
                              //   //     password) {
                              //   //   Fluttertoast.showToast(
                              //   //       msg: "Password Not Same",
                              //   //       toastLength: Toast.LENGTH_SHORT,
                              //   //       timeInSecForIosWeb: 1,
                              //   //       backgroundColor: Style.white,
                              //   //       textColor: Style.black,
                              //   //       fontSize: 14.0);
                              //   // } else {
                              //   //   Navigator.pushReplacement(
                              //   //     context,
                              //   //     MaterialPageRoute(
                              //   //       builder: (context) => HomePage(),
                              //   //     ),
                              //   //   );
                              //   // }

                              //   //  else if (providerTrue!.formKey.currentState!
                              //   //     .validate()) {
                              //   //   Navigator.pushReplacement(
                              //   //     context,
                              //   //     MaterialPageRoute(
                              //   //       builder: (context) => RegistrationPage(),
                              //   //     ),
                              //   //   );
                              //   // }
                              // },
                              child: Text(
                                "Registration",
                                style: TextStyle(fontSize: 19),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
