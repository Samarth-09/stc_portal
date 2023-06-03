import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stc_portal/auth.dart';
import 'package:stc_portal/home.dart';
import 'package:stc_portal/myroutes.dart';
import 'package:stc_portal/widget.dart';

class login extends StatefulWidget {
  static String s = '';
  static bool f = false;
  static bool corr = true;
  static String password = '';
  static String email = '';
  static String id = '';
  static bool error_msg = false;
  static bool err = true;
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  var user;
  Future<void> authenticate() async {
    user = auth();
    await user.log_in(login.email, login.password);
  }
  @override
  void initState() {
    super.initState();
    login.id='';
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              alignment: Alignment.bottomCenter,
              width: width,
              height: height * 0.25,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(50)),
                color: widget.p1,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                      onTap: () async {
                        await Navigator.pushNamed(context, myroutes.signup);
                      },
                      child: Text(
                        'Sign Up',
                        style: widget().ts().copyWith(
                            fontSize: width * 0.05, color: Colors.white),
                      )),
                  InkWell(
                      onTap: () async {
                        await Navigator.pushNamed(context, myroutes.login);
                      },
                      child: Text(
                        'Log In',
                        style: widget().ts().copyWith(
                            decoration: TextDecoration.underline,
                            fontSize: width * 0.07,
                            color: Colors.white),
                      )),
                ],
              ),
            ),
            Text('Welcome ${login.s}!',
                style: widget().ts().copyWith(
                    color: widget.p2,
                    fontSize: width * 0.07,
                    fontWeight: FontWeight.bold)),
            Card(
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: ((value) {
                  if (value!.isEmpty) {
                    return "Please enter the email id";
                  }
                  return null;
                }),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(color: widget.p1)),
                  icon: const Icon(Icons.email_outlined,
                      color: Color.fromARGB(255, 43, 41, 74)),
                  hintText: 'Enter Email Id',
                  hintStyle: widget().ts().copyWith(color: widget.p2),
                ),
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  setState(() {
                    login.s = value;
                    login.email = value;
                    //print(s);
                  });
                },
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Expanded(
                      child: Divider(
                          color: Color.fromARGB(255, 43, 41, 74),
                          height: 1,
                          thickness: 1,
                          endIndent: 5,
                          indent: 30)),
                  Text('Also Enter',
                      style: widget().ts().copyWith(
                          color: const Color.fromARGB(255, 43, 41, 74),
                          fontSize: width * 0.045)),
                  const Expanded(
                      child: Divider(
                          color: Color.fromARGB(255, 43, 41, 74),
                          height: 1,
                          thickness: 1,
                          indent: 5,
                          endIndent: 30))
                ]),
            Card(
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: ((value) {
                  if (value!.isEmpty) {
                    return "Plese Enter College Id";
                  }
                  login.id = value;
                  return null;
                }),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(color: widget.p1)),
                  icon: const Icon(Icons.abc_outlined,
                      color: Color.fromARGB(255, 43, 41, 74)),
                  hintText: 'Enter College Id',
                  hintStyle: widget().ts().copyWith(color: widget.p2),
                ),
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  setState(() {
                    login.id = value;
                  });
                },
              ),
            ),
            Card(
              child: TextFormField(
                obscureText: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: ((value) {
                  if (value!.isEmpty) {
                    return "Plese Enter the Password";
                  }
                  return null;
                }),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(color: widget.p1)),
                  icon: const Icon(Icons.password_outlined,
                      color: Color.fromARGB(255, 43, 41, 74)),
                  hintText: 'Enter Password',
                  hintStyle: widget().ts().copyWith(color: widget.p2),
                ),
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  login.password = value;
                },
              ),
            ),
            Row(
              children: [
                Checkbox(
                    activeColor: Colors.white,
                    side: const BorderSide(
                        color: Color.fromARGB(255, 43, 41, 74)),
                    value: login.f,
                    onChanged: (bool? f) {
                      setState(() {
                        print(f);
                        login.f = f!;
                      });
                    },
                    checkColor: widget.p2),
                Text('Remember Password',
                    style: widget().ts().copyWith(color: widget.p2))
              ],
            ),
            Card(
              color: Colors.white70,
              elevation: 5,
              child: InkWell(
                onTap: () async {
                  HapticFeedback.heavyImpact();

                  setState(() {
                    if (login.corr) {
                      login.corr = false;
                    } else {
                      login.corr = true;
                    }
                    //print(login.corr);
                  });
                  //print(login.error_msg);

                  if (login.id == '') {
                    login.err = true;
                  } else {
                    login.err = false;
                  }
                  if (!login.err) {
                    await authenticate();
                    late bool ok;

                    await FirebaseFirestore.instance
                        .collection('student')
                        .doc(login.id)
                        .get()
                        .then((value) {
                      var x = value.data() as Map<String, dynamic>;
                      ok = (x['email'] == login.email) ? true : false;
                    }).onError((error, stackTrace) {
                      ok = false;
                    });

                    if (!login.error_msg && ok) {
                      home.haveDelatils=true;
                      await Future.delayed(const Duration(milliseconds: 500));
                      await Navigator.pushNamed(context, myroutes.home);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.white,
                        //margin: const EdgeInsets.all(10),
                        elevation: 10,
                        content: Text(
                          'Please enter correct details',
                          style: widget().ts().copyWith(color: widget.p1),
                        ),
                      ));
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.white,
                      //margin: const EdgeInsets.all(10),
                      elevation: 10,
                      content: Text(
                        'Please enter correct details',
                        style: widget().ts().copyWith(color: widget.p1),
                      ),
                    ));
                  }
                  login.corr = true;
                  setState(() {});
                },
                child: AnimatedContainer(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: widget.p2,
                        borderRadius: login.corr
                            ? BorderRadius.circular(10)
                            : BorderRadius.circular(30)),
                    duration: const Duration(milliseconds: 500),
                    child: login.corr
                        ? Text('Log In',
                            style: widget().ts().copyWith(
                                color: Colors.white, fontSize: width * 0.052))
                        : const Icon(Icons.check, color: Colors.white)),
              ),
            ),
            Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(50)),
                  color: widget.p1,
                ),
                width: width,
                height: height * 0.1)
          ]),
    );
  }
}
