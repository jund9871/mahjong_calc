import 'package:hello/Mahjong/constants.dart';
import 'package:hello/Mahjong/utils.dart';

class Hatsu{
  int yakuId;
  int tenhouId = 19;
  String name = 'Yakuhai (Hatsu)';

  int? hanOpen = 1;
  int hanClosed = 1;

  bool isYakuman = false;

  Hatsu(this.yakuId);

  isConditionMet(List hand){
    List count = [];
    for(var x in hand){
      if(isPonOrKan(x) && x[0] == hatsu){
        count.add(x);
      }
    }

    return count.length == 1;
  }
}
