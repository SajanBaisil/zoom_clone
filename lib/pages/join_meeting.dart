import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zoom_clone/pages/home_page.dart';
import 'package:zoom_clone/pages/room_page.dart';
import 'package:zoom_clone/themes/colors.dart';

class JoinMeeting extends StatefulWidget {
  const JoinMeeting({super.key});

  @override
  State<JoinMeeting> createState() => _JoinMeetingState();
}

class _JoinMeetingState extends State<JoinMeeting> {
  bool isSwitchedAudio = false;
  bool isSwitchedVideo = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Row(
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const HomePage()));
                  },
                  child: Text("Cancel",
                      style: TextStyle(
                          color: Colors.blue[700],
                          fontSize: 18,
                          fontWeight: FontWeight.normal))),
              const SizedBox(
                width: 70,
              ),
              const Text(
                "Join a Meeting",
                style: TextStyle(color: Colors.black, fontSize: 18),
              )
            ],
          )),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 50,
            decoration: const BoxDecoration(color: Colors.white),
            child: Row(
              children: [
                Container(
                  width: size.width * 0.1,
                  height: 40,
                ),
                Container(
                  width: size.width * 0.9,
                  child: const Padding(
                    padding: EdgeInsets.only(top: 3),
                    child: TextField(
                      textAlign: TextAlign.center,
                      cursorColor: primary,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Meeting ID",
                          hintStyle: TextStyle(color: Colors.grey),
                          suffixIcon: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.black,
                          )),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            "Join with a personal link name",
            style: TextStyle(color: primary),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            height: 50,
            decoration: const BoxDecoration(color: Colors.white),
            child: Row(
              children: [
                // Container(
                //   width: size.width * 0.3,
                //   height: 40,
                // ),
                Container(
                  width: size.width,
                  child: const Padding(
                    padding: EdgeInsets.only(top: 3),
                    child: TextField(
                      textAlign: TextAlign.center,
                      cursorColor: primary,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Your Name",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => RoomPage()));
            },
            child: Container(
              width: size.width * 0.8,
              height: 50,
              decoration: BoxDecoration(
                  color: const Color(0xffe4e4ed),
                  borderRadius: BorderRadius.circular(15)),
              child: const Center(
                child: Text(
                  "Join",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Text(
              "If you received an invitation link, tab on the link again to join the meeting",
              style: TextStyle(color: Colors.black54, height: 1),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "JOIN OPTIONS",
                style: TextStyle(color: Colors.grey[600], height: 1.3),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            decoration: const BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Don't Connect To Audio",
                    style: TextStyle(
                        color: Colors.black87,
                        height: 1.3,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                  Switch(
                      activeColor: primary,
                      value: isSwitchedAudio,
                      onChanged: (value) {
                        setState(() {
                          isSwitchedAudio = value;
                        });
                      })
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 50,
            decoration: const BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Turn Off My Video",
                    style: TextStyle(
                        color: Colors.black87,
                        height: 1.3,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                  Switch(
                      activeColor: primary,
                      value: isSwitchedVideo,
                      onChanged: (value) {
                        setState(() {
                          isSwitchedVideo = value;
                        });
                      })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
