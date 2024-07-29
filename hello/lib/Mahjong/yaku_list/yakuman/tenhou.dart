import 'package:hello/Mahjong/constants.dart';

import '../../utils.dart';

class Tenhou{
  int yakuId;
  int tenhouId = 37;

  String name = 'Tenhou';

  int? hanOpen = null;
  int hanClosed = 13;

  bool isYakuman = true;

  Tenhou(this.yakuId);

  isConditionMet(List hand){
    return true;
  }
}