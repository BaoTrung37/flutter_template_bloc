import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_error.freezed.dart';
part 'api_error.g.dart';

enum ErrorCode {
  // Firebase related errors
  aborted, // Error when an operation is aborted
  alreadyExists, // Error when a document already exists
  dataLoss, // Error when there is data loss
  deadlineExceeded, // Error when a deadline is exceeded
  failedPrecondition, // Error when a precondition fails
  internal, // Represents an internal error
  invalidArgument, // Error when an argument is invalid
  notFound, // Error when an item is not found
  outOfRange, // Error when an operation is out of range
  permissionDenied, // Error when permission is denied
  resourceExhausted, // Error when a resource is exhausted
  unauthenticated, // Error when authentication is required
  unavailable, // Error when a service is unavailable
  unimplemented, // Error when an operation is not implemented
  authentication, // Error when authentication credentials are invalid
  authenticationInvalid, // Error when authentication is invalid
  userTokenExpired, // Error when the user token has expired
  wrongPassword, // Error when the password is incorrect
  invalidEmail, // Error when the email address is invalid
  emailAlreadyInUse, // Error when the email is already in use
  operationNotAllowed, // Error when the operation is not allowed
  weakPassword, // Error when the password is too weak
  tooManyRequests, // Error when too many requests have been made
  expiredActionCode, // Error when the action code has expired
  invalidActionCode, // Error when the action code is invalid

  // Store Errors
  storeProblemError, // Error when there is a store problem
  productAlreadyPurchasedError, // Error when a product is already purchased
  operationAlreadyInProgressError, // Error when an operation is already in progress
  invalidReceiptError, // Error when the receipt is invalid
  purchaseNotAllowedError, // Error when the purchase is not allowed
  purchaseInvalidError, // Error when the purchase is invalid
  productNotAvailableForPurchaseError, // Error when the product is not available for purchase
  receiptAlreadyInUseError, // Error when the receipt is already in use
  missingReceiptFileError, // Error when the receipt file is missing
  invalidCredentialsError, // Error when the credentials are invalid
  unexpectedBackendResponseError, // Error when the backend response is unexpected
  receiptInUseByOtherSubscriberError, // Error when the receipt is in use by another subscriber
  unknownBackendError, // Error when there is an unknown backend error
  invalidAppleSubscriptionKeyError, // Error when the Apple subscription key is invalid
  ineligibleError, // Error when the user is ineligible for the action
  insufficientPermissionsError, // Error when there are insufficient permissions
  paymentPendingError, // Error when the payment is pending
  invalidSubscriberAttributesError, // Error when subscriber attributes are invalid
  logOutWithAnonymousUserError, // Error when logging out with an anonymous user
  configurationError, // Error when there is a configuration issue
  unsupportedError, // Error when the operation is unsupported
  emptySubscriberAttributesError, // Error when subscriber attributes are empty
  productDiscountMissingIdentifierError, // Error when the product discount is missing an identifier
  unknownNonNativeError, // Error when there is an unknown non-native error
  productDiscountMissingSubscriptionGroupIdentifierError, // Error when the product discount is missing a subscription group identifier
  beginRefundRequestError, // Error when beginning a refund request
  apiEndpointBlocked, // Error when the API endpoint is blocked
  invalidPromotionalOfferError, // Error when the promotional offer is invalid

  // General Errors
  unknown, // Represents an unknown error
  cancelled, // Represents a cancelled operation
  network, // Represents a network error
  timeout, // Represents a timeout error
  format, // Represents a format error
  appError, // Represents an application error
}

@freezed
abstract class ServerError with _$ServerError {
  const factory ServerError({
    @JsonKey(name: 'error_code', defaultValue: ErrorCode.unknown)
    @Default(ErrorCode.unknown)
    ErrorCode errorCode,
    @JsonKey(name: 'developer_text') String? developerText,
    @JsonKey(name: 'display_message') String? displayMessage,
    @JsonKey(name: 'message') String? message,
  }) = _ServerError;
  factory ServerError.fromJson(Map<String, dynamic> json) =>
      _$ServerErrorFromJson(json);
}
