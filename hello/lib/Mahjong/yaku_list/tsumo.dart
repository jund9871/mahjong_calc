class Tsumo{
  int yakuId;
  int tenhouId = 0;
  String name = 'Menzen Tsumo';

  int? hanOpen = null;
  int hanClosed = 1;

  bool isYakuman = false;

  Tsumo(this.yakuId);

  isConditionMet(List hand){
    return true;
  }
}
