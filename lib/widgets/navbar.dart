import 'package:flutter/material.dart';
import '../utils/responsiveLayout.dart';

class NavBar extends StatelessWidget {
  // Navigation Bar Items
  final navLinks = ["Products", "Solutions", "Customers", "Resources", "Login"];
  List<Widget> navItem() {
    return navLinks.map((text) {
      return Padding(
        padding: EdgeInsets.only(left: 18),
        child: Text(text, style: TextStyle(fontFamily: "Montserrat-Bold",color: Colors.white)),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 45, vertical: 38),
      child: Row(
        // After doing Wrap with Row to the above Row,
        // below line of code doesn't seem to have effect
        // anymore on Container, SizedBox and Text.
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: 60,
                  padding: EdgeInsets.only(right: 20,left: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      gradient: LinearGradient(colors: [
                        Color(0xFFF64C72),
                        Color(0xFF2F2FA2),
                      ], begin: Alignment.bottomRight, end: Alignment.topLeft)),
                  child: Center(child: Text("Advid Technologies", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),)))
            ],
          ),
          // Responsive Layout
          if (!ResponsiveLayout.isSmallScreen(context))
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[...navItem()]
                  // ..add(InkWell(
                  //   child: Container(
                  //     margin: EdgeInsets.only(left: 20),
                  //     width: 120,
                  //     height: 40,
                  //     decoration: BoxDecoration(
                  //         gradient: LinearGradient(
                  //             colors: [Color(0xFFC86DD7),
                  //               Color(0xFF00A895)],
                  //             begin: Alignment.bottomRight,
                  //             end: Alignment.topLeft),
                  //         borderRadius: BorderRadius.circular(20),
                  //         boxShadow: [
                  //           BoxShadow(
                  //               color: Color(0xFF6078ea).withOpacity(.3),
                  //               offset: Offset(0, 8),
                  //               blurRadius: 8)
                  //         ]),
                  //     child: Material(
                  //       color: Colors.transparent,
                  //       child: Center(
                  //         child: Text("Login",
                  //             style: TextStyle(
                  //                 color: Colors.white,
                  //                 fontSize: 18,
                  //                 letterSpacing: 1,
                  //                 fontFamily: "Montserrat-Bold")),
                  //       ),
                  //     ),
                  //   ),
                  // ))
            )
          else
            Image.network("assets/icons8-menu.png", width: 50, height: 50)
        ],
      ),
    );
  }
}
