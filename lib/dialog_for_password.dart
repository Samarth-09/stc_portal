import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stc_portal/myroutes.dart';
import 'widget.dart';

class dialog_for_password extends StatefulWidget {
  const dialog_for_password({super.key});
  static bool isCorrect = false;
  static String password = '';
  @override
  State<dialog_for_password> createState() => _dialog_for_passwordSate();
}

class _dialog_for_passwordSate extends State<dialog_for_password> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: AlertDialog(
      elevation: 10,
      actions: [
        TextFormField(
          onChanged: (value) {
            dialog_for_password.password = value;
          },
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(color: widget.p1)),
            icon: Icon(Icons.password_sharp, color: widget.p1),
            hintText: 'Enter Password',
            hintStyle: widget().ts().copyWith(color: widget.p2),
          ),
          obscureText: true,
        ),
        InkWell(
            onTap: () async {
              await FirebaseFirestore.instance
                  .collection('teacher')
                  .doc('password')
                  .get()
                  .then((value) {
                var x = value.data() as Map<String, dynamic>;
                if (dialog_for_password.password == x['password']) {
                  dialog_for_password.isCorrect = true;
                } else {
                  dialog_for_password.isCorrect = false;
                }
              });
              if (dialog_for_password.isCorrect) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.white,
                  //margin: const EdgeInsets.all(10),
                  elevation: 10,
                  content: Text(
                    'Please fill all details',
                    style: widget().ts().copyWith(color: widget.p1),
                  ),
                ));
                await Navigator.pushNamed(context, myroutes.enter_details);
                
                 Navigator.pop(context);
              }
            },
            child: Align(
              alignment: Alignment.center,
              child: Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: widget.p1),
                  child: Text('Sign In',
                      style: widget().ts().copyWith(
                          color: Colors.white, fontSize: width * 0.04))),
            ))
      ],
    ));
  }
}
