import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zoom_clone/pages/home_page.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.grey[50],
          shadowColor: Colors.transparent,
          elevation: 0.5,
          title: Row(
            children: [
              GestureDetector(
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
              const SizedBox(
                width: 100,
              ),
              const Text(
                "Sign In",
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
        ),
        backgroundColor: Colors.grey[100],
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
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
                // onTap: () {
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           fullscreenDialog: true,
                //           builder: (_) => JoinMeetingPage()));
                //   // Navigator.pushReplacement(
                //   //     context, MaterialPageRoute(builder: (_) => RootApp()));
                // },
                child: Container(
                  width: size.width * 0.75,
                  height: 50,
                  decoration: BoxDecoration(
                      color: const Color(0xffe4e4ed),
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[600]),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Forget Password?",
                style: TextStyle(color: Colors.blue[700]),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Text("OR, sign in with"),
                  ),
                ],
              ),
              ListTile(
                onLongPress: () {},
                tileColor: Colors.white,
                leading: IconButton(
                  icon: const Icon(Icons.vpn_key),
                  onPressed: () {},
                ),
                title: const Text(
                  "SSO",
                  style: TextStyle(color: Colors.black),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {},
                ),
              ),
              ListTile(
                tileColor: Colors.white,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SvgPicture.asset(
                    "assets/icons/icons-google.svg",
                    width: 22,
                    height: 22,
                  ),
                ),
                title: const Text(
                  "Google",
                  style: TextStyle(color: Colors.black),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {},
                ),
              ),
              ListTile(
                tileColor: Colors.white,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 13),
                  child: SvgPicture.asset(
                    "assets/icons/facebook-2.svg",
                    width: 22,
                    height: 22,
                  ),
                ),
                title: const Text(
                  "Facebook",
                  style: TextStyle(color: Colors.black),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
