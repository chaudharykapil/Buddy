import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:buddy/providers/AppData.dart';
import 'package:buddy/providers/Test.dart';
import 'package:buddy/screens/HistoryPage.dart';
import 'package:buddy/screens/HomePage.dart';
import 'package:buddy/screens/ReportPage.dart';
import 'package:buddy/screens/StartTestScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
initfirebase ()async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

void main() {
  initfirebase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>AppData()),
        ChangeNotifierProvider(create: (_)=>TestData())
      ],
      child:MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.lightGreen,
          )
        ),
        initialRoute: "/",
        routes: {
          '/':(context)=>HomePage(),
          '/starttest':(context)=>StartTestScreen(),
          '/report': (context)=>ReportPage(),
          '/history':(context)=>HistoryPage()
        },
      ),
    );
  }
}
