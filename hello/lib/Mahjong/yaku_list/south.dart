import 'package:hello/Mahjong/constants.dart';

import '../utils.dart';

class YakuhaiSouth{
  int yakuId;
  int tenhouId = 10;
  String name = 'Yakuhai (South)';

  int? hanOpen = 1;
  int hanClosed = 1;

  bool isYakuman = false;

  YakuhaiSouth(this.yakuId);

  isConditionMet(List hand, playerWind, roundWind){
    List playerWindCount = [];
    List roundWindCount = [];

    for(var x in hand){
      if(isPonOrKan(x) && x[0] == playerWind){
        playerWindCount.add(x);
      }
    }
    if(playerWindCount.length == 1 && playerWind == south){
      return true;
    }

    for(var x in hand){
      if(isPonOrKan(x) && x[0] == roundWind){
        roundWindCount.add(x);
      }
    }
    if(roundWindCount.length == 1 && roundWind == south){
      return true;
    }

    return false;
  }
}