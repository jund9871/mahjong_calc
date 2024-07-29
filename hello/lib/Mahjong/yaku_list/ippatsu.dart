class Ippatsu{
  int yakuId;
  int tenhouId = 2;
  String name = 'Ippatsu';

  int? hanOpen = null;
  int hanClosed = 1;

  bool isYakuman = false;

  Ippatsu(this.yakuId);

  isConditionMet(List hand){
    return true;
  }
}
