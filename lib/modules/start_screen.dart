import 'package:flutter/material.dart';
import 'package:x_o_game/modules/game_screen.dart';

class StartScreen extends StatefulWidget {
  static String Route = "start_screen";

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  TextEditingController player1_controller = TextEditingController();

  TextEditingController player2_controller = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value){
                      if(value!.isEmpty){
                        return "Player 1 shouldn't empty";
                      }
                      return null;
                    },
                    controller: player1_controller,
                    decoration: InputDecoration(
                      hintText: "Please enter name of player 1",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 20
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                      )
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    validator: (value){
                      if(value!.isEmpty){
                        return "Player 2 shouldn't empty";
                      }
                      return null;
                    },
                    controller: player2_controller,
                    decoration: InputDecoration(
                        hintText: "Please enter name of player 2",
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 20
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        )
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: (){
                          if(formKey.currentState!.validate()){
                            Navigator.pushNamed(context, GameScreen.Route,arguments: GameScreenArguments(
                                player1: player1_controller.text,
                                player2: player2_controller.text));
                          }
                        },
                        child: Text(
                          'Start',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40
                          ),
                        )
                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}
class GameScreenArguments{
  String player1;
  String player2;
  GameScreenArguments({required this.player1 ,required this.player2});
}
