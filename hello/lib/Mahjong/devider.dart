import 'dart:core';
import 'package:hello/Mahjong/constants.dart';
import 'package:hello/Mahjong/utils.dart';
import 'package:flutter/foundation.dart';

class HandDivider{
  // var dividerCache = {};
  // var cacheKey = null;

  divideHand(List tiles34, {List? melds ,useCache = false}){
    print('melds : $melds'); //////////////////////////////////////////////////
    // 현재 패로 가능한 조합 찾기
    melds ??= [];
    // if (melds == null){
    //   melds = [];
    // }

    List closedHandTiles34 = List.from(tiles34);

    List<int> openTileIndices = [];
    if(melds.isNotEmpty){
      for(int i = 0; i < melds.length; i++){
        List meldTemp = melds[i].tiles34();
        print(meldTemp);
        for(int j = 0; j < meldTemp.length; j++){
          openTileIndices.add(meldTemp[j]);
        }
      }
    }
    else{
      openTileIndices = [];
    }
    print('openTileIndices : $openTileIndices'); ///////////////////////////////
    print(closedHandTiles34);
    for(int openItem in openTileIndices){
      closedHandTiles34[openItem] -= 1;
    }
    print('closedHandTiles34 : $closedHandTiles34'); ///////////////////////////

    var pairIndices = findPairs(closedHandTiles34);
    print('pairIndices : $pairIndices'); ///////////////////////////////////////

    List hands = [];
    for(int pairIndex in pairIndices){
      print('pairIndex : $pairIndex'); /////////////////////////////////////////
      List localTile34 = List.from(tiles34);

      for(int openItem in openTileIndices){
        localTile34[openItem] -= 1;
      }

      localTile34[pairIndex] -= 2;
      print('localTile34 : $localTile34');  ////////////////////////////////////

      var man = findValidCombinations(localTile34, 0, 8);
      print('man : $man');  ////////////////////////////////////////////////////

      var pin = findValidCombinations(localTile34, 9, 17);
      print('pin : $pin');  ////////////////////////////////////////////////////

      var sou = findValidCombinations(localTile34, 18, 26);
      print('sou : $sou');  ////////////////////////////////////////////////////

      var honor = [];
      for(int x in honorIndices){
        if(localTile34[x] == 3){
          honor.add([x,x,x]);
        }
      }
      print('honor : $honor');

      if(honor.isNotEmpty){
        honor = [honor];
      }
      print('honor in List : $honor');

      List<List<dynamic>> arrays = [[[pairIndex, pairIndex]]];
      if(sou.isNotEmpty){
        arrays.add(sou);
      }
      if(man.isNotEmpty){
        arrays.add(man);
      }
      if(pin.isNotEmpty){
        arrays.add(pin);
      }
      if(honor.isNotEmpty){
        arrays.add(honor);
      }
      print('combination added arrays : $arrays');  ///////////////////////////

      for(var meld in melds){
        arrays.add([meld.tiles34()]);
      }
      print('meld added arrays : $arrays');  //////////////////////////////////

      List<List<T>> product<T>(List<List<T>> iterables) {
        if (iterables.isEmpty) {
          return [[]]; // 빈 리스트의 경우 빈 리스트를 반환
        }

        List<List<T>> result = [];
        List<T> current = [];

        void generate(int index) {
          if (index == iterables.length) {
            result.add(List<T>.from(current)); // 조합을 결과 리스트에 추가
            return;
          }

          for (T item in iterables[index]) {
            current.add(item);
            generate(index + 1);
            current.removeLast();
          }
        }

        generate(0); // 재귀 함수 호출

        return result;
      }
      print('product arrays : ${product(arrays)}'); ///////////////////////////

      for(var s in product(arrays)){
        print('array in product arrays : $s');
        var hand = [];
        for(var item in s){
          if(item[0] is List){
            for(var x in item){
              hand.add(x);
            }
          } else {
            hand.add(item);
          }
        }
        hand.sort((a, b) => a[0].compareTo(b[0]));
        print('sorted hand : $hand');  /////////////////////////////////////////
        if(hand.length == 5){
          hands.add(hand);
        }
      }
      print('hands : $hands');  ////////////////////////////////////////////////
    }

    var uniqueHands = [];
    if(hands.isNotEmpty){
      for(List hand in hands){
        print('hand in hands : $hand');  ///////////////////////////////////////
        hand.sort((a, b) {
          // 첫 번째 요소로 먼저 비교하고, 동일한 경우 두 번째 요소로 비교
          if (a[0].compareTo(b[0]) != 0) {
            return a[0].compareTo(b[0]); // 첫 번째 요소로 정렬
          } else {
            return a[1].compareTo(b[1]); // 첫 번째 요소가 동일할 경우 두 번째 요소로 정렬
          }
        });
        if(uniqueHands.isEmpty){
          uniqueHands.add(hand);
        }
        for(int i = 0; i < uniqueHands.length; i++){
          if(!(listEquals(uniqueHands[i][0], hand[0]) && listEquals(uniqueHands[i][1], hand[1]) &&
              listEquals(uniqueHands[i][2], hand[2]) && listEquals(uniqueHands[i][3], hand[3]) &&
              listEquals(uniqueHands[i][4], hand[4])
          )){
            print('new unique hand : $hand');  /////////////////////////////////
            uniqueHands.add(hand);
          }
        }
      }
    }
    print('unique : $uniqueHands');

    hands = uniqueHands;

    if(pairIndices.length == 7){
      var hand = [];
      for(var index in pairIndices){
         hand.add([index, index]);
      }
      hands.add(hand);
    }

    var result = hands;
    print('result : $result');

    // if(useCache){
    //   self.dividerCache[self.cacheKey] = result;
    // }

    return result;
  }

  findPairs(tiles34, {firstIndex = 0, secondIndex = 33}){
    var pairIndices = [];
    for(var x in List.generate(secondIndex + 1, (int index) => firstIndex + index)){
      if(honorIndices.contains(x)&&tiles34[x] != 2){
        continue;
      }

      if(tiles34[x] >= 2){
        pairIndices.add(x);
      }
    }

    return pairIndices;
  }

  findValidCombinations(List tiles34, int firstIndex, int secondIndex, {handNotCompleted = false}){
    List<int> indices = [];
    for(int x in List.generate(9, (int index) => firstIndex + index)){
      if(tiles34[x] > 0){
        for(int i = 0; i < tiles34[x]; i++){
          indices.add(x);
        }
      }
    }
    print('indices : $indices');////////////////////////////////////////////////
    print('tiles34 : $tiles34');///////////////////////////////////////////////

    if(!indices.isNotEmpty){
      return [];
    }


    List<List<T>> permutations<T>(List<T> items, int length) {  //itertools.permutation기능
      List<List<T>> result = [];

      void generate(List<T> current, List<T> remaining) {
        if (current.length == length) {
          result.add(List<T>.from(current)); // 현재 순열을 결과에 추가
          return;
        }

        for (int i = 0; i < remaining.length; i++) {
          T item = remaining[i];
          List<T> newCurrent = List<T>.from(current)..add(item);
          List<T> newRemaining = List<T>.from(remaining);
          newRemaining.removeAt(i);
          generate(newCurrent, newRemaining);
        }
      }

      generate([], items);
      return result;
    }

    List<List<int>> allPossibleCombinations = permutations(indices, 3);
    print('allPossible : $allPossibleCombinations');////////////////////////////

    isValidCombination(List possibleSet){
      if(isChi(possibleSet)){
        return true;
      }
      if(isPon(possibleSet)){
        return true;
      }
      return false;
    }

    List<List<int>> validCombinations = [];
    for(List<int> combination in allPossibleCombinations){
      if(isValidCombination(combination)){
        validCombinations.add(combination);
      }
    }
    print('validCombi : $validCombinations');///////////////////////////////////

    if(validCombinations.isEmpty){
      return [];
    }
    int countOfNeededCombinations = indices.length ~/ 3;
    print('countOfNeededCombinations : $countOfNeededCombinations');////////////

    if(countOfNeededCombinations == validCombinations.length && validCombinations.map((list) => list.reduce((value, element) => value + element))
        .fold(0, (previousValue, element) => previousValue + element) == indices){
      return [validCombinations];
    }

    for(var item in validCombinations){
      if(isPon(item)){
        print('item in validCombinations(isPon) : $item');//////////////////////
        int countOfSets = 1;
        int countOfTiles = 0;
        while(countOfSets > countOfTiles){
          var arr1 = [];
          var arr2 = [];
          for(var x in indices){
            if(x == item[0]){
              arr1.add(x);
            }
          }
          countOfTiles = arr1.length ~/ 3;
          for(var x in validCombinations){
            if(x[0] == item[0] && x[1] == item[1] && x[2] == item[2]){
              arr2.add(x);
            }
          }
          countOfSets = arr2.length;
          if(countOfSets > countOfTiles){
            for(int i = 0; i < validCombinations.length; i++){
              if(listEquals(validCombinations[i], item)){
                validCombinations.removeAt(i);
                break;
              }

            }
          }
        }
      }
    }
    print('validCombi : $validCombinations');///////////////////////////////////

    for(var item in validCombinations){
      if(isChi(item)){
        print('item in validCombinations(isChi) : $item');//////////////////////
        int countOfSets = 5;
        int countOfPossibleSets = 1;
        while(countOfSets > countOfPossibleSets){
          var arr2 = [];
          for(var x in validCombinations){
            print('x in validCombinations : $x');///////////////////////////////
            if(x[0] == item[0] && x[1] == item[1] && x[2] == item[2]){
              arr2.add(x);
            }
          }
          countOfSets = arr2.length;
          if(countOfSets > countOfPossibleSets){
            for(int i = 0; i < validCombinations.length; i++){
              if(listEquals(validCombinations[i], item)){
                validCombinations.removeAt(i);
                break;
              }
            }
            print('remove $item');
            print('removed validCombi : $validCombinations');
          }
        }
      }
    }
    print('validCombi : $validCombinations');///////////////////////////////////

    if(handNotCompleted){
      return [validCombinations];
    }

    var possibleCombinations = permutations(List.generate(validCombinations.length, (int index) => index), countOfNeededCombinations);
    print('possibleCombi : $possibleCombinations');/////////////////////////////

    var combinationResults = [];
    for(List<int> combination in possibleCombinations){
      print('combi : $combination');  //////////////////////////////////////////
      var result = [];
      for(int item in combination){
        result += validCombinations[item];
      }
      result.sort();
      print('result : $result');////////////////////////////////////////////////
      print('indices : $indices');//////////////////////////////////////////////
      print('listEquals result : indices = ${listEquals(result, indices)}');////////

      if(listEquals(result, indices)){
        var results = [];
        for(var item in combination){
          results.add(validCombinations[item]);
        }
        results.sort((a, b) => a[0].compareTo(b[0]));
        print('combiResults contain results : ${combinationResults.contains(results)}');  /////////
        if(!combinationResults.contains(results)){
          combinationResults.add(results);
          print('combiResult : $combinationResults'); //////////////////////////
        }
      }
    }

    return combinationResults;
  }
}