package com.example.untitled

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "location"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getLocation") {
                val locationHandler = LocationHandler(this)
                locationHandler.getLocation(result)
            } else if(call.method == "requestLocationPermission"){
                val locationHandler = LocationHandler(this)
                locationHandler.requestLocationPermission(result)
            } else if(call.method == "haveLocationPermission"){
                val locationHandler = LocationHandler(this)
                locationHandler.haveLocationPermission(result)
            } else {
                result.notImplemented()
            }
        }

    }
}