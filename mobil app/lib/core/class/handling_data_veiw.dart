// import 'package:ecommerce/core/class/statuseRequest.dart';
// import 'package:ecommerce/core/constans/imageasset.dart';

// import 'package:flutter/material.dart';

// import 'package:lottie/lottie.dart';

import 'package:flutter/material.dart';
import 'package:icumonitoring/core/class/statuseRequest.dart';

class HandlingDataVeiw extends StatelessWidget {
  final StatuseRequest statuseRequest;
  final Widget widget;
  final Widget loading;
  final Future<void> Function() onRefresh;
  const HandlingDataVeiw(
      {super.key,
      required this.statuseRequest,
      required this.widget,
      required this.onRefresh,
      required this.loading});

  @override
  Widget build(BuildContext context) {
    return statuseRequest == StatuseRequest.loading
        ? RefreshIndicator(onRefresh: onRefresh, child: loading)
        : statuseRequest == StatuseRequest.offlinefailure
            ? RefreshIndicator(
                onRefresh: onRefresh,
                child: ListView(
                  shrinkWrap: true,
                  children: const [
                    SizedBox(
                      height: 200,
                    ),
                    Center(
                      child: Text('not internt conect'),
                    ),
                    // Center(
                    //   child: Lottie.asset(ImageAsset.offline),
                    // ),
                  ],
                ),
              )
            : statuseRequest == StatuseRequest.serverfailure
                ? RefreshIndicator(
                    onRefresh: onRefresh,
                    child: ListView(
                      shrinkWrap: true,
                      children: const [
                        SizedBox(
                          height: 250,
                        ),
                        Center(
                          child: Text('server failer'),
                        ),
                      ],
                    ),
                  )
                : statuseRequest == StatuseRequest.notfound
                    ? RefreshIndicator(
                        onRefresh: onRefresh,
                        child: ListView(
                          shrinkWrap: true,
                          children: const [
                            SizedBox(
                              height: 70,
                            ),
                            Center(
                              // child: Lottie.asset(ImageAsset.noData),
                              child: Text('thers no data to show'),
                            ),
                          ],
                        ),
                      )
                    : statuseRequest == StatuseRequest.authFailer
                        ? RefreshIndicator(
                            onRefresh: onRefresh,
                            child: ListView(
                              shrinkWrap: true,
                              children: const [
                                SizedBox(
                                  height: 70,
                                ),
                                Center(
                                  // child: Lottie.asset(ImageAsset.noData),
                                  child: Text(
                                      'you are not allowd to access data no  '),
                                ),
                              ],
                            ),
                          )
                        : widget;
  }
}

class HandlingDataVeiwWebSocket extends StatelessWidget {
  final StatuseRequest statuseRequest;
  final Widget widget;
  final Widget loading;
  final Future<void> Function() onRefresh;
  const HandlingDataVeiwWebSocket(
      {super.key,
      required this.statuseRequest,
      required this.widget,
      required this.onRefresh,
      required this.loading});

  @override
  Widget build(BuildContext context) {
    return statuseRequest == StatuseRequest.loading
        ? RefreshIndicator(onRefresh: onRefresh, child: loading)
        : statuseRequest == StatuseRequest.offlinefailure
            ? RefreshIndicator(
                onRefresh: onRefresh,
                child: ListView(
                  shrinkWrap: true,
                  children: const [
                    SizedBox(
                      height: 200,
                    ),
                    Center(
                      child: Text('not internt conect'),
                    ),
                    // Center(
                    //   child: Lottie.asset(ImageAsset.offline),
                    // ),
                  ],
                ),
              )
            : statuseRequest == StatuseRequest.serverfailure
                ? RefreshIndicator(
                    onRefresh: onRefresh,
                    child: ListView(
                      shrinkWrap: true,
                      children: const [
                        SizedBox(
                          height: 250,
                        ),
                        Center(
                          child: Text(
                              'failde conecion with server reconnecting.....'),
                        ),
                      ],
                    ),
                  )
                : statuseRequest == StatuseRequest.notfound
                    ? RefreshIndicator(
                        onRefresh: onRefresh,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: ListView(
                            shrinkWrap: true,
                            children: const [
                              SizedBox(
                                height: 70,
                              ),
                              Center(
                                // child: Lottie.asset(ImageAsset.noData),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  'There is no working device for this patient.',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Icon(
                                color: Colors.red,
                                Icons.error_outline,
                                size: 100,
                              )
                            ],
                          ),
                        ),
                      )
                    : statuseRequest == StatuseRequest.authFailer
                        ? RefreshIndicator(
                            onRefresh: onRefresh,
                            child: ListView(
                              shrinkWrap: true,
                              children: const [
                                SizedBox(
                                  height: 70,
                                ),
                                Center(
                                  // child: Lottie.asset(ImageAsset.noData),
                                  child: Text(
                                      'you are not allowd to access data no  '),
                                ),
                              ],
                            ),
                          )
                        : widget;
  }
}

// class HandlingDataRecuest extends StatelessWidget {
//   final StatuseRequest statuseRequest;
//   final Widget widget;
//   final void Function()? onPressed;
//   const HandlingDataRecuest(
//       {super.key,
//       required this.statuseRequest,
//       required this.widget,
//       this.onPressed});

//   @override
//   Widget build(BuildContext context) {
//     return statuseRequest == StatuseRequest.loading
//         ? Center(
//             child: Lottie.asset(ImageAsset.loading),
//           )
//         : statuseRequest == StatuseRequest.offlinefailure
//             ? Center(
//                 child: Lottie.asset(ImageAsset.offline),
//               )
//             : statuseRequest == StatuseRequest.serverfailure
//                 ? Center(
//                     child: Column(
//                       children: [
//                         Lottie.asset(ImageAsset.server),
//                         ElevatedButton(
//                             style: ButtonStyle(
//                                 backgroundColor:
//                                     WidgetStateProperty.all(Colors.blue)),
//                             onPressed: onPressed,
//                             child: const Text(
//                               'العودة',
//                               style: TextStyle(color: Colors.white),
//                             ))
//                       ],
//                     ),
//                   )
//                 : widget;
//   }
// }
