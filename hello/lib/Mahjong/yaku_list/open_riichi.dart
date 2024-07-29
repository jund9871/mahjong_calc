class OpenRiichi{
  int yakuId;
  String name = 'Open Riichi';

  int? hanOpen = null;
  int hanClosed = 2;

  bool isYakuman = false;

  OpenRiichi(this.yakuId);

  isConditionMet(List hand){
    return true;
  }
}
