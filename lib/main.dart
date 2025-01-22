import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    home: XylophoneApp(),
  ));
}

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> buttons = this.getAllXylophoneButtons(7, context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, // 寬度拉伸
            children: buttons,
          ),
        ),
      ),
    );
  }

  List<Widget> getAllXylophoneButtons(int buttonNumber, BuildContext context) {
    List<Widget> buttons = [];
    for (var buttonIndex = 1; buttonIndex <= 7; buttonIndex++) {
      buttons.add(getXylophoneButton(buttonIndex, context));
    }
    return buttons;
  }

  /**
   * 獲得聲音按鍵
   * buttonIndex: 聲音編號
   * context: 上下文
   */
  Widget getXylophoneButton(int buttonIndex, BuildContext context) {
    double appWidth = MediaQuery.of(context).size.width;
    return Expanded(
      child: TextButton(
        // style: TextButton.styleFrom(padding: EdgeInsets.zero),
        onPressed: () {
          AudioPlayer().play(AssetSource('note$buttonIndex.wav'));
        },
        child: Container(
          width: (appWidth / 2) + (buttonIndex * (appWidth / 14)),
          color: Colors.brown,
        ),
      ),
    );
  }
}
