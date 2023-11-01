import 'dart:async';

import 'package:buddy/components/OmrRow.dart';
import 'package:buddy/providers/Test.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class StartTestScreen extends StatefulWidget{

  StartTestScreen({super.key});
  @override
  State<StatefulWidget> createState() {

    return StartTestState();
  }
}
class StartTestState extends State<StartTestScreen> with AutomaticKeepAliveClientMixin{
  bool isstart = false;
  int time = 0;
  int timeleft = 0;
  Timer? t;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isstart = false;
    time = 120;
    timeleft = time;

  }
  @override
  void dispose() {
    // TODO: implement dispose
    t?.cancel();
    super.dispose();
  }
  void start_test(){
    setState(() {
      isstart = true;
      t = Timer.periodic(Duration(minutes: 1), (t) {setState(() {
        timeleft = timeleft>0?timeleft-1:0;
      }); });
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<TestData>(
      builder:(context,test,child)=>Scaffold(
        appBar: AppBar( title: Text("New Test"),),
        body: Container(
          child: Column(
            children: [
              SizedBox(
                height: 200,
                width: double.maxFinite,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child:Flex(
                    direction: Axis.horizontal,
                    children: [
                      Flexible(

                          flex:1,
                          fit:FlexFit.tight,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Subject: English", style: TextStyle(fontSize: 15,color: Colors.black54),),
                              Divider(),
                              Text("Total Questions: 120",style: TextStyle(fontSize: 15,color: Colors.blue),),
                              Divider(),
                              Text("Right: +0.83",style: TextStyle(fontSize: 15,color: Colors.black),),
                              Divider(),
                              Text("Wrong: -0.27",style: TextStyle(fontSize: 15,color: Colors.blueGrey),),
                              Divider(),
                              Text("Time: 120 min",style: TextStyle(fontSize: 15,color: Colors.green),),
                            ],
                      )),
                      Flexible(flex:1,fit:FlexFit.tight,child: Center(
                        child: !isstart ? ElevatedButton(child: Text("Start"), onPressed: (){ start_test();},)
                            :
                        CircularPercentIndicator(
                            radius: 50,
                            center: Text("${timeleft??0} min"),
                            progressColor: Colors.lightGreen,
                            percent: (timeleft??0)/time??1
                        ),
                      ))
                    ],
                  )
                ),
              ),
              Expanded(
                child: isstart ? ListView.builder(itemCount: 120,key:PageStorageKey<String>("thisiskey"), itemBuilder: (context,idx)=>OmrRow(onselectans: test.setans, ques: idx+1))
                    :
                Container(),
              )
            ],
          ),
        )
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

}