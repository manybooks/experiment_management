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
              Tab(text: 'Experiment'),
              Tab(text: 'Activity'),
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
              Tab(text: 'Experiment'),
              Tab(text: 'Event'),
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
          child: Column(
            children: <Widget>[
              Spacer(flex: 4),
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

class _ButtonsToAdd extends StatelessWidget {
  const _ButtonsToAdd({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Spacer(flex: 10),
          Expanded(
            flex: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new _EventButton(
                  icon: Icon(Icons.watch),
                  label: 'Add Experiment',
                  onPressedHandler: () => print('Add experiment handler'),
                ),
                new _EventButton(
                  icon: Icon(Icons.note_add),
                  label: 'Add Event',
                  onPressedHandler: () => print('Add activity handler'),
                ),
              ],
            ),
          ),
          Spacer(flex: 1),
        ],
      ),
    );
  }
}

class _EventButton extends StatelessWidget {
  final String label;
  final Icon icon;
  final Function onPressedHandler;

  _EventButton({Key key, Icon icon, String label, Function onPressedHandler})
      : this.label = label,
        this.icon = icon,
        this.onPressedHandler = onPressedHandler,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text(this.label),
        IconButton(
          icon: this.icon,
          iconSize: 40,
          onPressed: () => this.onPressedHandler(),
        ),
      ],
    );
  }
}
