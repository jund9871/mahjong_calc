import 'package:hello/Mahjong/constants.dart';

import '../utils.dart';

class Chantai{
  int yakuId;
  int tenhouId = 23;
  String name = 'Chantai';

  int? hanOpen = 1;
  int hanClosed = 2;

  bool isYakuman = false;

  Chantai(this.yakuId);

  isConditionMet(List hand){
    tileInIndices(List itemSet, List indicesArray){
      for(var x in itemSet){
        if(indicesArray.contains(x)){
          return true;
        }
      }
      return false;
    }

    int honorSets = 0;
    int terminalSets = 0;
    int countOfchi = 0;
    for(var item in hand){
      if(isChi(item)){
        countOfchi++;
      }

      if(tileInIndices(item, terminalIndices)){
        terminalSets++;
      }

      if(tileInIndices(item, honorIndices)){
        honorSets++;
      }
    }

    if(countOfchi == 0){
      return false;
    }

    return terminalSets + honorSets == 5 && terminalSets != 0 && honorSets != 0;
  }
}
