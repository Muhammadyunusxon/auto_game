import 'dart:async';

import 'package:auto_game/domain/service/http_service.dart';
import 'package:auto_game/infrastructure/model/model.dart';
import 'package:auto_game/infrastructure/services/app_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:json_view/json_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  TextEditingController interval = TextEditingController();
  Timer? _timer;
  Response? response;
  ClickerUser? user;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(12),
            child: SingleChildScrollView(
              child: Column(children: [
                const SizedBox(height: 200),
                TextFormField(
                  maxLines: 4,
                  minLines: 1,
                  controller: controller,
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _timer?.cancel();
                        setState(() {});
                      },
                      child: const Text("Stop"),
                    ),
                      ElevatedButton(
                        onPressed: () {
                          if(!(_timer?.isActive ?? false)){
                            _request();
                            _timer = Timer.periodic(const Duration(minutes: 1),
                                    (t) async {
                                  print(t);
                                  _request();
                                });
                          }

                        },
                        child:  Text(((_timer?.isActive ?? false)) ? "${(_timer?.tick ?? 0)+1}" : "Start"),
                      ),
                  ],
                ),
                const SizedBox(height: 40),
                if (response?.data != null)
                  Column(
                    children: [
                      Text(AppHelper.numberFormat(number: user?.balanceCoins)),
                      SizedBox(
                        height: 1000,
                        child: JsonConfig(
                          data: JsonConfigData(
                              animation: true,
                              animationDuration:
                                  const Duration(milliseconds: 300),
                              animationCurve: Curves.ease,
                              itemPadding: const EdgeInsets.only(left: 8),
                              color: const JsonColorScheme(
                                stringColor: Colors.black,
                              ),
                              style: const JsonStyleScheme(
                                arrow: Icon(Icons.arrow_right),
                              )),
                          child: JsonView(
                            json: response?.data ?? '',
                          ),
                        ),
                      ),
                    ],
                  ),
              ]),
            )));
  }

  _request() async {
    final body = {
      "availableTaps": 10000,
      "count": 1000000,
      "timestamp": 1717518112000
    };
    final client = HttpService().client(token: controller.text);
    response = await client.post(
      '/clicker/tap',
      data: body,
    );
    user = ResponseModel.fromJson(response?.data).clickerUser;
    print("response");
    setState(() {});
  }
}
