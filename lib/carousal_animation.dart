import 'package:flutter/material.dart';

class CarousalAnimation extends StatefulWidget {
  CarousalAnimation({Key? key}) : super(key: key);

  @override
  State<CarousalAnimation> createState() => _CarousalAnimationState();
}

class _CarousalAnimationState extends State<CarousalAnimation>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;

  double currentPage = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);

    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!;
        print(
            currentPage); //* will emmit values from 0.00 to the n number of pages
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Container(
          height: 400,
          padding: EdgeInsets.all(15.0),
          child: PageView.builder(
              itemCount: 6,
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) {
                late double currentScale; //! current height of active container
                double highestScaleValue = 1;
                double lowestScaleValue = .8;
                double height = 230.0;
                double
                    currTrans; //! current height (gap) between top widget& container top
                double diff =
                    highestScaleValue - lowestScaleValue; //! 1 - 0.8 = 0.2

                if (index == currentPage.floor()) {
                  //* WHEN THE CONATINER IS ACTIVE

                  currentScale = highestScaleValue -
                      (currentPage - index) * diff; // ! 1 - (0-0) * 0.2 = 1
                  /*
                  * Current scale value will be 1, beacuse its active

                  * currTrans =  _height * (1-1) / 2 = 0
                  ? which means there is 0 gap between top widget & container top
                  */

                  currTrans = height * (1 - currentScale) / 2;
                } else if (index == currentPage.floor() + 1) {
                  //* WHEN THE CONATINER IS IN ACTIVE
                  currentScale = lowestScaleValue +
                      (currentPage - index + 1) *
                          diff; //! 0.8 + ( 0.5 - 0 + 1 ) * 0.2 =

                  /*
                  * Current scale value will be 0.8, beacuse its non active

                  * currTrans =  _height * ( 0.8 - 1 ) / 2 = 23
                  ? which means there is 23 gap between top widget & container top
                  */

                  currTrans = height * (1 - currentScale) / 2;
                } else if (index == currentPage.floor() - 1) {
                  currentScale =
                      highestScaleValue - (currentPage - index) * diff;

                  /*
                  * Current scale value will be 0.8, beacuse its non active

                  * currTrans =  _height * ( 0.8 - 1 ) / 2 = 23
                  ? which means there is 23 gap between top widget & container top
                  */

                  currTrans = height * (1 - currentScale) / 2;
                } else {
                  currentScale = 0.8;
                  currTrans = height * (1 - currentScale) / 2;
                }
                return Transform(
                  transform: Matrix4.diagonal3Values(1, currentScale, 1)
                    ..setTranslationRaw(0, currTrans, 0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.0),
                      color: Colors.green,
                    ),
                  ),
                );
              })),
        ),
      )),
    );
  }
}
