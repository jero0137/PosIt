import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class cabecera extends StatelessWidget with PreferredSizeWidget {
  final String titulo;

  @override
  Size get preferredSize => const Size.fromHeight(45);

  const cabecera({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 1,
          ),
          Image.network(
            'https://firebasestorage.googleapis.com/v0/b/posit-afbe6.appspot.com/o/Logo.png?alt=media&token=fdd54a50-f264-4a16-960b-23ad499290f9',
            height: 30,
          ),
          const SizedBox(
            width: 10,
          ),
          Container(padding: const EdgeInsets.all(8.0), child: Text(titulo)),
          const Spacer(
            flex: 4,
          ),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
      backgroundColor: Color(0xFF031630),
      toolbarHeight: 45,
    );
  }
}
