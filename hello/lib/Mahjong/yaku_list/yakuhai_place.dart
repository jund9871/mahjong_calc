class YakuhaiOfPlace{
  int yakuId;
  int tenhouId = 10;
  String name = 'Yakuhai (wind of place)';

  int? hanOpen = 1;
  int hanClosed = 1;

  bool isYakuman = false;

  YakuhaiOfPlace(this.yakuId);

  isConditionMet(List hand){
    return true;
  }
}
