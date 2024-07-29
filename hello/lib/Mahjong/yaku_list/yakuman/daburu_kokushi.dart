import 'package:hello/Mahjong/constants.dart';

import '../../meld.dart';
import '../../utils.dart';

class DaburuKokushiMusou{
  int yakuId;
  int tenhouId = 48;
  String name = 'Kokushi Musou Juusanmen Matchi';

  int? hanOpen = null;
  int hanClosed = 26;

  bool isYakuman = true;

  DaburuKokushiMusou(this.yakuId);

  isConditionMet(List hand){
    return true;
  }
}
