import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:missa/common/utils.dart';
import 'package:missa/ui/data_layer/widgets/components/custom_clippers.dart';

import '../../../presenter_layer/controller/user_controller.dart';
import 'church_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final UserController _userController = Get.find();
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

    final Color primary = Colors.white;

  final Color active = Colors.grey.shade800;

  final Color divider = Colors.grey.shade600;

  var list = [
    {
      "title": "Basilica",
      "description": "Basilica de Ouidah",
      "image": "assets/images/basilica_of_ouidah.png",
      "ville": "Ouidah"
    },
    {
      "title": "St Michel",
      "description": "Eglise saint Michel de Cotonou",
      "image": "assets/images/st_michel.png",
      "ville": "Cotonou"
    },
    {
      "title": "St Jean",
      "description": "Eglise saint Jean baptiste de Cotonou",
      "image": "assets/images/st_jean.png",
      "ville": "Cotonou"
    },
    {
      "title": "St Louis",
      "description": "Eglise saint Louis de Cotonou",
      "image": "assets/images/st_louis.png",
      "ville": "Cotonou"
    },
    {
      "title": "Notre dame",
      "description": "Eglise Notre dame de Cotonou",
      "image": "assets/images/notre_dame.png",
      "ville": "Cotonou"
    },
  ];
 
 @override
  Widget build(BuildContext context) {
   Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _key,

      /// ----------------
      /// Building drawer here .
      /// ---------------
      drawer: _buildDrawer(),

      /// ----------------
      /// Main Content .
      /// ---------------
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            ClipWithShadowPath(
              shadow: const BoxShadow(
                color: Colors.black,
                spreadRadius: 8,
                blurRadius: 4,
                offset: Offset(4, 4)
              ),
              clipper: CustomAmissaClipper(),
              child: Container(
                color:accentColor,
                alignment: Alignment.topLeft,
                child: SafeArea(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon:const Icon(Icons.menu, color: Colors.white,),
                            onPressed: () {
                              _key.currentState?.openDrawer();
                            },
                          ),
                         const Text("Amissa", style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w600),),
                        ],
                      ),
                      Container(
                        width: 200.0,
                        height: 140.0,
                        alignment: Alignment.center,

                        child: Image.asset("assets/images/jesus.png", fit: BoxFit.fill,),
                      )
                    ],
                  ),
                ),
              ),
            ),
        DraggableScrollableSheet(
            maxChildSize: 0.85,
            initialChildSize: 0.65,
            minChildSize: 0.65,
            builder: (context, scrollable) {
              return Container(
                  decoration: const BoxDecoration(
                      color: Color(0xFFE5E5E5),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60.0),
                        topRight: Radius.circular(60.0),
                      )),
                  child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: SizedBox(
                  width: size.width,
                  height: size.height * 0.75,
                  child: Column(
                    children: [
                      const SizedBox(height: 15.0),
                      const Text("Listes des paroisses", style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w600),),
                      const SizedBox(height: 15.0),
                      Flexible(
                        child: NotificationListener<
                            OverscrollIndicatorNotification>(
                          onNotification:
                              (OverscrollIndicatorNotification overscroll) {
                            overscroll.disallowIndicator();
                            return true;
                          },
                          child: ListView.builder(
                            controller: scrollable,
                              itemCount: list.length,
                              itemBuilder: (context, index) => SizedBox(
                                width: size.width,
                                height: size.height * 0.4,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ChurchPage(church:list[index])));
                                  },
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          width: size.width,
                                          height: size.width > 500.0
                                              ? size.width * 0.4
                                              : size.height * 0.3,
                                          margin: const EdgeInsets.only(
                                              left: 25.0, right: 15.0, top: 5.0, bottom: 5.0),
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image:
                                                     AssetImage(list[index]["image"]!),
                                                fit: BoxFit.fill,
                                              ),
                                              borderRadius:
                                              const BorderRadius.all(Radius.circular(10.0))),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.black.withOpacity(0.1),
                                                borderRadius:
                                                const BorderRadius.all(Radius.circular(10.0))),
                                          )
                                        /*isRestaurant == true
                    ? Align(
                          alignment: const Alignment(-1, 0),
                          child: Container(
                            height: 29.0,
                            width: 65.0,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0)),
                                color: appThemeColor),
                            child: Center(
                                child: Text("${etab.promoPercent!}%",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                        letterSpacing: 0.02,
                                        fontSize: 13.0))),
                          ))
                    : SizedBox.fromSize(),*/
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 12.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 15, top: 20),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 40.0,
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.grey,
                                                        image: DecorationImage(
                                                            image: AssetImage(list[index]["image"]!),
                                                            fit: BoxFit.fill)),
                                                  ),
                                                  const SizedBox(width: 10.0),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        list[index]["title"]!,
                                                        style: const TextStyle(
                                                          fontWeight: FontWeight.w700,
                                                          fontSize: 16.0,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      Text(
                                                        list[index]["description"]!,
                                                        maxLines: 2,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: const TextStyle(
                                                          fontSize: 9.0,
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                ],
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.location_on_outlined, color: accentColor,),
                                                Text(list[index]["ville"]!, style:const TextStyle(color: Colors.black, fontSize: 10.0, fontWeight: FontWeight.w500),),

                                              ],
                                            ),
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ));})

          ],
        ),
      ),
    );
  }

  _buildDrawer() {
   String image = 'assets/images/blonde.png';
    return ClipPath(
      /// ---------------------------
      /// Building Shape for drawer .
      /// ---------------------------

      clipper: OvalRightBorderClipper(),

      /// ---------------------------
      /// Building drawer widget .
      /// ---------------------------

      child: Drawer(
        child: Container(
          padding: const EdgeInsets.only(left: 16.0, right: 40),
          decoration: BoxDecoration(
              color: primary, boxShadow: [BoxShadow(color: Colors.black45)]),
          width: 300,
          child: SafeArea(
            /// ---------------------------
            /// Building scrolling  content for drawer .
            /// ---------------------------

            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(
                        Icons.power_settings_new,
                        color: active,
                      ),
                      onPressed: () {},
                    ),
                  ),

                  /// ---------------------------
                  /// Building header for drawer .
                  /// ---------------------------

                  Container(
                    height: 90,
                    alignment: Alignment.center,
                    decoration:const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [Colors.orange, Colors.deepOrange])),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(image),
                    ),
                  ),
                  const SizedBox(height: 5.0),

                  /// ---------------------------
                  /// Building header title for drawer .
                  /// ---------------------------
                  //_userController.user.value.username!
                  const Text(
                    "Username",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                  ),
                  //_userController.user.value.numeromomo!
                  Text(
                    "Numero",
                    style: TextStyle(color: active, fontSize: 16.0),
                  ),

                  /// ---------------------------
                  /// Building items list  for drawer .
                  /// ---------------------------

                  const SizedBox(height: 30.0),
                  _buildRow(Icons.home, "Accueil"),
                  _buildDivider(),
                  _buildRow(Icons.person_pin, "Mon profile"),
                  _buildDivider(),
                  _buildRow(Icons.notifications, "Notifications",
                      showBadge: true),
                  _buildDivider(),
                  _buildRow(Icons.local_activity, "Mes demandes",
                      showBadge: true),
                  _buildDivider(),
                  _buildRow(Icons.settings, "Parametres"),
                  _buildDivider(),
                  _buildRow(Icons.email, "Nous Contacter"),
                  _buildDivider(),
                  _buildRow(Icons.info_outline, "Aide"),
                  _buildDivider(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// ---------------------------
  /// Building divider for drawer .
  /// ---------------------------

  Divider _buildDivider() {
    return Divider(
      color: divider,
    );
  }

  /// ---------------------------
  /// Building item  for drawer .
  /// ---------------------------

  Widget _buildRow(IconData icon, String title, {bool showBadge = false}) {
    final TextStyle tStyle = TextStyle(color: active, fontSize: 16.0);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: active,
          ),
         const SizedBox(width: 10.0),
          Text(
            title,
            style: tStyle,
          ),
         const Spacer(),
          if (showBadge)
            Material(
              color: Colors.deepOrange,
              elevation: 5.0,
              shadowColor: Colors.red,
              borderRadius: BorderRadius.circular(5.0),
              child: Container(
                width: 25,
                height: 25,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: const Text(
                  "10+",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// ------------------
/// for shaping the drawer. You can customize it as your own
/// ------------------
class OvalRightBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width - 40, 0);
    path.quadraticBezierTo(
        size.width, size.height / 4, size.width, size.height / 2);
    path.quadraticBezierTo(size.width, size.height - (size.height / 4),
        size.width - 40, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
