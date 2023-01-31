import 'package:flutter/material.dart';
import 'package:smart_home_ui/intro_scr/intro.dart';
import 'package:smart_home_ui/login_page/login_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {

  // Controller to keep track of which page we are on
  final PageController _controller = PageController();

  // keep track of if we r on the last page or not
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[
          //Page View
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);  // return true if we r on the last page
              });
            },
            children: const [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),

          // Dot Indicator row
          Container(
              alignment: const Alignment(0, 0.75),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // skip
                  GestureDetector(
                      onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context){
                              return LoginPage();
                            }
                        ),
                      ),

                      child: Text("Skip")
                  ),

                  // dot indicator
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect: const ScrollingDotsEffect(
                      dotColor: Colors.grey,
                      activeDotColor: Colors.black,
                    ),
                  ),

                  // next or done
                  onLastPage ?  // it will return a bool val
                  // if onLastPage is true
                  GestureDetector(
                      onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context){
                              return LoginPage();
                            }
                        ),
                      ),
                      child: const Text("Done")
                  ):
                  // if onLastPage is true
                  GestureDetector(
                      onTap: (){
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      },
                      child: const Text("Next")
                  ),
                ],
              )
          )
        ]
      ),
    );
  }
}
