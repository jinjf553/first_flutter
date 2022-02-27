import 'dart:ffi';

import 'package:first_flutter/actions/account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../models/models.dart';
import '../actions/actions.dart';

class BootstrapPage extends StatelessWidget {
  const BootstrapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _Boyd(),
    );
  }
}

class _Boyd extends StatefulWidget {
  const _Boyd({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<_Boyd> {
  var _isFailed = false;

  @override
  void initState() {
    super.initState();

    _bootstrap();
  }

  void _bootstrap() {
    StoreProvider.of<AppState>(context)
        .dispatch(accountInfoAction(onSucceed: (user) {
      Navigator.of(context)
          .pushReplacementNamed(user.id == 0 ? '/login' : '/tab');
    }, onFailed: (notice) {
      setState(() {
        _isFailed = true;
      });
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(notice.message),
        duration: notice.duration,
      ));
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Spacer(
            flex: 5,
          ),
          const FractionallySizedBox(
            widthFactor: 0.3,
            child: Image(
              image: AssetImage('assets/wg-iocn-no-bg.png'),
            ),
          ),
          const Spacer(),
          _isFailed
              ? Column(
                  children: <Widget>[
                    const Text('网络请求出错'),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            _isFailed = false;
                          });
                        },
                        child: Text(
                          '再试一次',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary),
                        ))
                  ],
                )
              : const Text('data'),
          const Spacer(
            flex: 5,
          ),
        ],
      ),
    );
  }
}
