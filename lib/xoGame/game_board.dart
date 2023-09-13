import 'package:flutter/material.dart';

import 'game_button.dart';

class GameBoard extends StatefulWidget {
  static const String routeName = 'GameBoard';

  const GameBoard({super.key});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  List<String> boardState = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  int player1Score = 0;
  int player2Score = 0;

  @override
  Widget build(BuildContext context) {
    GameBoardArgs args =
        ModalRoute.of(context)?.settings.arguments as GameBoardArgs;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('TIC TAC TOE'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black, width: 4)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${args.player1Name} (X)',
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        '$player1Score',
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${args.player2Name} (O)',
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        '$player2Score',
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GameButton(
                  text: boardState[0],
                  index: 0,
                  onButtonClicked: onButtonClick,
                ),
                GameButton(
                  text: boardState[1],
                  index: 1,
                  onButtonClicked: onButtonClick,
                ),
                GameButton(
                  text: boardState[2],
                  index: 2,
                  onButtonClicked: onButtonClick,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GameButton(
                  text: boardState[3],
                  index: 3,
                  onButtonClicked: onButtonClick,
                ),
                GameButton(
                  text: boardState[4],
                  index: 4,
                  onButtonClicked: onButtonClick,
                ),
                GameButton(
                  text: boardState[5],
                  index: 5,
                  onButtonClicked: onButtonClick,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GameButton(
                  text: boardState[6],
                  index: 6,
                  onButtonClicked: onButtonClick,
                ),
                GameButton(
                  text: boardState[7],
                  index: 7,
                  onButtonClicked: onButtonClick,
                ),
                GameButton(
                  text: boardState[8],
                  index: 8,
                  onButtonClicked: onButtonClick,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          restartGame();
                        });
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ))),
                      child: const Text(
                        'Restart Game',
                        style: TextStyle(fontSize: 35),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  int counter = 0;

  void onButtonClick(int index) {
    setState(() {
      if (boardState[index].isNotEmpty) {
        return;
      }
      if (counter % 2 == 0) {
        boardState[index] = 'X';
      } else {
        boardState[index] = 'O';
      }
      counter++;
      if (checkWinner('X')) {
        player1Score++;
        initBoard();
      } else if (checkWinner('O')) {
        player2Score++;
        initBoard();
      } else if (counter == 9) {
        initBoard();
      }
    });
  }

  bool checkWinner(String symbol) {
    for (int i = 0; i < 9; i += 3) {
      if (boardState[i] == symbol &&
          boardState[i + 1] == symbol &&
          boardState[i + 2] == symbol) {
        return true;
      }
    }
    for (int i = 0; i < 3; i++) {
      if (boardState[i] == symbol &&
          boardState[i + 3] == symbol &&
          boardState[i + 6] == symbol) {
        return true;
      }
    }
    if (boardState[0] == symbol &&
        boardState[4] == symbol &&
        boardState[8] == symbol) {
      return true;
    }
    if (boardState[2] == symbol &&
        boardState[4] == symbol &&
        boardState[6] == symbol) {
      return true;
    }
    return false;
  }

  void initBoard() {
    boardState = [
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
    ];
    counter = 0;
  }

  void restartGame() {
    boardState = [
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
    ];
    counter = 0;
    player1Score = 0;
    player2Score = 0;
  }
}

class GameBoardArgs {
  String player1Name;
  String player2Name;

  GameBoardArgs({required this.player1Name, required this.player2Name});
}
