import 'package:hello/Mahjong/constants.dart';

import '../../utils.dart';

class Paarenchan{
  int yakuId;
  int tenhouId = 37;

  String name = 'Paarenchan';

  int? hanOpen = 13;
  int hanClosed = 13;
  int count = 0;

  setPaarenchanCount(int count){
    hanOpen = 13 * count;
    hanClosed = 13 * count;
    this.count = count;
  }

  bool isYakuman = true;

  Paarenchan(this.yakuId);

  isConditionMet(List hand){
    return true;
  }
}