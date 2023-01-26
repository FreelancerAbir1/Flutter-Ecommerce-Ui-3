import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommecre_ui3/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../Screen/Home Screen/home_screen.dart';
import 'custom_btn.dart';
import 'custom_form_field.dart';
import 'information_text.dart';
import 'submit_txt.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? currentUser = FirebaseAuth.instance.currentUser;
  List item = ['Male', 'Female'];
  String? items;

  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController birth = TextEditingController();
  final TextEditingController genders = TextEditingController();
  final TextEditingController age = TextEditingController();

  Future sendProfileDataToDb() async {
    setState(() {
      onReload = false;
    });
    final user = FirebaseFirestore.instance.collection('user-profile-data');
    return user.doc(currentUser!.email).set({
      'name': name.text.toString(),
      'phone': phone.text.toString(),
      'birth': birth.text.toString(),
      'gender': items.toString(),
      'age': age.text.toString(),
    }).then((value) {
      setState(() {
        onReload = true;
      });
      Navigator.of(context).pushReplacementNamed(HomeScreen.route);
    });
  }

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

  @override
  void dispose() {
    name.dispose();
    phone.dispose();
    birth.dispose();
    genders.dispose();
    age.dispose();
    super.dispose();
  }

  bool onReload = true;
//! Global Key
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: _key,
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: kDefaultPadding),
                const SubmitText(text: 'Submit the form to continue'),
                const InformationText(
                    text: 'We will not share information with anyone.'),
                const SizedBox(height: kDefaultPadding * 2),
                CustomFormField(
                  controller: name,
                  suffix: const Text(''),
                  hintText: 'Full Name',
                  onChange: (p0) {},
                  validator: buildValidate,
                ),
                SizedBox(height: kDefaultPadding.h),
                CustomFormField(
                  controller: phone,
                  suffix: const Text(''),
                  hintText: 'Phone Number',
                  onChange: (p0) {},
                  validator: buildValidate,
                ),
                SizedBox(height: kDefaultPadding.h),
                buildDatePicker(),
                SizedBox(height: kDefaultPadding.h),
                CustomFormField(
                  controller: genders,
                  suffix: DropdownButton(
                    hint: const Text('Choose'),
                    value: items,
                    items: item
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        items = value as String?;
                      });
                    },
                  ),
                  hintText: items == null ? 'Gender' : items.toString(),
                  onChange: (p0) {},
                  validator: buildValidate,
                ),
                SizedBox(height: kDefaultPadding.h),
                CustomFormField(
                  controller: age,
                  suffix: const Text(''),
                  hintText: 'Age',
                  onChange: (p0) {},
                  validator: buildValidate,
                ),
                const SizedBox(height: kDefaultPadding * 2),
                CustomButton(
                  text: 'Submit',
                  onPress: () {
                    sendProfileDataToDb();
                  },
                  onRelaod: onReload,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  DateTimePicker buildDatePicker() {
    return DateTimePicker(
      type: DateTimePickerType.dateTimeSeparate,
      dateMask: 'd MMM, yyyy',
      initialValue: DateTime.now().toString(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2030),
      icon: const Icon(Icons.event),
      dateLabelText: 'Date',
      timeLabelText: "Hour",
      selectableDayPredicate: (date) {
        if (date.weekday == 6 || date.weekday == 7) {
          return false;
        }
        return true;
      },
      onChanged: (val) => setState(() {
        birth.text = val;
      }),
      validator: buildValidate,
    );
  }

  String? buildValidate(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }
}
