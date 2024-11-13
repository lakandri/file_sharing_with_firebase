import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                _buildPageContent(
                    image: 'assets/b1.png',
                    title: 'Welcome',
                    description: 'Welcome to our app!'),
                _buildPageContent(
                    image: 'assets/b2.png',
                    title: 'Explore',
                    description: 'Explore our features!'),
                _buildPageContent(
                    image: 'assets/b3.png',
                    title: 'Get Started',
                    description: 'Let\'s get started!'),
              ],
            ),
          ),
          _buildPageIndicator(),
          _currentPage != 2
              ? Container(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
                    child: Text('NEXT'),
                  ),
                )
              : Container(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setBool('seenOnboarding', true);
                      Navigator.of(context).pushReplacementNamed('/home');
                    },
                    child: Text('GET STARTED'),
                  ),
                ),
        ],
      ),
    );
  }

  Widget _buildPageContent(
      {required String image,
      required String title,
      required String description}) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image),
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: 10,
          width: (index == _currentPage) ? 20 : 10,
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: (index == _currentPage) ? Colors.blue : Colors.grey,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
