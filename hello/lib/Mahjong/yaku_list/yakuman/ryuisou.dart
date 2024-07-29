import 'package:hello/Mahjong/constants.dart';

import '../../utils.dart';

class Ryuuiisou{
  int yakuId;
  int tenhouId = 43;
  String name = 'Ryuuiisou';

  int? hanOpen = 13;
  int hanClosed = 13;

  bool isYakuman = true;

  Ryuuiisou(this.yakuId);

  isConditionMet(List hand){
    List greenIndices = [19, 20, 21, 23, 25, hatsu];
    List<int> indices = [];
    for(var item in hand){
      for(int j = 0; j < item.length; j++){
        indices.add(item[j]);
      }
    }

    int count = 0;
    for(var x in indices){
      if(greenIndices.contains(x)){
        count++;
        if(count == indices.length){
          return true;
        }
      }
    }

    return false;
  }
}
