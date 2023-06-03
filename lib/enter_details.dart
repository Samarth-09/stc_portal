import 'package:flutter/material.dart';
import 'package:stc_portal/crud.dart';
import 'package:stc_portal/home.dart';
import 'package:stc_portal/signup.dart';
import 'package:stc_portal/student.dart';
import 'package:stc_portal/widget.dart';
import 'login.dart';

class enter_details extends StatefulWidget {
  const enter_details({super.key});
  static bool corr = true;
  static late String n, e, r, s, i, d;
  static Map<String, dynamic>? mp;

  @override
  State<enter_details> createState() => _enter_detailsState();
}

class _enter_detailsState extends State<enter_details> {
  @override
  // void initState() {
  //   super.initState();
  //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //     content: Text('All field should be filled'),
  //   ));
  // }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(children: [
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(50)),
                color: widget.p1),
            width: width,
            height: height * 0.16,
            padding: const EdgeInsets.all(10),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Text('Enter Details',
                    style: widget().ts().copyWith(
                        color: Colors.white, fontSize: width * 0.08))),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(2, 10, 2, 10),
            width: width,
            height: height * 0.66,
            child: ListView(children: [
              Container(
                margin: const EdgeInsets.fromLTRB(2, 10, 2, 10),
                child: Row(children: [
                  const Icon(Icons.perm_identity),
                  Card(
                      elevation: 10,
                      child: SizedBox(
                        width: width * 0.85,
                        height: height * 0.07,
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: widget.p1),
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: 'Enter the name',
                              hintStyle:
                                  widget().ts().copyWith(color: widget.p1)),
                          keyboardType: TextInputType.name,
                          onChanged: (value) {
                            enter_details.n = value;
                          },
                        ),
                      ))
                ]),
              ),
              Container(
                  margin: const EdgeInsets.fromLTRB(2, 10, 2, 10),
                  child: Row(children: [
                    const Icon(Icons.abc_outlined),
                    Card(
                        elevation: 10,
                        child: SizedBox(
                          width: width * 0.85,
                          height: height * 0.07,
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: widget.p1),
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: 'Enter the College Id',
                                hintStyle:
                                    widget().ts().copyWith(color: widget.p1)),
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              enter_details.i = value;
                              login.id = value;
                            },
                          ),
                        ))
                  ])),
              Container(
                  margin: const EdgeInsets.fromLTRB(2, 10, 2, 10),
                  child: Row(children: [
                    const Icon(Icons.numbers),
                    Card(
                        elevation: 10,
                        child: SizedBox(
                          width: width * 0.85,
                          height: height * 0.07,
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: widget.p1),
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: 'Enter the RollNo',
                                hintStyle:
                                    widget().ts().copyWith(color: widget.p1)),
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              enter_details.r = value;
                            },
                          ),
                        ))
                  ])),
             
              Container(
                  margin: const EdgeInsets.fromLTRB(2, 10, 2, 10),
                  child: Row(children: [
                    const Icon(Icons.numbers),
                    Card(
                        elevation: 10,
                        child: SizedBox(
                          width: width * 0.85,
                          height: height * 0.07,
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: widget.p1),
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: 'Enter the semester',
                                hintStyle:
                                    widget().ts().copyWith(color: widget.p1)),
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              enter_details.s = value;
                            },
                          ),
                        ))
                  ])),
              Container(
                  margin: const EdgeInsets.fromLTRB(2, 10, 2, 10),
                  child: Row(children: [
                    const Icon(Icons.abc_outlined),
                    Card(
                        elevation: 10,
                        child: SizedBox(
                          width: width * 0.85,
                          height: height * 0.07,
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: widget.p1),
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: 'Enter the Department',
                                hintStyle:
                                    widget().ts().copyWith(color: widget.p1)),
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              enter_details.d = value;
                            },
                          ),
                        ))
                  ])),
              Container(
                  margin: const EdgeInsets.fromLTRB(2, 10, 2, 10),
                  child: Row(
                    children: [
                      Expanded(
                          child: Divider(
                              height: 1,
                              thickness: 1,
                              indent: 8,
                              endIndent: 8,
                              color: widget.p1)),
                      Text(
                        'Enter the Marks',
                        style: widget()
                            .ts()
                            .copyWith(color: widget.p1, fontSize: width * 0.05),
                      ),
                      Expanded(
                          child: Divider(
                              height: 1,
                              thickness: 1,
                              indent: 8,
                              endIndent: 8,
                              color: widget.p1))
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      margin: const EdgeInsets.fromLTRB(2, 10, 2, 10),
                      child: Row(children: [
                        const Icon(Icons.password),
                        Card(
                            elevation: 10,
                            child: SizedBox(
                              width: width * 0.3,
                              height: height * 0.05,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: widget.p1),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    hintText: 'Sub1',
                                    hintStyle: widget()
                                        .ts()
                                        .copyWith(color: widget.p1)),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  //var x = <String, dynamic>{'sub1':value};
                                  enter_details.mp = {'sub1': value};
                                },
                              ),
                            ))
                      ])),
                  Container(
                      margin: const EdgeInsets.fromLTRB(2, 10, 2, 10),
                      child: Row(children: [
                        const Icon(Icons.password),
                        Card(
                            elevation: 10,
                            child: SizedBox(
                              width: width * 0.3,
                              height: height * 0.05,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: widget.p1),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    hintText: 'Sub2',
                                    hintStyle: widget()
                                        .ts()
                                        .copyWith(color: widget.p1)),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  enter_details.mp!['sub2'] = value;
                                },
                              ),
                            ))
                      ])),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      margin: const EdgeInsets.fromLTRB(2, 10, 2, 10),
                      child: Row(children: [
                        const Icon(Icons.password),
                        Card(
                            elevation: 10,
                            child: SizedBox(
                              width: width * 0.3,
                              height: height * 0.05,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: widget.p1),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    hintText: 'Sub3',
                                    hintStyle: widget()
                                        .ts()
                                        .copyWith(color: widget.p1)),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  enter_details.mp!['sub3'] = value;
                                },
                              ),
                            ))
                      ])),
                  Container(
                      margin: const EdgeInsets.fromLTRB(2, 10, 2, 10),
                      child: Row(children: [
                        const Icon(Icons.password),
                        Card(
                            elevation: 10,
                            child: SizedBox(
                              width: width * 0.3,
                              height: height * 0.05,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: widget.p1),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    hintText: 'Sub4',
                                    hintStyle: widget()
                                        .ts()
                                        .copyWith(color: widget.p1)),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  enter_details.mp!['sub4'] = value;
                                },
                              ),
                            ))
                      ])),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      margin: const EdgeInsets.fromLTRB(2, 10, 2, 10),
                      child: Row(children: [
                        const Icon(Icons.password),
                        Card(
                            elevation: 10,
                            child: SizedBox(
                              width: width * 0.3,
                              height: height * 0.05,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: widget.p1),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    hintText: 'Sub5',
                                    hintStyle: widget()
                                        .ts()
                                        .copyWith(color: widget.p1)),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  enter_details.mp!['sub5'] = value;
                                },
                              ),
                            ))
                      ])),
                  Container(
                      margin: const EdgeInsets.fromLTRB(2, 10, 2, 10),
                      child: Row(children: [
                        const Icon(Icons.password),
                        Card(
                            elevation: 10,
                            child: SizedBox(
                              width: width * 0.3,
                              height: height * 0.05,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: widget.p1),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    hintText: 'Sub6',
                                    hintStyle: widget()
                                        .ts()
                                        .copyWith(color: widget.p1)),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  enter_details.mp!['sub6'] = value;
                                },
                              ),
                            ))
                      ])),
                ],
              ),
              Container(
                  margin: const EdgeInsets.fromLTRB(2, 10, 2, 10),
                  child: Row(children: [
                    const Icon(Icons.password_outlined),
                    Card(
                        elevation: 10,
                        child: SizedBox(
                          width: width * 0.85,
                          height: height * 0.07,
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: widget.p1),
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: 'Enter the password',
                                hintStyle:
                                    widget().ts().copyWith(color: widget.p1)),
                            keyboardType: TextInputType.text,
                          ),
                        ))
                  ]))
            ]),
          ),
          Container(
            width: width,
            height: height * 0.145,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(50)),
                color: widget.p1),
            child: Container(
              width: width * 0.2,
              height: height * 0.06,
              alignment: Alignment.center,
              child: InkWell(
                onTap: () async {
                  student s = student(
                      name: enter_details.n,
                      email: signup.email,
                      marks: enter_details.mp!,
                      id: enter_details.i,
                      dept: enter_details.d,
                      sem: enter_details.s,
                      rollno: enter_details.r);
                  //sprint(enter_details.s);
                  crud().insertStudent(s);
                  setState(()  {
                    if (enter_details.corr) {
                      enter_details.corr = false;
                    } else {
                      enter_details.corr = true;
                    }
                  });
                  home.haveDelatils = true;
                  await Future.delayed(Duration(seconds: 1));
                   Navigator.pop(context);
                },
                child: AnimatedContainer(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: enter_details.corr
                            ? BorderRadius.circular(10)
                            : BorderRadius.circular(30)),
                    duration: const Duration(milliseconds: 500),
                    child: enter_details.corr
                        ? Text('Submit',
                            style: widget().ts().copyWith(
                                color: widget.p1,
                                fontSize: width * 0.052,
                                fontWeight: FontWeight.bold))
                        : Icon(Icons.check, color: widget.p1)),
              ),
            ),
          )
        ]));
  }
}
