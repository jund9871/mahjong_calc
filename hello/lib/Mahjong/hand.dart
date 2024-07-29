

import 'package:hello/Mahjong/agari.dart';
import 'package:hello/Mahjong/constants.dart';
import 'package:hello/Mahjong/devider.dart';
import 'package:hello/Mahjong/fu.dart';
import 'package:hello/Mahjong/hand_config.dart';
import 'package:hello/Mahjong/hand_response.dart';
import 'package:hello/Mahjong/scores.dart';
import 'package:hello/Mahjong/tile.dart';
import 'package:hello/Mahjong/utils.dart';

import 'meld.dart';

class handCalculator{
  String errNoWinningTile = 'winning_tile_not_in_hand';
  String errOpenHandRiichi = 'open_hand_riichi_not_allowed';
  String errOpenHandDaburi = 'open_hand_daburi_not_allowed';
  String errIppatsuWithoutRiichi = 'ippatsu_without_riichi_not_allowed';
  String errHandNotWinning = 'hand_not_winning';
  String errHandNotCorrect = 'hand_not_correct';
  String errNoYaku = 'no_yaku';
  String errChankanWithTsumo = 'chankan_with_tsumo_not_allowed';
  String errRinshanWithoutTsumo = 'rinshan_without_tsumo_not_allowed';
  String errHaiteiWithoutTsumo = 'haitei_without_tsumo_not_allowed';
  String errHouteiWithTsumo = 'houtei_with_tsumo_not_allowed';
  String errHaiteiWithRinshan = 'haitei_with_rinshan_not_allowed';
  String errHouteiWithChankan = 'houtei_with_chankan_not_allowed';
  String errTenhouNotAsDealer = 'tenhou_not_as_dealer_not_allowed';
  String errTenhouWithoutTsumo = 'tenhou_without_tsumo_not_allowed';
  String errTenhouWithMeld = 'tenhou_with_meld_not_allowed';
  String errChiihouAsDealer = 'chiihou_as_dealer_not_allowed';
  String errChiihouWithoutTsumo = 'chiihou_without_tsumo_not_allowed';
  String errChiijouWithMeld = 'chiihou_with_meld_not_allowed';
  String errRenhouAsDealer = 'renhou_as_dealer_not_allowed';
  String errRenhouWithTsumo = 'renhou_with_tsumo_not_allowed';
  String errRenhouWithMeld = 'renhou_with_meld_not_allowed';

  HandDivider divider = HandDivider();

  estimateHandValue(List tiles, int winTile, List? melds, List<int> doraIndicators, {useHandDividerCache = false}){
    if(melds!.isEmpty){
      melds = [];
    }

    print('melds: $melds');

    if(doraIndicators.isEmpty){
      doraIndicators = [];
    }

    print('doraIndicators: $doraIndicators');

    handConfig config = handConfig();

    Agari agari = Agari();
    List handYaku = [];
    ScoresCalculator scoresCalculator = ScoresCalculator();
    List tiles34 = TilesConverter().to34Array(tiles);

    FuCalculator fuCalculator = FuCalculator();
    bool isAotenjou = scoresCalculator is Aotenjou;

    print('isAotenjou: $isAotenjou');

    List openedMelds = [];
    for(Meld x in melds){
      if(x.opened){
        openedMelds.add(x.tiles34());
      }
    }
    print(openedMelds);
    List allMelds = [];
    for(Meld x in melds){
      allMelds.add(x.tiles34());
    }
    print(allMelds);
    bool isOpenHand = openedMelds.isNotEmpty;
    print(isOpenHand);

    if(config.isNagashiMangan){
      handYaku.add(config.yaku.nagashiMangan);
      int fu = 30;
      int han = config.yaku.nagashiMangan.hanClosed;
      var cost = scoresCalculator.calculateScores(han, fu, config, isYakuman: false);
      return HandResponse(cost: cost, han: han, fu: fu, yaku: handYaku).str();
    }

    if(tiles.contains(winTile)){
      return HandResponse(error: errNoWinningTile).str();
    }

    if(config.isRiichi && !config.isDaburuRiichi && isOpenHand){
      return HandResponse(error: errOpenHandRiichi).str();
    }

    if(config.isDaburuRiichi && isOpenHand){
      return HandResponse(error: errOpenHandDaburi).str();
    }

    if(config.isIppatsu && !config.isRiichi && !config.isDaburuRiichi){
      return HandResponse(error: errIppatsuWithoutRiichi).str();
    }

    if(config.isChankan && config.isTsumo){
      return HandResponse(error: errChankanWithTsumo).str();
    }

    if(config.isRinshan && !config.isTsumo){
      return HandResponse(error: errRinshanWithoutTsumo).str();
    }

    if(config.isHaitei && !config.isTsumo){
      return HandResponse(error: errHaiteiWithoutTsumo).str();
    }

    if(config.isHoutei && config.isTsumo){
      return HandResponse(error: errHouteiWithTsumo).str();
    }

    if(config.isHaitei && config.isRinshan){
      return HandResponse(error: errHaiteiWithRinshan).str();
    }

    if(config.isHoutei && config.isChankan){
      return HandResponse(error: errHouteiWithChankan).str();
    }

    // if(config.isTenhou && config.playerWind != null && !config.isDealer){
    //   return HandResponse(error: errTenhouNotAsDealer).str();
    // }
    //
    // if(config.isTenhou && !config.isTsumo){
    //   return HandResponse(error: errTenhouWithoutTsumo).str();
    // }
    //
    // if(config.isTenhou && melds.isNotEmpty){
    //   return HandResponse(error: errTenhouWithMeld).str();
    // }

    // if(config.isChiihou && config.playerWind != null && config.isDealer){
    //   return HandResponse(error: errChiihouAsDealer).str();
    // }
    //
    // if(config.isChiihou && !config.isTsumo){
    //   return HandResponse(error: errChiihouWithoutTsumo).str();
    // }
    //
    // if(config.isChiihou && melds.isNotEmpty){
    //   return HandResponse(error: errChiijouWithMeld).str();
    // }

    // if(config.isRenhou && config.playerWind != null && config.isDealer){
    //   return HandResponse(error: errRenhouAsDealer).str();
    // }
    //
    // if(config.isRenhou && config.isTsumo){
    //   return HandResponse(error: errRenhouWithTsumo).str();
    // }
    //
    // if(config.isRenhou && melds.isNotEmpty){
    //   return HandResponse(error: errRenhouWithMeld).str();
    // }

    if(!agari.isAgari(List.from(tiles34), openSets34: allMelds)){ //리스트 복사 안하면 동기화당함
      return HandResponse(error: errHandNotWinning).str();
    }print('error!!!!!!!!!');

    if(!config.options.hasDoubleYakuman){
      config.yaku.daburuKokushiMusou.hanClosed = 13;
      config.yaku.suuankou.hanClosed = 13;
      config.yaku.daburuChuurenPoutou.hanClosed = 13;
      config.yaku.daiSuushii.hanClosed = 13;
      config.yaku.daiSuushii.hanOpen = 13;
    }

    List handOptions = divider.divideHand(List.from(tiles34), melds: melds);

    List calculatedHands = [];
    for(List hand in handOptions){
      bool isChiitoitsu = config.yaku.chiitoitsu.isConditionMet(hand);
      List valuedTiles = [haku, hatsu, chun, config.playerWind, config.roundWind];

      List winGroups = findWinGroups(winTile, hand, openedMelds);
      for(var winGroup in winGroups){
        var cost;
        var error;
        handYaku = [];
        int han = 0;

        List fuCal = fuCalculator.calculateFu(hand, winTile, winGroup, config, valuedTiles: valuedTiles, melds: melds);
        List fuDetails = fuCal[0];
        int fu = fuCal[1];

        bool isPinfu = fuDetails.length == 1 && !isChiitoitsu && !isOpenHand;

        List ponSets = [];
        List kanSets = [];
        List chiSets = [];
        for(var x in hand){
          if(isPon(x)){
            ponSets.add(x);
          }
          if(isKan(x)){
            kanSets.add(x);
          }
          if(isChi(x)){
            chiSets.add(x);
          }
        }

        if(config.isTsumo){
          if(!isOpenHand){
            handYaku.add(config.yaku.tsumo);
          }
        }

        if(isPinfu){
          handYaku.add(config.yaku.pinfu);
        }

        if(isChiitoitsu && isOpenHand){
          continue;
        }

        if(isChiitoitsu){
          handYaku.add(config.yaku.chiitoitsu);
        }

        // daisharin 안씀

        // daichisei 안씀

        bool isTanyao = config.yaku.tanyao.isConditionMet(List.from(hand));
        if(isOpenHand && !config.options.hasOpenTanyao){
          isTanyao = false;
        }

        if(isTanyao){
          handYaku.add(config.yaku.tanyao);
        }

        if(config.isRiichi && !config.isDaburuRiichi){
          if(config.isOpenRiichi){
            handYaku.add(config.yaku.openRiichi);
          }else{
            handYaku.add(config.yaku.riichi);
          }
        }

        if(config.isDaburuRiichi){
          if(config.isOpenRiichi){
            // handYaku.add(config.yaku.daburuOpenRiichi);
          }else{
            handYaku.add(config.yaku.daburuRiichi);
          }
        }

        // sashikomi 안씀

        if(config.isIppatsu){
          handYaku.add(config.yaku.ippatsu);
        }

        if(config.isRinshan){
          handYaku.add(config.yaku.rinshan);
        }

        if(config.isChankan){
          handYaku.add(config.yaku.chankan);
        }

        if(config.isHaitei){
          handYaku.add(config.yaku.haitei);
        }

        if(config.isHoutei){
          handYaku.add(config.yaku.houtei);
        }

        // renhou 안씀

        // tenhou 안씀

        // chiihou 안씀

        if(config.yaku.honitsu.isConditionMet(hand)){
          handYaku.add(config.yaku.honitsu);
        }

        if(config.yaku.chinitsu.isConditionMet(hand)){
          handYaku.add(config.yaku.chinitsu);
        }

        if(config.yaku.tsuuiisou.isConditionMet(hand)){
          handYaku.add(config.yaku.tsuuiisou);
        }

        if(config.yaku.honroto.isConditionMet(hand)){
          handYaku.add(config.yaku.honroto);
        }

        if(config.yaku.chinroutou.isConditionMet(hand)){
          handYaku.add(config.yaku.chinroutou);
        }

        if(config.yaku.ryuuiisou.isConditionMet(hand)){
          handYaku.add(config.yaku.ryuuiisou);
        }
        
        // paarenchan 안씀
        
        if(chiSets.isNotEmpty){
          if(config.yaku.chantai.isConditionMet(hand)){
            handYaku.add(config.yaku.chantai);
          }
          
          if(config.yaku.junchan.isConditionMet(hand)){
            handYaku.add(config.yaku.junchan);
          }
          
          if(config.yaku.ittsu.isConditionMet(hand)){
            handYaku.add(config.yaku.ittsu);
          }
          
          if(!isOpenHand){
            if(config.yaku.ryanpeiko.isConditionMet(hand)){
              handYaku.add(config.yaku.ryanpeiko);
            }else if(config.yaku.iipeiko.isConditionMet(hand)){
              handYaku.add(config.yaku.iipeiko);
            }
          }
          
          if(config.yaku.sanshoku.isConditionMet(hand)){
            handYaku.add(config.yaku.sanshoku);
          }
        }
        
        if(ponSets.isNotEmpty || kanSets.isNotEmpty){
          if(config.yaku.toitoi.isConditionMet(hand)){
            handYaku.add(config.yaku.toitoi);
          }
          
          if(config.yaku.sanankou.isConditionMet(hand, winTile, melds, config.isTsumo)){
            handYaku.add(config.yaku.sanankou);
          }

          if(config.yaku.sanshokuDoukou.isConditionMet(hand)){
            handYaku.add(config.yaku.sanshokuDoukou);
          }

          if(config.yaku.shosangen.isConditionMet(hand)){
            handYaku.add(config.yaku.shosangen);
          }

          if(config.yaku.haku.isConditionMet(hand)){
            handYaku.add(config.yaku.haku);
          }

          if(config.yaku.hatsu.isConditionMet(hand)){
            handYaku.add(config.yaku.hatsu);
          }

          if(config.yaku.chun.isConditionMet(hand)){
            handYaku.add(config.yaku.chun);
          }

          if(config.yaku.yakuhaiEast.isConditionMet(hand, config.playerWind, config.roundWind)){
            if(config.playerWind == east){
              handYaku.add(config.yaku.yakuhaiOfPlace);
            }

            if(config.roundWind == east){
              handYaku.add(config.yaku.yakuhaiOfRound);
            }
          }

          if(config.yaku.yakuhaiSouth.isConditionMet(hand, config.playerWind, config.roundWind)){
            if(config.playerWind == south){
              handYaku.add(config.yaku.yakuhaiOfPlace);
            }

            if(config.roundWind == south){
              handYaku.add(config.yaku.yakuhaiOfRound);
            }
          }

          if(config.yaku.yakuhaiWest.isConditionMet(hand, config.playerWind, config.roundWind)){
            if(config.playerWind == west){
              handYaku.add(config.yaku.yakuhaiOfPlace);
            }

            if(config.roundWind == west){
              handYaku.add(config.yaku.yakuhaiOfRound);
            }
          }

          if(config.yaku.yakuhaiNorth.isConditionMet(hand, config.playerWind, config.roundWind)){
            if(config.playerWind == north){
              handYaku.add(config.yaku.yakuhaiOfPlace);
            }

            if(config.roundWind == north){
              handYaku.add(config.yaku.yakuhaiOfRound);
            }
          }

          if(config.yaku.daisangen.isConditionMet(hand)){
            handYaku.add(config.yaku.daisangen);
          }

          if(config.yaku.shousuushii.isConditionMet(hand)){
            handYaku.add(config.yaku.shousuushii);
          }

          if(config.yaku.daiSuushii.isConditionMet(hand)){
            handYaku.add(config.yaku.daiSuushii);
          }

          if(melds.isEmpty && config.yaku.chuurenPoutou.isConditionMet(hand)){
            if(tiles34[winTile ~/ 4] == 2 || tiles34[winTile ~/ 4] == 4){
              handYaku.add(config.yaku.daburuChuurenPoutou);
            }else{
              handYaku.add(config.yaku.chuurenPoutou);
            }
          }

          if(!isOpenHand && config.yaku.suuankou.isConditionMet(hand, winTile, config.isTsumo)){
            if(tiles34[winTile ~/ 4] == 2){
              handYaku.add(config.yaku.suuankouTanki);
            }else{
              handYaku.add(config.yaku.suuankou);
            }
          }

          if(config.yaku.sankantsu.isConditionMet(hand, melds)){
            handYaku.add(config.yaku.sankantsu);
          }

          if(config.yaku.suukantsu.isConditionMet(hand, melds)){
            handYaku.add(config.yaku.suukantsu);
          }
        }

        if(config.paarenchan > 0 && config.options.paarenchanNeeddsYaku && handYaku.isNotEmpty){
          config.yaku.paarenchan.setPaarenchanCount(config.paarenchan);
          handYaku.add(config.yaku.paarenchan);
        }

        List yakumanList = [];
        for(var x in handYaku){
          if(x.isYakuman){
            yakumanList.add(x);
          }
        }
        if(yakumanList.isNotEmpty){
          if(!isAotenjou){
            handYaku = yakumanList;
          }else{
            scoresCalculator.aotenjouFilterYaku(handYaku, config);
            yakumanList = [];
          }
        }

        for(var item in handYaku){
          if(isOpenHand && item.hanOpen != null){
            int temp = item.hanOpen;
            han += temp;
          }else{
            int temp = item.hanClosed;
            han += temp;
          }
        }

        if(han == 0){
          error = handCalculator().errNoYaku;
          cost = null;
        }

        if(yakumanList.isEmpty){
          var tilesForDora = tiles;
          
          int countOfDora = 0;
          int countOfAkaDora = 0;

          for(var tile in tilesForDora){
            int temp = plusDora(tile, doraIndicators);
            countOfDora += temp;
          }

          for(var tile in tilesForDora){
            if(isAkaDora(tile, config.options.hasAkaDora)){
              countOfAkaDora += 1;
            }
          }

          if(countOfDora > 0){
            config.yaku.dora.hanOpen = countOfDora;
            config.yaku.dora.hanClosed = countOfDora;
            handYaku.add(config.yaku.dora);
            han += countOfDora;
          }

          if(countOfAkaDora > 0){
            config.yaku.akaDora.hanOpen = countOfAkaDora;
            config.yaku.akaDora.hanClosed = countOfAkaDora;
            handYaku.add(config.yaku.akaDora);
            han += countOfAkaDora;
          }
        }

        if(!isAotenjou && (config.options.limitToSextupleYakuman && han > 78)){
          han = 78;
        }

        if(fu == 0 && isAotenjou){
          fu = 40;
        }

        if(error == null){
          cost = scoresCalculator.calculateScores(han, fu, config, isYakuman:yakumanList.isNotEmpty);
        }

        Map<String, dynamic> calculatedHand = {
          'cost': cost,
          'error': error,
          'handYaku': handYaku,
          'han': han,
          'fu': fu,
          'fuDetails': fuDetails,
        };

        calculatedHands.add(calculatedHand);
      }
    }

    if(!isOpenHand && config.yaku.kokushiMusou.isConditionMet(List.from(tiles34))){
      if(tiles34[winTile ~/ 4] == 2){
        handYaku.add(config.yaku.daburuKokushiMusou);
      }else{
        handYaku.add(config.yaku.kokushiMusou);
      }

      if(!config.isTsumo && config.options.hasSashikomiYakuman){
        if(config.isRiichi && !config.isDaburuRiichi){
          if(config.isOpenRiichi){
            handYaku.add(config.yaku.sashikomi);
          }
        }

        if(config.isDaburuRiichi){
          if(config.isOpenRiichi){
            handYaku.add(config.yaku.sashikomi);
          }
        }
      }

      if(config.isRenhou && config.options.renhouAsYakuman){
        handYaku.add(config.yaku.renhouYakuman);
      }

      // if(config.isTenhou){
      //   handYaku.add(config.yaku.tenhou);
      // }

      // if(config.isChiihou){
      //   handYaku.add(config.yaku.chiihou);
      // }

      // if(config.paarenchan > 0){
      //   config.yaku.paarenchan.setPaarenchanCount(config.paarenchan);
      //   handYaku.add(config.yaku.paarenchan);
      // }

      // calculate han
      int han = 0;
      for(var item in handYaku){
        if(isOpenHand && item.hanOpen != null){
          int temp = item.hanOpen;
          han += temp;
        }else{
          int temp = item.hanClosed;
          han += temp;
        }
      }

      int fu = 0;
      if(isAotenjou){
        if(config.isTsumo){
          fu = 30;
        }else{
          fu = 40;
        }

        var tilesForDora = tiles;

        int countOfDora = 0;
        int countOfAkaDora = 0;

        for(var tile in tilesForDora){
          countOfDora += int.parse(plusDora(tile, doraIndicators));
        }

        for(var tile in tilesForDora){
          if(isAkaDora(tile, config.options.hasAkaDora)){
            countOfAkaDora += 1;
          }
        }

        if(countOfDora > 0){
          config.yaku.dora.hanOpen = countOfDora;
          config.yaku.dora.hanClosed = countOfDora;
          handYaku.add(config.yaku.dora);
          han += countOfDora;
        }

        if(countOfAkaDora > 0){
          config.yaku.akaDora.hanOpen = countOfAkaDora;
          config.yaku.akaDora.hanClosed = countOfAkaDora;
          handYaku.add(config.yaku.akaDora);
          han += countOfAkaDora;
        }
      }

      var cost = scoresCalculator.calculateScores(han, fu, config, isYakuman: handYaku.isNotEmpty);
      calculatedHands.add(
        {'cost': cost, 'error': null, 'handYaku': handYaku, 'han': han, 'fu': fu, 'fuDetils': []}
      );
    }

    if(calculatedHands.isEmpty){
      return HandResponse(error: handCalculator().errHandNotCorrect);
    }

    calculatedHands.sort((a, b) {
      int hanCompare = b['han'].compareTo(a['han']);
      if(hanCompare != 0){
        return hanCompare;
    }
      return b['fu'].compareTo(a['fu']);
    });

    List temp = [];

    for(var x in calculatedHands){
      if(x['han'] == calculatedHands[0]['han'] && x['fu'] == calculatedHands[0]['fu']){
        temp.add(x);
      }
    }

    // temp(calc hands) 리스트를 fuDetails의 fu합계를 기준으로 내림차순 정렬
    temp.sort((a, b) {
      int sumA = a['fuDetails'].fold(0, (sum, item) => sum + item['fu']);
      int sumB = b['fuDetails'].fold(0, (sum, item) => sum + item['fu']);
      return sumB.compareTo(sumA);
    });
    var calculateHand = temp[0];

    var cost = calculateHand['cost'];
    var error = calculateHand['error'];
    var nowHandYaku = calculateHand['handYaku'];
    var han = calculateHand['han'];
    var fu = calculateHand['fu'];
    var fuDetails = calculateHand['fuDetails'];
    print(cost);
    print(error);
    print(nowHandYaku);
    print(han);
    print(fu);
    print(fuDetails);

    return HandResponse(cost: cost, han: han, fu: fu, yaku: nowHandYaku, error: error, fuDetails: fuDetails, isOpenHand: isOpenHand).str();
  }

  findWinGroups(int winTile, List hand, List openedMelds){
    var winTile34 = winTile ~/ 4;
    List copiedOpenedMelds = openedMelds;

    List closedSetItems = [];
    for(var x in hand){
      if(!copiedOpenedMelds.contains(x)){
        closedSetItems.add(x);
      }else{
        copiedOpenedMelds.remove(x);
      }
    }

    List winGroups = [];
    for(List x in closedSetItems){
      if(x.contains(winTile34)){
        winGroups.add(x);
      }
    }
    // unique_win_groups = [list(x) for x in set(tuple(x) for x in win_groups)]
    List uniqueWinGroups = winGroups.map((e) => e.join(','))
    .toSet()
    .map((e) => e.split(',').map(int.parse).toList()).toList();

    return uniqueWinGroups;
  }
}