import 'package:hello/Mahjong/constants.dart';

import '../utils.dart';

class YakuhaiEast{
  int yakuId;
  int tenhouId = 10;
  String name = 'Yakuhai (East)';

  int? hanOpen = 1;
  int hanClosed = 1;

  bool isYakuman = false;

  YakuhaiEast(this.yakuId);

  isConditionMet(List hand, int playerWind, int roundWind){
    List playerWindCount = [];
    List roundWindCount = [];

    for(var x in hand){
      if(isPonOrKan(x) && x[0] == playerWind){
        playerWindCount.add(x);
      }
    }
    if(playerWindCount.length == 1 && playerWind == east){
      return true;
    }

    for(var x in hand){
      if(isPonOrKan(x) && x[0] == roundWind){
        roundWindCount.add(x);
      }
    }
    if(roundWindCount.length == 1 && roundWind == east){
      return true;
    }

    return false;
  }
}
