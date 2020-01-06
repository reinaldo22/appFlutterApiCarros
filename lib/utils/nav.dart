import 'package:flutter/material.dart';

Future rotas(BuildContext context, Widget page){

  return Navigator.push(context, MaterialPageRoute(builder: (BuildContext){
    return page;
  }));

}