import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

final FirebaseAnalytics analytics = FirebaseAnalytics();
final FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: analytics);

// Usage:
// import 'firebase_analytics.dart';
// analytics.logLogin();