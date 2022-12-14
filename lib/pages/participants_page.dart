import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:zoom_clone/models/participants_model.dart';
import 'package:zoom_clone/themes/colors.dart';

class ParticipantsPage extends StatefulWidget {
  const ParticipantsPage({super.key});

  @override
  State<ParticipantsPage> createState() => _ParticipantsPageState();
}

class _ParticipantsPageState extends State<ParticipantsPage> {
  @override
  Widget build(BuildContext context) {
    var participantsCount = participants.length;
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 10),
            child: Text(
              "Close",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue[600]),
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Participants ($participantsCount)",
          style: const TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
      bottomSheet: Container(
        width: size.width,
        height: 55,
        decoration: BoxDecoration(color: Colors.grey[50]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 5),
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xffe4e4ed),
                      borderRadius: BorderRadius.circular(8)),
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      "Invite",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, top: 5),
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xffe4e4ed),
                      borderRadius: BorderRadius.circular(8)),
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      "Mute all",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 70),
        child: Column(
            children: List.generate(participants.length, (index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 38,
                          height: 38,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: AssetImage(participants[index]['img']),
                                  fit: BoxFit.cover)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          participants[index]['name'],
                          style: const TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.mic,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Icon(
                          index == 0 ? Icons.videocam : Icons.videocam_off,
                          color: index == 0 ? Colors.grey : Colors.red,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Divider()
            ],
          );
        })),
      )),
    );
  }
}
