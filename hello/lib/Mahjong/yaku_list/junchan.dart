import '../constants.dart';
import '../utils.dart';

class Junchan{
  int yakuId;
  int tenhouId = 33;
  String name = 'Junchan';

  int? hanOpen = 2;
  int hanClosed = 3;

  bool isYakuman = false;

  Junchan(this.yakuId);

  isConditionMet(List hand){
    tileInIndices(List itemSet, List indicesArray){
      for(var x in itemSet){
        if(indicesArray.contains(x)){
          return true;
        }
      }
      return false;
    }

    int terminalSets = 0;
    int countOfchi = 0;
    for(var item in hand){
      if(isChi(item)){
        countOfchi++;
      }

      if(tileInIndices(item, terminalIndices)){
        terminalSets++;
      }
    }

    if(countOfchi == 0){
      return false;
    }

    return terminalSets == 5;
  }
}
