import '../utils.dart';

class Chiitoitsu{
  int yakuId;
  int tenhouId = 22;
  String name = 'Chiitoitsu';

  int? hanOpen = null;
  int hanClosed = 2;

  bool isYakuman = false;

  Chiitoitsu(this.yakuId);

  isConditionMet(List hand){
    return hand.length == 7;
  }
}
