import 'package:flutter/material.dart';
import 'package:stc_portal/crud.dart';
import 'package:stc_portal/login.dart';
import 'package:stc_portal/student.dart';
//import 'package:stc_portal/myroutes.dart';
import 'package:stc_portal/widget.dart';
import 'package:url_launcher/url_launcher.dart';

class pers_info extends StatefulWidget {
  const pers_info({super.key});

  @override
  State<pers_info> createState() => _pers_infoState();
}

class _pers_infoState extends State<pers_info> {
  

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        //backgroundColor: Colors.white,
        body: Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
            margin: const EdgeInsets.all(10),
            width: width * 0.4,
            height: height * 0.2,
            child: Image.asset(
              'assets/images/logo.png',
            )),
        FutureBuilder(
            future: crud().readStudent(login.id),
            //initialData: InitialData,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                } else if (snapshot.hasData) {
                  student s = snapshot.data as student;
                  return Container(
                      alignment: Alignment.topLeft,
                      width: width * 0.4,
                      height: height * 0.2,
                      child: Text(s.getName(),
                          style: widget().ts().copyWith(
                                color: widget.p1,
                                fontSize: width * 0.08,
                              )));
                }
              }
              return CircularProgressIndicator(color: widget.p1);
            })
      ]),
      Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, height * 0.03),
        child: Divider(
            height: 1, thickness: 2, indent: 5, endIndent: 5, color: widget.p1),
      ),
      Text('Personal Information',
          style:
              widget().ts().copyWith(color: widget.p1, fontSize: width * 0.08)),
      FutureBuilder(
        future: crud().readStudent(login.id),
        //initialData: InitialData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              print(snapshot.error);
            } else if (snapshot.hasData) {
              student s = snapshot.data as student;
              return SizedBox(
                width: width,
                height: height * 0.52,
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    String s1, s2;
                    if (index == 1) {
                      s2 = 'Id';
                      s1 = s.getId();
                    } else if (index == 2) {
                      s2 = 'RollNo';
                      s1 = s.getRollno();
                    } else if (index == 3) {
                      s2 = 'Semester';
                      s1 = s.getSem();
                    } else if (index == 4) {
                      s2 = 'Department';
                      s1 = s.getDept();
                    } else {
                      s2 = 'Email';
                      s1 = s.getEmail();
                    }
                    return Container(
                      padding: EdgeInsets.all(10),
                      margin: const EdgeInsets.fromLTRB(1, 5, 1, 5),
                      child: Card(
                          elevation: 10,
                          child: Container(
                              margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                              width: width,
                              height: height * 0.09,
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(s2,
                                          style: widget().ts().copyWith(
                                              color: widget.p2,
                                              fontSize: width * 0.04)),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(s1,
                                          style: widget().ts().copyWith(
                                              color: widget.p1,
                                              fontSize: width * 0.068,
                                              fontWeight: FontWeight.bold)),
                                    )
                                  ]))),
                    );
                  },
                ),
              );
            }
          }
          return const CircularProgressIndicator();
        },
      ),
      Container(
          margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          decoration: BoxDecoration(
              color: widget.p1,
              shape: BoxShape.rectangle,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20))),
          width: width,
          height: height * 0.12,
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text('Contact Us',
                    style: widget().ts().copyWith(
                        color: Colors.white,
                        fontSize: width * 0.044,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {},
                    child: const CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/LeetCode_logo.png')),
                  ),
                  InkWell(
                    onTap: () async {
                      final Uri url =
                          Uri.parse('https://github.com/Samarth-09');
                      if (!await launchUrl(url)) {
                        throw Exception('Could not launch $url');
                      }
                    },
                    child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage:
                            AssetImage('assets/images/github.jpeg')),
                  )
                ],
              )
            ],
          ))
    ]));
  }
}
