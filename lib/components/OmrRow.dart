import 'package:flutter/material.dart';
class OmrRow extends StatefulWidget{
  final Function onselectans;
  final int ques;
  const OmrRow({super.key,required this.onselectans,required this.ques});
  @override
  State<StatefulWidget> createState() {
    return OmrRowState();
  }

}
class OmrRowState extends State<OmrRow> {
  OmrRowState();
  String ans = "";
  void onSelectAns(String value){
    setState(() {
      ans = value;
    });
    widget.onselectans(value);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(flex: 1,child: Text("Q${widget.ques}",style: TextStyle(fontSize: 17),)),
              Expanded(flex: 2,
                  child: RadioListTile(
                    title: Text('A'),
                    value: "A",
                    groupValue: ans,
                    selected: ans == "A"?true:false,
                    onChanged: (value) { onSelectAns(value!); },)
              ),
              Expanded(flex: 2,
                child: RadioListTile(
                  title: Text('B'),
                  value: "B",
                  groupValue: ans,
                  selected: ans == "B"?true:false,
                  onChanged: (final value) { onSelectAns(value!); },
                )
              ),
              Expanded(flex: 2,
                  child: RadioListTile(
                    title: Text('C'),
                    value: "C",
                    selected: ans == "C"?true:false,
                    groupValue: ans,
                    onChanged: (final value) { onSelectAns(value!); },
                  )
              ),

              Expanded(flex: 2,
                  child: RadioListTile(
                    title: Text('D'),
                    value: "D",
                    groupValue: ans,
                    selected: ans == "D"?true:false,
                    onChanged: (final value) { onSelectAns(value!); },
                  )
              ),
            ],
          ),
        ),
        Divider()
      ],
    );
  }
}
