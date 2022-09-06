import 'package:flutter/material.dart';
/*
?===============================================================================
* ANIMATION NO 1: DRAWER ANIMATION !============================================
?+==============================================================================

? STEP 1: WRAP YOUR WIDGET WITH TRANSFORM WIDGET, with property Matrix4.idenity()
* add scale or transform or translate  or rotate according to your need

? STEP 2: Make an animation controller
* your class must be stateful with singleTickerProviderStateMixin,
* make animation controller varriable and give it vsync and Duration in initState() method

? STEP 3: Make a toogle() method
* will return animation.farward() method [used to start the anaimation] if the animation is dismissed,
* will return animation.reverse() method [used to start running this animation in reverse (towards the beginning)],
* 

? STEP 4: Calculation of values 
! Translate: => max position where we want to move * animation_controller.value [animatonControler.value * 180]

! Scale:=> formule = 1 - (animationController.value * 0.2)
? we want to scale down from 1 to 0.8 [starting from 1 ]
? animation_controller value will start from 0.0 as this value is increasing
? so we will set max increasing value to 0.2 by formula [animationController.value * 0.2] 
? now we will substract from 1 
* so animation controller value will start from complete 1 and only reduced by 0.2% 


*/

class DrawerAnimation extends StatefulWidget {
  DrawerAnimation({Key? key}) : super(key: key);

  @override
  State<DrawerAnimation> createState() => _DrawerAnimationState();
}

class _DrawerAnimationState extends State<DrawerAnimation>
    with SingleTickerProviderStateMixin {
  //! THE VALUE WHICH THIS ANIMATION CONTROLLER EMMITS IS ALWAYS BETWEEN [0.0 - 1.0]
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(
            milliseconds:
                400) //!DURATION IS TIME UNTILL THE ANIMATION CONTROLLER WILL KEEP EMETTING VALUEs
        );

    _animationController.forward();

    //* UN COMMENT THIS CODE IF YOU WANT TO SEE ANIMATION CONTROLLER VALUES EMETTING BETWEEN THE DURATION WHICH YOU HAD GIVEN
    // _animationController.forward();
    // _animationController.addListener(() {
    //   print(_animationController.value);
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          double scale = 1 - (_animationController.value * 0.2);
          double translate = _animationController.value * 180.0;

          return Container(
            height: double.infinity,
            child: GestureDetector(
              onPanUpdate: (details) => detectSwipe(details),
              child: Stack(
                children: [
                  Transform(
                    transform: Matrix4.identity()
                      //! always give value in double
                      ..translate(translate)
                      ..scale(scale),
                    alignment: Alignment.centerLeft,
                    child: HomePage(),
                  ),
                  DrawerPage()
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  //!: TOOGLE METHOD
  TickerFuture toggle() {
    print(_animationController.isDismissed);
    return _animationController.isDismissed
        ? _animationController.forward()
        : _animationController.reverse();
  }

  //!: DETECT SWIPE RIGHT OR LEFT
  //* 0 IS THE ORIGIN
  void detectSwipe(DragUpdateDetails details) {
    if (details.delta.dx > 0) {
      toggle();

      print("swaping in right direction");
    }

    // Swiping in left direction.
    if (details.delta.dx < 0) {
      toggle();
      print("swaping in left direction");
    }
  }
}

//? DRAWER PAGE  =============================================================
class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Container(),
    );
  }
}

//? HOME PAGE  ============================================================

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Container(
        height: double.infinity,
      ),
    );
  }
}
