class CheckOutState {

  Set<int> slectedIndex;
  bool selectedAll = false;
  double totalPrice;

  CheckOutState({
    required this.slectedIndex,
    required this.selectedAll,
    required this.totalPrice});

   factory CheckOutState.initial(){
     return CheckOutState(
         slectedIndex: {},
         selectedAll: false,
         totalPrice: 0.0);
   }


   CheckOutState copyWith({
     Set<int>? selectedIndex,
     double? totalPrice,
     bool? selectedAll

  }){
     return CheckOutState(
         slectedIndex: selectedIndex ?? this.slectedIndex,
         selectedAll: selectedAll ?? this.selectedAll,
         totalPrice: totalPrice ?? this.totalPrice);
   }



}