class NagashiMangan{
  int yakuId;
  String name = 'Nagashi Mangan';

  int? hanOpen = 5;
  int hanClosed = 5;

  bool isYakuman = false;

  NagashiMangan(this.yakuId);

  isConditionMet(List hand){
    return true;
  }
}
