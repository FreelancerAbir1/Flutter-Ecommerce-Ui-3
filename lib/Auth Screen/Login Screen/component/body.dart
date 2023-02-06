import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Screen/Home Screen/home_screen.dart';
import '../../../constant.dart';
import '../../Create User/create_user.dart';
import 'custom_btn.dart';
import 'cutom_text_field.dart';
import 'logo_text.dart';
import 'sign_up_btn.dart';
import 'welcom_back_text.dart';
import 'welcome_sub_text.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool obPassword = true;
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  @override
  void dispose() {
    email.dispose();
    pass.dispose();
    focusNode1.dispose();
    focusNode2.dispose();
    super.dispose();
  }

//! Global Key
  final _key = GlobalKey<FormState>();
  bool onReload = true;
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
          const SignInText(text: 'Sign In'),
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
                        const WelcomeBuddyText(text: 'Welcome Back'),
                        const WelcomeSubtitle(
                            text: 'Glad to see you back my buddy'),
                        SizedBox(
                          height: 30.h,
                        ),
                        CustomTextFormField(
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (value) {
                            FocusScope.of(context).requestFocus(focusNode2);
                          },
                          focusNode: focusNode1,
                          obscureText: false,
                          suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.email,
                              )),
                          onChange: (value) {},
                          keyboardType: TextInputType.emailAddress,
                          controller: email,
                          hintText: 'Enter your Email',
                          icon: Icons.email,
                          labelText: 'Email',
                          validate: validateEmail,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomTextFormField(
                          textInputAction: TextInputAction.send,
                          onFieldSubmitted: (value) {
                            FocusScope.of(context).unfocus();
                            if (_key.currentState!.validate()) {
                              signInWithEmailAndPassword(context);
                            } else {
                              setState(() {
                                onReload = true;
                              });
                            }
                          },
                          focusNode: focusNode2,
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
                                      Icons.visibility_off,
                                      color: kPrimaryColor,
                                    )),
                          onChange: (value) {},
                          keyboardType: TextInputType.emailAddress,
                          controller: pass,
                          hintText: 'must use 6 character',
                          icon: Icons.password,
                          labelText: 'password',
                          validate: validatePassword,
                        ),
                        SizedBox(
                          height: kDefaultPadding * 5.h,
                        ),
                        CustomButton(
                          text: 'Sign in',
                          onPress: () {
                            if (_key.currentState!.validate()) {
                              signInWithEmailAndPassword(context);
                            } else {
                              setState(() {
                                onReload = true;
                              });
                            }
                          },
                          onRelaod: onReload,
                        ),
                        SizedBox(
                          height: kDefaultPadding.h,
                        ),
                        SignUpButton(
                          text: 'Don\'t have an account?',
                          txt: 'Sign Up',
                          onPress: () {
                            Navigator.of(context)
                                .pushReplacementNamed(CreateUser.route);
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

  Future signInWithEmailAndPassword(context) async {
    setState(() {
      onReload = false;
    });
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: pass.text,
      );
      if (credential.user != null) {
        flutterToast(text: 'Signin successfully');
        setState(() {
          onReload = true;
        });
        Navigator.of(context).pushReplacementNamed(HomeScreen.route);
        email.clear();
        pass.clear();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        setState(() {
          onReload = true;
        });
        flutterToast(text: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        setState(() {
          onReload = true;
        });
        flutterToast(text: 'Wrong password provided for that user.');
      }
    }
  }
}
