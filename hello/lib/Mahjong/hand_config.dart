

import 'package:hello/Mahjong/constants.dart';
import 'package:hello/Mahjong/yaku_config.dart';

class handConstants{
  int kazoeLimited = 0;
  int kazoeSanbaiman = 1;
  int kazoeNoLimit = 2;
}

class optionalRules{
  bool hasOpenTanyao = false;
  bool hasAkaDora = false;
  bool hasDoubleYakuman = true;
  int kazoeLimit = handConstants().kazoeLimited;
  bool kiriage = false;
  bool fuForOpenPinfu = true;
  bool fuForPinfuTsumo = false;
  bool renhouAsYakuman = false;
  bool hasDaisharin = false;
  bool hasDaisharinOtherSuits = false;
  bool hasDaichisei = false;
  bool hasSashikomiYakuman = false;
  bool limitToSextupleYakuman = true;
  bool paarenchanNeeddsYaku = true;
}

class handConfig extends handConstants{
  var yaku = yakuConfig();
  var options = optionalRules();

  bool isTsumo = true;
  bool isRiichi = false;
  bool isIppatsu = false;
  bool isRinshan = false;
  bool isChankan = false;
  bool isHaitei = false;
  bool isHoutei = false;
  bool isDaburuRiichi = false;
  bool isNagashiMangan = false;
  bool isTenhou = false;
  bool isRenhou = false;
  bool isChiihou = false;
  bool isOpenRiichi = false;


  int playerWind = east;
  int roundWind = east;
  late bool isDealer;
  int paarenchan = 0;

  int kyoutakuNumber = 0;
  int tsumiNumber = 0;

  handConfig(){
    isDealer = playerWind == east;
  }
}