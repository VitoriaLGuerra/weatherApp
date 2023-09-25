package com.example.untitled

import android.Manifest
import android.app.Activity
import android.content.pm.PackageManager
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import com.google.android.gms.location.FusedLocationProviderClient
import com.google.android.gms.location.LocationServices
import io.flutter.plugin.common.MethodChannel

class LocationHandler(private val activity: Activity){
    private val fusedLocationClient: FusedLocationProviderClient = LocationServices.getFusedLocationProviderClient(activity)

    fun haveLocationPermission(result: MethodChannel.Result) {
        val permission = ContextCompat.checkSelfPermission(activity, Manifest.permission.ACCESS_FINE_LOCATION) == PackageManager.PERMISSION_GRANTED;
        result.success(permission);
    }

    fun requestLocationPermission(result: MethodChannel.Result){
        if (ContextCompat.checkSelfPermission(activity, Manifest.permission.ACCESS_FINE_LOCATION)
            != PackageManager.PERMISSION_GRANTED) {
            ActivityCompat.requestPermissions(activity, arrayOf(Manifest.permission.ACCESS_FINE_LOCATION), 0)
        }
        haveLocationPermission(result);
    }

    fun getLocation(result: MethodChannel.Result) {
        if (ContextCompat.checkSelfPermission(activity, Manifest.permission.ACCESS_FINE_LOCATION)
            != PackageManager.PERMISSION_GRANTED) {
            ActivityCompat.requestPermissions(activity, arrayOf(Manifest.permission.ACCESS_FINE_LOCATION), 0)
        }

        fusedLocationClient.lastLocation.addOnSuccessListener { location ->
            if (location != null) {
                result.success("${location.latitude} ${location.longitude}")
            } else {
                result.error("UNAVAILABLE", "Location not available.", null)
            }
        }
    }
}