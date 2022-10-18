import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:missa/ui/data_layer/widgets/screens/login_screen.dart';
import 'package:missa/ui/presenter_layer/controller/preference_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      title: 'Amissa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor:const Color(0xFFF5F5F5),
      ),
      home: LoginScreen(),
    );
  }
}



class PrefBuilder extends StatelessWidget {

  final Widget Function(BuildContext context,bool authState) builder;

  const PrefBuilder({Key? key,required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PrefsController>(
        init: PrefsController(),
        builder: (controller){
          controller.loadPrefs();
      return builder(context, controller.isAuthenticated.value);
    });
  }
}
