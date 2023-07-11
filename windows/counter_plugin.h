#ifndef FLUTTER_PLUGIN_COUNTER_PLUGIN_H_
#define FLUTTER_PLUGIN_COUNTER_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace counter_plugin {

class CounterPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  CounterPlugin();

  virtual ~CounterPlugin();

  // Disallow copy and assign.
  CounterPlugin(const CounterPlugin&) = delete;
  CounterPlugin& operator=(const CounterPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace counter_plugin

#endif  // FLUTTER_PLUGIN_COUNTER_PLUGIN_H_
