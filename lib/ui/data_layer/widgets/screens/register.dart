import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:missa/common/utils.dart';
import 'package:missa/ui/domain_layer/models/user.dart';
import 'package:missa/ui/presenter_layer/controller/auth_controller.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController numeromomoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPaswordController = TextEditingController();
  final AuthController authController = Get.find();
   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   bool isLoading = false;

  
  var dropDownValue = "St Louis";

  static final _emailRegex = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );

  
  bool emailValidator(String value) {
    return _emailRegex.hasMatch(value) ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var backGroundColor = accentColor;

    var list = [
      "St Louis",
      "St Michel",
      "Bon Pasteur",
      "St Antoine de Padou",
      "Jésus l'Eucharistie",
      "St Piere-Paul",
      "St Jean"
    ];
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          elevation: 0.0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            "Amissa",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w700),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              width: size.width,
              height: size.height,
              child: Form(
      key: _formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        width: size.width,
                        height: size.height * 0.85,
                        decoration: BoxDecoration(
                          color: backGroundColor,
                          borderRadius: BorderRadius.circular(
                            60.0,
                          ),
                        ),
                        margin: const EdgeInsets.only(bottom: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 10.0),
                            Container(
                              width: size.width / 3,
                              height: size.height / 6,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                            ),
                            const Spacer(),
                            const SizedBox(height: 10.0),
                            textEditing(
                              size,
                              usernameController,
                              "Nom d'utilisateur",
                              false,
                              (String? str){
                                 if(str!.isEmpty){
                                  return "Ce champ est obligatoire";
                                 }else{
                                   return null;
                                 }
                               }
                            ),
                            const SizedBox(height: 10.0),
                            textEditing(size, emailController, "Email", 
                            false,
                            (String? str){
                                 if(str!.isEmpty){
                                  return "Ce champ est obligatoire";
                                 }else if(!emailValidator(emailController.text)){
                                   return "L'email n'est pas valide";
                                    }else{
                                         return null;
                                }
                               }),
                            const SizedBox(height: 10.0),
                            textEditing(size, numeromomoController,
                                "Numero de téléphone",
                                false,
                                (String? str){
                                 if(str!.isEmpty){
                                  return "Ce champ est obligatoire";
                                 }else{
                                    return null;
                                 }
                               }),
                            const SizedBox(
                              height: 10.0,
                            ),
                            /*Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Opacity(
                                opacity: 0.9,
                                child: Container(
                                  width: size.width,
                                  height: size.width > 500.0
                                      ? size.height * 0.15
                                      : size.height * 0.065,
                                  alignment: Alignment.topCenter,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Choisissez votre Eglise? ",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            60.0,
                                          ),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 5.0),
                                        child: DropdownButton(
                                          underline: Container(),
                                          elevation: 0,
                                          value: dropDownValue,
                                          icon: Transform.rotate(
                                            angle: 1.5,
                                            child: const Icon(
                                              Icons.chevron_right,
                                              size: 12,
                                            ),
                                          ),
                                          style: const TextStyle(
                                              color: Colors.black, fontSize: 12),
                                          onChanged: (newValue) {
                                            setState(() {
                                              dropDownValue = newValue!;
                                            });
                                          },
                                          items: list
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            */const SizedBox(height: 10.0),
                            textEditing(size, passwordController, "Mot de passe",
                            true,
                            (String? str){
                                 if(str!.isEmpty){
                                  return "Ce champ est obligatoire";
                                 }else{
                                    return null;
                                 }
                               }),
                            const SizedBox(
                              height: 10.0,
                            ),
                            textEditing(size, confirmPaswordController,
                                "Confirmer le mot de passe",
                                true,
                                (String? str){
                                 if(str!.isEmpty){
                                  return "Ce champ est obligatoire";
                                 }else 
                                 if(passwordController.text != confirmPaswordController.text){
                                  return "Vérifier le mot de passe";
                                 }else
                                 {
                                    return null;
                                 }
                               }),
                            const SizedBox(
                              height: 10.0,
                            ),
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
                                        borderRadius: BorderRadius.circular(50.0),
                                      ),
                                    ),
                                  ),
                                  onPressed: (){
                                    if(isLoading){
                                        return;
                                    }
                                    if(_formKey.currentState!.validate()){
                                      isLoading = true;
                                      setState(() {
                                      });
                                       onRegister();
                                    }
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 50.0,
                                    child:  Center(
                                      child: !isLoading ? const Text(
                                        "S'inscrire",
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
                            const SizedBox(height: 10.0),
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ));
  }

  void onRegister() async {
    User user = User(
        username: usernameController.text,
        email: emailController.text,
        numeromomo: numeromomoController.text,
        password: passwordController.text,
        
        );
    String result = await authController.register(user: user);
      // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result)));
      usernameController.text = "";
    emailController.text = "";
    numeromomoController.text = "";
    passwordController.text = "";
    isLoading = false;
    setState(() {
      
    });
      if(result == "succes"){
          // ignore: use_build_context_synchronously
           Navigator.pop(context);
      }
  
    
  }
}
