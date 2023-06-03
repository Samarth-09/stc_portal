import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stc_portal/home.dart';
import 'package:stc_portal/widget.dart';
import 'package:stc_portal/myroutes.dart';
import 'auth.dart';
import 'login.dart';

class signup extends StatefulWidget {
  static String s = '';
  static bool f = false;
  static bool corr = true;
  static String password = '';
  static String email = '';
  static String id = '';
  static bool error_msg = false;
  //static bool err = true;
  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  var user;
  Future<void> authenticate() async {
    user = auth();
    await user.register(signup.email, signup.password);
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
                            fontSize: width * 0.07,
                            color: Colors.white,
                            decoration: TextDecoration.underline),
                      )),
                  InkWell(
                      onTap: () async {
                        await Navigator.pushNamed(context, myroutes.login);
                      },
                      child: Text(
                        'Log In',
                        style: widget().ts().copyWith(
                            fontSize: width * 0.05, color: Colors.white),
                      )),
                ],
              ),
            ),
            Text('Hello ${signup.s}!',
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
                    signup.s = value;
                    signup.email = value;
                    //print(s);
                  });
                },
              ),
            ),
            // Card(
            //   child: TextFormField(
            //     autovalidateMode: AutovalidateMode.onUserInteraction,
            //     validator: ((value) {
            //       if (value!.isEmpty) {
            //         return "Plese Enter the College Id";
            //       }
            //       signup.id = value;
            //       return null;
            //     }),
            //     decoration: InputDecoration(
            //       border: const OutlineInputBorder(),
            //       focusedBorder: OutlineInputBorder(
            //           borderRadius: BorderRadius.all(Radius.circular(15)),
            //           borderSide: BorderSide(color: widget.p1)),
            //       icon: const Icon(Icons.abc_outlined,
            //           color: Color.fromARGB(255, 43, 41, 74)),
            //       hintText: 'Enter College Id',
            //       hintStyle: widget().ts().copyWith(color: widget.p2),
            //     ),
            //     keyboardType: TextInputType.text,
            //     onChanged: (value) {
            //       setState(() {
            //         //print(value);
            //         signup.id=value;
            //       });
            //       },
            //   ),
            // ),
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
                  setState(() {
                    signup.password = value;
                  });
                  
                },
              ),
            ),
            Row(
              children: [
                Checkbox(
                    activeColor: Colors.white,
                    side: const BorderSide(
                        color: Color.fromARGB(255, 43, 41, 74)),
                    value: signup.f,
                    onChanged: (bool? f) {
                      setState(() {
                        print(f);
                        signup.f = f!;
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
                    if (signup.corr) {
                      signup.corr = false;
                    } else {
                      signup.corr = true;
                    }
                  });
                  print(signup.id);
                  // if (signup.id == '') {
                  //   signup.err = true;
                  // } else {
                  //   signup.err = false;
                  // }
                  // if (!signup.err) {
                    await authenticate();
                    if (!signup.error_msg) {
                      home.haveDelatils=false;
                      login.id=signup.id;
                      await Future.delayed(const Duration(milliseconds: 500));
                      await Navigator.pushNamed(context, myroutes.home);
                    //}
                  }
                  signup.corr = true;
                  setState(() {});
                },
                child: AnimatedContainer(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: widget.p2,
                        borderRadius: signup.corr
                            ? BorderRadius.circular(10)
                            : BorderRadius.circular(30)),
                    duration: const Duration(milliseconds: 500),
                    child: signup.corr
                        ? Text('Sign Up',
                            style: widget().ts().copyWith(
                                color: Colors.white, fontSize: width * 0.052))
                        : const Icon(Icons.check, color: Colors.white)),
              ),
            ),
            Container(
              width: width,
              height: height * 0.1,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(50)),
                color: widget.p1,
              ),
            )
          ]),
    );
  }
}
