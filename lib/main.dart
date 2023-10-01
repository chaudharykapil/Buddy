import 'package:buddy/providers/AppData.dart';
import 'package:buddy/screens/HistoryPage.dart';
import 'package:buddy/screens/HomePage.dart';
import 'package:buddy/screens/ReportPage.dart';
import 'package:buddy/screens/StartTestScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>AppData())
      ],
      child:MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.deepOrangeAccent,
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
