import 'package:hello/Mahjong/constants.dart';

class Dora{
  int yakuId;
  int tenhouId = 52;
  String name = 'Dora';

  int? hanOpen = 1;
  int hanClosed = 1;

  bool isYakuman = false;

  Dora(this.yakuId);

  isConditionMet(List hand) {
    return true;
  }
}
