import 'package:flutter/material.dart';
import 'package:navigator/layout/main_layout.dart';
import 'package:navigator/screen/route_two_screen.dart';

class RouteOneScreen extends StatelessWidget {
  final int? number;

  const RouteOneScreen({
    this.number,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(title: 'Route One', children: [
      Text(
        'arguments : ${number.toString()}',
        textAlign: TextAlign.center,
      ),
      ElevatedButton(onPressed: (){
        print(Navigator.of(context).canPop());
      },
        child: Text('Can Pop'),
      ),
      ElevatedButton(onPressed: (){
        // 뒤로 가기에 값이 없을 때 넘어가지 않게 방지
        Navigator.of(context).maybePop();
      },
        child: Text('Maybe Pop'),
      ),
      ElevatedButton(
          onPressed: () {
            // [HomeScreen(), RouteOne(), RouteTwo()]
            // 생성이 될 때는 오른쪽 부터, 지워질 때는 왼쪽 으로 데이터가 지워진다.
            // 위와 같은 데이터 구조를 스택(Stack) 이라고 한다.
            Navigator.of(context).pop(456);
          },
          child: Text('Pop')),
      ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => RouteTwoScreen(),
              settings: RouteSettings(
                arguments: 789,
              ),
            ),
          );
        },
        child: Text('Push'),
      ),
    ]);
  }
}
