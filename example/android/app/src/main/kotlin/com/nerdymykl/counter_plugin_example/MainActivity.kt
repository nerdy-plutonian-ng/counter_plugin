package com.nerdymykl.counter_plugin_example

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch

class MainActivity: FlutterActivity() {

    companion object {
        var count = 0

        fun increase(){
            count++
        }

        var isListening = false
    }


    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor,"counterChannel").setMethodCallHandler{
                call,result ->
            when(call.method) {
                "increase" -> increase(result)
                "stopListening" -> stopListening(result)
                else -> result.notImplemented()

            }
        }

        EventChannel(flutterEngine.dartExecutor.binaryMessenger,"counterEvents").setStreamHandler(object : EventChannel.StreamHandler{


            override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                if(isListening){
                    isListening = false
                    return
                }
                isListening = true
                increaseNumberEvery3Seconds(events)
            }

            override fun onCancel(arguments: Any?) {
                isListening = false
            }
        })
    }

    private fun stopListening(result: MethodChannel.Result) {
        isListening = false
        result.success(true)
    }

    private fun increase(result : MethodChannel.Result){
        increase()
        result.success(count)
    }


    private fun increaseNumberEvery3Seconds(events: EventChannel.EventSink?) {
        // Create a new coroutine scope
        val coroutineScope = CoroutineScope(Dispatchers.Main)

        // Launch a coroutine to increase the number every 3 seconds
        coroutineScope.launch {
            while (isListening) {
                delay(3000) // Wait for 3 seconds
                increase()
                events?.success(count)
            }
        }
    }
}
