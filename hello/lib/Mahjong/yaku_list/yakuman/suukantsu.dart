import '../../meld.dart';
import '../../utils.dart';

class Suukantsu{
  int yakuId;
  int tenhouId = 51;
  String name = 'Suu Kantsu';

  int? hanOpen = 13;
  int hanClosed = 13;

  bool isYakuman = true;

  Suukantsu(this.yakuId);

  isConditionMet(List hand, List melds){
    List kanSets = [];

    Meld meld = Meld('', []);
    for(var x in melds){
      if(x.meldType == meld.kan || x.meldType == meld.shouminkan){
        kanSets.add(x);
      }
    }

    return kanSets.length == 4;
  }
}
