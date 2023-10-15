
import 'package:buddy/components/OmrRow.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class StartTestScreen extends StatefulWidget{

  StartTestScreen({super.key});
  @override
  State<StatefulWidget> createState() {

    return StartTestState();
  }
}
class StartTestState extends State<StartTestScreen>{
  bool isstart = false;
  void onSelectOption(String ans){
    print(ans);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
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
                      child: !isstart ? ElevatedButton(child: Text("Start"), onPressed: (){setState(() {
                        isstart = true;
                      });},)
                          :
                      CircularPercentIndicator(
                          radius: 50,
                          center: Text("120 min"),
                          progressColor: Colors.lightGreen,
                          percent: (120)/120
                      ),
                    ))
                  ],
                )
              ),
            ),
            Expanded(
              child: isstart ? SingleChildScrollView(
                  child: Column(
                    children: List.generate(120, (index) => OmrRow(onselectans: onSelectOption, ques: index+1)),
                  )
              ):Container(),
            )
          ],
        ),
      )
    );
  }

}