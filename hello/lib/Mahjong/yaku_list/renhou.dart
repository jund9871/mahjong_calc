class Renhou{
  int yakuId;
  int tenhouId = 36;
  String name = 'Renhou';

  int? hanOpen = null;
  int hanClosed = 5;

  bool isYakuman = false;

  Renhou(this.yakuId);

  isConditionMet(List hand){
    return true;
  }
}
