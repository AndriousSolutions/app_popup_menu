//
// Original source provided by Andrious Solutions Ltd.  October 2022.
// Distributed "AS IS" WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
// either expressed or implied. Use, copy, and modify at your own risk.
//

import 'package:flutter/material.dart';

import '../subclass01.dart';
import '../subclass03.dart';
import '../subclass05.dart';
import 'build_inherited_widget.dart';

void main() => runApp(const MyMenuExampleApp(key: Key('MyApp')));

class MyMenuExampleApp extends StatelessWidget {
  const MyMenuExampleApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BuildInheritedWidget(
          child: HomeScreen(
            key: Key('HomeScreen'),
          ),
        ),
      );
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Fields referencing the mutable menu class
  late AppPopupMenu<String> appMenu01;
  late AppPopupMenu<String> appMenu03;
  late SubClass05 appMenu05;

  @override
  void initState() {
    super.initState();

    /// The App's menu comes from a subclass
    appMenu01 = SubClass01(key: const Key('SubClass01'));

    /// The App's menu comes from a subclass
    appMenu03 = SubClass03<String>(
        key: const Key('SubClass03'),
        onSelected: (String value) {
          InheritedData.of(appMenu03.context!)?.data = value;
          ScaffoldMessenger.of(appMenu03.context!).showSnackBar(
            SnackBar(
              content: Text('appMenu03 option: $value'),
            ),
          );
        });

//    appMenu03.items = ['1', '2', '3'];  // Uncomment to take precedence.

    // Comment out to see the menu options, 'Look at that!', below.
    appMenu03.menuEntries = const [
      PopupMenuItem(
        value: '1',
        child: Text('This'),
      ),
      PopupMenuItem(
        value: '2',
        child: Text('That'),
      ),
      PopupMenuItem(
        value: '3',
        child: Text('Other'),
      ),
    ];

    // This has the least precedence among provided menu items.
    // Should it have the most precedence? You tell me.
    appMenu03.itemBuilder = (BuildContext context) => const [
          PopupMenuItem(
            value: '4',
            child: Text('Look'),
          ),
          PopupMenuItem(
            value: '5',
            child: Text('at'),
          ),
          PopupMenuItem(
            value: '6',
            child: Text('that!'),
          ),
        ];

    appMenu03.onCanceled = () {
      ScaffoldMessenger.of(appMenu03.context!).showSnackBar(
        const SnackBar(
          content: Text('appMenu03: Nothing selected.'),
        ),
      );
    };
    //
    appMenu03.tooltip = "Here's a tip for you.";
    appMenu03.elevation = 14;
    appMenu03.padding = const EdgeInsets.all(8);
    appMenu03.icon = const Icon(Icons.settings);
    appMenu03.shape =
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8));

    /// A subclass of the class, PopupMenu.
    appMenu05 = SubClass05(
        onSelect: (String value) {
          InheritedData.of(context)?.data = value;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('appMenu05 option: $value'),
            ),
          );
        },
        onCancel: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('appMenu05: Nothing selected.'),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Popup Menu Examples'),
          actions: [
            appMenu01.popupMenuButton,
            appMenu02, // a menu assigned to a getter instead.
            appMenu03.popupMenuButton,
            // An anonymous menu not assigned to a variable.
            PopupMenu<String>(
              items: const [
                'This',
                'is',
                'cool!'
              ], // Comment this to get entries below.
              menuEntries: const [
                PopupMenuItem(
                  child: Text('This'),
                ),
                PopupMenuItem(
                  child: Text('is'),
                ),
                PopupMenuItem(
                  child: Text('too.'),
                ),
              ], // Comment all above for itemBuilder's 'So is This!' items.
              itemBuilder: (context) => const [
                PopupMenuItem(
                  child: Text('So'),
                ),
                PopupMenuItem(
                  child: Text('is'),
                ),
                PopupMenuItem(
                  child: Text('this!'),
                ),
              ],
              onSelected: (String value) {
                InheritedData.of(context)?.data = value;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Anonymous option: $value'),
                  ),
                );
              },
              onCanceled: () => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Anonymous: Nothing selected.'),
                ),
              ),
              tooltip: "Anonymous Popupmenu",
              elevation: 14,
              icon: const Icon(Icons.add_circle),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              color: Colors.amber,
              position: PopupMenuPosition.under,
            ),
            appMenu05,
          ],
        ),
        body: const MenuExampleAppBody(),
      );

  /// Supply the menu with a getter instead.
  // Returns the immutable menu object.
  // It's listing all the 'inline' functions available to you.
  PopupMenu<int> get appMenu02 => PopupMenu<int>(
//        items: const [1, 2],  // Uncomment to take precedence
        menuEntries: const [
          PopupMenuItem(
            value: 1,
            child: Text('First'),
          ),
          PopupMenuItem(
            value: 2,
            child: Text('Second'),
          ),
        ],
        onSelected: (int value) {
          InheritedData.of(context)?.data = value;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('appMenu02 option: $value'),
            ),
          );
        },
        onCanceled: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('appMenu02: Nothing selected.'),
            ),
          );
        },
        inTooltip: () {
          return "Here's a tip for you.";
        },
        inElevation: () {
          return 8;
        },
        inPadding: () {
          return null;
        },
        inSplashRadius: () {
          return null;
        },
        inChild: () {
          return null;
        },
        inIcon: () {
          return null;
        },
        inIconSize: () {
          return null;
        },
        inOffset: () {
          return const Offset(0, 65);
        },
        inEnabled: () {
          return null;
        },
        inShape: () {
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          );
        },
        inColor: () {
          return Colors.deepOrangeAccent;
        },
        inEnableFeedback: () {
          return null;
        },
        inConstraints: () {
          return null;
        },
        inPosition: () {
          return null;
        },
      );
}

/// Displayed in the app's main screen.
class MenuExampleAppBody extends StatelessWidget {
  const MenuExampleAppBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final data = InheritedData.of(context)?.data;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$data',
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }
}
