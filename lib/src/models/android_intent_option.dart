import 'package:equatable/equatable.dart';

/// Represents the options for an Android Intent.
///
/// This class encapsulates the parameters that can be used to build an
/// Android Intent, allowing for the specification of various intent
/// properties such as action, flags, category, data, and additional
/// arguments. It ensures that at least one of the action or component
/// name is provided to create a valid intent.
///
/// See [Android Intents](https://developer.android.com/reference/android/content/Intent.html)
/// for more information on how to use Intents.
class AndroidIntentOption extends Equatable {
  /// Creates an instance of [AndroidIntentOption] with the specified parameters.
  ///
  /// The constructor requires at least one of [action] or [componentName] to be
  /// provided to ensure a valid intent configuration. The other parameters allow
  /// for customization of the intent's behavior and data.
  ///
  /// [action] refers to the action to be performed by the intent.
  /// [flags] are the flags that modify how the intent is handled.
  /// [category] is an optional category for the intent.
  /// [data] is the URI that the intent points to.
  /// [arguments] is a map of additional data to be passed with the intent.
  /// [arrayArguments] is a map of array data to be included in the intent.
  /// [package] specifies the package name to resolve the data within.
  /// [componentName] is the specific component that should handle the intent.
  /// [type] sets an explicit MIME type for the intent.
  const AndroidIntentOption({
    this.action,
    this.flags,
    this.category,
    this.data,
    this.arguments,
    this.arrayArguments,
    this.package,
    this.componentName,
    this.type,
  }) : assert(action != null || componentName != null, 'action or component (or both) must be specified');

  @override
  List<Object?> get props => [action, flags, category, data, arguments, arrayArguments, package, componentName, type];

  /// This is the general verb that the intent should attempt to do. This
  /// includes constants like `ACTION_VIEW`.
  final String? action;

  /// Constants that can be set on an intent to tweak how it is finally handled.
  final List<int>? flags;

  /// An optional additional constant qualifying the given [action].
  final String? category;

  /// The Uri that the [action] is pointed towards.
  final String? data;

  /// The equivalent of `extras`, a generic `Bundle` of data that the Intent can
  /// carry. This is a slot for extraneous data that the listener may use.
  ///
  /// If the argument contains a list value, then the value will be put in as an
  /// array list.
  final Map<String, dynamic>? arguments;

  /// Similar to [arguments], but in this case the arguments are an array and
  /// will be added to the intent as in an array extra instead of of an array
  /// list.
  final Map<String, List<dynamic>>? arrayArguments;

  /// Sets the [data] to only resolve within this given package.
  final String? package;

  /// Set the exact `ComponentName` that should handle the intent. If this is
  /// set [package] should also be non-null.
  final String? componentName;

  /// Set an explicit MIME data type.
  final String? type;
}
