import 'package:hello/Mahjong/constants.dart';

import '../utils.dart';

class Chun{
  int yakuId;
  int tenhouId = 20;
  String name = 'Yakuhai (Chun)';

  int? hanOpen = 1;
  int hanClosed = 1;

  bool isYakuman = false;

  Chun(this.yakuId);

  isConditionMet(List hand){
    List count = [];
    for(var x in hand){
      if(isPonOrKan(x) && x[0] == chun){
        count.add(x);
      }
    }

    return count.length == 1;
  }
}
