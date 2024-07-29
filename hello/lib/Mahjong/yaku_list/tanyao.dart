import 'package:hello/Mahjong/constants.dart';

class Tanyao{
  int yakuId;
  int tenhouId = 8;
  String name = 'Tanyao';

  int? hanOpen = 1;
  int hanClosed = 1;

  bool isYakuman = false;

  Tanyao(this.yakuId);

  isConditionMet(List hand){
    // List indices = hand.reduce((value, element) => value + element); error
    List<int> indices = [];
    for(var item in hand){
      for(int j = 0; j < item.length; j++){
        indices.add(item[j]);
      }
    }
    List<int> result = terminalIndices + honorIndices;

    for(var x in indices){
      if(result.contains(x)){
        return false;
      }
    }
    return true;
  }
}
