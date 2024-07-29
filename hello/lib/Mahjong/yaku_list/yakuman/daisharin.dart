import 'package:hello/Mahjong/constants.dart';

import '../../utils.dart';

class Daisharin{
  int yakuId;
  String name = 'Daisharin';

  int? hanOpen = null;
  int hanClosed = 13;

  bool isYakuman = true;

  Daisharin(this.yakuId);

  isConditionMet(List hand){
    return false;
  }
}