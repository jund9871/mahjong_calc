import 'package:hello/Mahjong/constants.dart';

import '../utils.dart';

class Chinitsu{
  int yakuId;
  int tenhouId = 35;
  String name = 'Chinitsu';

  int? hanOpen = 5;
  int hanClosed = 6;

  bool isYakuman = false;

  Chinitsu(this.yakuId);

  isConditionMet(List hand){
    int honorSets = 0;
    int souSets = 0;
    int pinSets = 0;
    int manSets = 0;
    for(var item in hand){
      if(honorIndices.contains(item[0])){
        honorSets++;
      }

      if(isSou(item[0])){
        souSets++;
      }else if(isPin(item[0])){
        pinSets++;
      }else if(isMan(item[0])){
        manSets++;
      }
    }

    List sets = [souSets, pinSets, manSets];
    bool onlyOneSuit = false;
    List count = [];
    for(var x in sets){
      if(x != 0){
        count.add(x);
      }
    }
    onlyOneSuit = count.length == 1;

    return onlyOneSuit && honorSets != 0;
  }
}
