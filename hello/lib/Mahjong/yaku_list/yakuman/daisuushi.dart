import 'package:hello/Mahjong/constants.dart';

import '../../utils.dart';

class DaiSuushii{
  int yakuId;
  int tenhouId = 49;

  String name = 'Dai suushii';

  int? hanOpen = 26;
  int hanClosed = 26;

  bool isYakuman = true;

  DaiSuushii(this.yakuId);

  isConditionMet(List hand){
    List ponSets = [];
    for(var x in hand){
      if(isPonOrKan(x)){
        ponSets.add(x);
      }
    }

    int countWindSets = 0;
    for(var item in ponSets){
      if(isPonOrKan(item) && winds.contains(item[0])){
        countWindSets += 1;
      }
    }

    return countWindSets == 4;
  }
}