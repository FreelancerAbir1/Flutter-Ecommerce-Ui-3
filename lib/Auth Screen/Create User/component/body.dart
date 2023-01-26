import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../constant.dart';
import '../../Complete Form/complete_form.dart';
import '../../Login Screen/login_screen.dart';
import 'custom_btn.dart';
import 'cutom_text_field.dart';
import 'logo_text.dart';
import 'sign_in_btn.dart';
import 'welcom_buddy_text.dart';
import 'welcome_sub_text.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future createUserWithEmailAndPassword(context) async {
    setState(() {
      onReload = false;
    });
    try {
      if (email.text.isNotEmpty && pass.text == rePass.text) {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text,
          password: pass.text,
        );
        if (credential.user != null) {
          setState(() {
            onReload = true;
          });
          Navigator.of(context).pushReplacementNamed(CompleteForm.route);
        }
      } else if (email.text.isNotEmpty && pass.text != rePass.text) {
        setState(() {
          onReload = true;
        });
        flutterToast(text: 'Password not match');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        setState(() {
          onReload = true;
        });
        flutterToast(text: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        setState(() {
          onReload = true;
        });
        flutterToast(text: 'The account already exists for that email.');
      }
    } catch (e) {
      setState(() {
        onReload = true;
      });
      flutterToast(text: '$e');
    }
  }

  bool onReload = true;
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final TextEditingController rePass = TextEditingController();
  bool obPassword = true;
  bool obRePassword = true;

//! Flutter toast here
  flutterToast({required text}) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: kPrimaryColor,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
//! Global Key
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height / kDefaultPadding,
          ),
          const SignInText(text: 'Sign Up'),
          SizedBox(
            height: size.height / kDefaultPadding,
          ),
          Flexible(
            child: Container(
              height: size.height / 1,
              width: size.width / 1,
              decoration: const BoxDecoration(
                color: kTextLightColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              //! another column for easy design
              child: Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Form(
                  key: _key,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 30.h,
                        ),
                        const WelcomeBuddyText(text: 'Welcome Buddy!'),
                        const WelcomeSubtitle(
                            text: 'Glad to see you back my buddy'),
                        SizedBox(
                          height: 30.h,
                        ),
                        CustomTextFormField(
                          focusNode: focusNode1,
                          onFieldSubmitted: (value) {
                            FocusScope.of(context).requestFocus(focusNode2);
                          },
                          obscureText: false,
                          suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.email,
                              )),
                          onChange: (value) {},
                          keyboardType: TextInputType.emailAddress,
                          controller: email,
                          hintText: 'Enter your email',
                          icon: Icons.email,
                          labelText: 'Email',
                          validate: buildValidate,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomTextFormField(
                            focusNode: focusNode2,
                            onFieldSubmitted: (value) {
                              FocusScope.of(context).requestFocus(focusNode3);
                            },
                            obscureText: obPassword,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    obPassword = !obPassword;
                                  });
                                },
                                icon: obPassword
                                    ? const Icon(
                                        Icons.remove_red_eye,
                                      )
                                    : const Icon(
                                        Icons.remove_red_eye,
                                        color: kPrimaryColor,
                                      )),
                            onChange: (value) {},
                            keyboardType: TextInputType.emailAddress,
                            controller: pass,
                            hintText: 'must use 6 character',
                            icon: Icons.password,
                            labelText: 'password',
                            validate: buildValidate),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomTextFormField(
                            focusNode: focusNode3,
                            onFieldSubmitted: (value) {
                              FocusScope.of(context).unfocus();
                            },
                            obscureText: obRePassword,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    obRePassword = !obRePassword;
                                  });
                                },
                                icon: obRePassword
                                    ? const Icon(
                                        Icons.remove_red_eye,
                                      )
                                    : const Icon(
                                        Icons.remove_red_eye,
                                        color: kPrimaryColor,
                                      )),
                            onChange: (value) {},
                            keyboardType: TextInputType.emailAddress,
                            controller: rePass,
                            hintText: 're-type your pasword',
                            icon: Icons.password,
                            labelText: 'password',
                            validate: buildValidate),
                        SizedBox(
                          height: kDefaultPadding * 5.h,
                        ),
                        CustomButton(
                          text: 'Sign Up',
                          onRelaod: onReload,
                          onPress: () {
                            if (_key.currentState!.validate()) {
                              createUserWithEmailAndPassword(context);
                            }
                          },
                        ),
                        SizedBox(
                          height: kDefaultPadding.h,
                        ),
                        SignInButton(
                          text: 'have an account?',
                          txt: 'Sign In',
                          onPress: () {
                            Navigator.of(context)
                                .pushReplacementNamed(LoginScreen.route);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String? buildValidate(value) {
    if (value == null || value.isEmpty) {
      setState(() {
        onReload = true;
      });
      return 'Please enter some text';
    }
    return null;
  }
}
