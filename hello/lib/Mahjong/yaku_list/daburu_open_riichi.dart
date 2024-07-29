class DaburuOpenRiichi{
  int yakuId;
  String name = 'Double Open Riichi';

  int? hanOpen = null;
  int hanClosed = 3;

  bool isYakuman = false;

  DaburuOpenRiichi(this.yakuId);

  isConditionMet(List hand){
    return true;
  }
}
