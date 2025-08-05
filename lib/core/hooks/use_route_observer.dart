// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';


// class _RouteCallbacks with RouteAware {
//   const _RouteCallbacks({
//     this.handleDidPopNext,
//     this.handleDidPush,
//     this.handleDidPop,
//     this.handleDidPushNext,
//   });

//   final VoidCallback? handleDidPopNext;
//   final VoidCallback? handleDidPush;
//   final VoidCallback? handleDidPop;
//   final VoidCallback? handleDidPushNext;

//   @override
//   void didPopNext() {
//     _executeCallbackIfNotNull(handleDidPopNext);
//   }

//   @override
//   void didPush() {
//     _executeCallbackIfNotNull(handleDidPush);
//   }

//   @override
//   void didPop() {
//     _executeCallbackIfNotNull(handleDidPop);
//   }

//   @override
//   void didPushNext() {
//     _executeCallbackIfNotNull(handleDidPushNext);
//   }

//   void _executeCallbackIfNotNull(VoidCallback? callback) {
//     if (callback != null) {
//       callback();
//     }
//   }
// }

// void useRouteObserver({
//   VoidCallback? didPopNext,
//   VoidCallback? didPush,
//   VoidCallback? didPop,
//   VoidCallback? didPushNext,
//   List<Object?> keys = const [],
// }) {
//   final context = useContext();
//   final route = ModalRoute.of(context);

//   useEffect(() {
//     if (route == null) return () {};

//     final callbacks = _RouteCallbacks(
//       handleDidPop: didPop,
//       handleDidPopNext: didPopNext,
//       handleDidPush: didPush,
//       handleDidPushNext: didPushNext,
//     );
//     routeObserver.subscribe(callbacks, route);
//     return () => routeObserver.unsubscribe(callbacks);
//   }, [route, routeObserver, ...keys]);
// }
