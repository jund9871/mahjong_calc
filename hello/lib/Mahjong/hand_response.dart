class HandResponse{
  Map? cost;
  int? han;
  int? fu;
  List? yaku;
  String? error;
  List? fuDetails;
  bool isOpenHand = false;

  HandResponse({this.cost, this.han, this.fu, this.yaku, this.error, this.fuDetails, this.isOpenHand = false}){
    if(fuDetails != null){
      fuDetails?.sort((a,b) => a['fu'].compareTo(b['fu']));
    }else{
      fuDetails = null;
    }

    if(yaku != null){
      yaku?.sort((a, b) => a.yakuId.compareTo(b.yakuId));
    }else{
      yaku = null;
    }

    print(cost);
    print(yaku);
    print(fuDetails);
  }

  str(){
    String yakuList = '';
    for(int i = 0; i < yaku!.length; i++){
        yakuList += yaku?[i].name;
        yakuList += '\n  ';
    }

    if(error != null){
      return error;
    }else{
      return '  $han 판, $fu 부\n  점수: ${cost?['total']}\n\n  역: \n  $yakuList';
    }
  }
}
