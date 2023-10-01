import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class RecentActivityCard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 300,
      margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
      color: Color.fromRGBO(249, 251, 231, 1.0),
      child: Card(
        color: Color.fromRGBO(249, 251, 231, 1.0),
        elevation: 5,
        borderOnForeground: true,

        child: Container(
          child: Row(
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: CircularPercentIndicator(
                  radius:  50.0,
                  lineWidth: 10.0,
                  percent: 0.67,
                  center: new Text("180/300"),
                  progressColor: Colors.green,
                )
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Subject: English", style: TextStyle(fontSize: 15,color: Colors.black54),),
                      Divider(),
                      Text("Total Questions: 100",style: TextStyle(fontSize: 15,color: Colors.blue),),
                      Divider(),
                      Text("Attempt: 90 (90%)",style: TextStyle(fontSize: 15,color: Colors.black),),
                      Divider(),
                      Text("Unattempt: 10 (10%)",style: TextStyle(fontSize: 15,color: Colors.blueGrey),),
                      Divider(),
                      Text("Right: 60",style: TextStyle(fontSize: 15,color: Colors.green),),
                      Divider(),
                      Text("Wrong: 30",style: TextStyle(fontSize: 15,color: Colors.redAccent),),
                      Divider(),
                      Text("Accuracy: ${((60/90)*100).toStringAsFixed(2)}%",style: TextStyle(fontSize: 15,color: Colors.orange),)
                    ],
                  ),
                )
              )
            ],
          ),
        )
      ),
    );
  }
}