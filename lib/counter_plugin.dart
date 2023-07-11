import 'package:counter_plugin/counter_widget.dart';
import 'package:flutter/cupertino.dart';

import 'counter_plugin_platform_interface.dart';

class CounterPlugin {
  Future<String?> getPlatformVersion() {
    return CounterPluginPlatform.instance.getPlatformVersion();
  }

  Widget counterWidget = const CounterWidget();
}
