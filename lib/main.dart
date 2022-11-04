import 'package:flutter/material.dart';
import 'package:posit/vistas/login.dart';
import 'package:provider/provider.dart';
import 'provider/providers/user.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => User(),
        ),
        
      ],
      child: const MyApp(),
      )
      ,
      
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: login(),
    );
  }
}
