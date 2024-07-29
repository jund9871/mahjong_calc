import 'package:flutter/foundation.dart';

import '../utils.dart';

class SanshokuDoukou{
  int yakuId;
  int tenhouId = 26;
  String name = 'Sanshoku Doukou';

  int? hanOpen = 2;
  int hanClosed = 2;

  bool isYakuman = false;

  SanshokuDoukou(this.yakuId);

  isConditionMet(List hand){
    List ponSets = [];
    for(var i in hand){
      if(isPonOrKan(i)){
        ponSets.add(i);
      }
    }
    if(ponSets.length < 3){
      return false;
    }

    List souPon = [];
    List pinPon = [];
    List manPon = [];
    for(var item in ponSets){
      if(isSou(item[0])){
        souPon.add(item);
      }else if(isPin(item[0])){
        pinPon.add(item);
      }else if(isMan(item[0])){
        manPon.add(item);
      }
    }

    for(List souItem in souPon){
      for(List pinItem in pinPon){
        for(List manItem in manPon){
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
