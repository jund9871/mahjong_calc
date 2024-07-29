class Houtei{
  int yakuId;
  int tenhouId = 6;
  String name = 'Houtei Raoyui';

  int hanOpen = 1;
  int hanClosed = 1;

  bool isYakuman = false;

  Houtei(this.yakuId);

  isConditionMet(List hand){
    return true;
  }
}
