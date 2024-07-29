import 'dart:core';
import 'package:hello/Mahjong/constants.dart';


isAkaDora(var tile136, akaEnabled){
    if(!akaEnabled){
      return false;
    }
    if(tile136.contains(fiveRedMan)||tile136.contains(fiveRedPin)||tile136.contains(fiveRedSou)){
      return true;
    }
    return false;
}

plusDora(var tile136, List<int> doraIndicators136, {addAkaDora = false}){
    var tileIndex = int.parse(tile136) ~/ 4;

    int doraCount = 0;

    bool akaEnabled;
    if(addAkaDora && isAkaDora(tile136, akaEnabled = true)){
      doraCount += 1;
    }

    for(var dora in doraIndicators136){
      dora ~/= 4;

      if(tileIndex < east){
        if(dora == 8){
          dora = -1;
        }
        if(dora == 17){
          dora = 8;
        }
        if(dora == 26){
          dora = 17;
        }

        if(tileIndex == dora + 1){
          doraCount += 1;
        }
      }else{
        if(dora < east){
          continue;
        }

        dora -= 9 * 3;
        int tileIndexTemp = tileIndex - 9 * 3;

        if(dora == 3){
          dora = -1;
        }

        if(dora == 6){
          dora = 3;
        }

        if(tileIndexTemp == dora + 1){
          doraCount += 1;
        }
      }
    }

    return doraCount;
}

isChi(List item){
    if(item.length != 3){
      return false;
    }
    return item[0] == (item[1] - 1) && item[0] == (item[2] - 2);
}

isPon(List item){
  if(item.length != 3){
    return false;
  }
  return item[0] == item[1] && item[1] == item[2];
}

isKan(List item){
    return item.length == 4;
}

isPonOrKan(List item){
  return isPon(item) || isKan(item);
}

isPair(var item){
  return item.length == 2;
}

isMan(var tile){
  return tile <= 8;
}

isPin(var tile){
  return 8 < tile && tile <= 17;
}

isSou(var tile){
  return 17 < tile && tile <= 26;
}

isHonor(var tile){
  return tile >= 27;
}

isSangenpai(var tile34){
  return tile34 >= 31;
}

isTerminal(var tile){
  return terminalIndices.contains(tile);
}

isDoraIndicatorForTerminal(var tile){
  return tile == 7 || tile == 8|| tile == 16 || tile == 17|| tile == 25 || tile == 26;
}

containsTerminals(var handSet){
  for(var x in handSet){
    if(terminalIndices.contains(x)){
      return true;
    }
  }

  return false;
}

simplify(var tile){
  return tile - 9 * (tile ~/ 9);
}

findIsolatedTileIndices(var hand34){
  var isolatedIndices = [];

  for(var x in List.generate(chun + 1, (index) => index)){
    if(isHonor(x) && hand34[x] == 0){
      isolatedIndices.add(x);
    }else{
      var simplified = simplify(x);

      if(simplified == 0){
        if(hand34[x] == 0 && hand34[x + 1] == 0){
          isolatedIndices.add(x);
        }
      }else if(simplified == 8){
        if(hand34[x] == 0 && hand34[x - 1] == 0){
          isolatedIndices.add(x);
        }
      }else{
        if(hand34[x] == 0 && hand34[x - 1] == 0 && hand34[x + 1] == 0){
          isolatedIndices.add(x);
        }
      }
    }
  }
  return isolatedIndices;
}

isTileStrictlyIsolated(var hand34, var tile34){
  if(isHonor(tile34)){
    return hand34[tile34] - 1 <= 0;
  }

  var simplified = simplify(tile34);
  var indices;
  if(simplified == 0){
    indices = [tile34, tile34 + 1, tile34 + 2];
  }else if(simplified == 1){
    indices = [tile34 - 1, tile34, tile34 + 1, tile34 + 2];
  }else if(simplified == 7){
    indices = [tile34 - 2, tile34 - 1, tile34, tile34 + 1];
  }else if(simplified == 8){
    indices = [tile34 - 2, tile34 - 1, tile34];
  }else{
    indices = [tile34 - 2, tile34 - 1, tile34, tile34 + 1, tile34 + 2];
  }

  bool isolated = true;
  for(var tileIndex in indices){
    if(tileIndex == tile34){
      isolated &= hand34[tileIndex] - 1 <= 0;
    }else{
      isolated &= hand34[tileIndex] == 0;
    }
  }

  return isolated;
}

countTilesBySuits(var tiles34){
  var suits = [
    {'count': 0, 'name': 'sou', 'function': isSou},
    {'count': 0, 'name': 'man', 'function': isMan},
    {'count': 0, 'name': 'pin', 'function': isPin},
    {'count': 0, 'name': 'honor', 'function': isHonor},
  ];

  // for(var x = 0; x < 34; x++){
  //   var tile = tiles34[x];
  //   if(tile == null){
  //     continue;
  //   }
  //
  //   for(var item in suits){
  //     if(item['function'](x)){
  //       item['count'] += 1;
  //     }
  //   }
  // }

  return suits;
}
