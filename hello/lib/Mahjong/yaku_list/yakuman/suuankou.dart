import '../../utils.dart';

class Suuankou{
  int yakuId;
  int tenhouId = 41;
  String name = 'Suu Ankou';

  int? hanOpen = null;
  int hanClosed = 13;

  bool isYakuman = true;

  Suuankou(this.yakuId);

  isConditionMet(List hand, int winTile, bool isTsumo){
    winTile ~/= 4;
    List closedHand = [];
    for(List item in hand){
      if(isPonOrKan(item) && item.contains(winTile) && !isTsumo){
        continue;
      }

      closedHand.add(item);
    }

    int countOfPon = 0;
    List count = [];
    for(var i in closedHand){
      if(isPonOrKan(i)){
        count.add(i);
      }
    }
    countOfPon = count.length;

    return countOfPon == 4;
  }
}
