import '../utils.dart';

class Iipeiko{
  int yakuId;
  int tenhouId = 9;
  String name = 'Iipeiko';

  int? hanOpen = null;
  int hanClosed = 1;

  bool isYakuman = false;

  Iipeiko(this.yakuId);

  isConditionMet(List hand){
    List chiSets = [];
    for(var i in hand){
      if(isChi(i)){
        chiSets.add(i);
      }
    }

    int countOfIdenticalChi = 0;
    for(var x in chiSets){
      int count = 0;
      for(var y in chiSets){
        if(x == y){
          count += 1;
        }
      }
      if(count > countOfIdenticalChi){
        countOfIdenticalChi = count;
      }
    }

    return countOfIdenticalChi >= 2;
  }
}
