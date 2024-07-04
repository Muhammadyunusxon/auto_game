import 'dart:async';

import 'package:auto_game/domain/service/http_service.dart';
import 'package:auto_game/infrastructure/model/model.dart';
import 'package:auto_game/infrastructure/services/app_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/response_modal.dart';
import 'widgets/upg_response_modal.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TextEditingController> tokenControllers = [];
  List<TextEditingController> upgradeController = [];
  List<TextEditingController> levelController = [];
  PageController pageController = PageController();
  final List<Timer?> _timerList = [];
  final List<Timer?> _timerListUPG = [];
  List<Response?> response = [];
  List upgradeResponse = [];
  List<ClickerUser?> user = [];
  List<String?> times = [];
  List<String?> tokens = [
    // "1719423352771RSNfS3G49IOZgL5yN6IHrUtAoAKXmsF8xniEClefzsCOUhr0lP4mvohNW3MqXDaf1786155243"
    // "1719423537172W3R3vFyMmIgPhjR4EXwfWBtNFXRM4NDMOkB7GdZkkifbgSaqTAxGdMxSFGSaJgYG5360475250"
    "1717492442713ewL0GETsMQZsjAkXZuOlIdNmSIt1sQiNDyv8zngx7vaTNko5TtiqlyPo2oiip3wD1458926891",
    "1717566487530aq48KYz9RrnNRl3LC1zlQD6Qwq3Q2DOHDMGHfr6WltPvzsEgIb7J8HSTA0uEuut75000295472",
    "1717609820219AWyOrtYlsNrb3wsIw3etAbz0D1uARPAhvMA4vK7axdNbGO2IiKUf7V7sHNdNhgLf1927432701",
    "1717493116770iUwoMfF9UNb4kBRAlADA4Iz0DZYYGffYJqzdGhl0rjB9x7wb0GP7APN2DDYWd5vj1643592320",
  ];

  @override
  void initState() {
    for (int i = 0; i < tokens.length; i++) {
      tokenControllers.add(TextEditingController(text: tokens[i]));
      upgradeController
          .add(TextEditingController(text: "sports_integration_0507"));
      levelController.add(TextEditingController(text: "12"));
      _timerList.add(null);
      _timerListUPG.add(null);
      response.add(Response(requestOptions: RequestOptions()));
      upgradeResponse.add(null);
      user.add(ClickerUser());
      times.insert(i, "");
    }
    super.initState();
  }

  @override
  void dispose() {
    for (int i = 0; i < tokens.length; i++) {
      tokenControllers[i].dispose();
      upgradeController[i].dispose();
      levelController[i].dispose();
      _timerList[i]?.cancel();
      _timerListUPG[i]?.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const SizedBox(height: 56),
        // ElevatedButton(
        //   onPressed: () {
        //     if (_timerList.any((e) => e.isActive)) {
        //       for (var e in _timerList) {
        //         e.cancel();
        //         setState(() {});
        //       }
        //
        //       return;
        //     }
        //     for (var e in _timerList) {
        //       if (!(e.isActive)) {
        //         _requestTap(_timerList.indexOf(e));
        //         e = Timer.periodic(const Duration(minutes: 30), (t) async {
        //           _requestTap(_timerList.indexOf(e));
        //         });
        //       }
        //     }
        //   },
        //   child: Text((_timerList.any((e) => e.isActive)) ? "Stop" : "Start"),
        // ),
        48.verticalSpace,
        Expanded(
          child: PageView.builder(
              itemCount: tokens.length,
              controller: pageController,
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  padding: REdgeInsets.all(16),
                  child: Column(children: [
                    Text("Page: $index"),
                    Text("Last Active: ${times[index]}"),
                    72.verticalSpace,
                    TextFormField(
                      maxLines: 4,
                      minLines: 1,
                      controller: tokenControllers[index],
                      decoration: const InputDecoration(
                          labelText: "Token without Bearer"),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _timerList[index]?.cancel();
                            setState(() {});
                          },
                          child: const Text("Stop"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (!(_timerList[index]?.isActive ?? false)) {
                              _requestTap(index);
                              _timerList[index] = Timer.periodic(
                                  const Duration(minutes: 30), (t) async {
                                _requestTap(index);
                              });
                            }
                          },
                          child: Text((_timerList[index]?.isActive ?? false)
                              ? "${(_timerList[index]?.tick ?? 0) + 1}"
                              : "Start"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () {
                        AppHelper.showCustomModalBottomDragSheet(
                          context: context,
                          paddingTop: 0,
                          modal: (c) => ResponseModal(
                            response: response[index],
                            clickerUser: user[index],
                            controller: c,
                          ),
                        );
                      },
                      child: const Text("Show response"),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            maxLines: 1,
                            minLines: 1,
                            controller: upgradeController[index],
                            decoration:
                                const InputDecoration(labelText: "UpgradeId"),
                          ),
                        ),
                        12.horizontalSpace,
                        Expanded(
                          child: TextFormField(
                            maxLines: 1,
                            minLines: 1,
                            maxLength: 2,
                            controller: levelController[index],
                            decoration: const InputDecoration(
                                counterText: "", labelText: "Max level"),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    12.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _timerListUPG[index]?.cancel();
                            setState(() {});
                          },
                          child: const Text("Stop"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (!(_timerListUPG[index]?.isActive ?? false)) {
                              _upgradeTap(index);
                            }
                          },
                          child: Text((_timerListUPG[index]?.isActive ?? false)
                              ? "${(_timerListUPG[index]?.tick ?? 0) + 1}"
                              : "Start"),
                        ),
                      ],
                    ),
                    24.verticalSpace,
                    ElevatedButton(
                      onPressed: () {
                        AppHelper.showCustomModalBottomDragSheet(
                          context: context,
                          paddingTop: 0,
                          modal: (c) => UpgResponseModal(
                            response: upgradeResponse[index],
                            controller: c,
                          ),
                        );
                      },
                      child: const Text("Show response"),
                    ),
                    40.verticalSpace,
                  ]),
                );
              }),
        ),
      ],
    ));
  }

  _requestTap(int index) async {
    final body = {
      "availableTaps": 10000,
      "count": 1000000,
      "timestamp": 1717518112000
    };
    times.insert(index, TimeOfDay.now().format(context));
    final client = HttpService().client(token: tokenControllers[index].text);
    final res = await client.post(
      '/clicker/tap',
      data: body,
    );
    response[index] = res;
    user[index] = ResponseModel.fromJson(res.data).clickerUser;
    debugPrint("response");
    setState(() {});
  }

  _upgradeTap(int index) async {
    try {
      final body = {
        "upgradeId": upgradeController[index].text,
        "timestamp": 1717518112000
      };
      times.insert(index, TimeOfDay.now().format(context));
      final client = HttpService().client(token: tokenControllers[index].text);
      final res = await client.post('/clicker/buy-upgrade', data: body);
      upgradeResponse[index] = res.data;
      _timerListUPG[index] =
          Timer.periodic(const Duration(seconds: 10), (t) async {
        _upgradeTap(index);
      });
    } catch (e) {
      _timerListUPG[index]?.cancel();
      upgradeResponse[index] = (e as DioException).response?.data;
      _timerListUPG[index] = Timer.periodic(
          Duration(seconds: AppHelper.errorSecond(e) ?? 5), (t) async {
        _timerListUPG[index]?.cancel();
        _upgradeTap(index);
      });
    }

    setState(() {});
  }

  requestSync(String text, int index) async {
    // final body = {
    //   "availableTaps": 10000,
    //   "count": 1000000,
    //   "timestamp": 1717518112000
    // };
    times.insert(index, TimeOfDay.now().format(context));
    final client = HttpService().client(token: text);
    final res = await client.post(
      'https://api.hamsterkombat.io/clicker/sync',
      // data: body,
    );
    response[index] = res;
    user[index] = ResponseModel.fromJson(res.data).clickerUser;
    debugPrint("response");
    setState(() {});
  }
}
