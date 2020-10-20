# camera_awesome_hero_issue

### Steps to reproduce

On Android Emulator (Android 10)

1. Start the application
2. accept permissions
3. the camera preview will be now in the center of the screen click on it
4. it will show a full view of the camera with `Hero` Animation.
5. Now click again anywhere on the camera (the full view) it will get back to the small preview
6. (if the app did not crash yet) click again on the small camera preview.

The issue happens here with this stack trace:

```dart
D/com.apparence.camerawesome.CamerawesomePlugin(24153): _handleCheckPermissions:
E/CameraCaptureSession(24153): Session 0: Exception while stopping repeating:
E/CameraCaptureSession(24153): android.hardware.camera2.CameraAccessException: CAMERA_DISCONNECTED (2): checkPidStatus:2030: The camera device has been disconnected
E/CameraCaptureSession(24153):  at android.hardware.camera2.CameraManager.throwAsPublicException(CameraManager.java:799)
E/CameraCaptureSession(24153):  at android.hardware.camera2.impl.ICameraDeviceUserWrapper.cancelRequest(ICameraDeviceUserWrapper.java:97)
E/CameraCaptureSession(24153):  at android.hardware.camera2.impl.CameraDeviceImpl.stopRepeating(CameraDeviceImpl.java:1138)
E/CameraCaptureSession(24153):  at android.hardware.camera2.impl.CameraCaptureSessionImpl.close(CameraCaptureSessionImpl.java:526)
E/CameraCaptureSession(24153):  at android.hardware.camera2.impl.CameraCaptureSessionImpl$2.onDisconnected(CameraCaptureSessionImpl.java:737)
E/CameraCaptureSession(24153):  at android.hardware.camera2.impl.CameraDeviceImpl$7.run(CameraDeviceImpl.java:239)
E/CameraCaptureSession(24153):  at android.os.Handler.handleCallback(Handler.java:883)
E/CameraCaptureSession(24153):  at android.os.Handler.dispatchMessage(Handler.java:100)
E/CameraCaptureSession(24153):  at android.os.Looper.loop(Looper.java:214)
E/CameraCaptureSession(24153):  at android.app.ActivityThread.main(ActivityThread.java:7356)
E/CameraCaptureSession(24153):  at java.lang.reflect.Method.invoke(Native Method)
E/CameraCaptureSession(24153):  at com.android.internal.os.RuntimeInit$MethodAndArgsCaller.run(RuntimeInit.java:492)
E/CameraCaptureSession(24153):  at com.android.internal.os.ZygoteInit.main(ZygoteInit.java:930)
E/CameraCaptureSession(24153): Caused by: android.os.ServiceSpecificException: checkPidStatus:2030: The camera device has been disconnected (code 4)
E/CameraCaptureSession(24153):  at android.os.Parcel.createException(Parcel.java:2085)
E/CameraCaptureSession(24153):  at android.os.Parcel.readException(Parcel.java:2039)
E/CameraCaptureSession(24153):  at android.os.Parcel.readException(Parcel.java:1987)
E/CameraCaptureSession(24153):  at android.hardware.camera2.ICameraDeviceUser$Stub$Proxy.cancelRequest(ICameraDeviceUser.java:658)
E/CameraCaptureSession(24153):  at android.hardware.camera2.impl.ICameraDeviceUserWrapper.cancelRequest(ICameraDeviceUserWrapper.java:95)
E/CameraCaptureSession(24153):  ... 11 more
E/com.apparence.camerawesome.CameraStateManager(24153): close camera session: failed

D/com.apparence.camerawesome.CamerawesomePlugin(24153): _handleCheckPermissions:
W/some_hero_issu(24153): JNI critical lock held for 36.478ms on Thread[12,tid=24172,Runnable,Thread*=0x77b81b674800,peer=0x130c04f0,"Binder:24153_2"]
E/com.apparence.camerawesome.CameraStateManager(24153): close camera session: failed
D/com.apparence.camerawesome.CamerawesomePlugin(24153): _handleCheckPermissions:
E/flutter (24153): [ERROR:flutter/lib/ui/ui_dart_state.cc(177)] Unhandled Exception: A ValueNotifier<Size> was used after being disposed.
E/flutter (24153): Once you have called dispose() on a ValueNotifier<Size>, it can no longer be used.
E/flutter (24153): #0      ChangeNotifier._debugAssertNotDisposed.<anonymous closure> (package:flutter/src/foundation/change_notifier.dart:117:9)
E/flutter (24153): #1      ChangeNotifier._debugAssertNotDisposed (package:flutter/src/foundation/change_notifier.dart:123:6)
E/flutter (24153): #2      ChangeNotifier.notifyListeners (package:flutter/src/foundation/change_notifier.dart:217:12)
E/flutter (24153): #3      ValueNotifier.value= (package:flutter/src/foundation/change_notifier.dart:292:5)
E/flutter (24153): #4      _CameraAwesomeState._initPhotoSize.<anonymous closure> (package:camerawesome/camerapreview.dart:264:32)
E/flutter (24153): #5      ChangeNotifier.notifyListeners (package:flutter/src/foundation/change_notifier.dart:226:25)
E/flutter (24153): #6      ValueNotifier.value= (package:flutter/src/foundation/change_notifier.dart:292:5)
E/flutter (24153): #7      _CameraAwesomeState.initPlatformState (package:camerawesome/camerapreview.dart:164:24)
E/flutter (24153): #8      _rootRunUnary (dart:async/zone.dart:1198:47)
E/flutter (24153): #9      _CustomZone.runUnary (dart:async/zone.dart:1100:19)
E/flutter (24153): #10     _FutureListener.handleValue (dart:async/future_impl.dart:143:18)
E/flutter (24153): #11     Future._propagateToListeners.handleValueCallback (dart:async/future_impl.dart:696:45)
E/flutter (24153): #12     Future._propagateToListeners (dart:async/future_impl.dart:725:32)
E/flutter (24153): #13     Future._completeWithValue (dart:async/future_impl.dart:529:5)
E/flutter (24153): #14     _AsyncAwaitCompleter.complete (dart:async-patch/async_patch.dart:40:15)
E/flutter (24153): #15     _completeOnAsyncReturn (dart:async-patch/async_patch.dart:311:13)
E/flutter (24153): #16     CamerawesomePlugin.getSizes (package:camerawesome/camerawesome_plugin.dart)
E/flutter (24153): #17     _rootRunUnary (dart:async/zone.dart:1198:47)
E/flutter (24153): #18     _CustomZone.runUnary (dart:async/zone.dart:1100:19)
E/flutter (24153): #19     _FutureListener.handleValue (dart:async/future_impl.dart:143:18)
E/flutter (24153): #20     Future._propagateToListeners.handleValueCallback (dart:async/future_impl.dart:696:45)
E/flutter (24153): #21     Future._propagateToListeners (dart:async/future_impl.dart:725:32)
E/flutter (24153): #22     Future._completeWithValue (dart:async/future_impl.dart:529:5)
E/flutter (24153): #23     _AsyncAwaitCompleter.complete (dart:async-patch/async_patch.dart:40:15)
E/flutter (24153): #24     _completeOnAsyncReturn (dart:async-patch/async_patch.dart:311:13)
E/flutter (24153): #25     MethodChannel._invokeMethod (package:flutter/src/services/platform_channel.dart)
E/flutter (24153): #26     _rootRunUnary (dart:async/zone.dart:1198:47)
E/flutter (24153): #27     _CustomZone.runUnary (dart:async/zone.dart:1100:19)
E/flutter (24153): #28     _FutureListener.handleValue (dart:async/future_impl.dart:143:18)
E/flutter (24153): #29     Future._propagateToListeners.handleValueCallback (dart:async/future_impl.dart:696:45)
E/flutter (24153): #30     Future._propagateToListeners (dart:async/future_impl.dart:725:32)
E/flutter (24153): #31     Future._completeWithValue (dart:async/future_impl.dart:529:5)
E/flutter (24153): #32     Future._asyncCompleteWithValue.<anonymous closure> (dart:async/future_impl.dart:567:7)
E/flutter (24153): #33     _rootRun (dart:async/zone.dart:1190:13)
E/flutter (24153): #34     _CustomZone.run (dart:async/zone.dart:1093:19)
E/flutter (24153): #35     _CustomZone.runGuarded (dart:async/zone.dart:997:7)
E/flutter (24153): #36     _CustomZone.bindCallbackGuarded.<anonymous closure> (dart:async/zone.dart:1037:23)
E/flutter (24153): #37     _microtaskLoop (dart:async/schedule_microtask.dart:41:21)
E/flutter (24153): #38     _startMicrotaskLoop (dart:async/schedule_microtask.dart:50:5)
E/flutter (24153):
E/MethodChannel#camerawesome(24153): Failed to handle method call
E/MethodChannel#camerawesome(24153): java.lang.NullPointerException: Attempt to invoke virtual method 'int android.util.Size.getWidth()' on a null object reference
E/MethodChannel#camerawesome(24153):    at com.apparence.camerawesome.CamerawesomePlugin._handleGetEffectivPreviewSize(CamerawesomePlugin.java:310)
E/MethodChannel#camerawesome(24153):    at com.apparence.camerawesome.CamerawesomePlugin.onMethodCall(CamerawesomePlugin.java:134)
E/MethodChannel#camerawesome(24153):    at io.flutter.plugin.common.MethodChannel$IncomingMethodCallHandler.onMessage(MethodChannel.java:233)
E/MethodChannel#camerawesome(24153):    at io.flutter.embedding.engine.dart.DartMessenger.handleMessageFromDart(DartMessenger.java:85)
E/MethodChannel#camerawesome(24153):    at io.flutter.embedding.engine.FlutterJNI.handlePlatformMessage(FlutterJNI.java:692)
E/MethodChannel#camerawesome(24153):    at android.os.MessageQueue.nativePollOnce(Native Method)
E/MethodChannel#camerawesome(24153):    at android.os.MessageQueue.next(MessageQueue.java:336)
E/MethodChannel#camerawesome(24153):    at android.os.Looper.loop(Looper.java:174)
E/MethodChannel#camerawesome(24153):    at android.app.ActivityThread.main(ActivityThread.java:7356)
E/MethodChannel#camerawesome(24153):    at java.lang.reflect.Method.invoke(Native Method)
E/MethodChannel#camerawesome(24153):    at com.android.internal.os.RuntimeInit$MethodAndArgsCaller.run(RuntimeInit.java:492)
E/MethodChannel#camerawesome(24153):    at com.android.internal.os.ZygoteInit.main(ZygoteInit.java:930)
E/flutter (24153): [ERROR:flutter/lib/ui/ui_dart_state.cc(177)] Unhandled Exception: setState() called after dispose(): _CameraAwesomeState#aee58(lifecycle state: defunct, not mounted)
E/flutter (24153): This error happens if you call setState() on a State object for a widget that no longer appears in the widget tree (e.g., whose parent widget no longer includes the widget in its build). This error can occur when code calls setState() from a timer or an animation callback.
E/flutter (24153): The preferred solution is to cancel the timer or stop listening to the animation in the dispose() callback. Another solution is to check the "mounted" property of this object before calling setState() to ensure the object is still in the tree.
E/flutter (24153): This error might indicate a memory leak if setState() is being called because another object is retaining a reference to this State object after it has been removed from the tree. To avoid memory leaks, consider breaking the reference to this object during dispose().
E/flutter (24153): #0      State.setState.<anonymous closure> (package:flutter/src/widgets/framework.dart:1208:9)
E/flutter (24153): #1      State.setState (package:flutter/src/widgets/framework.dart:1243:6)
E/flutter (24153): #2      _CameraAwesomeState.initPlatformState (package:camerawesome/camerapreview.dart:181:5)
E/flutter (24153): <asynchronous suspension>
E/flutter (24153): #3      _CameraAwesomeState.initState (package:camerawesome/camerapreview.dart:121:5)
E/flutter (24153): #4      StatefulElement._firstBuild (package:flutter/src/widgets/framework.dart:4765:58)
E/flutter (24153): #5      ComponentElement.mount (package:flutter/src/widgets/framework.dart:4601:5)
E/flutter (24153): #6      Element.inflateWidget (package:flutter/src/widgets/framework.dart:3569:14)
E/flutter (24153): #7      Element.updateChild (package:flutter/src/widgets/framework.dart:3327:18)
E/flutter (24153): #8      SingleChildRenderObjectElement.mount (package:flutter/src/widgets/framework.dart:6118:14)
E/flutter (24153): #9      Element.inflateWidget (package:flutter/src/widgets/framework.dart:3569:14)
E/flutter (24153): #10     Element.updateChild (package:flutter/src/widgets/framework.dart:3327:18)
E/flutter (24153): #11     ComponentElement.performRebuild (package:flutter/src/widgets/framework.dart:4652:16)
E/flutter (24153): #12     Element.rebuild (package:flutter/src/widgets/framework.dart:4343:5)
E/flutter (24153): #13     ComponentElement._firstBuild (package:flutter/src/widgets/framework.dart:4606:5)
E/flutter (24153): #14     ComponentElement.mount (package:flutter/src/widgets/framework.dart:4601:5)
E/flutter (24153): #15     Element.inflateWidget (package:flutter/src/widgets/framework.dart:3569:14)
E/flutter (24153): #16     Element.updateChild (package:flutter/src/widgets/framework.dart:3327:18)
E/flutter (24153): #17     SingleChildRenderObjectElement.mount (package:flutter/src/widgets/framework.dart:6118:14)
Lost connection to device.
```
