import "package:flutter/material.dart";

class CustomOptionDialog extends StatelessWidget {
  final String title;
  final List<IconData> icons;
  final List<String> options;
  final List<VoidCallback> actions;

  const CustomOptionDialog({
    required this.title,
    required this.icons,
    required this.options,
    required this.actions,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text(title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(options.length, (index) {
          return ListTile(
            leading: Icon(icons[index]),
            title: Text(options[index]),
            onTap: () {
              Navigator.of(context).pop();
              actions[index]();
            },
          );
        }),
      ),
    );
  }
}
