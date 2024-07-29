import 'package:hello/Mahjong/constants.dart';

import '../../utils.dart';

class Chiihou{
  int yakuId;
  int tenhouId = 38;

  String name = 'Chiihou';

  int? hanOpen = null;
  int hanClosed = 13;

  bool isYakuman = true;

  Chiihou(this.yakuId);

  isConditionMet(List hand){
    return true;
  }
}