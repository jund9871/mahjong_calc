import '../utils.dart';

class Toitoi{
  int yakuId;
  int tenhouId = 28;
  String name = 'Toitoi';

  int? hanOpen = 2;
  int hanClosed = 2;

  bool isYakuman = false;

  Toitoi(this.yakuId);

  isConditionMet(List hand){
    List countOfPon = [];
    for(var i in hand){
      if(isPonOrKan(i)){
        countOfPon.add(i);
      }
    }

    return countOfPon.length == 4;
  }
}
