import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
import 'package:stc_portal/myroutes.dart';
//import 'package:stc_portal/widget.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  void fun() async {
    await Future.delayed(const Duration(seconds: 2, milliseconds: 500));
    await Navigator.pushNamed(context, myroutes.login);
    //SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }

  @override
  void initState() {
    super.initState();
    fun();
  }

  @override
  Widget build(BuildContext context)  {
    return Container(
            color: const Color.fromARGB(255, 36, 35, 55),
            child: const   RiveAnimation.asset('assets/images/la.riv'));
  }
}
