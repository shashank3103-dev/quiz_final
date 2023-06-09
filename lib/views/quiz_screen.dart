import 'package:flutter/material.dart';
import 'package:quiz_final/views/result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List quizListData = [
    {
      "id": 1,
      "answer": "Charles Babbage",
      "answer_discription": "",
      "is_answered": 0,
      "is_answer_status_right_wrong_omitted": 0,
      "title":
          "Who is the father of Computers?",
      "options": [
        {
          "option": "a",
          "value": "James Gosling",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "b",
          "value": "Dennis Ritchie",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "c",
          "value": "Bjarne Stroustrup",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "d",
          "value": "Charles Babbage",
          "color": "0xFFFFFFFF",
        },
      ],
    },
    {
      "id": 2,
      "answer": "Central Processing Unit",
      "answer_discription": "",
      "is_answered": 0,
      "is_answer_status_right_wrong_omitted": 0,
      "title":
          "What is the full form of CPU?",
      "options": [
        {
          "option": "a",
          "value": "Central Processing Unit",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "b",
          "value": "Computer Processing Unit",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "c",
          "value": "Computer Principle Uni",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "d",
          "value": "Control Processing Unit",
          "color": "0xFFFFFFFF",
        },
        // {
        //   "option": "e",
        //   "value": "18 cm",
        //   "color": "0xFFFFFFFF",
        // }
      ],
    },
    {
      "id": 3,
      "answer": "machine language",
      "answer_discription": "",
      "is_answered": 0,
      "is_answer_status_right_wrong_omitted": 0,
      "title": " Which of the following computer language is written in binary codes only?",
      "options": [
        {
          "option": "a",
          "value": "pascal",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "b",
          "value": "machine language",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "c",
          "value": "C",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "d",
          "value": "C#",
          "color": "0xFFFFFFFF",
        },
        // {
        //   "option": "e",
        //   "value": "Haulage attendents",
        //   "color": "0xFFFFFFFF",
        // }
      ],
    },
    {
      "id": 4,
      "answer": "Bit",
      "answer_discription": "",
      "is_answered": 0,
      "is_answer_status_right_wrong_omitted": 0,
      "title": " Which of the following is the smallest unit of data in a computer?",
      "options": [
        {
          "option": "a",
          "value": "Byte",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "b",
          "value": "KB",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "c",
          "value": "Bit",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "d",
          "value": "Nibble",
          "color": "0xFFFFFFFF",
        }
      ],
    },
    {
      "id": 5,
      "answer": "Hardware",
      "answer_discription": "",
      "is_answered": 0,
      "is_answer_status_right_wrong_omitted": 0,
      "title":
          "Which of the following are physical devices of a computer?",
      "options": [
        {
          "option": "a",
          "value": "Software",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "b",
          "value": "Hardware",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "c",
          "value": "System Software",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "d",
          "value": "Package",
          "color": "0xFFFFFFFF",
        },
        // {
        //   "option": "e",
        //   "value": "4years",
        //   "color": "0xFFFFFFFF",
        // }
      ],
    },
    {
      "id": 6,
      "answer": "Abacus",
      "answer_discription": "",
      "is_answered": 0,
      "is_answer_status_right_wrong_omitted": 0,
      "title":
          "Which of the following device use positional notation to represent a decimal number?",
      "options": [
        {
          "option": "a",
          "value": "Computer",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "b",
          "value": "Pascaline",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "c",
          "value": "Abacus",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "d",
          "value": "Calculator",
          "color": "0xFFFFFFFF",
        },
        // {
        //   "option": "e",
        //   "value": "4m",
        //   "color": "0xFFFFFFFF",
        // }
      ],
    },
  ];

  final _pageController = PageController(initialPage: 0);
  int questionINdex = 0;

  int userPercentage = 0;
  int wrongQ = 0;
  int ommitedQuestion = 0;
  int totalRight = 0;

  quizResult(context) {
    userPercentage = 0;
    wrongQ = 0;
    ommitedQuestion = 0;
    totalRight = 0;

    for (int i = 0; i < quizListData.length; i++) {
      if (quizListData[i]['is_answer_status_right_wrong_omitted'] == 0) {
        ommitedQuestion++;
      }
      if (quizListData[i]['is_answer_status_right_wrong_omitted'] == 1) {
        totalRight++;
      }
      if (quizListData[i]['is_answer_status_right_wrong_omitted'] == 2) {
        wrongQ++;
      }
    }

    userPercentage = ((totalRight / quizListData.length) * 100).round();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            userPercentage: userPercentage,
            totalRight: totalRight,
            wrongQ: wrongQ,
            ommitedQuestion: ommitedQuestion,
          ),
        ),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF053251),
     // backgroundColor:Colors.black,
      appBar: AppBar(
        title: const Text("Quiz Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Question :${questionINdex + 1}/${quizListData.length}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: quizListData.length,
                onPageChanged: (page) {
                  print("Current page $page");
                  setState(
                    () {
                      questionINdex = page;
                    },
                  );
                },
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFAB40),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            quizListData[index]['title'],
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      quizListData[index]
                                  ['is_answer_status_right_wrong_omitted'] ==
                              2
                          ? Text(
                              "Sorry : Right answer is -> ${quizListData[index]['answer']} ",
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            )
                          : const SizedBox(),
                      SizedBox(
                        height: 20,
                      ),
                      ...quizListData[index]['options']
                          .map(
                            (data) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: SizedBox(
                                width: double.infinity,
                                child: Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: Color(
                                        int.parse(
                                          data['color'],
                                        ),
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    onPressed: () {
                                      if (quizListData[index]['is_answered'] ==
                                          0) {
                                        setState(() {
                                          if (data['value'] ==
                                              quizListData[index]['answer']) {
                                            data['color'] = "0xFF31CD63";
                                            quizListData[index][
                                                'is_answer_status_right_wrong_omitted'] = 1;
                                          } else {
                                            data['color'] = "0xFFFF0000";
                                            quizListData[index][
                                                'is_answer_status_right_wrong_omitted'] = 2;
                                          }
                                          quizListData[index]['is_answered'] =
                                              1;
                                        });
                                      } else {}
                                    },
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 0),
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: Color(
                                                int.parse(
                                                  data['color'],
                                                ),
                                              ),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                              child: Text(
                                                data['option'].toUpperCase(),
                                                style: const TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            data['value'],
                                            style: const TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (questionINdex == quizListData.length - 1) {
            print("Submit ");
            quizResult(context);
          } else {
            print("ELSE PART");
            _pageController.nextPage(
              duration: const Duration(milliseconds: 5),
              curve: Curves.easeIn,
            );
          }
        },
        label:
            Text(questionINdex == quizListData.length - 1 ? "Submit" : "Next"),
      ),
    );
  }
}
