import 'package:hello/Mahjong/constants.dart';

import '../../utils.dart';

class Sashikomi{
  int yakuId;

  String name = 'Sashikomi';

  int? hanOpen = null;
  int hanClosed = 13;

  bool isYakuman = true;

  Sashikomi(this.yakuId);

  isConditionMet(List hand){
    return true;
  }
}