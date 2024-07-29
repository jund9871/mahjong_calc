import 'package:hello/Mahjong/constants.dart';

import '../../meld.dart';
import '../../utils.dart';

class DaburuChuurenPoutou{
  int yakuId;
  int tenhouId = 46;
  String name = 'Daburu Chuuren Poutou';

  int? hanOpen = null;
  int hanClosed = 26;

  bool isYakuman = true;

  DaburuChuurenPoutou(this.yakuId);

  isConditionMet(List hand){
    return true;
  }
}