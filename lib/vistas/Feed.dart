import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class Feed extends StatelessWidget {
  const Feed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Color(0xFF031630),
      appBar: appBar("PosIT"),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              post(),
            ],
          ),
        ),
      ),
    );
  }
}