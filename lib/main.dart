import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'dart:math';

final player1 = AudioPlayer();
final player2 = AudioPlayer();
var random = Random();
int FirstNote = random.nextInt(24)+1;
int SecondNote = FirstNote + ListOfForbiddenInterval[random.nextInt(ListOfForbiddenInterval.length)] - 1;
int NumberOfInterval = SecondNote - FirstNote + 1;
/*Widget launchButton = TextButton(
  child: Text("Launch missile"),
  onPressed:  () {
  },
);*/

BoolToDigit() {
  ListOfForbiddenInterval.clear();
  for (int i = 0; i < isCelected.length; i++) {
    if(isCelected[i]) {
      if (i >= 6) {
        ListOfForbiddenInterval.add(i + 2);
      } else{
        ListOfForbiddenInterval.add(i + 1);
      }
    }
  }
}


List <String> WrongINterval = ["Прима", "Малая секунда", "Большая секунда", "Малая терция", "Большая терция", "Кварта", "Тритон", "Квинта", "Малая секста", "Большая секста", "Малая септима", "Большая септима", "Октава"];

showAlertDialogCorrect(BuildContext Dialogcontext) {
  AlertDialog alert = AlertDialog(
    title: Text("Правильно!",
      textAlign: TextAlign.center,),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0))
    ),
    content: Text("${WrongINterval[NumberOfInterval-1]}.",
      textAlign: TextAlign.center,),
    actions: [
      ],
  );
  // show the dialog
  showDialog(
    context: Dialogcontext,
    barrierDismissible: false,
    builder: (BuildContext Dialogcontext) {
      return alert;
    },
  );
}

showAlertDialogWrong(BuildContext Dialogcontext) {
  AlertDialog alert = AlertDialog(
    title: Text("Неверно.",
        textAlign: TextAlign.center,
    ),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0))
    ),
    content: Text("${WrongINterval[NumberOfInterval-1]}.",
      textAlign: TextAlign.center,
    ),
    actions: [
    ],);
  // show the dialog
  showDialog(
    context: Dialogcontext,
    barrierDismissible: false,
    builder: (BuildContext Dialogcontext) {
      return alert;
    },
  );
}


class _InhVisButton extends InheritedWidget {
  _InhVisButton({
    Key key,
    @required Widget child,
    @required this.data,
  }) : super(key: key, child: child);

  final InhVisButtonState data;

  @override
  bool updateShouldNotify(_InhVisButton oldWidget) {
    return true;
  }}


class InhVisButton extends StatefulWidget {

  InhVisButton({
    Key key,
    this.child,
  }): super(key: key);

  final Widget child;

  @override
  InhVisButtonState createState() => new InhVisButtonState();

  static InhVisButtonState of (BuildContext Vcontext) {
    return (Vcontext.dependOnInheritedWidgetOfExactType<_InhVisButton>()).data;
  }
}

class InhVisButtonState extends State<InhVisButton>{

  void OnPress(){
    setState(() {
      visibility_buttonList = true;
    });
  }

  @override
  Widget build(BuildContext Vcontext){
    return new _InhVisButton(
      data: this,
      child: widget.child,
    );
  }
}


class _MyInherited extends InheritedWidget {
  _MyInherited({
    Key key,
    @required Widget child,
    @required this.data,
  }) : super(key: key, child: child);

  final MyInheritedWidgetState data;

  @override
  bool updateShouldNotify(_MyInherited oldWidget) {
    return true;
  }
}

class MyInheritedWidget extends StatefulWidget {

  MyInheritedWidget({
    Key key,
    this.child,
  }): super(key: key);

  final Widget child;

  @override
  MyInheritedWidgetState createState() => new MyInheritedWidgetState();

  static MyInheritedWidgetState of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<_MyInherited>()).data;
  }
}

class MyInheritedWidgetState extends State<MyInheritedWidget>{


  void MakeInterval()  {
    setState(() {
      //NumberOfInterval = random.nextInt(7);
      FirstNote = random.nextInt(25)+1;
      //SecondNote = FirstNote + random.nextInt(11);
      SecondNote = FirstNote + ListOfForbiddenInterval[random.nextInt(ListOfForbiddenInterval.length)] -1;
      NumberOfInterval = SecondNote - FirstNote + 1;
      print(isCelected);
      print(ListOfForbiddenInterval);
      print('ПЕРВАЯ НОТА: $FirstNote');
      print('ВТОРАЯ НОТА: $SecondNote');
      /*print("FirstNoteFirstNote: $FirstNote");
      print("NumberOfInterval: $NumberOfInterval");*/
    });
  }

  void changeColor(){
    setState(() {
      redColor = greenColor;
    });
  }

  static var greenColor = Colors.green;
  static var redColor = Colors.red;
  static var whiteColor = Colors.white;

  void correctIncrement(){
    setState(() {
      correct++;
    });
  }

  void wrongIncrement(){
    setState(() {
      wrong++;
    });
  }

  //int NumberOfInterval = random.nextInt(12);
  int correct  = 0;
  int wrong = 0;

  @override
  Widget build(BuildContext context){
    return new _MyInherited(
        data: this,
        child: widget.child,
    );
  }
}

class new_interval_button extends StatelessWidget{

  bool visibility = true;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xFF014B88), // background
        ),
      child:
        Text('Новый интервал'),
      onPressed: () async {
          PlayNotes(FirstNote, 0);
          PlayNotes2(SecondNote, 0);
    },
    );
  }
}

class b_n extends StatelessWidget{
  String textOnButton;
  int NumberInterval;
  b_n(this.textOnButton, this.NumberInterval);

  @override
  Widget build(BuildContext context){

    final MyInheritedWidgetState state = MyInheritedWidget.of(context);
    return
        Expanded(
        flex: 1,
        child:
        Container(
            padding: const EdgeInsets.fromLTRB(4,4,4,0),
            child: ElevatedButton (
              style: ElevatedButton.styleFrom(
                primary: Colors.grey[300], // background
              ),
              child: Text('$textOnButton', style: TextStyle(fontSize: 22, height:1, color: Colors.grey)),
              onPressed: () {
                print("old: номер кнопки: $NumberInterval, интервал: ${NumberOfInterval}");
                if( NumberInterval == NumberOfInterval){
                  state.correctIncrement();
                  showAlertDialogCorrect(context);
                  //print("номер кнопки: $NumberInterval, интервал: ${NumberOfInterval}");
                } else{
                  state.wrongIncrement();
                  //print("номер кнопки: $NumberInterval, интервал: $NumberOfInterval");
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.green  //Add color of your choice
                          )
                      ),
                      child: showAlertDialogWrong(context));
                };
                state.MakeInterval();
                Future.delayed(Duration(seconds: 1), (){
                  Navigator.of(context, rootNavigator: true).pop();
                });
                Future.delayed(Duration(milliseconds: 1200),(){
                PlayNotes(FirstNote, 0);
                PlayNotes2(SecondNote, 1200);});
                print("новый интервал: ${NumberOfInterval}");
              },
            )));
  }}

class topButton extends StatefulWidget {
  @override
  topButtonState createState() => topButtonState();
}

class topButtonState extends State<topButton>{
  /*String wayToPlayInterval;
  int note;
  int num;
  int note2;
  int num2;
  topButton(this.wayToPlayInterval, this.note, this.num, this.note2, this.num2);*/




  //b_n p1 = b_n(update: _update);
  /*b_n m2 = b_n('m2',);
  b_n b2 = b_n('b2');
  b_n m3 = b_n('m3');
  b_n b3 = b_n('b3');
  b_n p4 = b_n('p4');
  b_n p5 = b_n('p5');
  b_n m6 = b_n('m6');
  b_n b6 = b_n('b6');
  b_n m7 = b_n('m7');
  b_n b7 = b_n('b7');*/

  @override
  Widget build(BuildContext context) {
    return
       Row(
              children: [
           Expanded(
           flex: 1,
           child:
                Container(
                  color: Colors.lightBlue[900],
                  padding: const EdgeInsets.fromLTRB(8,8,8,8),
                  child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xFF014B88), // background
                        ),
                        onPressed:
                            () async {
                          print(ListOfForbiddenInterval);
                          /*setState(() {
                            NumberOfInterval = random.nextInt(7);
                            print(NumberOfInterval);
                          });*/
                          PlayNotes(FirstNote, 0);
                          PlayNotes2(SecondNote, 1200);
                        },
                        child: Text('Восх.', style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w300)),
                      ))),
                Expanded(
                    flex: 1,
                    child:
                    Container(
                        color: Colors.lightBlue[900],
                        padding: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF014B88), // background
                          ),
                          onPressed:
                              () async {
                            PlayNotes(SecondNote, 0);
                            PlayNotes2(FirstNote, 1200);
                          },
                          child: Text('Нисх.', style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w300)),
                        ))),
                Expanded(
                    flex: 1,
                    child:
                    Container(
                        color: Colors.lightBlue[900],
                        padding: const EdgeInsets.fromLTRB(8,8,8,8),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF014B88), // background
                          ),
                          onPressed:
                              () async {
                            PlayNotes(FirstNote, 0);
                            PlayNotes2(SecondNote, 0);
                          },
                          child: Text('Гарм.', style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w300)),
                        ))),
              ]);
  }
}

/*class b_n extends StatelessWidget{
  final ValueChanged<int> update;
  String textOnButton;
  b_n(this.textOnButton, this.update);

  @override
  Widget build(BuildContext context){
    return Expanded(
        flex: 1,
        child: Container(
            padding: const EdgeInsets.fromLTRB(4,4,4,0),
            child: ElevatedButton (
              style: ElevatedButton.styleFrom(
                primary: Colors.grey[300], // background
              ),
              onPressed: () => update(random.nextInt(100)),
              child: Text('$textOnButton', style: TextStyle(fontSize: 22, height:1, color: Colors.grey)),
            )));
  }}*/

class correctOrWrong extends StatelessWidget{
  /*int  correct;
  int  wrong;
  correctOrWrong(this.correct, this.wrong);*/


  @override
  Widget build(BuildContext context) {
    final MyInheritedWidgetState state = MyInheritedWidget.of(context);
    return /*Expanded(
        child:*/ Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: 50,
                color: Colors.lightBlue[900],
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          width: 100,
                          height: 35,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [Image.asset("assets/images/gala.png", width: 40, height: 40),
                                Text('${state.correct}', style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.w700))])),
                      Container(
                          width: 100,
                          height: 35,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [Image.asset("assets/images/krest.png", width: 15, height: 15),
                                Text('${state.wrong}', style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.w700))]
                          ))]
                ))/*)*/);
  }
}

class empty extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SizedBox.shrink();
  }
}

bool visibility_buttonList = false;

class buttonList extends StatelessWidget{

  Widget p1 = isCelected[0]? b_n('p1', 1) : empty();
  Widget m2 = isCelected[1]? b_n('m2', 2) : Container(
  );
  Widget b2 = isCelected[2]? b_n('b2', 3) : Container();
  Widget m3 = isCelected[3]? b_n('m3', 4) : Container();
  Widget b3 = isCelected[4]? b_n('b3', 5) : Container();
  Widget p4 = isCelected[5]? b_n('p4', 6) : Container();
  Widget p5 = isCelected[6]? b_n('p5', 8) : Container();
  Widget m6 = isCelected[7]? b_n('m6', 9) : Container();
  Widget b6 = isCelected[8]? b_n('b6', 10) : Container();
  Widget m7 = isCelected[9]? b_n('m7', 11) : Container();
  Widget b7 = isCelected[10]? b_n('b7', 12) : Container();
  buttonList(/*this.prim, this.msec, this.bsec, this.mter, this.bter, this.kvar, this.kvin, this.msex, this.bsex, this.msept, this.bsept*/);

  @override
  Widget build(BuildContext Vcontext) {
    final InhVisButtonState statet = InhVisButton.of(Vcontext);
    return (!visibility_buttonList)? ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF014B88), // background
      ),
      child:
      Text('Новый интервал'),
      onPressed: () async {
        statet.OnPress();
        PlayNotes(FirstNote, 150);
        PlayNotes2(SecondNote, 1200);
      },
    ) : Column(
        mainAxisAlignment: MainAxisAlignment.start,
        verticalDirection: VerticalDirection.down,
        children: <Widget> [
          Container(
              child: Row(
                  children: [this.p1]
              )
          ),
          Container(
              child:Row(
                  children: [this.m2, this.b2]
              )),
          Container(
              child: Row(
                  children: [this.m3, this.b3]
              )),
          Container(
            child: Row(
                children: [this.p4, this.p5]
            ),
          ),
          Container(
            child: Row(
                children: [this.m6, this.b6]
            ),
          ),
          Container(
            child: Row(
                children: [this.m7, this.b7]
            ),
          ),
        ]      );
  }
}


void main(){
  BoolToDigit();
  print("FirstNote: $FirstNote");
  print("SecondNote: $SecondNote");
  print("интервал: ${NumberOfInterval}");
  print(ListOfForbiddenInterval);
  /*Future.delayed(Duration(milliseconds: 1500),(){
    PlayNotes(FirstNote, 0);
    PlayNotes2(SecondNote, 1300);});*/
  runApp(
      MaterialApp(
          routes: {
            '/':(BuildContext context) => MyApp(),
            '/second':(BuildContext context) => SecondScreen()
          },
      )
  );
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

/*final player1 = AudioPlayer();
final player2 = AudioPlayer();
int NumberOfInterval = random.nextInt(7);
int FirstNote = random.nextInt(29);
int SecondNote = FirstNote + NumberOfInterval;
var random = Random();*/

Future PlayNotes(note, num) async {
  await Future.delayed(Duration(milliseconds: num));
  await player1.setAsset('assets/notes/$note.mp3');
  player1.play();
}

Future PlayNotes2(note, num) async {
  await Future.delayed(Duration(milliseconds: num));
  await player2.setAsset('assets/notes/$note.mp3');
  player2.play();
}
/*Widget p1 = isCelected[0]? b_n('p1', 1) : Container();
Widget m2 = isCelected[1]? b_n('m2', 2) : Container();
Widget b2 = isCelected[2]? b_n('b2', 3) : Container();
Widget m3 = isCelected[3]? b_n('m3', 4) : Container();
Widget b3 = isCelected[4]? b_n('b3', 5) : Container();
Widget p4 = isCelected[5]? b_n('p4', 6) : Container();
Widget p5 = isCelected[6]? b_n('p5', 8) : Container();
Widget m6 = isCelected[7]? b_n('m6', 9) : Container();
Widget b6 = isCelected[8]? b_n('b6', 10) : Container();
Widget m7 = isCelected[9]? b_n('m7', 11) : Container();
Widget b7 = isCelected[10]? b_n('b7', 12) : Container();*/


class _MyAppState extends State<MyApp> {

//  int correct  = 0;

  //List<String> notes = ['1.mp3','2.mp3','3.mp3','4.mp3','5.mp3','6.mp3','7.mp3','8.mp3','9.mp3','10.mp3','11.mp3','12.mp3','13.mp3','14.mp3','15.mp3','16.mp3','17.mp3','18.mp3','19.mp3','20.mp3','21.mp3','22.mp3','23.mp3','24.mp3','25.mp3','26.mp3','27.mp3','28.mp3','29.mp3','30.mp3','31.mp3','32.mp3','33.mp3','34.mp3','35.mp3','36.mp3'];

  @override
  void initState() {
    super.initState();
    //player = AudioPlayer();
  }
  @override
  void dispose() {
    player1.dispose();
    player2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MyInheritedWidget(
          child: Scaffold(
            body:
                 Column(
                mainAxisAlignment: MainAxisAlignment.start,
                verticalDirection: VerticalDirection.down,
                children:[
                  topButton(),
                  InhVisButton(
                  child:
                  buttonList()),
                  Expanded(
                    child: Container()
                  ),
                  correctOrWrong(),
                  /*ElevatedButton(
                  child: Text("Click", style: TextStyle(fontSize: 22)),
                onPressed: () async {
                  PlayNotes(FirstNote, 0);
                  PlayNotes2(SecondNote, 1300);
                  /*await player.setAsset('assets/notes/1.mp3');
                  player.play();
                  sleep(const Duration(milliseconds: 1300));
                  await player.setAsset('assets/notes/2.mp3');
                  player.play();*/
                  },
              ),*/
                ]
            ),
            appBar: AppBar(backgroundColor: Colors.lightBlue[900],shadowColor: Colors.black, title:Text("Тренажер"), leading: Container(), actions: <Widget>[
              AppBarSettingsButton()
            ]),
              drawer: Drawer()
          )),
    );
  }
}

class AppBarSettingsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.settings),
        onPressed: ()
        {
        Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen()));
          print(isCelected);
        },
    );
  }
}


class SecondScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MyInheritedWidget(
        child: Scaffold(
        body: SecondScreen1(),
            drawer: Drawer()
    )
    ));
  }
}

class SecondScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MyInheritedWidgetState state = MyInheritedWidget.of(context);
    return
      Scaffold(
          drawer: Drawer(),
      body: Column(
          children: <Widget> [
            Container(
                height: 55,
                child: Row(
                    children: [p_1()]
                )
            ),
            Container(
                child:Row(
                    children: [m_2(), b_2()]
                )),
            Container(
                child: Row(
                    children: [m_3(), b_3()]
                )),
            Container(
              child: Row(
                  children: [p_4(), p_5()]
              ),
            ),
            Container(
              child: Row(
                  children: [m_6(), b_6()]
              ),
            ),
            Container(
              child: Row(
                  children: [m_7(), b_7()]
              ),
            ),
          ]      ),
      appBar: AppBar(backgroundColor: Colors.lightBlue[900],shadowColor: Colors.black, title:Text("Настройки"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (){
              visibility_buttonList = false;
              BoolToDigit();
              state.MakeInterval();
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
            },
          )
      ),
     /* body: Center(child: ElevatedButton(onPressed: (){
        Navigator.pop(context);
      }, child: Text('Назад')))*/
    );
  }
}
List<bool> isCelected =[true, true, true, true, true, true, true, true, true, true, true];

class p_1 extends StatefulWidget{
  @override
  p1_State  createState() => p1_State();
}

class p1_State extends State<p_1> {

  Color White = !isCelected[0]? Colors.white : Colors.grey[300];
  @override
  Widget build(BuildContext context) {
    return
      Expanded(
          flex: 1,
          child: Container(
              padding: const EdgeInsets.fromLTRB(4,4,4,0),
              child: ElevatedButton (
                  style: ElevatedButton.styleFrom(
                    primary: White,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                        side: BorderSide(color: Colors.grey[600])
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      White = isCelected[0]? Colors.white : Colors.grey[300];
                      isCelected[0] = !isCelected[0];

                    });
                    ;},
                  child: Text('p1', style: TextStyle(fontSize: 18, height:1, color: Colors.grey))
              )));
  }
}

class m_2 extends StatefulWidget{
  @override
  m2_State  createState() => m2_State ();
}

class m2_State extends State<m_2> {

  Color White = !isCelected[1]? Colors.white : Colors.grey[300];
  @override
  Widget build(BuildContext context) {
    return
      Expanded(
          flex: 1,
          child: Container(
              padding: const EdgeInsets.fromLTRB(4,4,4,0),
              child: ElevatedButton (
                  style: ElevatedButton.styleFrom(
                    primary: White,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                        side: BorderSide(color: Colors.grey[600])
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      White = isCelected[1]? Colors.white : Colors.grey[300];
                      isCelected[1] = !isCelected[1];
                    });
                    ;},
                  child: Text('m2', style: TextStyle(fontSize: 18, height:1, color: Colors.grey))
              )));
  }
}

class b_2 extends StatefulWidget{
  @override
  b2_State  createState() => b2_State();
}

class b2_State  extends State<b_2> {

  Color White = !isCelected[2]? Colors.white : Colors.grey[300];
  @override
  Widget build(BuildContext context) {
    return
      Expanded(
          flex: 1,
          child: Container(
              padding: const EdgeInsets.fromLTRB(4,4,4,0),
              child: ElevatedButton (
                  style: ElevatedButton.styleFrom(
                    primary: White,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                        side: BorderSide(color: Colors.grey[600])
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      White = isCelected[2]? Colors.white : Colors.grey[300];
                      isCelected[2] = !isCelected[2];

                    });
                    ;},
                  child: Text('b2', style: TextStyle(fontSize: 18, height:1, color: Colors.grey))
              )));
  }
}

class m_3 extends StatefulWidget{
  @override
  m3_State createState() => m3_State();
}

class m3_State  extends State<m_3> {

  Color White = !isCelected[3]? Colors.white : Colors.grey[300];
  @override
  Widget build(BuildContext context) {
    return
      Expanded(
          flex: 1,
          child: Container(
              padding: const EdgeInsets.fromLTRB(4,4,4,0),
              child: ElevatedButton (
                  style: ElevatedButton.styleFrom(
                    primary: White,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                        side: BorderSide(color: Colors.grey[600])
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      White = isCelected[3]? Colors.white : Colors.grey[300];
                      isCelected[3] = !isCelected[3];

                    });
                    ;},
                  child: Text('m3', style: TextStyle(fontSize: 18, height:1, color: Colors.grey))
              )));
  }
}

class b_3 extends StatefulWidget{
  @override
  b3_State createState() => b3_State();
}

class b3_State extends State<b_3> {

  Color White = !isCelected[4]? Colors.white : Colors.grey[300];
  @override
  Widget build(BuildContext context) {
    return
      Expanded(
          flex: 1,
          child: Container(
              padding: const EdgeInsets.fromLTRB(4,4,4,0),
              child: ElevatedButton (
                  style: ElevatedButton.styleFrom(
                    primary: White,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                        side: BorderSide(color: Colors.grey[600])
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      White = isCelected[4]? Colors.white : Colors.grey[300];
                      isCelected[4] = !isCelected[4];
                    });
                    ;},
                  child: Text('b3', style: TextStyle(fontSize: 18, height:1, color: Colors.grey))
              )));
  }
}

class p_4 extends StatefulWidget{
  @override
  p4_State createState() => p4_State();
}

class p4_State extends State<p_4> {

  Color White = !isCelected[5]? Colors.white : Colors.grey[300];
  @override
  Widget build(BuildContext context) {
    return
      Expanded(
          flex: 1,
          child: Container(
              padding: const EdgeInsets.fromLTRB(4,4,4,0),
              child: ElevatedButton (
                  style: ElevatedButton.styleFrom(
                    primary: White,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                        side: BorderSide(color: Colors.grey[600])
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      White = isCelected[5]? Colors.white : Colors.grey[300];
                      isCelected[5] = !isCelected[5];

                    });
                    ;},
                  child: Text('p4', style: TextStyle(fontSize: 18, height:1, color: Colors.grey))
              )));
  }
}

class p_5 extends StatefulWidget{
  @override
  p5_State createState() => p5_State();
}

class p5_State extends State<p_5> {

  Color White = !isCelected[6]? Colors.white : Colors.grey[300];
  @override
  Widget build(BuildContext context) {
    return
      Expanded(
          flex: 1,
          child: Container(
              padding: const EdgeInsets.fromLTRB(4,4,4,0),
              child: ElevatedButton (
                  style: ElevatedButton.styleFrom(
                    primary: White,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                        side: BorderSide(color: Colors.grey[600])
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      White = isCelected[6]? Colors.white : Colors.grey[300];
                      isCelected[6] = !isCelected[6];
                    });
                    ;},
                  child: Text('p5', style: TextStyle(fontSize: 18, height:1, color: Colors.grey))
              )));
  }
}

class m_6 extends StatefulWidget{
  @override
  m6_State createState() => m6_State();
}

class m6_State extends State<m_6> {

  Color White = !isCelected[7]? Colors.white : Colors.grey[300];
  @override
  Widget build(BuildContext context) {
    return
      Expanded(
          flex: 1,
          child: Container(
              padding: const EdgeInsets.fromLTRB(4,4,4,0),
              child: ElevatedButton (
                  style: ElevatedButton.styleFrom(
                    primary: White,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                        side: BorderSide(color: Colors.grey[600])
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      White = isCelected[7]? Colors.white : Colors.grey[300];
                      isCelected[7] = !isCelected[7];

                    });
                    ;},
                  child: Text('m6', style: TextStyle(fontSize: 18, height:1, color: Colors.grey))
              )));
  }
}

class b_6 extends StatefulWidget{
  @override
  b6_State createState() => b6_State();
}

class b6_State extends State<b_6> {

  Color White = !isCelected[8]? Colors.white : Colors.grey[300];
  @override
  Widget build(BuildContext context) {
    return
      Expanded(
          flex: 1,
          child: Container(
              padding: const EdgeInsets.fromLTRB(4,4,4,0),
              child: ElevatedButton (
                  style: ElevatedButton.styleFrom(
                    primary: White,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                        side: BorderSide(color: Colors.grey[600])
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      White = isCelected[8]? Colors.white : Colors.grey[300];
                      isCelected[8] = !isCelected[8];
                    });
                    ;},
                  child: Text('b6', style: TextStyle(fontSize: 18, height:1, color: Colors.grey))
              )));
  }
}

class m_7 extends StatefulWidget{
  @override
  m7_State createState() => m7_State();
}

class m7_State extends State<m_7> {

  Color White = !isCelected[9]? Colors.white : Colors.grey[300];
  @override
  Widget build(BuildContext context) {
    return
      Expanded(
          flex: 1,
          child: Container(
              padding: const EdgeInsets.fromLTRB(4,4,4,0),
              child: ElevatedButton (
                  style: ElevatedButton.styleFrom(
                    primary: White,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                        side: BorderSide(color: Colors.grey[600])
                    ),
                  ),
                  onPressed: () {
                    setState(() {

                      White = isCelected[9]? Colors.white : Colors.grey[300];
                      isCelected[9] = !isCelected[9];
                    });
                    ;},
                  child: Text('m7', style: TextStyle(fontSize: 18, height:1, color: Colors.grey))
              )));
  }
}

class b_7 extends StatefulWidget{
  @override
  b7_State createState() => b7_State();
}

class b7_State extends State<b_7>{

  Color White = !isCelected[10]? Colors.white : Colors.grey[300];
  @override
  Widget build(BuildContext context) {
    return
      Expanded(
          flex: 1,
          child: Container(
              padding: const EdgeInsets.fromLTRB(4,4,4,0),
              child: ElevatedButton (
                  style: ElevatedButton.styleFrom(
                    primary: White,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                        side: BorderSide(color: Colors.grey[600])
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      White = isCelected[10]? Colors.white : Colors.grey[300];
                      isCelected[10] = !isCelected[10];
                      print(isCelected);
                    });
                    ;},
                  child: Text('b7', style: TextStyle(fontSize: 18, height:1, color: Colors.grey))
              )));
  }
}

class ThreeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(),
        body:
        Container(
            padding: EdgeInsets.all(10),
    child:
        Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropDownDemo(),
            quanityChord(),
            Expanded(
              child:
                Container()
            ),
            PlayButton()
          ],
        )),
    appBar: AppBar(backgroundColor: Colors.lightBlue[900],shadowColor: Colors.black, title:Text("Тренажер Гармонии")));
  }
}

List<int> ListOfForbiddenInterval = [];


class PlayButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
        child:
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blue[900], // background
            ),
        onPressed: (){},
        child: Text('Начать')
        ));
  }
}



class DropDownDemo extends StatefulWidget {
  @override
  _DropDownDemoState createState() => _DropDownDemoState();
}

class _DropDownDemoState extends State<DropDownDemo> {
  String _chosenValue;

  @override
  Widget build(BuildContext context) {
    return
    Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Тональность:'),
    Row(
    children:
    [
      Center(
        child: Container(
          padding: const EdgeInsets.all(0.0),
          child: DropdownButton<String>(
            value: _chosenValue,
            //elevation: 5,
            style: TextStyle(color: Colors.black),
            items: <String>[
              'C-dur', 'D-dur','E-dur', 'F-dur','G-dur', 'A-dur','B-dur', 'Случайная'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            hint: Text(
              "",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            onChanged: (String value) {
              setState(() {
                _chosenValue = value;
              });
            },
      )),
    ),
      Container(
        margin: EdgeInsets.only(right:50),
      )

    ]
    )]);
  }
}

class quanityChord extends StatefulWidget {
  @override
  quanityChordState createState() => quanityChordState();
}

class quanityChordState extends State<quanityChord>{

  int cnt = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:
        [
          Text('Kоличество \n аккордов:'),
          Row(
          children: [
          IconButton (
              icon: Icon(Icons.arrow_left),
              onPressed: (){
                setState((){
                  if (cnt > 0){cnt--;}
                });
              }
          ),
          Container(
              /*decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent)
              ),*/
              child:
              Text('$cnt')
          ),
          IconButton(
              icon: Icon(Icons.arrow_right),
              onPressed: (
                  ){
                setState((){
                  cnt++;
                });
              }
          ),
            Container(
              margin: EdgeInsets.only(right:48),

            )
        ]
          )]);
  }
}
