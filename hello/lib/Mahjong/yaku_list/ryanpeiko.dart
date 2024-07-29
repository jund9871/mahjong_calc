import '../utils.dart';

class Ryanpeikou{
  int yakuId;
  int tenhouId = 32;
  String name = 'Ryanpeikou';

  int? hanOpen = null;
  int hanClosed = 3;

  bool isYakuman = false;

  Ryanpeikou(this.yakuId);

  isConditionMet(List hand){
    List chiSets = [];
    for(var i in hand){
      if(isChi(i)){
        chiSets.add(i);
      }
    }
    List countOfIdenticalChi = [];
    for(var x in chiSets){
      int count = 0;
      for(var y in chiSets){
        if(x == y){
          count++;
        }
      }
      countOfIdenticalChi.add(count);
    }

    List count = [];
    for(var x in countOfIdenticalChi){
      if(x >= 2){
        count.add(x);
      }
    }

    return count.length == 4;
  }
}
