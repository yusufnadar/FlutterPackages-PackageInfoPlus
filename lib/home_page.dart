import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var appName = '';
  var packageName = '';
  var version = '';
  var buildNumber = '';
  var buildSignature = '';

  @override
  void initState() {
    super.initState();
    getInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Package Info Plus'),
      ),
      body: Column(
        children: [
          Text(appName),
          Text(buildNumber),
          Text(buildSignature),
          Text(packageName),
          Text(version),
        ],
      ),
    );
  }

  void getInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appName = packageInfo.appName;
    buildNumber = packageInfo.buildNumber;
    buildSignature = packageInfo.buildSignature;
    packageName = packageInfo.packageName;
    version = packageInfo.version;
    setState(() {});
  }
}
