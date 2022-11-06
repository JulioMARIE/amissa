import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:missa/common/utils.dart';
import 'package:missa/ui/data_layer/widgets/components/simple_icons.dart';
import 'package:missa/ui/data_layer/widgets/screens/home_page.dart';

import 'package:missa/ui/data_layer/widgets/screens/register.dart';
import 'package:missa/ui/domain_layer/models/user.dart';
import 'package:missa/ui/presenter_layer/controller/auth_controller.dart';

import '../../../presenter_layer/controller/user_controller.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

   bool isLoading = false;

     final AuthController authController = Get.put(AuthController());


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var backGroundColor = accentColor;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: size.width,
                  height: size.height * 0.16,
                  color: backGroundColor,
                  child: Container(
                    width: size.width,
                    height: size.height * 0.16,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular((size.height * 0.2) / 2),
                        )),
                  ),
                ),
                SizedBox(
                  width: size.width,
                  height: size.height * 0.72,
                  child: Stack(children: [
                    Positioned(
                        top: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: SizedBox(
                          width: size.width,
                          height: size.height * 0.15,
                          child: Row(children: [
                            Flexible(
                              flex: 2,
                              child: Container(
                                  height: size.height * 0.15,
                                  color: Colors.white),
                            ),
                            Flexible(flex: 2, child: Container()),
                          ]),
                        )),
                    Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: SizedBox(
                          width: size.width,
                          height: size.height * 0.1,
                          child: Row(children: [
                            Flexible(flex: 2, child: Container()),
                            Flexible(
                                flex: 2,
                                child: Container(
                                    height: size.height * 0.1,
                                    color: Colors.white)),
                          ]),
                        )),
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          color: backGroundColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(60.0),
                            bottomRight: Radius.circular(40.0),
                          ),
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Spacer(),
                              Container(
                                width: size.width / 3,
                                height: size.height / 6,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 20.0),
                              const Text(
                                "Amissa",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(height: 30.0),
                              textEditing(size, usernameController, "Email",false, (String? str){
                                  if(str!.isEmpty){
                                  return "Ce champ est obligatoire";
                                 }else{
                                   return null;
                                 }
                              }),
                              const SizedBox(height: 30.0),
                              textEditing(
                                  size, passwordController, "Mot de passe",true, (String? str){
                                if(str!.isEmpty){
                                  return "Ce champ est obligatoire";
                                 }else{
                                   return null;
                                 }
                              }),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: const Text(
                                      "Mot de passe oublié?",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15.0),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                width: size.width,
                                height: 3.0,
                                color: Colors.white,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 50.0),
                              ),
                              const Spacer(),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Opacity(
                                  opacity: 0.9,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      fixedSize: MaterialStateProperty.all(Size(
                                          size.width * 0.4,
                                          size.width > 500.0
                                              ? size.height * 0.14
                                              : size.height * 0.07)),
                                      elevation: MaterialStateProperty.all(4.0),
                                      backgroundColor:
                                          MaterialStateProperty.all(Colors.blue),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const HomePage()), (route) => false);
                                      /*  if(isLoading){
                                        return;
                                    }
                                    if(_formKey.currentState!.validate()){
                                      isLoading = true;
                                      setState(() {
                                      });
                                       onLogin();
                                    }*/
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 50.0,
                                      child:  Center(
                                        child: !isLoading ?  const Text(
                                          "Connexion",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0),
                                        ): const SizedBox(
                                        width: 35.0,
                                        height: 35.0,
                                        child: CircularProgressIndicator(color: Colors.white,),
                                      ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Vous ne disposez pas encore d'un compte? ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 9.0),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>const Register()));
                                    },
                                    child: const Text(
                                      "S'inscrire",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline,
                                          fontSize: 9.0),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 10.0),
                            ]),
                      ),
                    ),
                  ]),
                ),
                Container(
                  width: size.width,
                  height: size.height * 0.15,
                  color: backGroundColor,
                  child: Container(
                    width: size.width,
                    height: size.height * 0.15,
                    margin: const EdgeInsets.only(bottom: 15.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular((size.height * 0.2) / 1.2),
                        )),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SimpleIcon(
                            icon: Icons.facebook,
                            size: 40.0,
                          ),
                          const SizedBox(
                            width: 15.0,
                          ),
                          SimpleIcon(icon: Icons.facebook, size: 40.0),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void onLogin() async {
    User user = User(
        username: usernameController.text,
        password: passwordController.text,
        );
    String result = await authController.login(user: user);
      // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result)));
      usernameController.text = "";
    passwordController.text = "";
    isLoading = false;
    setState(() {
      
    });
      if(result == "succes"){
          // ignore: use_build_context_synchronously
           Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const HomePage()), (route) => false);
      }
  
    
  }
}

class AuthWidget extends StatelessWidget {
  final bool authState;
  final UserController _userController = Get.put(UserController());

   AuthWidget({Key? key,required this.authState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (authState == true && _userController.user.value != null) {
      return const HomePage();
    }else{
      return LoginScreen();
    }
    }
  }