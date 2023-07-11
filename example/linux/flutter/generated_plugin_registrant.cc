//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <counter_plugin/counter_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) counter_plugin_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "CounterPlugin");
  counter_plugin_register_with_registrar(counter_plugin_registrar);
}
