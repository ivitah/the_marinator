import 'package:flutter/material.dart';
import 'package:themarinator/sha/services/auth.dart';



class Provider extends InheritedWidget {
  final authService auth;
  final db;
  Provider ({Key key,Widget child,this.auth,this.db}):super(key:key,child:child);

  @override
  bool upDateShouldNotify(InheritedWidget oldWidget){
    return true;
  }

  static Provider of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<Provider>());

  //JUST PRESSED ON THE RED BULB AND THIS POPPED BY :|
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }
}

