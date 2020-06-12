import 'package:flutter/material.dart';

void main() {
  runApp(ExperimentManagement());
}

class ExperimentManagement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeTab());
  }
}

class _ButtonsToAdd extends StatelessWidget {
  const _ButtonsToAdd({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Spacer(flex: 8),
        IconButton(
          iconSize: 40,
          icon: Icon(Icons.person_add),
        ),
        Spacer(flex: 1),
        IconButton(
          iconSize: 40,
          icon: Icon(Icons.event),
        ),
        Spacer(flex: 3),
      ],
    );
  }
}

Size displaySize(BuildContext context) {
  return MediaQuery.of(context).size;
}

class MyAppBar extends AppBar {
  MyAppBar({Key key, Widget title})
      : super(
          key: key,
          title: title,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Experiment',
              ),
              Tab(
                text: 'Activity',
              ),
            ],
          ),
        );
}

class HomeTab extends StatelessWidget {
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Experiment',
              ),
              Tab(
                text: 'Activity',
              ),
            ],
          ),
          title: Text('Experiment Management'),
        ),
        body: TabBarView(
          children: [
            Icon(Icons.directions_car),
            Icon(Icons.directions_bike),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PushEventPage(),
              fullscreenDialog: true,
            ),
          ),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class PushEventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Container(
          child: Row(
            children: <Widget>[
              Spacer(flex: 20),
              _ButtonsToAdd(),
              Spacer(flex: 1),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pop(context),
          child: Icon(Icons.close),
        ),
      ),
    );
  }
}
