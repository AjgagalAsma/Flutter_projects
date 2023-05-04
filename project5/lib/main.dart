import 'package:flutter/material.dart';
import 'appBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

AppBrain appBrain = AppBrain();

void main() {
  runApp(const MaterialApp(
    home: ekhtibar_app(),
  ));
}

class ekhtibar_app extends StatelessWidget {
  const ekhtibar_app({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("اختبار"),
        backgroundColor: Colors.grey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: exam(),
      ),
    );
  }
}

class exam extends StatefulWidget {
  const exam({super.key});

  @override
  State<exam> createState() => _examState();
}

class _examState extends State<exam> {
  List<Widget> myList = [];
  int n = 0;
  void checkResult(bool res) {
    setState(() {
      bool correct = appBrain.getQuetionAnswer();
      if (correct == res) {
        n++;
        myList.add(Padding(
          padding: const EdgeInsets.all(3.0),
          child: Icon(Icons.thumb_up, color: Colors.green),
        ));
      } else
        myList.add(Padding(
          padding: const EdgeInsets.all(3.0),
          child: Icon(Icons.thumb_down, color: Colors.red),
        ));

      if (appBrain.isFinished() == true) {
        Alert(
          context: context,
          type: AlertType.error,
          title: "انتهاء الاختبار",
          desc: "لقد اجبت على $n من اصل 4",
          buttons: [
            DialogButton(
              child: Text(
                "restart",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
        appBrain.reset();
        n = 0;
        myList = [];
      } else
        appBrain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: myList,
        ),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Image.asset(appBrain.getQuetionImage()),
              SizedBox(
                height: 20,
              ),
              Text(
                appBrain.getQuetionText(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0),
              ),
            ],
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: TextButton(
            child: Text(
              "صح",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.indigo),
            ),
            onPressed: () {
              checkResult(true);
            },
          ),
        )),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: TextButton(
            child: Text(
              "خطا",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.deepOrange),
            ),
            onPressed: () {
              checkResult(false);
            },
          ),
        ))
      ],
    );
  }
}
