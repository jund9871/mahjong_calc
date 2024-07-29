import 'package:hello/Mahjong/constants.dart';

import '../utils.dart';

class Honitsu{
  int yakuId;
  int tenhouId = 34;
  String name = 'Honitsu';

  int? hanOpen = 2;
  int hanClosed = 3;

  bool isYakuman = false;

  Honitsu(this.yakuId);

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
