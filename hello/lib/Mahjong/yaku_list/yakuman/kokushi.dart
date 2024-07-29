import '../../utils.dart';

class KokushiMusou{
  int yakuId;
  int tenhouId = 47;
  String name = 'Kokushi Musou';

  int? hanOpen = null;
  int hanClosed = 13;

  bool isYakuman = true;

  KokushiMusou(this.yakuId);

  isConditionMet(List tiles34){
    if(
    tiles34[0]
    * tiles34[8]
    * tiles34[9]
    * tiles34[17]
    * tiles34[18]
    * tiles34[26]
    * tiles34[27]
    * tiles34[28]
    * tiles34[29]
    * tiles34[30]
    * tiles34[31]
    * tiles34[32]
    * tiles34[33]
    == 2
    ){
      return true;
    }

    return false;
  }
}
