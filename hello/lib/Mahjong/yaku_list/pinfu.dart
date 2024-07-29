class Pinfu{
  int yakuId;
  int tenhouId = 7;
  String name = 'Pinfu';

  int? hanOpen = null;
  int hanClosed = 1;

  bool isYakuman = false;

  Pinfu(this.yakuId);

  isConditionMet(List hand){
    return true;
  }
}
