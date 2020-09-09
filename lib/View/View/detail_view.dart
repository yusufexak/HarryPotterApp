import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:harrypotterapp/Core/Extension/context_extension.dart';
import 'package:harrypotterapp/Core/Extension/string_extension.dart';
import 'package:harrypotterapp/View/Model/hp_c.dart';

class DetailView extends StatefulWidget {
  final HPCharacters character;

  const DetailView({Key key, this.character}) : super(key: key);
  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var character = widget.character;
    return Scaffold(
      key: _scaffoldKey,
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              character.name,
              style: context.textTheme.headline5,
            ),
            SizedBox(
              height: context.constMediumValue,
            ),
            OutlineButton(
              onPressed: () {
                showModal(
                  configuration: FadeScaleTransitionConfiguration(),
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(character.actor),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            Text(character.ancestry),
                            Text(character.gender),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Text(
                "OpenDialog".locale,
                style: context.textTheme.headline5,
              ),
              borderSide:
                  BorderSide(color: context.theme.primaryColor, width: 2),
            ),
          ],
        ),
      ),
    );
  }
}
