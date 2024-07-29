class DaburuRiichi{
  int yakuId;
  int tenhouId = 21;
  String name = 'Double Riichi';

  int? hanOpen = null;
  int hanClosed = 2;

  bool isYakuman = false;

  DaburuRiichi(this.yakuId);

  isConditionMet(List hand){
    return true;
  }
}
