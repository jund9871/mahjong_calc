import 'package:flutter/foundation.dart';
import '../utils.dart';

class Sanankou{
  int yakuId;
  int tenhouId = 29;
  String name = 'San Ankou';

  int? hanOpen = 2;
  int hanClosed = 2;

  bool isYakuman = false;

  Sanankou(this.yakuId);

  isConditionMet(List hand, int winTile, List melds, bool isTsumo){
    winTile ~/= 4;


    List openSets = [];
    for(var x in melds){
      if(x.opened){
        openSets.add(x.tiles34());
      }
    }

    List chiSets = [];
    List ponSets = [];
    for(List x in hand){
      if(isChi(x) && x.contains(winTile) && !openSets.contains(x)){
        chiSets.add(x);
      }
      if(isPonOrKan(x)){
        ponSets.add(x);
      }
    }

    List closedPonSets = [];
    for(List item in ponSets){
      for(int i = 0; i<openSets.length; i++){
        if(listEquals(openSets[i], item)){
          continue;
        }
      }

      if(item.contains(winTile) && !isTsumo && chiSets.isEmpty){
        continue;
      }

      closedPonSets.add(item);
    }

    return closedPonSets.length == 3;
  }
}
