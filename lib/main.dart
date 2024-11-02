// 「Cupertino」はiOS系統のWidget
import 'package:flutter/cupertino.dart';

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
    return const CupertinoApp(
      title: 'Flutter Demo', // アプリのタイトル
      theme: CupertinoThemeData(
        // アプリのカラースキーム
        primaryColor: CupertinoColors.activeBlue,
      ),
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
    // scaffoldの代わりに、iOSスタイルのCupertinoPageScaffoldを使用
    // navigationBar/childプロパティを使って、各部分を簡単に設定できる
    return CupertinoPageScaffold(
      // CupertinoNavigationBarはiOSスタイルのナビゲーションバー
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.activeBlue,
        // loadingプロパティは、ナビゲーションバーの左側に表示されるWidget
        leading: Align(
          alignment: Alignment.centerLeft, // 左寄せかつ上下中央
          child: Text(
            widget.title,
            style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
          ),
        ),
        // trailingプロパティは、ナビゲーションバーの右側に表示されるWidget
        // loadingは左寄せ、trailingは右寄せ、middleは中央寄せ
        trailing: CupertinoButton(
          // paddingプロパティは、ボタンの内側の余白を設定
          // 余白をなくし、アイコンのみ表示されるように設定
          padding: EdgeInsets.zero,
          onPressed: _incrementCounter,
          child: const Icon(
            CupertinoIcons.add,
            color: CupertinoColors.white, // アイコンを白に設定
          ),
        ),
      ),
      // StackWidgetは、子Widgetを重ねて表示するためのWidget
      child: Stack(
        // childrenプロパティには、重ねて表示する子Widgetを設定
        children: [
          // CenterWidgetは、指定した子Widgetを中央に配置するためのWidget
          Center(
            // ColumnWidgetは、複数の子Widgetを縦方向に並べるためのレイアウトWidget
            child: Column(
              // mainAxisAlignmentプロパティは、縦方向の中央に配置する
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
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
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // PositionedWidgetは、子Widgetを指定した位置に配置するためのWidget
          Positioned(
            // 画面右下から50px上、30px左に配置
            bottom: 50,
            right: 30,
            // RowWidgetは、複数の子Widgetを横方向に並べるためのレイアウトWidget
            child: Row(
              // mainAxisAlignmentプロパティは、横方向の右寄せに配置する
              mainAxisSize: MainAxisSize.min,
              children: [
                CupertinoButton(
                  onPressed: _decrementCounter,
                  padding: EdgeInsets.zero,
                  child: const Icon(CupertinoIcons.minus_circle, size: 60),
                ),
                const SizedBox(width: 16),
                CupertinoButton(
                  onPressed: _incrementCounter,
                  padding: EdgeInsets.zero,
                  child: const Icon(CupertinoIcons.add_circled, size: 60),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
