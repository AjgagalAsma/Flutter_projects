import 'question.dart';

class AppBrain {
  int _questionNumber = 0;
  List<Question> _questionGroup = [
    Question('عدد الكواكب في المجموعة الشمسية هو ثمانية كواكب',
        'images/image-1.jpg', true),
    Question('que2', 'images/image-2.jpg', true),
    Question('que3', 'images/image-3.jpg', false),
    Question('que4', 'images/image-4.jpg', false),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionGroup.length - 1) _questionNumber++;
  }

  String getQuetionText() {
    return _questionGroup[_questionNumber].questionText;
  }

  String getQuetionImage() {
    return _questionGroup[_questionNumber].questionImage;
  }

  bool getQuetionAnswer() {
    return _questionGroup[_questionNumber].questionAnser;
  }

  bool isFinished() {
    if (_questionNumber >= _questionGroup.length - 1)
      return true;
    else
      return false;
  }

  void reset() {
    _questionNumber = 0;
  }
}
