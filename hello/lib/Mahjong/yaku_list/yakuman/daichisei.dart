import 'package:hello/Mahjong/constants.dart';

import '../../utils.dart';

class Daichisei{
  int yakuId;
  String name = 'Daichisei';

  int? hanOpen = null;
  int hanClosed = 13;

  bool isYakuman = true;

  Daichisei(this.yakuId);

  isConditionMet(List hand){
    return false;
  }
}