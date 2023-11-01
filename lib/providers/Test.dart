import 'package:flutter/material.dart';

class TestData extends ChangeNotifier{
  Map<int,String> ans = {};
  void setans(int ques,String a){
    ans[ques] = a;
  }
  Map<int,String> getallAns(){
    return ans;
  }
  String getans(int ques){
    return ans[ques]!;
  }
}
