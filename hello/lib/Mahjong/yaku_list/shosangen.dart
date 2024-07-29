import 'package:hello/Mahjong/constants.dart';

import '../utils.dart';

class Shosangen{
  int yakuId;
  int tenhouId = 30;
  String name = 'Shou Sangen';

  int? hanOpen = 2;
  int hanClosed = 2;

  bool isYakuman = false;

  Shosangen(this.yakuId);

  isConditionMet(List hand){
    List dragons = [chun, haku, hatsu];
    int countOfConditions = 0;
    for(var item in hand){
      if((isPair(item) || isPonOrKan(item)) && dragons.contains(item[0])){
        countOfConditions++;
      }
    }

    return countOfConditions == 3;
  }
}
