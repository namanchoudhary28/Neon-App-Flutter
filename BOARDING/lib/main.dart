import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Provider<OnBoardState>(
      create: (_) => OnBoardState(),
      child: Scaffold(
        body: OnBoard(
          pageController: _pageController,
          onSkip: () {
            print('skipped');
          },
          onDone: () {
            print('done tapped');
          },
          onBoardData: onBoardData,
          titleStyles: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w900,
            letterSpacing: 0.15,
          ),
          descriptionStyles: TextStyle(
            fontSize: 12,
            color: Colors.black,
          ),
          pageIndicatorStyle: PageIndicatorStyle(
            width: 50,
            inactiveColor: Colors.blue[100],
            activeColor: Colors.blue[500],
            inactiveSize: Size(8, 8),
            activeSize: Size(12, 12),
          ),
          skipButton: FlatButton(
            onPressed: () {
              print('skipped');
            },
            child: Text(
              "Skip",
              style: TextStyle(color: Colors.blue[300]),
            ),
          ),
          nextButton: Consumer<OnBoardState>(
            builder: (BuildContext context, OnBoardState state, Widget child) {
              return InkWell(
                onTap: () => _onNextTap(state),
                child: Container(
                  width: 230,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      colors: [Colors.blue, Colors.blue],
                    ),
                  ),
                  child: Text(
                    state.isLastPage ? "Let's Get Started" : "Next",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _onNextTap(OnBoardState onBoardState) {
    if (!onBoardState.isLastPage) {
      _pageController.animateToPage(
        onBoardState.page + 1,
        duration: Duration(milliseconds: 250),
        curve: Curves.easeInOutSine,
      );
    } else {
      print("done");
    }
  }
}

final List<OnBoardModel> onBoardData = [
  OnBoardModel(
    title: "Welcome to Neon",
    description: "Manage all your activities ",
    imgUrl: "assets/images/weight.png",
  ),
  OnBoardModel(
    title: "What is Lorem ipsum?",
    description:
        "i dont know what is lorem ipsum plz tell",
    imgUrl: 'assets/images/graph.png',
  ),
  OnBoardModel(
    title: "Do you know who is lorem ipsum",
    description:
        "Nobody i dont know head to next page",
    imgUrl: 'assets/images/graph.png',
  ),
];
