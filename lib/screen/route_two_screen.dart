import 'package:flutter/material.dart';
import 'package:navigator/layout/main_layout.dart';
import 'package:navigator/screen/route_three_screen.dart';

class RouteTwoScreen extends StatelessWidget {
  const RouteTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute
        .of(context)!
        .settings
        .arguments;
    return MainLayout(
      title: 'Route Two',
      children: [
        Text(
          'arguments : ${arguments}',
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Pop')),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/three', arguments: 999);
          },
          child: Text('Push Named'),
        ),
        ElevatedButton(
          onPressed: () {
            // replacement 작동 방식
            // 원래 페이지 이동은 아래와 같이 한다.
            // [HomeScreen(), RouteOne(), RouteTwo(), RouteThree()]
            // 하지만 replacemente는 RouteTwo() -> RouteThree() 로 가게되면
            // [HomeScreen(), RouteOne(), RouteThree()] 처럼
            // RouteTwo()를 대체하는 것이다.
            /*Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => RouteThreeScreen(),
              ),*/

            Navigator.of(context).pushReplacementNamed(
                '/three'
            );
          },
          child: Text('Push Replacement'),
        ),
        ElevatedButton(onPressed: () {
          // [HomeScreen(), RouteOne(), RouteTwo(), RouteThree()]
          // setting.name에 있는 값 빼고 모두 삭제
          // [HomeScreen(), RouteThree()]
          /*Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => RouteThreeScreen()
          ),
                (route) => route.settings.name == '/',
          );*/
          Navigator.of(context).pushNamedAndRemoveUntil('/three',
                (route) => route.settings.name == '/',
          );
        },
          child: Text('Push And Remove Untill'),
        ),
      ],
    );
  }
}
