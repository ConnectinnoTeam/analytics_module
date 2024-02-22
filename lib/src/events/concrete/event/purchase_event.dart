import 'package:analytics/analytics.dart';

sealed class PurchaseEvent with IEvent {
  String get source;
  String get productID;
  String get productType;
}

class PurchaseCompleted extends PurchaseEvent {
  PurchaseCompleted({
    required this.eventName,
    required this.source,
    required this.productID,
    required this.productType,
    this.data,
  });

  @override
  final String eventName;

  final Map<String, dynamic>? data;

  @override
  Map<String, dynamic> toJson() => (data ?? {})
    ..addEntries([
      MapEntry("source", source),
      MapEntry("product_id", productID),
      MapEntry("product_type", productType),
    ]);

  @override
  final String source;

  @override
  final String productID;

  @override
  final String productType;
}

class PurchaseIntended extends PurchaseEvent {
  PurchaseIntended({
    required this.eventName,
    required this.source,
    required this.productID,
    required this.productType,
    this.data,
  });
  @override
  final String eventName;

  @override
  final String source;

  @override
  final String productID;

  @override
  final String productType;

  final Map<String, dynamic>? data;

  @override
  Map<String, dynamic> toJson() => (data ?? {})
    ..addEntries([
      MapEntry("source", source),
      MapEntry("product_id", productID),
      MapEntry("product_type", productType),
    ]);
}

class PurchaseFailed extends PurchaseEvent {
  PurchaseFailed({
    required this.eventName,
    required this.source,
    required this.productID,
    required this.productType,
    required this.reason,
    this.data,
  });

  @override
  final String eventName;

  final Map<String, dynamic>? data;

  @override
  Map<String, dynamic> toJson() => (data ?? {})
    ..addEntries([
      MapEntry("source", source),
      MapEntry("product_id", productID),
      MapEntry("product_type", productType),
      MapEntry("reason", reason),
    ]);

  @override
  final String source;

  @override
  final String productID;

  @override
  final String productType;

  final PurchaseFailReasons reason;
}

enum PurchaseFailReasons {
  receiptAlreadyInUse('receipt_already_in_use'),
  invalidReceipt('invalid_receipt'),
  invalidAppleSubscriptionKey('invalid_apple_subscription_key'),
  missingReceiptFile('missing_receipt_file'),
  ineligibleError('ineligible_error'),
  insufficientPermError('insufficient_permission_error'),
  paymentPendingError('payment_pending_error'),
  productAlreadyPurchased('product_already_purchased'),
  itemAlreadyOwned('item_already_owned'),
  productNotAvailableForPurchase('product_not_available_purchase'),
  itemUnavailable('item_unavailable'),
  purchaseCanceled('purchase_canceled'),
  purchaseInvalid('purchase_invalid'),
  developerError('developer_error'),
  purchaseNotAllowed('purchase_not_allowed'),
  unknown('unknown'),
  errorFindingReceiptSku('error_finding_receipt_sku'),
  errorFetchingReceipts('error_fetching_receipts'),
  errorFetchingReceiptInfo('error_fetching_receipt_info'),
  errorObserverModeNotSupported('error_observer_mode_not_supported'),
  invalidAppUserID('invalid_app_user_id'),
  invalidCredentials('invalid_credentials'),
  invalidSubscriberAttributes('invalid_subscriber_attributes'),
  networkError('network_error'),
  offlineConnectionError('offline_connection_error'),
  operationAlreadyInProgress('operation_already_in_progress'),
  storeProblem('store_problem'),
  signatureVerificationFailed('signature_verification_failed'),
  unExpectedBackendResponseError('unexpected_backend_response_error'),
  unknownBackendError('unknown_backend_error');

  const PurchaseFailReasons(this.key);
  final String key;
}
