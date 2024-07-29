class YakuhaiOfRound{
  int yakuId;
  int tenhouId = 11;
  String name = 'Yakuhai (wind of round)';

  int? hanOpen = 1;
  int hanClosed = 1;

  bool isYakuman = false;

  YakuhaiOfRound(this.yakuId);

  isConditionMet(List hand){
    return true;
  }
}