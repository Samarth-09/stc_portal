import 'package:flutter/material.dart';
import 'package:stc_portal/enter_details.dart';
import 'package:stc_portal/myroutes.dart';
import 'package:stc_portal/widget.dart';
import 'package:url_launcher/url_launcher.dart';

class home extends StatefulWidget {
  const home({super.key});
  static bool haveDelatils = false;
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var t = ['Personal Info', 'Result', 'Fee Voucher', 'Enter Details'];
    var s =
        'It is an multipurpose application. Where all the data related to a college is stored. Here information of College, Teacher and Student is stored ans displayed with an user friendly interface.';
    return Scaffold(
      //backgroundColor: Colors.white,
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.all(10),
                width: width * 0.4,
                height: height * 0.2,
                child: Image.asset(
                  'assets/images/logo.png',
                )),
            Container(
              alignment: Alignment.centerLeft,
              width: width * 0.5,
              height: height * 0.2,
              child: Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  // mainAxisSize: main,
                  children: [
                    Text('Student',
                        //textAlign: TextAlign.left,
                        style: widget().ts().copyWith(
                            color: widget.p1,
                            fontSize: width * 0.12,
                            fontWeight: FontWeight.bold)),
                    Text('Portal',
                        //textAlign: TextAlign.left,
                        style: widget().ts().copyWith(
                            color: widget.p1,
                            fontSize: width * 0.12,
                            fontWeight: FontWeight.bold))
                  ]),
            )
          ],
        ),
        Divider(
            height: 1, thickness: 2, indent: 5, endIndent: 5, color: widget.p1),
        Padding(
          padding: EdgeInsets.all(width * 0.03),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Card(
                  shadowColor: widget.p1,
                  elevation: 15,
                  child: Container(
                    width: width * 0.32,
                    height: height * 0.15,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5),
                      //border: Border.all(color: widget.p1)
                    ),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(t[0],
                            textAlign: TextAlign.center,
                            style: widget().ts().copyWith(
                                color: widget.p1,
                                fontSize: width * 0.058,
                                fontWeight: FontWeight.bold)),
                        Expanded(
                            child: Align(
                                alignment: Alignment.bottomRight,
                                child: IconButton(
                                  onPressed: () async {
                                    if (home.haveDelatils) {
                                      await Navigator.pushNamed(
                                          context, myroutes.pers_info);
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        backgroundColor: Colors.white,
                                        //margin: const EdgeInsets.all(10),
                                        elevation: 10,
                                        content: Text(
                                          'Please enter the details first',
                                          style: widget()
                                              .ts()
                                              .copyWith(color: widget.p1),
                                        ),
                                      ));
                                    }
                                  },
                                  icon: const Icon(Icons.arrow_forward),
                                )))
                      ],
                    ),
                  ),
                ),
                Card(
                  shadowColor: widget.p1, //abc@gmail.com
                  elevation: 15,
                  child: Container(
                    width: width * 0.32,
                    height: height * 0.15,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5),
                      //border: Border.all(color: widget.p1)
                    ),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(t[1],
                            textAlign: TextAlign.center,
                            style: widget().ts().copyWith(
                                color: widget.p1,
                                fontSize: width * 0.058,
                                fontWeight: FontWeight.bold)),
                        widget().arrow_anmiation(context, myroutes.result)
                      ],
                    ),
                  ),
                ),
              ]),
        ),
        Padding(
          padding: EdgeInsets.all(width * 0.03),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Card(
                  shadowColor: widget.p1,
                  elevation: 15,
                  child: Container(
                    width: width * 0.32,
                    height: height * 0.15,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5),
                      //border: Border.all(color: widget.p1)
                    ),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(t[2],
                            textAlign: TextAlign.center,
                            style: widget().ts().copyWith(
                                color: widget.p1,
                                fontSize: width * 0.058,
                                fontWeight: FontWeight.bold)),
                        Expanded(
                            child: Align(
                                alignment: Alignment.bottomRight,
                                child: IconButton(
                                  onPressed: null,
                                  icon: Icon(
                                    Icons.arrow_forward,
                                    color: widget.p1,
                                  ),
                                )))
                      ],
                    ),
                  ),
                ),
                Card(
                  shadowColor: widget.p1,
                  elevation: 15,
                  child: Container(
                    width: width * 0.32,
                    height: height * 0.15,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5),
                      //border: Border.all(color: widget.p1)
                    ),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(t[3],
                            textAlign: TextAlign.center,
                            style: widget().ts().copyWith(
                                color: widget.p1,
                                fontSize: width * 0.058,
                                fontWeight: FontWeight.bold)),
                        Expanded(
                            child: Align(
                                alignment: Alignment.bottomRight,
                                child: IconButton(
                                  onPressed: () async {
                                    
                                    enter_details.corr = true;
                                    await Navigator.pushNamed(
                                        context, myroutes.dialog_for_password);
                                        
                                  },
                                  icon: Icon(
                                    Icons.arrow_forward,
                                    color: widget.p1,
                                  ),
                                )))
                      ],
                    ),
                  ),
                ),
              ]),
        ),
        Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20)),
                color: widget.p1),
            width: width,
            height: height * 0.30,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('About Us',
                      style: widget().ts().copyWith(
                          color: Colors.white,
                          fontSize: width * 0.050,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline)),
                ),
                Text(s,
                    style: widget()
                        .ts()
                        .copyWith(color: Colors.white, fontSize: width * 0.04)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Contact Us',
                      style: widget().ts().copyWith(
                          color: Colors.white,
                          fontSize: width * 0.05,
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
                          backgroundImage:
                              AssetImage('assets/images/github.jpeg')),
                    )
                  ],
                )
              ],
            ))
      ]),
    );
  }
}
