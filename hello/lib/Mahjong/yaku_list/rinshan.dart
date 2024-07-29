class Rinshan{
  int yakuId;
  int tenhouId = 4;
  String name = 'Rinshan kaihou';

  int hanOpen = 1;
  int hanClosed = 1;

  bool isYakuman = false;

  Rinshan(this.yakuId);

  isConditionMet(List hand){
    return true;
  }
}
