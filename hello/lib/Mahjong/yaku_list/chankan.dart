class Chankan{
  int yakuId;
  int tenhouId = 3;
  String name = 'Chankan';

  int hanOpen = 1;
  int hanClosed = 1;

  bool isYakuman = false;

  Chankan(this.yakuId);

  isConditionMet(List hand){
    return true;
  }
}
