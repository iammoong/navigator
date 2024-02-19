import 'package:flutter/material.dart';
import 'package:navigator/layout/main_layout.dart';
import 'package:navigator/screen/route_one_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // true - pop 가능
        // false - pop 불가능
        final canPop = Navigator.of(context).canPop();

        return canPop;
      },
      child: MainLayout(
        title: 'Home Screen',
        children: [
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
          ElevatedButton(onPressed: (){
            Navigator.of(context).pop(123);
          },
            child: Text('Pop'),
          ),
          ElevatedButton(
            onPressed: () async {
              final result = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext contect) => RouteOneScreen(
                    number:123,
                  ),
                ),
              );
              print(result);
            },
            child: Text(
              'Push',
            ),
          ),
        ],
      ),
    );
  }
}
