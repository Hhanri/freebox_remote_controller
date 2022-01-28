import 'package:flutter/material.dart';
import 'package:freebox_remote_controller/models/remote_button_class.dart';
import 'package:freebox_remote_controller/resources/remote_button_data.dart';
import 'package:freebox_remote_controller/widgets/remote_button_widget.dart';

class NumPadWidget extends StatelessWidget {
  NumPadWidget({
    Key? key,
  }) : super(key: key);

  final List<RemoteButton> numPad = [
    RemoteButtonsWidgets.n1,
    RemoteButtonsWidgets.n2,
    RemoteButtonsWidgets.n3,
    RemoteButtonsWidgets.n4,
    RemoteButtonsWidgets.n5,
    RemoteButtonsWidgets.n6,
    RemoteButtonsWidgets.n7,
    RemoteButtonsWidgets.n8,
    RemoteButtonsWidgets.n9,
    RemoteButtonsWidgets.placeholder,
    RemoteButtonsWidgets.n0,
    RemoteButtonsWidgets.placeholder
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        RemoteButton _currentButton = numPad[index];
        if (numPad[index] != RemoteButtonsWidgets.placeholder) {
          return RemoteButtonWidget(buttonKey: _currentButton.buttonKey, icon: _currentButton.buttonWidget ,color: _currentButton.backgroundColor ?? Colors.transparent);
        }
        return Container();
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:3,
        childAspectRatio: 4
      ),
      itemCount: numPad.length,
    );
  }
}

class PowerRowWidget extends StatelessWidget {
  PowerRowWidget({Key? key}) : super(key: key);

  final List<RemoteButton> rowButtons = [
    RemoteButtonsWidgets.tv,
    RemoteButtonsWidgets.placeholder,
    RemoteButtonsWidgets.power
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        RemoteButton _currentButton = rowButtons[index];
        if (rowButtons[index] != RemoteButtonsWidgets.placeholder) {
          return RemoteButtonWidget(buttonKey: _currentButton.buttonKey, icon: _currentButton.buttonWidget ,color: _currentButton.backgroundColor ?? Colors.transparent);
        }
        return Container();
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:3,
        childAspectRatio: 4
      ),
      itemCount: rowButtons.length,
    );
  }
}

class DirectionalButtonsWidget extends StatelessWidget {
  DirectionalButtonsWidget({Key? key}) : super(key: key);

  final List<RemoteButton> directionalButtons = [
    RemoteButtonsWidgets.red,
    RemoteButtonsWidgets.up,
    RemoteButtonsWidgets.blue,
    RemoteButtonsWidgets.left,
    RemoteButtonsWidgets.ok,
    RemoteButtonsWidgets.right,
    RemoteButtonsWidgets.green,
    RemoteButtonsWidgets.down,
    RemoteButtonsWidgets.yellow,
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        RemoteButton _currentButton = directionalButtons[index];
          return RemoteButtonWidget(buttonKey: _currentButton.buttonKey, icon: _currentButton.buttonWidget ,color: _currentButton.backgroundColor ?? Colors.transparent);
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:3,
        childAspectRatio: 4
      ),
      itemCount: directionalButtons.length,
    );
  }
}
