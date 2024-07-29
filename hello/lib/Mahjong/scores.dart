import 'dart:math';

import 'hand_config.dart';

class ScoresCalculator{
  calculateScores(int han, int fu, handConfig config, {bool isYakuman = false}){
    String yakuLevel = '';
    int rounded = 0;
    int extraHan = 0;
    int remain = 0;
    int doubleRounded = 0;
    int fourRounded = 0;
    int sixRounded = 0;
    int basePoints = 0;

    bool isKiriage = false;

    int main = 0;
    int mainBonus = 0;
    int additional = 0;
    int additionalBonus = 0;
    int kyoutakuBonus = 0;

    int total = 0;

    handConstants constants = handConstants();

    if(han >= 13 && !isYakuman){
      if(config.options.kazoeLimit == constants.kazoeLimited){
        han = 13;
        yakuLevel = 'kazoe yakuman';
      }else if(config.options.kazoeLimit == constants.kazoeSanbaiman){
        han = 12;
        yakuLevel = 'kazoe sanbaiman';
      }
    }

    if(han >= 5){
      if(han >= 78){
        yakuLevel = '6x yakuman';
        if(config.options.limitToSextupleYakuman){
          rounded = 48000;
        }else{
          extraHan = (han - 78) ~/ 13;
          remain = (han - 78) % 13;
          rounded = 48000 + (extraHan * 8000);
        }
      }else if(han >= 65){
        yakuLevel = '5x yakuman';
        rounded = 40000;
      }else if(han >= 52){
        yakuLevel = '4x yakuman';
        rounded = 32000;
      }else if(han >= 39){
        yakuLevel = '3x yakuman';
        rounded = 24000;
      }else if(han >= 26){
        yakuLevel = '2x yakuman';
        rounded = 16000;
      }else if(han >= 13){
        yakuLevel = 'yakuman';
        rounded = 8000;
      }else if(han >= 11){
        yakuLevel = 'sanbaiman';
        rounded = 6000;
      }else if(han >= 8){
        yakuLevel = 'baiman';
        rounded = 4000;
      }else if(han >= 6){
        yakuLevel = 'haneman';
        rounded = 3000;
      }else{
        yakuLevel = 'mangen';
        rounded = 2000;
      }

      doubleRounded = rounded * 2;
      fourRounded = doubleRounded * 2;
      sixRounded = doubleRounded * 3;
    }else{
      basePoints = (fu * pow(2, 2 + han)) as int;
      rounded = (basePoints + 99) ~/ 100 * 100;
      doubleRounded = (2 * basePoints + 99) ~/ 100 * 100;
      fourRounded = (4 * basePoints + 99) ~/ 100 * 100;
      sixRounded = (6 * basePoints + 99) ~/ 100 * 100;

      if(config.options.kiriage){
        if((han == 4 && fu == 30) || (han == 3 && fu == 60)){
          yakuLevel = 'kiriage mangan';
          isKiriage = true;
        }
      }else{
        if(rounded > 2000){
          yakuLevel = 'mangan';
        }
      }

      if(rounded > 2000 || isKiriage){
        rounded = 2000;
        doubleRounded = rounded * 2;
        fourRounded = doubleRounded * 2;
        sixRounded = doubleRounded * 3;
      }else{
        //pass
      }
    }

    if(config.isTsumo){
      main = doubleRounded;
      mainBonus = 100 * config.tsumiNumber;
      additionalBonus = mainBonus;

      if(config.isDealer){
        additional = main;
      }else{
        additional = rounded;
      }
    }else{
      additional = 0;
      additionalBonus = 0;
      mainBonus = 300 * config.tsumiNumber;

      if(config.isDealer){
        main = sixRounded;
      }else{
        main = fourRounded;
      }
    }

    kyoutakuBonus = 1000 * config.kyoutakuNumber;
    total = (main + mainBonus) + 2 * (additional + additionalBonus) + kyoutakuBonus;

    if(config.isNagashiMangan){
      yakuLevel = 'nagashi mangan';
    }

    Map retDict = {
      'main': main,
      'mainBonus': mainBonus,
      'additional': additional,
      'additionalBonus': additionalBonus,
      'kyoutakuBonus': kyoutakuBonus,
      'total': total,
      'yakuLevel': yakuLevel,
    };

    return retDict;
  }
}

class Aotenjou extends ScoresCalculator{
  calculateScores(int han, int fu, handConfig config, {bool isYakuman = false}){
    int basePoints = fu * pow(2, 2 + han) as int;
    int rounded = (basePoints + 99) ~/ 100 * 100;
    var doubleRounded = (2 * basePoints + 99) ~/ 100 * 100;
    int fourRounded = (4 * basePoints + 99) ~/ 100 * 100;
    int sixRounded = (6 * basePoints + 99) ~/ 100 * 100;

    if(config.isTsumo){
      return {'main': doubleRounded, 'additional': config.isDealer ? doubleRounded : rounded};
    }else{
      return {'main': config.isDealer ? sixRounded : fourRounded, 'additional': 0};
    }
  }

  aotenjouFilterYaku(List handYaku, handConfig config){
    if(handYaku.contains(config.yaku.daisangen)){
      handYaku.remove(config.yaku.chun);
      handYaku.remove(config.yaku.hatsu);
      handYaku.remove(config.yaku.haku);
      handYaku.remove(config.yaku.shosangen);
    }

    if(handYaku.contains(config.yaku.tsuuiisou)){
      handYaku.remove(config.yaku.toitoi);
      handYaku.remove(config.yaku.honroto);
    }

    if(handYaku.contains(config.yaku.shousuushii)){
      //pass
    }

    if(handYaku.contains(config.yaku.daiSuushii)){
      handYaku.remove(config.yaku.toitoi);
    }

    if(handYaku.contains(config.yaku.suuankou) || handYaku.contains(config.yaku.suuankouTanki)){
      if(handYaku.contains(config.yaku.toitoi)){
        handYaku.remove(config.yaku.toitoi);
      }
    }

    if(handYaku.contains(config.yaku.chinroutou)){
      handYaku.remove(config.yaku.toitoi);
      handYaku.remove(config.yaku.honroto);
    }

    if(handYaku.contains(config.yaku.suukantsu)){
      if(handYaku.contains(config.yaku.toitoi)){
        handYaku.remove(config.yaku.toitoi);
      }
    }

    if(handYaku.contains(config.yaku.chuurenPoutou) || handYaku.contains(config.yaku.daburuChuurenPoutou)){
      handYaku.remove(config.yaku.chinitsu);
    }

    if(handYaku.contains(config.yaku.daisharin)){
      handYaku.remove(config.yaku.chinitsu);
      if(handYaku.contains(config.yaku.pinfu)){
        handYaku.remove(config.yaku.pinfu);
      }
      handYaku.remove(config.yaku.tanyao);
      if(handYaku.contains(config.yaku.ryanpeiko)){
        handYaku.remove(config.yaku.ryanpeiko);
      }
      if(handYaku.contains(config.yaku.chiitoitsu)){
        handYaku.remove(config.yaku.chiitoitsu);
      }
    }

    if(handYaku.contains(config.yaku.ryuuiisou)){
      if(handYaku.contains(config.yaku.honitsu)){
        handYaku.remove(config.yaku.honitsu);
      }
    }
  }
}