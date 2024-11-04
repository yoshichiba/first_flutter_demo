// 「Material」はAndroid系統のWidget
import 'package:flutter/material.dart';

// void関数は「戻り値がない」ことを示す。
// もし関数が値を返す場合には、その値の型を指定する
// 整数を返す場合はint、文字列を返す場合はStringなど
// main関数はアプリケーションのエントリーポイント
// この関数が呼び出されると、アプリケーションが起動する
// runApp関数は、引数に渡されたWidgetを画面に表示する
// この場合、MyAppクラスのインスタンスを引数に渡している
// constを使ってMyAppインスタンスを生成している
// MyAppが定数インスタンスとして生成されるため、再レンダリングが不要な場合に効率的に処理される
void main() {
  runApp(const MyApp());
}

// MyAppクラスはStatelessWidgetクラスを継承している
// 「状態を持たない」Widgetを作成するために使用される
// ユーザーの操作によって変化するデータを持たない場合に使用される
class MyApp extends StatelessWidget {
  // constを使ってMyAppインスタンスを生成している
  // {super.key}は、親クラス(StatelessWidget)のkeyパラメータを受け取る
  // superは「親クラス」を指し、keyはStatelessWidgetが持つパラメータの一つ
  // keyはWidgetの一意性を管理するためのIDとして使われ、ツリー構造のWidgetを識別する
  // const MyApp({super.key});は、定数コンストラクタであるMyAppクラスのコンストラクタで、
  // 親クラスのkeyを直接受け取り、MyAppインスタンスを一意に管理するための役割を持つ
  const MyApp({super.key});

  // StatelessWidgetクラスから継承されたbuildメソッドをオーバーライドしている
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo', // アプリのタイトル
      theme: ThemeData(
        // アプリのカラースキーム
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        // Material Design3を有効化
        useMaterial3: true,
      ),
      // homeプロパティでアプリのホーム画面を設定
      // MyHomePageクラスを指定し、タイトルとして"Flutter Demo Home Page"を渡している
      // MyHomePageはこのアプリが起動した際に最初に表示される画面
      home: MyHomePage(title: 'Flutterヘッダー'),
    );
  }
}

// MyHomePageクラスはStatefulWidgetクラスを継承している
// 「状態を持つ」Widgetを作成するために使用される
// ユーザーの操作によって変化するデータを持つ場合に使用される
class MyHomePage extends StatefulWidget {
  // {super.key, required this.title}は、keyとtitleの2つの引数を受け取る
  // super.keyは、親クラスStatefulWidgetのkeyに値を渡すために使われ、
  // FlutterのWidgetツリー内でWidgetを一意に識別するために利用される
  // required this.titleは、必須の引数titleを設定する
  const MyHomePage({super.key, required this.title});

  // titleプロパティをfinalで宣言する
  // このプロパティは変更できない固定の値で、コンストラクタで一度設定されるとその後変更されない
  final String title;

  // State<MyHomePage>を作成するメソッドであるcreateStateをオーバーライドする
  @override
  // createStateメソッドはStatefulWidgetに必須のメソッド
  // 対応する状態クラスである_MyHomePageStateクラス（Stateオブジェクト）を返す
  // アンダーバーをつけることでそのメソッドはプライベートになる
  State<MyHomePage> createState() => _MyHomePageState();
}

// State<MyHomePage>を継承することで、このクラスはMyHomePage Widgetと連動する
// StatefulWidgetであるMyHomePageの状態を保持し、必要に応じて再描画を行う
class _MyHomePageState extends State<MyHomePage> {
  // _counterはint型の整数で、初期値は0に設定されている
  // アンダーバーが付いているのでプライベート変数として定義されている
  int _counter = 0;

  // カウンターを増加させるメソッド
  // アンダーバーが付いているのでプライベート変数として定義されている
  void _incrementCounter() {
    // setStateメソッドは状態が変化したことを通知し、Widgetを再描画するために使用する
    // setStateを呼び出さずに_counterを更新した場合、変更が表示されない
    setState(() {
      // _counterを1ずつ増加させる
      // アンダーバーが付いているのでプライベート変数として定義されている
      _counter++;
    });
  }

  // カウンターを減少させるメソッド
  // アンダーバーが付いているのでプライベート変数として定義されている
  void _decrementCounter() {
    // setStateメソッドは状態が変化したことを通知し、Widgetを再描画するために使用する
    // setStateを呼び出さずに_counterを更新した場合、変更が表示されない
    setState(() {
      // _counterを1ずつ減少させる
      // アンダーバーが付いているのでプライベート変数として定義されている
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Scaffoldは、Flutterアプリの基本的なレイアウト構造を提供するウィジェット
    // appBar/body/floatingActionButtonプロパティを使って、各部分を簡単に設定できる
    return Scaffold(
      // AppBarはアプリ画面の上部に表示されるバー
      // ここではアプリのタイトルや背景色が設定される
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(widget.title),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _incrementCounter,
          ),
        ],
      ),
      // bodyは画面の中央部分のレイアウトを構成
      // Center Widgetは、指定した子Widgetを中央に配置するためのWidget
      body: Center(
        // Column Widgetは、複数の子Widgetを縦方向に並べるためのレイアウトWidget
        child: Column(
          // MainAxisAlignment.centerにより、縦方向の中央に配置する
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 初期表示のテキスト
            const Text(
              'Hello Flutter!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'カウンターが1ずつ増加します',
            ),
            Text(
              // 文字列内に変数を埋め込むため$を使用する
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
