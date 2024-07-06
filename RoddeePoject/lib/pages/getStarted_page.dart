import 'package:flutter/material.dart';

void main() {
  runApp(const MyGetStartedPage());
}

class MyGetStartedPage extends StatefulWidget {
  const MyGetStartedPage({super.key});

  @override
  _MyGetStartedPageState createState() => _MyGetStartedPageState();
}

class _MyGetStartedPageState extends State<MyGetStartedPage> with SingleTickerProviderStateMixin {
  bool _showInitialText = true;
  late AnimationController _controller;
  late Animation<double> _animation1;
  late Animation<double> _animation2;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000), // Reduced to 2 seconds
    );

    _animation1 = CurvedAnimation(
      parent: _controller,
      curve: Interval(0.0, 0.45, curve: Curves.easeOut),
    );

    _animation2 = CurvedAnimation(
      parent: _controller,
      curve: Interval(0.45, 0.9, curve: Curves.easeOut),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(Duration(milliseconds: 500), () { // Reduced to 0.5 seconds
          setState(() {
            _showInitialText = !_showInitialText;
            _controller.reset();
            _controller.forward();
          });
        });
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(40, 40, 5, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedBuilder(
                      animation: _animation1,
                      builder: (context, child) {
                        String text = _showInitialText ? 'RodRang' : 'Welcome to';
                        return Text(
                          text.substring(0, (_animation1.value * text.length).round()),
                          style: TextStyle(
                            fontSize: 36.0,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                    AnimatedBuilder(
                      animation: _animation2,
                      builder: (context, child) {
                        String text = _showInitialText ? 'Roddee' : 'RodRang Roddee';
                        return Text(
                          text.substring(0, (_animation2.value * text.length).round()),
                          style: TextStyle(
                            fontSize: 36.0,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 80),
              Center(
                child: Column(
                  children: [
                    const Image(
                      image: AssetImage('images/MainPicRod.png'),
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 250),
                    SizedBox(
                      width: 350,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          // Button action
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text(
                          'GET STARTED',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}