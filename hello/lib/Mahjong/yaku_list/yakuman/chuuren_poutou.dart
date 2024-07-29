import '../../utils.dart';

class ChuurenPoutou{
  int yakuId;
  int tenhouId = 45;
  String name = 'Chuuren Poutou';

  int? hanOpen = null;
  int hanClosed = 13;

  bool isYakuman = true;

  ChuurenPoutou(this.yakuId);

  isConditionMet(List hand){
    int souSets = 0;
    int pinSets = 0;
    int manSets = 0;
    int honorSets = 0;
    for(var item in hand){
      if(isSou(item[0])){
        souSets++;
      }else if(isPin(item[0])){
        pinSets++;
      }else if(isMan(item[0])){
        manSets++;
      }else{
        honorSets++;
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
    if(!onlyOneSuit || honorSets > 0){
      return false;
    }

    List indices = hand.reduce((value, element) => value + element);
    List temp = [];
    List indicesCount = [];
    for(var x in indices){
      temp.add(simplify(x));
      if(x == 0){
        indicesCount.add(x);
      }
    }
    indices = temp;

    if(indicesCount.length < 3){
      return false;
    }
    indicesCount = [];
    for(var x in indices){
      if(x == 8){
        indicesCount.add(x);
      }
    }

    if(indicesCount.length < 3){
      return false;
    }

    indices.remove(0);
    indices.remove(0);
    indices.remove(8);
    indices.remove(8);
    for(var x in List.generate(9, (index) => index)){
      if(indices.contains(x)){
        indices.remove(x);
      }
    }

    if(indices.length == 1){
      return true;
    }

    return false;
  }
}
