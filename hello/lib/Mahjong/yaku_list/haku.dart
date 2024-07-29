import 'package:hello/Mahjong/constants.dart';
import 'package:hello/Mahjong/utils.dart';

class Haku{
  int yakuId;
  int tenhouId = 18;
  String name = 'Haku';

  int? hanOpen = 1;
  int hanClosed = 1;

  bool isYakuman = false;

  Haku(this.yakuId);

  isConditionMet(List hand){
    List count = [];
    for(var x in hand){
      if(isPonOrKan(x) && x[0] == haku){
        count.add(x);
      }
    }

    return count.length == 1;
  }
}
