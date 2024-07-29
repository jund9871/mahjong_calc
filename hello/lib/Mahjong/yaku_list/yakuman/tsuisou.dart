import 'package:hello/Mahjong/constants.dart';

import '../../meld.dart';
import '../../utils.dart';

class Tsuuiisou{
  int yakuId;
  int tenhouId = 42;
  String name = '자일색';

  int? hanOpen = 13;
  int hanClosed = 13;

  bool isYakuman = true;

  Tsuuiisou(this.yakuId);

  isConditionMet(List hand){
    List<int> indices = [];
    for(var item in hand){
      for(int j = 0; j < item.length; j++){
        indices.add(item[j]);
      }
    }

    int count = 0;
    for(var x in indices){
      if(honorIndices.contains(x)){
        count++;
        if(count == indices.length){
          return true;
        }
      }
    }

    return false;
  }
}
