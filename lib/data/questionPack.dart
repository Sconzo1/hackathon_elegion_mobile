class QuestionPack{

  String questionPackName;
  List<Question> questions;

  QuestionPack({
    required this.questionPackName,
    required this.questions,
  });
}


class Question{
  String questionText;
  List<String> answers;
  int rightAnswer;

  Question({
    required this.questionText,
    required this.answers,
    required this.rightAnswer
  });
}