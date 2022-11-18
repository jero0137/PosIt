import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:posit/vistas/home_page.dart';
import 'package:posit/vistas/login.dart';
import 'package:provider/provider.dart';
import 'provider/providers/UserProvider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
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
      home: HomePage(),
    );
  }
}
