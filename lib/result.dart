import 'package:flutter/material.dart';
import 'package:stc_portal/crud.dart';
import 'package:stc_portal/login.dart';
//import 'package:stc_portal/signup.dart';
import 'package:stc_portal/student.dart';
import 'package:stc_portal/widget.dart';
import 'package:url_launcher/url_launcher.dart';

class result extends StatefulWidget {
  const result({super.key});
  static var s;
  @override
  State<result> createState() => _resultState();
}

class _resultState extends State<result> {
  late student st;

  var sub = ['sub1', 'sub2', 'sub3', 'sub4', 'sub5', 'sub6'];
  var s =
      'It is an multipurpose application. Where all the data related to a college is stored. Here information of College, Teacher and Student is stored ans displayed with an user friendly interface.';
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
          Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(50)),
                color: widget.p1,
              ),
              padding: EdgeInsets.fromLTRB(0, 0, 0, height * 0.02),
              margin: EdgeInsets.fromLTRB(0, 0, 0, height * 0.05),
              width: width,
              height: height * 0.16,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Result',
                          style: widget().ts().copyWith(
                              color: Colors.white,
                              fontSize: width * 0.08,
                              decoration: TextDecoration.underline)),
                      Text(
                        'Attendance',
                        style: widget().ts().copyWith(
                            color: Colors.white, fontSize: width * 0.058),
                      ),
                    ]),
              )),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Text(
              'Subject Name',
              style: widget()
                  .ts()
                  .copyWith(color: widget.p1, fontSize: width * 0.07),
            ),
            Text('Internal',
                style: widget()
                    .ts()
                    .copyWith(color: widget.p1, fontSize: width * 0.056)),
            Text('External',
                style: widget()
                    .ts()
                    .copyWith(color: widget.p1, fontSize: width * 0.056))
          ]),
          SizedBox(
            width: width,
            height: height * 0.55,
            child: FutureBuilder(
              future: crud().readMarks(login.id),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // If we got an error
                  if (snapshot.hasError) {
                    //print(signup.id);
                    return Center(
                      child: Text(
                        '${snapshot.error} occurred',
                        style: TextStyle(fontSize: 18),
                      ),
                    );
                  } else if (snapshot.hasData) {
                    var s = snapshot.data as Map<String, dynamic>;

                    return ListView.builder(
                      itemCount: sub.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                            elevation: 10,
                            child: SizedBox(
                              width: width,
                              height: height * 0.1,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly, //  srparekh0909@gmail.com // 21ituos013
                                  children: [
                                    Text(
                                      sub[index],
                                      style: widget().ts().copyWith(
                                          color: widget.p1,
                                          fontSize: width * 0.06),
                                    ),
                                    Text(
                                      s[sub[index]],
                                      style: widget().ts().copyWith(
                                          color: widget.p1,
                                          fontSize: width * 0.054),
                                    ),
                                    Text(
                                      s[sub[index]],
                                      style: widget().ts().copyWith(
                                          color: widget.p1,
                                          fontSize: width * 0.054),
                                    )
                                  ]),
                            ));
                      },
                    );
                  }
                }
                return CircularProgressIndicator(color: widget.p1);
              },
            ),
            
          ),
          Expanded(
            child: Container(
                margin: EdgeInsets.fromLTRB(0, height * 0.05, 0, 0),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(50)),
                  color: widget.p1,
                ),
                width: width,
                //height: height * 0.20,
                child: Column(
                  children: [
                    Text('Contact Us',
                        style: widget().ts().copyWith(
                            color: Colors.white,
                            fontSize: width * 0.054,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/LeetCode_logo.png')),
                        InkWell(
                          onTap: () async {
                            final Uri url =
                                Uri.parse('https://github.com/Samarth-09');
                            if (!await launchUrl(url)) {
                              throw Exception('Could not launch $url');
                            }
                          },
                          child: const CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/github.jpeg')),
                        )
                      ],
                    )
                  ],
                )),
          )
        ]));
  }
}
