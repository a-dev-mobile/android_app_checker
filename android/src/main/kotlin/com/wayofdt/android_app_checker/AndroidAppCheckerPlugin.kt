package com.wayofdt.android_app_checker

import android.content.pm.PackageManager
import android.os.Build
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** AndroidAppCheckerPlugin */
class AndroidAppCheckerPlugin: FlutterPlugin, MethodCallHandler {
    private lateinit var channel: MethodChannel
    private lateinit var context: android.content.Context

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "android_app_checker")
        channel.setMethodCallHandler(this)
        context = flutterPluginBinding.applicationContext
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method == "isAppInstalled") {
            val packageId: String? = call.argument("packageId")
            packageId?.let {
                val isInstalled = isAppInstalled(it)
                result.success(isInstalled)
            } ?: run {
                result.error("INVALID_PACKAGE_ID", "No package ID provided", null)
            }
        } else {
            result.notImplemented()
        }
    }

    private fun isAppInstalled(packageId: String): Boolean {
        val pm = context.packageManager
        return try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
                pm.getApplicationInfo(packageId, PackageManager.ApplicationInfoFlags.of(0))
            } else {
                pm.getApplicationInfo(packageId, 0)
            }
            true
        } catch (e: PackageManager.NameNotFoundException) {
            false
        }
    }


    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
