import '../meld.dart';
import '../utils.dart';

class SanKantsu{
  int yakuId;
  int tenhouId = 27;
  String name = 'San Kantsu';

  int? hanOpen = 2;
  int hanClosed = 2;

  bool isYakuman = false;

  SanKantsu(this.yakuId);

  isConditionMet(List hand, List melds){
    List kanSets = [];
    Meld meld = Meld('', []);

    for(var x in melds){
      if(x.meldType == meld.kan || x.meldType == meld.shouminkan){
        kanSets.add(x);
      }
    }

    return kanSets.length == 3;
  }
}
