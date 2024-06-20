import 'package:base_project_flutter/export.dart';
import 'package:base_project_flutter/utils/extensions/getter_extension.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      child: Scaffold(
        appBar: AppBar(),
        drawer: buildDrawer(context),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: "Ready To Rock == context.bodyLarge.w500.withColor(ColorConst.kRedColor)",
                style: context.bodyLarge.w700.withColor(ColorConst.kRedColor),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }

  Drawer buildDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Column(
                  children: [],
                ),
              ),
              ListTile(title: const Text('Item 1'), onTap: () {}),
              ListTile(title: const Text('Item 2'), onTap: () {}),
              const ThemeChangeButton()
            ],
          ),

          //App Version
          SafeArea(
            child: Center(
              child: RichText(
                text: TextSpan(
                  // text: 'Hello ',
                  style: Theme.of(context).textTheme.bodyLarge,
                  children: <TextSpan>[
                    const TextSpan(text: 'Version : '),
                    TextSpan(
                      text:
                          '${FkUserAgent.properties?['applicationVersion']}+${FkUserAgent.properties?['buildNumber']}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
