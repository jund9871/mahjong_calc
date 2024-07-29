import 'package:hello/Mahjong/constants.dart';

import '../../utils.dart';

class Daisangen{
  int yakuId;
  int tenhouId = 39;
  String name = 'Daisangen';

  int? hanOpen = 13;
  int hanClosed = 13;

  bool isYakuman = true;

  Daisangen(this.yakuId);

  isConditionMet(List hand){
    int countOfDragonPonSets = 0;
    for(var item in hand){
      if(isPonOrKan(item) && [chun, haku, hatsu].contains(item[0])){
        countOfDragonPonSets++;
      }
    }

    return countOfDragonPonSets == 3;
  }
}
