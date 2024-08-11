import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(QuotesApp());
}

class QuotesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quotes Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QuotesHomePage(),
    );
  }
}

class QuotesHomePage extends StatefulWidget {
  @override
  _QuotesHomePageState createState() => _QuotesHomePageState();
}

class _QuotesHomePageState extends State<QuotesHomePage> {
  final List<Map<String, String>> quotes = [
    {
      "quote":
          "The only limit to our realization of tomorrow is our doubts of today.",
      "author": "Franklin D. Roosevelt",
      "image": "assets/1.jpg"
    },
    {
      "quote": "In the middle of every difficulty lies opportunity.",
      "author": "Albert Einstein",
      "image": "assets/2.jpg"
    },
    {
      "quote": "Life is what happens when you're busy making other plans.",
      "author": "John Lennon",
      "image": "assets/3.jpg"
    },
    {
      "quote":
          "Do not dwell in the past, do not dream of the future, concentrate the mind on the present moment.",
      "author": "Buddha",
      "image": "assets/4.jpg"
    },
    {
      "quote": "You only live once, but if you do it right, once is enough.",
      "author": "Mae West",
      "image": "assets/5.jpg"
    },
    {
      "quote":
          "In the end, it's not the years in your life that count. It's the life in your years.",
      "author": "Abraham Lincoln",
      "image": "assets/6.jpg"
    },
    {
      "quote": "The best way to predict the future is to create it.",
      "author": "Peter Drucker",
      "image": "assets/7.jpg"
    },
    {
      "quote":
          "The greatest glory in living lies not in never falling, but in rising every time we fall.",
      "author": "Nelson Mandela",
      "image": "assets/8.jpg"
    },
    {
      "quote":
          "Your time is limited, don't waste it living someone else's life.",
      "author": "Steve Jobs",
      "image": "assets/9.jpg"
    },
    {
      "quote":
          "If life were predictable it would cease to be life, and be without flavor.",
      "author": "Eleanor Roosevelt",
      "image": "assets/10.jpg"
    },
    {
      "quote": "Life is what we make it, always has been, always will be.",
      "author": "Grandma Moses",
      "image": "assets/11.jpg"
    },
    {
      "quote":
          "Happiness is not something ready made. It comes from your own actions.",
      "author": "Dalai Lama",
      "image": "assets/12.jpg"
    },
    {
      "quote":
          "In three words I can sum up everything I've learned about life: it goes on.",
      "author": "Robert Frost",
      "image": "assets/13.jpg"
    },
    {
      "quote":
          "Success is not final, failure is not fatal: It is the courage to continue that counts.",
      "author": "Winston Churchill",
      "image": "assets/14.jpg"
    },
    {
      "quote":
          "Do not go where the path may lead, go instead where there is no path and leave a trail.",
      "author": "Ralph Waldo Emerson",
      "image": "assets/15.jpg"
    },
    {
      "quote":
          "It is our choices that show what we truly are, far more than our abilities.",
      "author": "J.K. Rowling",
      "image": "assets/16.jpg"
    },
    {
      "quote":
          "The more that you read, the more things you will know. The more that you learn, the more places you'll go.",
      "author": "Dr. Seuss",
      "image": "assets/17.jpg"
    },
    {
      "quote":
          "Talk to yourself once in a day, otherwise you may miss meeting an intelligent person in this world.",
      "author": "Swami vivekananda",
      "image": "assets/18.jpg"
    },
    {
      "quote":
          "I think it's very important to have a feedback loop, where you're constantly thinking about what you've done and how you could be doing it better.",
      "author": "Elon Musk",
      "image": "assets/19.jpg"
    },
    {
      "quote": "Freedom is not given - it is taken.",
      "author": "Subhas Chandra Bose",
      "image": "assets/20.jpg"
    },
    {
      "quote":
          "If you want to find the secrets of the universe, think in terms of energy, frequency, and vibration.",
      "author": "Nikola Tesla",
      "image": "assets/21.jpg"
    },
    {
      "quote":
          "If you tell a big enough lie and tell it frequently enough, it will be believed.",
      "author": "Adolf Hitler",
      "image": "assets/22.jpg"
    }
  ];

  final PageController _pageController = PageController();
  List<Map<String, String>> shuffledQuotes = [];

  @override
  void initState() {
    super.initState();
    shuffledQuotes = List.from(quotes)..shuffle(Random());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quotes Generator'),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: shuffledQuotes.length,
        itemBuilder: (context, index) {
          final quote = shuffledQuotes[index];
          return Stack(
            children: [
              // Background image
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(quote["image"]!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Quote text
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        quote["quote"]!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          color: Color.fromARGB(255, 255, 253, 253),
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.black,
                              offset: Offset(2.0, 2.0),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        '- ${quote["author"]!}',
                        style: TextStyle(
                          fontSize: 25,
                          color: Color.fromARGB(255, 255, 0, 0),
                          fontStyle: FontStyle.italic,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.black,
                              offset: Offset(2.0, 2.0),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (index > 0)
                            ElevatedButton(
                              onPressed: () {
                                _pageController.previousPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeIn,
                                );
                              },
                              child: Text('Previous Quote'),
                            ),
                          if (index == 0 || index == shuffledQuotes.length - 1)
                            Spacer(),
                          if (index < shuffledQuotes.length - 1)
                            ElevatedButton(
                              onPressed: () {
                                _pageController.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeIn,
                                );
                              },
                              child: Text('Next Quote'),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
