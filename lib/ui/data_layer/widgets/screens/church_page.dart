import 'package:flutter/material.dart';
import 'package:missa/common/constants.dart';
import 'package:missa/common/utils.dart';
import 'package:missa/ui/data_layer/widgets/components/custom_clippers.dart';
import 'package:missa/ui/data_layer/widgets/screens/demander_messe_page.dart';

class ChurchPage extends StatefulWidget {
  const ChurchPage({Key? key, required this.church}) : super(key: key);

  final dynamic church;

  @override
  State<ChurchPage> createState() => _ChurchPageState();
}

class _ChurchPageState extends State<ChurchPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var sortedList = [
      {
        "Jours": "Lundi",
        "Heures": [
          "08h-10h",
          "12h-15h",
          "17h-20h",
          "20h-21h",
        ]
      },
      {
        "Jours": "Mardi",
        "Heures": [
          "08h-10h",
          "12h-15h",
          "17h-20h",
          "20h-21h",
        ]
      },
      {
        "Jours": "Mercredi",
        "Heures": [
          "08h-10h",
          "12h-15h",
          "17h-20h",
          "20h-21h",
        ]
      },
      {
        "Jours": "Jeudi",
        "Heures": [
          "08h-10h",
          "12h-15h",
          "17h-20h",
          "20h-21h",
        ]
      },
      {
        "Jours": "Vendredi",
        "Heures": [
          "08h-10h",
          "12h-15h",
          "17h-20h",
          "20h-21h",
        ]
      },
      {
        "Jours": "Samedi",
        "Heures": [
          "08h-10h",
          "12h-15h",
          "17h-20h",
          "20h-21h",
        ]
      },
      {
        "Jours": "Dimanche",
        "Heures": [
          "08h-10h",
          "12h-15h",
          "17h-20h",
          "20h-21h",
        ]
      }
    ];
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        elevation: 0.0,
        title:const Text('Nom Eglise', style: TextStyle(
          color: Colors.black
        ),),
      leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios_new, color: Colors.black)),
      ),*/
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topLeft,
                width: size.width,
                height: size.height * 0.4,
                decoration: const BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50.0),
                      bottomLeft: Radius.circular(50.0),
                    )),
                child: SafeArea(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Icon(Icons.arrow_back_ios_new,
                                    color: Colors.black)),
                            const SizedBox(
                              width: 15.0,
                            ),
                            const Text(
                              "Nom Eglise",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 300.0,
                        height: 200.0,
                        alignment: Alignment.center,
                        child: Image.asset(
                          widget.church["image"]!,
                          fit: BoxFit.fill,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Description',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                    "Nom d'église est créée depuis 1986 sous l'ère du père xxx. Elle a été consacrée le 02 janvier 2000 après tant d'éffort des fidèles de cette paroisse xxx. Elle est sous le diocèse du Bon pasteur."),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Nos messes de la semaine',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: DataTable(
                      dividerThickness: 5.0,
                      headingTextStyle: const TextStyle(color: Colors.black),
                      columnSpacing: 160.0,
                      horizontalMargin: 10.0,
                      dataRowHeight: 80.0,
                      columns: const [
                        DataColumn(
                            label: Text(
                          "Jours de la semaine",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w700,
                          ),
                        )),
                        DataColumn(
                            label: Text(
                          "Heure des messes",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w700,
                          ),
                        )),
                      ],
                      rows: [
                        for (int i = 0; i < sortedList.length; i++)
                          DataRow(cells: [
                            DataCell(
                              Text(
                                "${sortedList[i]["Jours"]}",
                                style: const TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            DataCell(Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                for (int j = 0;
                                    j <
                                        (sortedList[i]["Heures"]! as List)
                                            .length;
                                    j++)
                                  Text(
                                    (sortedList[i]["Heures"] as List)[j]!,
                                    style: const TextStyle(
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                              ],
                            )),
                          ]),
                      ]),
                ),
              ),
              SizedBox(height: size.height * 0.08)
            ],
          ),
        ),
      ),
      bottomSheet: ElevatedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const DemanderMesse()));
        },
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(accentColor),
            fixedSize:
                MaterialStatePropertyAll(Size(size.width, size.height * 0.08))),
        child: const Text("Demander une messe"),
      ),
    );
  }
}
