import 'package:hello/Mahjong/constants.dart';

class Honroto{
  int yakuId;
  int tenhouId = 31;
  String name = 'Honroutou';

  int? hanOpen = 2;
  int hanClosed = 2;

  bool isYakuman = false;

  Honroto(this.yakuId);

  isConditionMet(List hand){
    List<int> indices = [];
    for(var item in hand){
      for(int j = 0; j < item.length; j++){
        indices.add(item[j]);
      }
    }
   List result = honorIndices + terminalIndices;

   int count = 0;
  for(var x in indices){
    if(result.contains(x)){
      count++;
      if(count == indices.length){
        return true;
      }
    }
  }
    return false;
  }
}
