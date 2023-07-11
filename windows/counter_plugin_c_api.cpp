#include "include/counter_plugin/counter_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "counter_plugin.h"

void CounterPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  counter_plugin::CounterPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
