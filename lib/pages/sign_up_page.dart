import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';
import 'package:zoom_clone/pages/home_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    DateTime _selectedDate;
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.grey[50],
          shadowColor: Colors.transparent,
          elevation: 0.5,
          title: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const HomePage()));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 5, top: 5),
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Colors.blue[700], fontSize: 18),
                ),
              )),
        ),
        backgroundColor: Colors.grey[50],
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 150,
              ),
              const Text(
                "For verification , please\n              confirm\n     your date of birth",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shadowColor:
                          MaterialStateProperty.all<Color>(Colors.transparent)),
                  child: const Center(
                      child: Text(
                    "Month/Day/Year",
                    style: TextStyle(color: Colors.grey),
                  )),
                  onPressed: () async {
                    var datePicked = await DatePicker.showSimpleDatePicker(
                      context,
                      initialDate: DateTime(1994),
                      firstDate: DateTime(1960),
                      lastDate: DateTime(2012),
                      dateFormat: "dd-MMMM-yyyy",
                      locale: DateTimePickerLocale.en_us,
                      looping: true,
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "This data will not be stored",
                style: TextStyle(color: Colors.black),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 0.5, color: Colors.grey.withOpacity(0.3)),
                        top: BorderSide(
                            width: 0.5, color: Colors.grey.withOpacity(0.3)))),
                child: const TextField(
                  textAlignVertical: TextAlignVertical.center,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      hintText: "Email Address",
                      hintStyle: TextStyle()),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 0.5, color: Colors.grey.withOpacity(0.3)),
                        top: BorderSide(
                            width: 0.5, color: Colors.grey.withOpacity(0.3)))),
                child: const TextField(
                  obscureText: true,
                  textAlignVertical: TextAlignVertical.center,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      hintText: "Password  ",
                      hintStyle: TextStyle()),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const HomePage()));
                  },
                  child: Container(
                    height: 50,
                    width: size.width * 0.75,
                    decoration: BoxDecoration(
                        color: const Color(0xFF0e72ec),
                        borderRadius: BorderRadius.circular(15)),
                    child: const Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
