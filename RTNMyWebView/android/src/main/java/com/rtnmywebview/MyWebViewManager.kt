package com.rtnmywebview

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.uimanager.SimpleViewManager
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.ViewManagerDelegate
import com.facebook.react.uimanager.annotations.ReactProp
import com.facebook.react.viewmanagers.RTNMyWebViewManagerDelegate
import com.facebook.react.viewmanagers.RTNMyWebViewManagerInterface

class MyWebViewManager(private val context: ReactApplicationContext) :
    SimpleViewManager<MyWebView>(),
    RTNMyWebViewManagerInterface<MyWebView> {

    private val mDelegate: ViewManagerDelegate<MyWebView>

    init {
        mDelegate = RTNMyWebViewManagerDelegate(this)
    }

    override fun getDelegate(): ViewManagerDelegate<MyWebView> {
        return mDelegate
    }

    override fun getName(): String {
        return NAME
    }

    companion object {
        const val NAME = "RTNMyWebView"
    }

    override fun createViewInstance(p0: ThemedReactContext): MyWebView {
        return MyWebView(context)
    }



    @ReactProp(name = "url")
    override fun setUrl(view: MyWebView?, value: String?) {
        value?.let { view?.loadUrl(it) }
    }
}