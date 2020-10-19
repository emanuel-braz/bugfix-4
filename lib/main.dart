import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: OneContext().builder,
      navigatorKey: OneContext().key,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Test Bug #4',
            ),
            RaisedButton(
              child: Text('Show dialog'),
              onPressed: () {
                
                showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        actions: [
                          RaisedButton(
                              child: Text('Show Snackbar'),
                              onPressed: () {
                                OneContext().dismissSnackBar();
                                OneContext().showSnackBar(
                                    builder: (_) =>
                                        SnackBar(content: Text('My snackbar 2')));
                                OneContext().popDialog();
                              })
                        ],
                      );
                    });

                    OneContext().showSnackBar(
                                    builder: (_) =>
                                        SnackBar(content: Text('My snackbar 1')));

                // OneContext().showDialog(builder: (_) {
                //   return AlertDialog(
                //     actions: [
                //       RaisedButton(
                //           child: Text('Show Snackbar'),
                //           onPressed: () {
                //             OneContext().showSnackBar(
                //                 builder: (_) =>
                //                     SnackBar(content: Text('My snackbar')));
                //             OneContext().popDialog();
                //           })
                //     ],
                //   );
                // });
              },
            )
          ],
        ),
      ),
    );
  }
}
