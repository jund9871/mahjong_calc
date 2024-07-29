import 'dart:core';
import 'package:hello/Mahjong/constants.dart';

class TilesConverter{

  toOneLineString(tiles, {bool printAkaDora = false}){
    tiles = tiles.sort();
    var man = [];
    var pin = [];
    var sou = [];
    var honors = [];

    for(var t in tiles){
      if(t < 36){
        man.add(t);
      }
      if(36<= t && t < 72){
        pin.add(t - 36);
      }
      if(72 <= t && t < 108){
        sou.add(t - 72);
      }
      if(108 <= t){
        honors.add(t - 108);
      }
    }

    words(suits, redFive, suffix){
      String result = '';

      if(suits != null){
        for(int i = 0; i < suits.length; i++){
          if(suits[i] == redFive){
            if(printAkaDora){
              result += '0';
            }else{
              result += (suits[i] ~/ 4);
            }
          }
          result += (suits[i] ~/ 4);
        }
      }else{
        return '';
      }

      result += suffix;

      return result;
    }

    var souStr = words(sou, fiveRedSou - 72, 's');
    var pinStr = words(pin, fiveRedPin - 36, 'p');
    var manStr = words(man, fiveRedMan, 'm');
    var honorsStr = words(honors, -1 - 108, 'z');

    return manStr + pinStr + souStr + honorsStr;
  }

  to34Array(List tiles){
    List<int> results = List.generate(34, (index) => 0);
    // for(int a = 0; a < tiles.length; a++){
    //   String tile = tiles.substring(a, a+1);
    for(var tile in tiles){
      int temp = 0;
      temp = int.parse(tile) ~/ 4;
      results[temp] += 1;
    }
    print(results);////////////////////////////////////////////////////////
    return results;
  }

  to136Array(tiles){
    var temp = [];
    var results = [];
    for(var x in List.generate(34, (index) => index)){
      if(tiles[x]){
        var tempValue = List.generate(tiles[x], (index) => x * 4);
        for(var tile in tempValue){
          if(results.contains(tile)){
            var countOfTiles;
            for(var x in temp){
              if(x == tile){
                countOfTiles = x.length;
              }
            }
            var newTile = tile + countOfTiles;
            results.add(newTile);

            temp.add(tile);
          }else{
            results.add(tile);
            temp.add(tile);
          }
        }
      }
    }
    return results;
  }

  stringTo136Array({String sou = '', String pin = '', String man = '', String honors = '', bool hasAkaDora = false}){
    splitString(String string, int offset, int red){
      List data = [];
      List temp = [];

      if(string == null){
        return [];
      }

      for(int a = 0; a < string.length; a++){
        String i = string.substring(a, a+1);
        if((i == 'r' || i == '0') && hasAkaDora){
          temp.add(red.toString());
          data.add(red.toString());
        }else{
          int tile = offset + (int.parse(i) - 1) * 4;
          if(tile == red && hasAkaDora){
            tile += 1;
          }
          if(data.contains(tile)){
            int countOfTiles = 0;
            for(List x in temp){
              if(x[0] == tile){
                countOfTiles = x.length;
              }
            }
            int newTile = tile + countOfTiles;
            data.add(newTile.toString());

            temp.add(tile.toString());
          }else{
            data.add(tile.toString());
            temp.add(tile.toString());
          }
        }
      }
      return data;
    }

    List results = splitString(man, 0, fiveRedMan);
    results += splitString(pin, 36, fiveRedPin);
    results += splitString(sou, 72, fiveRedSou);
    results += splitString(honors, 108, -555); // 임의 숫자 -555
    print('result : $results');////////////////////////////////////////////////////

    return results;
  }

  stringTo34Array({String sou = '', String pin = '', String man = '', String honors = ''}){
    List results = TilesConverter().stringTo136Array(sou: sou, pin: pin, man: man, honors: honors);
    results = TilesConverter().to34Array(results);
    return results;
  }

  find34TileIn136Array(tile34, tiles){
    if(tile34 == null || tile34 > 33){
      return null;
    }

    var tile = tile34 * 4;

    var possibleTiles = [tile] + List.generate(4, (index) => tile + index);

    var foundTile = null;
    for(var possibleTile in possibleTiles){
      if(tiles.contains(possibleTile)){
        foundTile = possibleTile;
        break;
      }
    }

    return foundTile;
  }

  oneLineStringTo136Array(string, {hasAkaDora = false}){
    var sou = '';
    var pin = '';
    var man = '';
    var honors = '';

    var splitStart = 0;

    for (int index = 0; index < string.length; index++) {
      String i = string[index];

      if (i == "m") {
        man += string.substring(splitStart, index);
        splitStart = index + 1;
      } else if (i == "p") {
        pin += string.substring(splitStart, index);
        splitStart = index + 1;
      } else if (i == "s") {
        sou += string.substring(splitStart, index);
        splitStart = index + 1;
      } else if (i == "z" || i == "h") {
        honors += string.substring(splitStart, index);
        splitStart = index + 1;
      }
    }
    
    return TilesConverter().stringTo136Array(sou: sou, pin: pin, man: man, honors: honors, hasAkaDora: hasAkaDora);
  }

  oneLineStringTo34Array(string, {hasAkaDora = false}){
    var results = TilesConverter().oneLineStringTo136Array(string, hasAkaDora: hasAkaDora);
    results = TilesConverter().to34Array(results);
    return results;
  }
}