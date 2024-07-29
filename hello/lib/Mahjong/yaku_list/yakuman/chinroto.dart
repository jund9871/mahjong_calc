import 'package:hello/Mahjong/constants.dart';

import '../../meld.dart';
import '../../utils.dart';

class Chinroutou{
  int yakuId;
  int tenhouId = 44;
  String name = 'Chinroutou';

  int? hanOpen = 13;
  int hanClosed = 13;

  bool isYakuman = true;

  Chinroutou(this.yakuId);

  isConditionMet(List hand){
    List<int> indices = [];
    for(var item in hand){
      for(int j = 0; j < item.length; j++){
        indices.add(item[j]);
      }
    }

    int count = 0;
    for(var x in indices){
      if(terminalIndices.contains(x)){
        count++;
        if(count == indices.length){
          return true;
        }
      }
    }

    return false;
  }
}
