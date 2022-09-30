import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zoom_clone/models/home_model.dart';
import 'package:zoom_clone/pages/join_meeting.dart';
import 'package:zoom_clone/pages/sign_in_page.dart';
import 'package:zoom_clone/pages/sign_up_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeTab = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Icon(
                Icons.settings_outlined,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              width: 130,
            ),
            Row(
              children: List.generate(4, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        activeTab = index;
                      });
                    },
                    child: Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: activeTab == index
                              ? Colors.black54
                              : const Color(0xffe4e4ed)),
                    ),
                  ),
                );
              }),
            ),
            const Spacer(),
          ],
        ),
      ),
      body: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          enableInfiniteScroll: true,
          autoPlayCurve: Curves.easeInCubic,
          autoPlayAnimationDuration: Duration(milliseconds: 1000),
            viewportFraction: 0.99,
            height: size.height,
            onPageChanged: (int index, reason) {
              setState(() {
                activeTab = index;
              });
            }),
        items: List.generate(items.length, (index) {
          return Container(
            height: size.height,
            width: size.width,
            child: Column(
              children: [
                Column(
                  children: [
                    Text(items[index]['title'],
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black)),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(items[index]['description'],
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black))
                  ],
                ),
                items[index]['img'] == null
                    ? Container()
                    : Container(
                        width: 280,
                        height: 280,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(items[index]['img']))),
                      )
              ],
            ),
          );
        }),
      ),
      bottomNavigationBar: Container(
        width: size.width,
        height: 200,
        decoration: const BoxDecoration(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => JoinMeeting()));
                  },
                  child: Container(
                    height: 50,
                    width: size.width * 0.75,
                    decoration: BoxDecoration(
                        color: const Color(0xFF0e72ec),
                        borderRadius: BorderRadius.circular(15)),
                    child: const Center(
                      child: Text(
                        "Join a Meeting",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          fullscreenDialog: true,
                          builder: (context) => SignUp()));
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Color(0xFF0e72ec),
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          fullscreenDialog: true,
                          builder: (context) => SignIn()));
                    },
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                          color: Color(0xFF0e72ec),
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
