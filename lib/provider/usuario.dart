import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/user.dart';

class Usuario extends StatelessWidget {
  Usuario({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      /// Calls `context.watch` to make [Count] rebuild when [Counter] changes.
      context.watch<User>().usuario,
      style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
    );
  }
  
}
