import 'package:hello/Mahjong/constants.dart';

import '../../meld.dart';
import '../../utils.dart';

class SuuankouTanki{
  int yakuId;
  int tenhouId = 40;
  String name = 'Suu Ankou Tanki';

  int? hanOpen = null;
  int hanClosed = 26;

  bool isYakuman = true;

  SuuankouTanki(this.yakuId);

  isConditionMet(List hand){
    return true;
  }
}