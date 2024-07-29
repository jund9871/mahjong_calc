import 'package:flutter/foundation.dart';

import '../utils.dart';

class Ittsu{
  int yakuId;
  int tenhouId = 24;
  String name = 'Ittsu';

  int? hanOpen = 1;
  int hanClosed = 2;

  bool isYakuman = false;

  Ittsu(this.yakuId);

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
    
    List sets = [souChi, pinChi, manChi];
    
    for(var suitItem in sets){
      if(suitItem.length < 3){
        continue;
      }
      
      List castedSets = [];
      
      for(var setItem in suitItem){
        castedSets.add([simplify(setItem[0]), simplify(setItem[1]), simplify(setItem[2])]);
      }

      if((listEquals(castedSets[0], [0, 1, 2]) || listEquals(castedSets[1], [0, 1, 2]) || listEquals(castedSets[2], [0, 1, 2])) &&
          (listEquals(castedSets[0], [3, 4, 5]) || listEquals(castedSets[1], [3, 4, 5]) || listEquals(castedSets[2], [3, 4, 5])) &&
          (listEquals(castedSets[0], [6, 7, 8]) || listEquals(castedSets[1], [6, 7, 8]) || listEquals(castedSets[2], [6, 7, 8]))
      ){
        return true;
      }
    }

    return false;
  }
}