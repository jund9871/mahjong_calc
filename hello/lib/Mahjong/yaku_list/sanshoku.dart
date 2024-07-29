import 'package:flutter/foundation.dart';

import '../utils.dart';

class Sanshoku{
  int yakuId;
  int tenhouId = 25;
  String name = 'Sanshoku Doujun';

  int? hanOpen = 1;
  int hanClosed = 2;

  bool isYakuman = false;

  Sanshoku(this.yakuId);

  isConditionMet(List hand){
    List chiSets = [];
    for(var i in hand){
      if(isChi(i)){
        chiSets.add(i);
      }
    }
    if(chiSets.length < 3){
      return false;
    }

    List souChi = [];
    List pinChi = [];
    List manChi = [];
    for(var item in chiSets){
      if(isSou(item[0])){
        souChi.add(item);
      }else if(isPin(item[0])){
        pinChi.add(item);
      }else if(isMan(item[0])){
        manChi.add(item);
      }
    }

    for(List souItem in souChi){
      for(List pinItem in pinChi){
        for(List manItem in manChi){
          List temp = [];
          for(var x in souItem){
            temp.add(simplify(x));
          }
          souItem = temp;
          temp = [];
          for(var x in pinItem){
            temp.add(simplify(x));
          }
          pinItem = temp;
          temp = [];
          for(var x in manItem){
            temp.add(x);
          }
          manItem = temp;

          if(listEquals(souItem, pinItem) && listEquals(pinItem, manItem)){
            return true;
          }
        }
      }
    }

    return false;
  }
}