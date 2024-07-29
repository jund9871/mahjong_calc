class Riichi{
  int yakuId;
  int tenhouId = 1;
  String name = 'Riichi';

  int? hanOpen = null;
  int hanClosed = 1;

  bool isYakuman = false;

  Riichi(this.yakuId);

  isConditionMet(List hand){
    return true;
  }
}
