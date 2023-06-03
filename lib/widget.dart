import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';
import 'package:stc_portal/home.dart';

//import 'myroutes.dart';
class widget {
  static Color p1 = Color.fromARGB(255, 36, 35, 55);
  static Color p2 = Color.fromARGB(255, 43, 41, 74);
  TextStyle ts() {
    return GoogleFonts.getFont('Titillium Web');
  }

  Widget arrow_anmiation(BuildContext context, String s) {
    return Expanded(
      child: InkWell(
          onTap: () async {
            if (home.haveDelatils) {
              await Navigator.pushNamed(context, s);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.white,
                //margin: const EdgeInsets.all(10),
                elevation: 10,
                content: Text(
                  'Please enter the details first',
                  style: widget().ts().copyWith(color: widget.p1),
                ),
              ));
            }
          },
          child: const Align(
            alignment: Alignment.bottomRight,
            child: RiveAnimation.asset('assets/images/arrow.riv'),
          )),
    );
  }
}
