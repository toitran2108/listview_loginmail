import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(ListviewApp());
}

class ListviewApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (MaterialApp (home: ListviewAppPage()
    ));
  }

}

class ListviewAppPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListViewAppPageSate();
  }
}

class ListViewAppPageSate extends State<ListviewAppPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView tinh va dong'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
                width: 300,
                height: 200,
                child: Image.asset('assets/anhlist.gif')
            ),
            Text('Listview tinh'),
            ListviewTinh(),
            //Text('listview dong'),
            //ListviewDong(),
            Text('listview dong 2'),
            ListviewDong2(),
          ],
        ),
      ),
    );
  }
}
Widget ListviewTinh(){
  return ListView(shrinkWrap: true, children: [
    Card(child: ListTile(title: Text('Tran Van A'))),
    Card(child: ListTile(title: Text('Tran Van B'))),
  ]);
}
Widget ListviewDong(){
  int n = 4;
  List<int> list_so = List.generate(n, (i) => i*i);
  return ListView.builder(
      shrinkWrap: true,
      itemCount: n,
      itemBuilder: (BuildContext context, i) => Card(
          child: ListTile(
            title: Text('Phần tử ${list_so[i]}'),
            onTap: (){
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(duration: Duration(milliseconds: 100),
                      content: Text('Phần tử ${list_so[i]}')));
            },
          )));
}
Widget ListviewDong2(){
  int n = 5;
  List<int> list_so = List.generate(n, (i) => i*i);
  return ListView.separated(
      shrinkWrap: true,
      itemCount: n,
      itemBuilder: (BuildContext context, int i) => Text('Phần tử thứ: ${list_so[i]}'),
      separatorBuilder: (BuildContext context, int i) => Divider(),
  );
}