import 'package:hello/Mahjong/constants.dart';

class AkaDora{
  int yakuId;
  int tenhouId = 54;
  String name = 'Aka Dora';

  int? hanOpen = 1;
  int hanClosed = 1;

  bool isYakuman = false;

  AkaDora(this.yakuId);

  isConditionMet(List hand){
    return true;
  }
}
