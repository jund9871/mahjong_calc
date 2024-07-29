import 'package:flutter/foundation.dart';
import 'package:hello/Mahjong/constants.dart';
import 'package:hello/Mahjong/hand_config.dart';
import 'package:hello/Mahjong/meld.dart';
import 'package:hello/Mahjong/tile.dart';
import 'package:hello/Mahjong/utils.dart';

class FuCalculator{
  String ron = 'ron';
  String base = 'base';
  String penchan = 'penchan';
  String kanchan = 'kanchan';
  String valuedPair = 'valuedPair';
  String doubleValuedPair = 'doubleValuedPair';
  String pairWait = 'pairWait';
  String tsumo = 'tsumo';
  String handWithoutFu = 'handWithoutFu';

  String closedPon = 'closedPon';
  String openPon = 'openPon';

  String closedTerminalPon = 'closedTerminalPon';
  String openTerminalPon = 'openTerminalPon';

  String closedKan = 'closedKan';
  String openKan = 'openKan';

  String closedTerminalKan = 'closedTerminalKan';
  String openTerminalKan = 'openTerminalKan';

  calculateFu(List hand, int winTile, List winGroup, handConfig config, {List? valuedTiles = null, List? melds = null}){
    int winTile34 = winTile ~/ 4;

    if(valuedTiles!.isEmpty){
      valuedTiles = [];
    }

    if(melds!.isEmpty){
      melds = [];
    }

    List fuDetails = [];

    if(hand.length == 7){
      return [[{'fu':25, 'reason': base}], 25]; //TODO:: do chack
    }

    List pairList = [];
    for(var x in hand){
      if(isPair(x)){
        pairList.add(x);
      }
    }
    var pair = pairList[0];

    List ponSets = [];
    for(var x in hand){
      if(isPonOrKan(x)){
        ponSets.add(x);
      }
    }

    List copiedOpenedMelds = [];
    Meld meld = Meld('', []);
    for(Meld x in melds){
      if(x.meldType == meld.chi){
        copiedOpenedMelds.add(x.tiles34());
      }
    }

    List closedChiSets = [];
    for(var x in hand){
      if(!copiedOpenedMelds.contains(x)){
        closedChiSets.add(x);
      }else{
        copiedOpenedMelds.remove(x);
      }
    }


    List<Meld> check = [];
    for(Meld x in melds){
      if(x.opened){
        check.add(x);
      }
    }
    bool isOpenHand = check.isNotEmpty;
    for(var x in closedChiSets){
      if(listEquals(x, winGroup)){ //TODO:: do check

        var tileIndex = simplify(winTile34);

        if(containsTerminals(winGroup)){
          if(tileIndex == 2 && winGroup.indexOf(winTile34) == 2){
            fuDetails.add({'fu': 2, 'reason': FuCalculator().penchan});
          }else if(tileIndex == 6 && winGroup.indexOf(winTile34) == 0){
            fuDetails.add({'fu': 2, 'reason': FuCalculator().penchan});
          }
        }

        if(winGroup.indexOf(winTile34) == 1){
          fuDetails.add({'fu': 2, 'reason': FuCalculator().kanchan});
        }
      }
    }


    int countOfValuedPairs = valuedTiles.where((element) => element == pair[0]).length;
    if(countOfValuedPairs == 1){
      fuDetails.add({'fu': 2, 'reason': FuCalculator().valuedPair});
    }

    if(countOfValuedPairs == 2){
      fuDetails.add({'fu': 4, 'reason': FuCalculator().doubleValuedPair});
    }

    if(isPair(winGroup)){
      fuDetails.add({'fu': 2, 'reason': FuCalculator().pairWait});
    }

    for(List setItem in ponSets) {
      List<Meld> openMeld = [];
      for (Meld x in melds) {
        if (listEquals(setItem, x.tiles34())) {
          openMeld.add(x);
        }
      }

      if (openMeld.isNotEmpty) {
        openMeld = [openMeld[0]];
      } else {
        openMeld = [];
      }

      bool setWasOpen = openMeld!.isNotEmpty ? openMeld[0].opened : false;
      bool isKanSet = openMeld.isNotEmpty ? (openMeld[0].meldType == meld.kan ||
          openMeld[0].meldType == meld.shouminkan) : false;
      bool isHonor = (terminalIndices + honorIndices).contains(setItem[0]);

      if (!config.isTsumo && listEquals(setItem, winGroup)) {
        setWasOpen = true;
      }

      if (isHonor) {
        if (isKanSet) {
          if (setWasOpen) {
            fuDetails.add({'fu': 16, 'reason': FuCalculator().openTerminalKan});
          } else {
            fuDetails.add(
                {'fu': 32, 'reason': FuCalculator().closedTerminalKan});
          }
        } else {
          if (setWasOpen) {
            fuDetails.add({'fu': 4, 'reason': FuCalculator().openTerminalPon});
          } else {
            fuDetails.add(
                {'fu': 8, 'reason': FuCalculator().closedTerminalPon});
          }
        }
      } else {
        if (isKanSet) {
          if (setWasOpen) {
            fuDetails.add({'fu': 8, 'reason': FuCalculator().openKan});
          } else {
            fuDetails.add({'fu': 16, 'reason': FuCalculator().closedKan});
          }
        } else {
          if (setWasOpen) {
            fuDetails.add({'fu': 2, 'reason': FuCalculator().openPon});
          } else {
            fuDetails.add({'fu': 4, 'reason': FuCalculator().closedPon});
          }
        }
      }
    }

    bool addTsumoFu = fuDetails.isNotEmpty || config.options.fuForPinfuTsumo;

    if(config.isTsumo && addTsumoFu){
      fuDetails.add({'fu': 2, 'reason': FuCalculator().tsumo});
    }

    if(isOpenHand && fuDetails.isEmpty && config.options.fuForOpenPinfu){
      fuDetails.add({'fu': 2, 'reason': FuCalculator().handWithoutFu});
    }

    if(isOpenHand || config.isTsumo){
      fuDetails.add({'fu': 20, 'reason': FuCalculator().base});
    }else{
      fuDetails.add({'fu': 30, 'reason': FuCalculator().base});
    }

    return [fuDetails, roundFu(fuDetails)];
  }

  roundFu(List fuDetails){
    int fu = 0;
    List sum = [];
    for(var x in fuDetails){
      sum.add(x['fu']);
    }
    for(int x in sum){
      fu += x;
    }

    return (fu + 9) ~/ 10 * 10;
  }
}