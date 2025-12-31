import 'package:flutter/material.dart';

class AuthHeader extends StatefulWidget {
  const AuthHeader({super.key});

  @override
  State<AuthHeader> createState() => _AuthHeaderState();
}

class _AuthHeaderState extends State<AuthHeader> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 290,
      // padding: EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(milliseconds: 250),
            curve: Curves.linear,
            top: 7,
            left: isSelected ? 138 : 8,
            child: Container(
              height: 44,
              width: 145,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(28)),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                  alignment: Alignment(0.0, -0.38),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelected = false;
                      });
                    },
                    child: AnimatedDefaultTextStyle(
                      child: const Text("Sign Up"),
                      style: TextStyle(
                        color: isSelected ? Colors.black : Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                        fontFamily: "Agbalumo",
                        letterSpacing: 1.5,
                      ),
                      duration: Duration(milliseconds: 250),
                      curve: Curves.linear,
                    ),
                  ),
                ),
                // SizedBox(width: 1),
                Align(
                  alignment: Alignment(0.0, -0.38),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelected = true;
                      });
                    },
                    child: AnimatedDefaultTextStyle(
                      child: const Text("Sign Up"),
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                        fontFamily: "Agbalumo",
                        letterSpacing: 1.5,
                      ),
                      duration: Duration(milliseconds: 250),
                      curve: Curves.linear,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


