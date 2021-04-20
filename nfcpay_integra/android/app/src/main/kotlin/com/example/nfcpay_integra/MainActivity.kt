package com.example.nfcpay_integra

import android.os.Bundle
import android.widget.Toast
import androidx.annotation.NonNull
import com.integra.demonfcreader.NFCHandler
import com.integra.demonfcreader.emv.model.EMVData
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant


class MainActivity: io.flutter.embedding.android.FlutterActivity(),NFCHandler.CardNfcInterface {
    private val CHANNEL = "flutter.native/helper"
    val TAG = "NfcDemo"
    var nfcHandler: NFCHandler = NFCHandler(this, this);
    var switch = 0;
    private var text1: String? = "";
    private var text2: String? = "";

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            // Note: this method is invoked on the main thread.
            // TODO
            if (call.method == "doTransactionPay") {
                val text1 = call.argument<String>("text1")
                val text2 = call.argument<String>("text2")
                doTransactionPay(text1, text2)
            } else if (call.method == "doTransactionBalance") {
                val text3 = call.argument<String>("text3")
                doTransactionBalance(text3)
            }
        }
    }

    private fun doTransactionPay(text1:String?,text2:String?) {
        switch = 1;
        nfcHandler.doTransaction(text1,text2)
    }

    private fun doTransactionBalance(text3:String?){
        switch = 2;
        nfcHandler.doTransaction(text3, "")
    }



    override fun CardReadSuccess(p0: String?, p1: String?, emvData: EMVData?) {
        text1 = emvData!!.tag5A
        text2 = emvData!!.tag59

        if (emvData===null){
            Toast.makeText(this, "card write success:", Toast.LENGTH_SHORT).show()
        }else{
            if(switch==1){
                MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, CHANNEL).invokeMethod("pay","$text1,$text2")
            }else if(switch==2){
                MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, CHANNEL).invokeMethod("balance","$text1,$text2")
            }
//        if (emvData != null) {
//            Toast.makeText(this, "card read success:\n" + emvData.tag5A, Toast.LENGTH_SHORT).show()
//        }
        }
    }

    override fun CardReadFailed(p0: String?, p1: String?){
        //MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, CHANNEL).invokeMethod("balance","$text1,$text2")
        //MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, CHANNEL).invokeMethod("pay","$text1,$text2")
        MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, CHANNEL).invokeMethod("failed","");
        Toast.makeText(this, "uh ohh...$p1", Toast.LENGTH_SHORT).show()
    }
}
