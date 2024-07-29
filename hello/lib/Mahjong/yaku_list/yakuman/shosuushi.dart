import 'package:hello/Mahjong/constants.dart';

import '../../utils.dart';

class Shousuushii{
  int yakuId;
  int tenhouId = 50;
  String name = '소사희';

  int? hanOpen = 13;
  int hanClosed = 13;

  bool isYakuman = true;

  Shousuushii(this.yakuId);

  isConditionMet(List hand){
    List ponSets = [];
    for(var x in hand){
      if(isPonOrKan(x)){
        ponSets.add(x);
      }
    }
    if(ponSets.length < 3){
      return false;
    }

    int countOfWindSets = 0;
    int windPair = 0;
    List winds = [east, south, west, north];
    for(var item in hand){
      if(isPonOrKan(item) && winds.contains(item[0])){
        countOfWindSets++;
      }

      if(isPair(item) && winds.contains(item[0])){
        windPair++;
      }
    }

    return countOfWindSets == 3 && windPair == 1;
  }
}
