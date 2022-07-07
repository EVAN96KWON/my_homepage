import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final int index;

  const Tile({
    Key? key,
    required this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
            children: [
              Expanded(
                  flex: 3,
                  child: Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children:[
                            SelectableText('$index번째 카드')
                          ]
                      )
                  )
              ),
              Expanded(
                  child: Container(
                      decoration: BoxDecoration(color: Colors.blue[900]),
                      child: Center(
                          child: SelectableText('$index번째 카드입니다')
                      )
                  )
              )
            ]
        )
    );
  }
}
