/*
* Developer: Abubakar Abdullahi
* Date: 20/09/2024
*/

import 'package:flutter/material.dart';

class LoadingOverlay {
  LoadingOverlay();

  OverlayEntry? _overlay;
  
  void show(BuildContext context){
    if(_overlay == null){
      _overlay = OverlayEntry(
          builder: (context) => const ColoredBox(
            color: Color(0x80000000),
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            ),
          ),
      );
      Overlay.of(context).insert(_overlay!);
    }
  }

  void hide(){
    if(_overlay != null){
      _overlay!.remove();
      _overlay = null;
    }
  }


}