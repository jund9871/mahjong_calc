import 'package:hello/Mahjong/constants.dart';

import '../../utils.dart';

class RenhouYakuman{
  int yakuId;

  String name = 'Renhou (yakuman)';

  int? hanOpen = null;
  int hanClosed = 13;

  bool isYakuman = true;

  RenhouYakuman(this.yakuId);

  isConditionMet(List hand){
    return true;
  }
}