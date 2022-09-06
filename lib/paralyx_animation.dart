import 'dart:html';

import 'package:flutter/material.dart';

class ParalyxAnimation extends StatefulWidget {
  ParalyxAnimation({Key? key}) : super(key: key);

  @override
  State<ParalyxAnimation> createState() => _ParalyxAnimationState();
}

class _ParalyxAnimationState extends State<ParalyxAnimation> {
  final ScrollController _scrollController = ScrollController();

  late double offset = 20;
  Color backgroundColor = Color.fromRGBO(216, 177, 136, 1);
  Color darkerColor = Color.fromRGBO(200, 162, 122, 1);

  @override
  void initState() {
    _scrollController.addListener(() {
      setState(() {
        offset = _scrollController.offset;
      });

      print(offset);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: -0.3 * offset,
              child: Container(
                child: Image(image: AssetImage('assets/images/sky.png')),
              )),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.20,
              left: MediaQuery.of(context).size.width * 0.25,
              child: headingText()),
          Positioned(
              top: 210 - (offset * 0.5),
              left: 80,
              child: Image(image: AssetImage('assets/images/pyramid.png'))),
          Positioned(
              top: 450 - (offset * 0.7),
              child: Image(image: AssetImage('assets/images/sand.png'))),
          Positioned(
              top: 460 - (offset * 0.7),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.67,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: backgroundColor,
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0, 1],
                      colors: [backgroundColor.withOpacity(0), backgroundColor],
                    )),
              )),
          Positioned(
              top: 840 - (offset * 0.7),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: backgroundColor,
                  child: subHeadingRow())),
          Positioned(
              top: 1090 - (offset * 0.7),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: backgroundColor,
                child: Stack(
                  children: [
                    AnimatedPositioned(
                      duration: Duration(seconds: 1),
                      left: offset <= 750 ? 1400 : 10,
                      child: Text(
                        "CIVILIZATION",
                        style: TextStyle(
                          color: darkerColor.withOpacity(0.8),
                          fontSize: 200,
                          fontFamily: 'Deligne',
                        ),
                      ),
                    ),
                    Positioned(
                        top: 200,
                        child: Container(
                          height: 600,
                          width: MediaQuery.of(context).size.width,
                          color: darkerColor,
                        )),
                    Positioned(
                        top: 50,
                        left: 380,
                        child: AnimatedOpacity(
                          duration: Duration(seconds: 1),
                          opacity: offset <= 800 ? 0 : (760 / offset),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.9,
                            width: MediaQuery.of(context).size.height * 0.8,
                            child: Image(
                                image: AssetImage('assets/images/camel.png')),
                          ),
                        )),
                  ],
                ),
              )),
          SingleChildScrollView(
            controller: _scrollController,
            child: Container(
              height: MediaQuery.of(context).size.height * 6,
            ),
          )
        ],
      ),
    );
  }

  Column subHeadingRow() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Text(
            "THE ANCIENT EGYPTIAN CIVILIZATION",
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 25,
              fontFamily: 'Deligne',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Text(
                '''
                              The egyption civilization is famous for its mummies,
                              paraymods, thombs, Thousand and thousands of years
                              but does it worth a while, then
                              Who is willing tp pay for this
                              ''',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: 'Deligne',
                ),
              ),
              Text(
                '''
                              The egyption civilization is famous for its mummies,
                              paraymods, thombs, Thousand and thousands of years
                              but does it worth a while,  then
                              Who is willing tp pay for this
                              ''',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: 'Deligne',
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Column headingText() {
    return Column(
      children: [
        Text(
          "THE ANCIENT WORLD",
          style: TextStyle(
            color: backgroundColor,
            fontSize: 25,
            fontFamily: 'Deligne',
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Container(
              color: backgroundColor,
              child: const SizedBox(
                height: 2,
                width: 100,
                child: Text("_________________"),
              )),
        ),
        const Text(
          "Disover the inspiring",
          style: TextStyle(
            color: Colors.white,
            fontSize: 50,
            fontFamily: 'Deligne',
          ),
        ),
        SizedBox(
          height: 20,
        ),
        const Text(
          "Paramids of fiza and ancient Egypt",
          style: TextStyle(
            color: Colors.white,
            fontSize: 50,
            fontFamily: 'Deligne',
          ),
        ),
      ],
    );
  }
}
