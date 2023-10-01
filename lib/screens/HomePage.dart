import 'package:buddy/components/RecentActivityCard.dart';
import 'package:buddy/providers/AppData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class HomePage extends StatelessWidget{
  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<AppData>(
      builder:(context,setting,child)=>Scaffold(
        appBar: AppBar(title: const Text("Home"),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.history,size: 30,),
            )
          ],

        ),
        body: Column(
          children: [
            // Recent Block
            Expanded(
              flex: 5,
                child: Column(
                children: [
                  Container(
                    height: 60,
                    width: double.maxFinite,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [ BoxShadow(color: Colors.black26,blurRadius: 2,offset: Offset(0,5))]
                    ),
                    padding: const EdgeInsets.all(12),
                    child: const Text("Recents",style: TextStyle(
                      fontSize: 25,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500
                    ),),
                  ),
                  SizedBox(
                    height: 250,
                    child: ListView.builder(itemCount: 5,scrollDirection: Axis.horizontal,itemBuilder: (context,index)=>RecentActivityCard()),
                  )
                ],
              ),
            ),
            // New Test Block
            Expanded(
              flex: 7,
              child: Column(
                children: [
                  Container(
                    height: 60,
                    width: double.maxFinite,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(250, 250, 250, 1.0),
                        boxShadow: [ BoxShadow(color: Colors.black26,blurRadius: 2,offset: Offset(0,5))]
                    ),
                    padding: const EdgeInsets.all(12),
                    child: const Text("Start Tests",style: TextStyle(
                        fontSize: 25,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500
                    ),),
                  ),
                  Expanded(
                    child: GridView(
                      padding: EdgeInsets.all(5),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                      children:  [
                         InkWell(
                           child: Container(
                            height: 100,
                            width: 100,
                            child: Card(
                              color: Color.fromRGBO(104,159,56,1),
                              elevation: 5,
                              shadowColor: Colors.black45,
                              child: Center(
                                child: Text("AFCAT",style: TextStyle(fontSize: 20,color: Colors.white),),
                              ),
                            ),
                        ),
                         ),
                        InkWell(
                          child: Container(
                            height: 100,
                            width: 100,
                            child: Card(
                              color: Color.fromRGBO(94,53,177,1),
                              elevation: 5,
                              shadowColor: Colors.black45,
                              child: Center(
                                child: Text("CDSE Maths",style: TextStyle(fontSize: 20,color: Colors.white),),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          child: Container(
                            height: 100,
                            width: 100,
                            child: Card(
                              color: Color.fromRGBO(0,172,193,1),
                              elevation: 5,
                              shadowColor: Colors.black45,
                              child: Center(
                                child: Text("CDSE English",style: TextStyle(fontSize: 20,color: Colors.white),),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          child: Container(
                            height: 100,
                            width: 100,
                            child: Card(
                              color: Color.fromRGBO(244, 67, 54, 1.0),
                              elevation: 5,
                              shadowColor: Colors.black45,
                              child: Center(
                                child: Text("CDSE GS",style: TextStyle(fontSize: 20,color: Colors.white),),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          child: Container(
                            height: 100,
                            width: 100,
                            child: Card(
                              color: Color.fromRGBO(0, 150, 136, 1.0),
                              elevation: 5,
                              shadowColor: Colors.black45,
                              child: Center(
                                child: Text("Custom",style: TextStyle(fontSize: 20,color: Colors.white),),
                              ),
                            ),
                          ),
                        )
                    ],),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}