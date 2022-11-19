import 'package:flutter/material.dart';
import 'package:missa/common/utils.dart';
import 'package:missa/ui/data_layer/widgets/components/custom_clippers.dart';

class AskForMesse extends StatefulWidget {
  const AskForMesse({super.key});

  @override
  State<AskForMesse> createState() => _AskForMesseState();
}

class _AskForMesseState extends State<AskForMesse> {
  var listDiocese = [
    "Bon Pasteur",
    "Chang huo",
    "Notre dame",
    "St Louis",
    "St Jean",
    "St Michel",
    "Basilica"
  ];

  @override
  void initState() {
    super.initState();
    dropDownValue = listDiocese.first;
  }

  var dropDownValue;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            ClipPath(
              clipper: CustomAmissaClipper(),
              child: Container(
                color: accentColor,
                alignment: Alignment.topLeft,
                child: SafeArea(
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Amissa",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.35,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      "Diocèse",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.0),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      width: size.width * 0.95,
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
                        style:
                            const TextStyle(color: Colors.black, fontSize: 12),
                        onChanged: (newValue) {
                          setState(() {
                            dropDownValue = newValue!;
                          });
                        },
                        items: listDiocese
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    const Text(
                      "Vicariat",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.0),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      width: size.width * 0.95,
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
                        style:
                            const TextStyle(color: Colors.black, fontSize: 12),
                        onChanged: (newValue) {
                          setState(() {
                            dropDownValue = newValue!;
                          });
                        },
                        items: listDiocese
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    const Text(
                      "Paroisse",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.0),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      width: size.width * 0.95,
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
                        style:
                            const TextStyle(color: Colors.black, fontSize: 12),
                        onChanged: (newValue) {
                          setState(() {
                            dropDownValue = newValue!;
                          });
                        },
                        items: listDiocese
                            .map<DropdownMenuItem<String>>((String value) {
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
          ],
        ),
      ),
    );
  }
}
