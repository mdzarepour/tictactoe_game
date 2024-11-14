import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:audioplayers/audioplayers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int playerOScore = 0;
  int playerXScore = 0;
  String winnerMessage = '';
  bool isTurnO = false;
  int roundConter = 0;
  List<String> homes = ['', '', '', '', '', '', '', '', ''];
  bool haveWinner = false;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var sized = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(style: textTheme.headlineLarge, 'tictactoe'),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(
              children: [
                _scorBoard(),
                _gridView(sized),
                const SizedBox(
                  height: 30,
                ),
                Text(winnerMessage),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        style: textTheme.bodyMedium!
                            .copyWith(color: Colors.blueGrey),
                        isTurnO ? 'turn O' : 'turn X'),
                    const SizedBox(
                      width: 10,
                    ),
                    const SpinKitThreeBounce(
                      color: Colors.blueGrey,
                      size: 10,
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                _resetButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _resetButton() {
    return TextButton.icon(
        onPressed: () {
          playerOScore = 0;
          playerXScore = 0;
          _clearTableDate();
          roundConter = 0;
          winnerMessage = '';
          haveWinner = false;
        },
        label: const Text('RESET GAME'),
        icon: const Icon(CupertinoIcons.restart));
  }

  SizedBox _gridView(Size sized) {
    return SizedBox(
      height: sized.width,
      width: sized.width,
      child: GridView.builder(
        itemCount: 9,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            String firstSound = 'sound1.wav';
            String secondSound = 'sound2.wav';
            final player = AudioPlayer();
            player.play(
                AssetSource(homes[index] == 'O' ? firstSound : secondSound));
            onTapFunction(index);
            checkTheWinner();
          },
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              border: Border.all(color: Colors.grey),
            ),
            child: Center(
              child: Text(
                  style: homes[index] == 'O'
                      ? Theme.of(context).textTheme.displayMedium
                      : Theme.of(context).textTheme.displaySmall,
                  homes[index]),
            ),
          ),
        ),
      ),
    );
  }

  checkTheWinner() {
    changeStatus(index) {
      if (roundConter == 4) {
        if (playerOScore > playerXScore) {
          winnerMessage = '** Player O is Winner **';
          haveWinner = false;
        }
        if (playerXScore > playerOScore) {
          winnerMessage = '** Player X is Winner **';
          haveWinner = false;
        }
        if (playerOScore == playerXScore) {
          winnerMessage = '** Draw **';
          haveWinner = false;
        }
      } else {
        winnerMessage = 'round is for : ${homes[index]}';
        Future.delayed(const Duration(seconds: 2)).then(
          (value) {
            _clearTableDate();
            winnerMessage = '';
            haveWinner = false;
          },
        );
      }
    }

    if (homes.contains('')) {
      if (homes[0] != '' && homes[0] == homes[1] && homes[0] == homes[2]) {
        if (haveWinner == false) {
          homes[0] == 'O' ? playerOScore++ : playerXScore++;
          changeStatus(0);
          roundConter += 1;
          haveWinner = true;
        }
      }
      if (homes[3] != '' && homes[3] == homes[4] && homes[3] == homes[5]) {
        if (haveWinner == false) {
          homes[3] == 'O' ? playerOScore++ : playerXScore++;
          changeStatus(3);
          roundConter += 1;
          haveWinner = true;
        }
      }
      if (homes[6] != '' && homes[6] == homes[7] && homes[6] == homes[8]) {
        if (haveWinner == false) {
          homes[6] == 'O' ? playerOScore++ : playerXScore++;
          changeStatus(6);
          roundConter += 1;
          haveWinner = true;
        }
      }
      if (homes[0] != '' && homes[0] == homes[3] && homes[0] == homes[6]) {
        if (haveWinner == false) {
          homes[0] == 'O' ? playerOScore++ : playerXScore++;
          changeStatus(0);
          roundConter += 1;
          haveWinner = true;
        }
      }
      if (homes[1] != '' && homes[1] == homes[4] && homes[1] == homes[7]) {
        if (haveWinner == false) {
          homes[1] == 'O' ? playerOScore++ : playerXScore++;
          changeStatus(1);
          roundConter += 1;
          haveWinner = true;
        }
      }
      if (homes[0] != '' && homes[0] == homes[4] && homes[0] == homes[8]) {
        if (haveWinner == false) {
          homes[0] == 'O' ? playerOScore++ : playerXScore++;
          changeStatus(0);
          roundConter += 1;
          haveWinner = true;
        }
      }
      if (homes[2] != '' && homes[2] == homes[5] && homes[2] == homes[8]) {
        if (haveWinner == false) {
          homes[2] == 'O' ? playerOScore++ : playerXScore++;
          changeStatus(2);
          roundConter += 1;
          haveWinner = true;
        }
      }
      if (homes[2] != '' && homes[2] == homes[4] && homes[2] == homes[6]) {
        if (haveWinner == false) {
          homes[2] == 'O' ? playerOScore++ : playerXScore++;
          changeStatus(2);
          roundConter += 1;
          haveWinner = true;
        }
      }
    } else {
      winnerMessage = 'draw round';
      Future.delayed(const Duration(seconds: 2)).then(
        (value) {
          _clearTableDate();
          winnerMessage = '';
        },
      );
    }
  }

  Padding _scorBoard() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              const Text('PLAYER O'),
              Text('$playerOScore'),
            ],
          ),
          Column(
            children: [
              const Text('PLAYER X'),
              Text('$playerXScore'),
            ],
          ),
        ],
      ),
    );
  }

  _clearTableDate() {
    setState(() {
      for (int i = 0; i < homes.length; i++) {
        homes[i] = '';
      }
    });
  }

  onTapFunction(int index) {
    if (homes[index] == '') {
      setState(() {
        if (isTurnO) {
          homes[index] = 'O';
        } else {
          homes[index] = 'X';
        }
        isTurnO = !isTurnO;
      });
    }
  }
}
