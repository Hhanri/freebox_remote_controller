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
    return Center(
      child: GridView.builder(
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
          childAspectRatio: 30/11
        ),
        itemCount: numPad.length,
      ),
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
    return Center(
      child: GridView.builder(
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
          childAspectRatio: 3
        ),
        itemCount: rowButtons.length,
      ),
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
    return Center(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          RemoteButton _currentButton = directionalButtons[index];
          return RemoteButtonWidget(buttonKey: _currentButton.buttonKey, icon: _currentButton.buttonWidget ,color: _currentButton.backgroundColor ?? Colors.transparent);
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:3,
            childAspectRatio: 30/11
        ),
        itemCount: directionalButtons.length,
      ),
    );
  }
}

class VolColumnWidget extends StatelessWidget {
  VolColumnWidget({Key? key}) : super(key: key);

  final List<RemoteButton> volButtons = [
    RemoteButtonsWidgets.volUp,
    RemoteButtonsWidgets.volPlaceholder,
    RemoteButtonsWidgets.volDown
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*2/12,
      child: Center(
        child: GridView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            RemoteButton _currentButton = volButtons[index];
            if (_currentButton != RemoteButtonsWidgets.volPlaceholder) {
              return RemoteButtonWidget(buttonKey: _currentButton.buttonKey, icon: _currentButton.buttonWidget ,color: _currentButton.backgroundColor ?? Colors.transparent);
            }
            return Center(
              child: _currentButton.buttonWidget,
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1/2,
          ),
          itemCount: volButtons.length,
        ),
      ),
    );
  }
}

class MidColumnWidget extends StatelessWidget {
  MidColumnWidget({Key? key}) : super(key: key);

  final List<RemoteButton> midColumnButtons = [
    RemoteButtonsWidgets.mute,
    RemoteButtonsWidgets.placeholder,
    RemoteButtonsWidgets.rec,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*2/12,
      child: Center(
        child: GridView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            RemoteButton _currentButton = midColumnButtons[index];
            if (midColumnButtons[index] != RemoteButtonsWidgets.placeholder) {
              return RemoteButtonWidget(buttonKey: _currentButton.buttonKey, icon: _currentButton.buttonWidget ,color: _currentButton.backgroundColor ?? Colors.transparent);
            }
            return Container();
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1/2,
          ),
          itemCount: midColumnButtons.length,
        ),
      ),
    );
  }
}

class ProgColumnWidget extends StatelessWidget {
  ProgColumnWidget({Key? key}) : super(key: key);

  final List<RemoteButton> progButtons = [
    RemoteButtonsWidgets.prgmUp,
    RemoteButtonsWidgets.progPlaceholder,
    RemoteButtonsWidgets.prgmDown
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*2/12,
      child: Center(
        child: GridView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            RemoteButton _currentButton = progButtons[index];
            if (_currentButton != RemoteButtonsWidgets.progPlaceholder) {
              return RemoteButtonWidget(buttonKey: _currentButton.buttonKey, icon: _currentButton.buttonWidget ,color: _currentButton.backgroundColor ?? Colors.transparent);
            }
            return Center(
              child: _currentButton.buttonWidget,
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1/2,
          ),
          itemCount: progButtons.length,
        ),
      ),
    );
  }
}

class PlayRowWidget extends StatelessWidget {
  PlayRowWidget({Key? key}) : super(key: key);

  final List<RemoteButton> rowButtons = [
    RemoteButtonsWidgets.backward,
    RemoteButtonsWidgets.play,
    RemoteButtonsWidgets.forward
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          RemoteButton _currentButton = rowButtons[index];
          return RemoteButtonWidget(buttonKey: _currentButton.buttonKey, icon: _currentButton.buttonWidget ,color: _currentButton.backgroundColor ?? Colors.transparent);
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:3,
          childAspectRatio: 3
        ),
        itemCount: rowButtons.length,
      ),
    );
  }
}

class FreeButtonWidget extends StatelessWidget {
  const FreeButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RemoteButton _currentButton = RemoteButtonsWidgets.home;
    return FittedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RemoteButtonWidget(buttonKey: _currentButton.buttonKey, icon: _currentButton.buttonWidget, color: _currentButton.backgroundColor ?? Colors.transparent)
        ],
      ),
    );
  }
}

