import 'package:flutter/material.dart';

class ChargingView extends StatelessWidget {
  final String text;
  final String? nametext;
  final String? infotext;
  const ChargingView({
    Key? key,
    required this.text,
    this.infotext,
    this.nametext,
  }) : super(key: key);

  Widget customText(String text, double heightSize) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: heightSize * 0.05),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: heightSize * 0.03,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.amber,
        ),
        child: Column(
          children: [
            const Spacer(),
            customText(text, screenHeight),
            SizedBox(
              height: screenHeight * 0.005,
            ),
            SizedBox(
              width: screenWidth * 0.8,
              child: const LinearProgressIndicator(
                backgroundColor: Colors.amber,
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFFFFFF)),
                //strokeWidth: 2,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.005,
            ),
            customText(nametext ?? '', screenHeight),
            customText(infotext ?? '', screenHeight),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
