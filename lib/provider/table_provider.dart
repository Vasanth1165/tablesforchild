import 'package:flutter/material.dart';

class TableProvider extends ChangeNotifier{
  int _val=20;
  int get value => _val;
  List<String> li=[];
  List<String> get tableList => li;
  void tableNumber(int val){
      li.clear();
      _val=val;
      for(int i=1;i<=20;i++){
        li.add("$val X $i = ${val*i}");
      }
      notifyListeners();
  }
}