import 'package:flutter/material.dart';
import 'package:x_o_game/modules/start_screen.dart';

class GameScreen extends StatefulWidget {
  static String Route = "game_screen";
  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int counter = 0;
  int player1 = 0;
  int player2 = 0;
  List<Widget?> game = [
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
  ];
  List<int> x_plays = [0, 0, 0, 0, 0, 0, 0, 0, 0];
  List<int> o_plays = [0, 0, 0, 0, 0, 0, 0, 0, 0];

  @override
  Widget build(BuildContext context) {
    GameScreenArguments arguments = ModalRoute.of(context)?.settings.arguments as GameScreenArguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        title: Text("X-O Game"),
      ),
      body: Container(
        color: Colors.purple[800],
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "${arguments.player1}: $player1",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "${arguments.player2}: $player2",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellowAccent),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                padding: EdgeInsetsDirectional.all(8),
                child: GridView.builder(
                    itemCount: game.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 3 / 4,
                    ),
                    itemBuilder: (context, index) => Container(
                          padding: EdgeInsetsDirectional.all(8),
                          child: ElevatedButton(
                              onPressed: () {
                                if (game[index] == null) {
                                  print(counter);
                                  setState(() {
                                    if (counter % 2 == 0) {
                                      game[index] =
                                          Image.asset('assets/images/x.png');
                                      x_plays[index] = 1;
                                      if (checkWinner(x_plays)) {
                                        player1++;
                                        resetGame();
                                        return;
                                      }
                                    } else {
                                      game[index] =
                                          Image.asset('assets/images/o.png');
                                      o_plays[index] = 1;
                                      if (checkWinner(o_plays)) {
                                        player2++;
                                        resetGame();
                                        return;
                                      }
                                    }
                                    counter++;
                                    if (counter == 9) {
                                      resetGame();
                                    }
                                  });
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                primary: Colors.purple[900],
                              ),
                              child: game[index]),
                        )),
              ),
            ),
            Expanded(
                flex: 1,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple[500],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                      )
                    ),
                    onPressed: (){
                      setState((){
                        resetGame();
                        player1 = 0;
                        player2 = 0;
                      });
                    }, 
                    child: Text(
                      'Play Again',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 25
                      ),
                      
                    ))
            )
          ],
        ),
      ),
    );
  }

  bool checkWinner(List<int> plays) {
    for (int i = 0; i < 9; i += 3) {
      if (plays[i] == 1 && plays[i + 1] == 1 && plays[i + 2] == 1) {
        return true;
      }
    }
    for (int i = 0; i < 3; i++) {
      if (plays[i] == 1 && plays[i + 3] == 1 && plays[i + 6] == 1) {
        return true;
      }
    }
    if (plays[0] == 1 && plays[4] == 1 && plays[8] == 1) {
      return true;
    }
    if (plays[2] == 1 && plays[4] == 1 && plays[6] == 1) {
      return true;
    }
    return false;
  }

  void resetGame() {
    counter = 0;
    game = [
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
    ];
    x_plays = [0, 0, 0, 0, 0, 0, 0, 0, 0];
    o_plays = [0, 0, 0, 0, 0, 0, 0, 0, 0];
  }
}
