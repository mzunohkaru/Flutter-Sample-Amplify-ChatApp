import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:aws_amplify_sample/amplifyconfiguration.dart';
import 'package:aws_amplify_sample/models/ModelProvider.dart';
import 'package:aws_amplify_sample/models/SmallTalk.dart';
import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '雑談の小部屋',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomePage(title: '雑談の小部屋'),
      // 日本語フォントで表示
      // locale: const Locale("ja", "JP"),
      // supportedLocales: const [Locale("ja", "JP")],
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({super.key, required this.title});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _handleNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: "ハンドル名",
                  hintText: "太郎",
                ),
                controller: _handleNameController,
                maxLength: 20,
                autovalidateMode: AutovalidateMode.disabled,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "ハンドル名を入力してください。";
                  }
                },
              ),
              Container(
                padding: const EdgeInsets.all(30.0),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SmallTalkPage(
                          handleName: _handleNameController.text,
                        );
                      }));
                    }
                  },
                  child: const Text('入室'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SmallTalkPage extends StatefulWidget {
  const SmallTalkPage({Key? key, required this.handleName}) : super(key: key);

  final String handleName;

  @override
  _SmallTalkPageState createState() => _SmallTalkPageState();
}

class _SmallTalkPageState extends State<SmallTalkPage> {
  List<SmallTalk> smallTalks = <SmallTalk>[];
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  void _configureAmplify() async {
    // Amplifyの初期化処理
    try {
      if (!Amplify.isConfigured) {
        AmplifyDataStore datastorePlugin =
            AmplifyDataStore(modelProvider: ModelProvider.instance);
        await Amplify.addPlugin(datastorePlugin);
        await Amplify.addPlugin(AmplifyAPI());
        await Amplify.configure(amplifyconfig);
      }
    } on AmplifyAlreadyConfiguredException catch (e) {
      debugPrint('Amplify Configure failed: $e');
    }
    // 入室時にDataStoreの内容をクリア
    await Amplify.DataStore.clear();

    // Streamをlistenし、リアルタイムに雑談内容を受け取る
    Stream<QuerySnapshot<SmallTalk>> stream = Amplify.DataStore.observeQuery(
      SmallTalk.classType,
      where: SmallTalk.ROOM.eq("1"),
      sortBy: [SmallTalk.CREATEDAT.ascending()],
    );
    stream.listen((QuerySnapshot<SmallTalk> snapshot) {
      if (mounted) {
        setState(() {
          smallTalks = snapshot.items;
        });
      }
    });
  }

  Widget _buildMessage(int index) {
    if (widget.handleName == smallTalks[index].name) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(smallTalks[index].name),
          Dismissible(
            key: Key(smallTalks[index].id.toString()),
            direction: DismissDirection.endToStart,
            child: BubbleSpecialOne(
              text: smallTalks[index].message!,
              isSender: true,
            ),
            background: Container(
              padding: const EdgeInsets.only(right: 10),
              alignment: AlignmentDirectional.centerEnd,
              color: Colors.red,
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (direction) {
              _deleteMessage(index);
            },
          ),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(smallTalks[index].name),
          BubbleSpecialOne(
            text: smallTalks[index].message!,
            isSender: false,
          ),
        ],
      );
    }
  }

  void _postMessage() async {
    if (_messageController.text.trim().isNotEmpty) {
      SmallTalk smallTalk = SmallTalk(
        room: "1",
        name: widget.handleName,
        message: _messageController.text,
        createdAt: TemporalDateTime(DateTime.now()),
      );
      await Amplify.DataStore.save(smallTalk);
    }
    _messageController.text = '';
  }

  void _deleteMessage(int index) async {
    List<SmallTalk> _smallTalks = await Amplify.DataStore.query(
      SmallTalk.classType,
      where: SmallTalk.ID.eq(smallTalks[index].id),
    );
    for (SmallTalk _smallTalk in _smallTalks) {
      try {
        await Amplify.DataStore.delete(_smallTalk);
      } on DataStoreException catch (e) {
        debugPrint('Delete failed: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('トーク画面'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: smallTalks.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildMessage(index);
                },
              ),
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(10.0),
            child: Form(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Flexible(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      controller: _messageController,
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: 5,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send, color: Colors.red),
                    onPressed: () {
                      _postMessage();
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      backgroundColor: Colors.red.shade100,
    );
  }
}
