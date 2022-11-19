import 'package:flutter/material.dart';
import 'package:missa/common/utils.dart';
import 'package:missa/ui/data_layer/widgets/components/custom_text_field.dart';

class DemanderMesse extends StatefulWidget {
  const DemanderMesse({super.key});

  @override
  State<DemanderMesse> createState() => _DemanderMesseState();
}

class _DemanderMesseState extends State<DemanderMesse> {
  final formkey = GlobalKey<FormState>();
  final TextEditingController nomController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: size.height * 0.5,
                alignment: Alignment.topCenter,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset("assets/images/flat_church.png"),
                    Positioned(
                      top: 0.0,
                      right: 5.0,
                      child: Image.asset(
                        "assets/images/angel_stone.png",
                        width: size.width * 0.3,
                        height: size.height * 0.2,
                      ),
                    )
                  ],
                ),
              ),
              Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50.0,
                        child: Row(
                          children: [
                            Flexible(
                              child: Container(
                                  height: 50.0,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(232, 232, 232, 1),
                                  ),
                                  child: CustomTextField(
                                    controller: nomController,
                                    label: "Intention",
                                    keyboardType: TextInputType.text,
                                    onChanged: (text) {},
                                    onSaved: (text) {},
                                    validator: (text) {
                                      return '';
                                    },
                                  )),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      SizedBox(
                        height: 50.0,
                        child: Row(
                          children: [
                            Flexible(
                              child: Container(
                                  height: 50.0,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(232, 232, 232, 1),
                                  ),
                                  child: CustomTextField(
                                    controller: nomController,
                                    label: "DATE DE LA MESSE",
                                    keyboardType: TextInputType.datetime,
                                    onChanged: (text) {},
                                    onSaved: (text) {},
                                    validator: (text) {
                                      return '';
                                    },
                                  )),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      SizedBox(
                        height: 50.0,
                        child: Row(
                          children: [
                            Flexible(
                              child: Container(
                                  height: 50.0,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(232, 232, 232, 1),
                                  ),
                                  child: CustomTextField(
                                    controller: nomController,
                                    label: "HEURE DE LA MESSE",
                                    keyboardType: TextInputType.datetime,
                                    onChanged: (text) {},
                                    onSaved: (text) {},
                                    validator: (text) {
                                      return '';
                                    },
                                  )),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      SizedBox(
                        height: 50.0,
                        child: Row(
                          children: [
                            Flexible(
                              child: Container(
                                  height: 50.0,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(232, 232, 232, 1),
                                  ),
                                  child: CustomTextField(
                                    controller: nomController,
                                    label: "ID TRANSACTION",
                                    keyboardType: TextInputType.datetime,
                                    onChanged: (text) {},
                                    onSaved: (text) {},
                                    validator: (text) {
                                      return '';
                                    },
                                  )),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Container(
                        height: 45.0,
                        margin: const EdgeInsets.all(25.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const DemanderMesse()));
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(accentColor),
                              fixedSize: MaterialStatePropertyAll(
                                  Size(size.width, size.height * 0.08))),
                          child: const Text("Demander votre messe"),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    ));
  }
}
