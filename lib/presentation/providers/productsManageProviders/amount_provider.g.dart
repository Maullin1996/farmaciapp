// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amount_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$counterHash() => r'9cf2f195e8af67f8e11c516842d22a4cdc7e87cb';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$Counter extends BuildlessNotifier<int> {
  late final String id;

  int build({
    required String id,
  });
}

/// See also [Counter].
@ProviderFor(Counter)
const counterProvider = CounterFamily();

/// See also [Counter].
class CounterFamily extends Family<int> {
  /// See also [Counter].
  const CounterFamily();

  /// See also [Counter].
  CounterProvider call({
    required String id,
  }) {
    return CounterProvider(
      id: id,
    );
  }

  @override
  CounterProvider getProviderOverride(
    covariant CounterProvider provider,
  ) {
    return call(
      id: provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'counterProvider';
}

/// See also [Counter].
class CounterProvider extends NotifierProviderImpl<Counter, int> {
  /// See also [Counter].
  CounterProvider({
    required String id,
  }) : this._internal(
          () => Counter()..id = id,
          from: counterProvider,
          name: r'counterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$counterHash,
          dependencies: CounterFamily._dependencies,
          allTransitiveDependencies: CounterFamily._allTransitiveDependencies,
          id: id,
        );

  CounterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  int runNotifierBuild(
    covariant Counter notifier,
  ) {
    return notifier.build(
      id: id,
    );
  }

  @override
  Override overrideWith(Counter Function() create) {
    return ProviderOverride(
      origin: this,
      override: CounterProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  NotifierProviderElement<Counter, int> createElement() {
    return _CounterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CounterProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CounterRef on NotifierProviderRef<int> {
  /// The parameter `id` of this provider.
  String get id;
}

class _CounterProviderElement extends NotifierProviderElement<Counter, int>
    with CounterRef {
  _CounterProviderElement(super.provider);

  @override
  String get id => (origin as CounterProvider).id;
}

String _$totalAmountHash() => r'5706e1502ca5c85409b005a8080b58fbbdb2199c';

abstract class _$TotalAmount extends BuildlessNotifier<int> {
  late final String id;
  late final int price;

  int build({
    required String id,
    required int price,
  });
}

/// See also [TotalAmount].
@ProviderFor(TotalAmount)
const totalAmountProvider = TotalAmountFamily();

/// See also [TotalAmount].
class TotalAmountFamily extends Family<int> {
  /// See also [TotalAmount].
  const TotalAmountFamily();

  /// See also [TotalAmount].
  TotalAmountProvider call({
    required String id,
    required int price,
  }) {
    return TotalAmountProvider(
      id: id,
      price: price,
    );
  }

  @override
  TotalAmountProvider getProviderOverride(
    covariant TotalAmountProvider provider,
  ) {
    return call(
      id: provider.id,
      price: provider.price,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'totalAmountProvider';
}

/// See also [TotalAmount].
class TotalAmountProvider extends NotifierProviderImpl<TotalAmount, int> {
  /// See also [TotalAmount].
  TotalAmountProvider({
    required String id,
    required int price,
  }) : this._internal(
          () => TotalAmount()
            ..id = id
            ..price = price,
          from: totalAmountProvider,
          name: r'totalAmountProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$totalAmountHash,
          dependencies: TotalAmountFamily._dependencies,
          allTransitiveDependencies:
              TotalAmountFamily._allTransitiveDependencies,
          id: id,
          price: price,
        );

  TotalAmountProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.price,
  }) : super.internal();

  final String id;
  final int price;

  @override
  int runNotifierBuild(
    covariant TotalAmount notifier,
  ) {
    return notifier.build(
      id: id,
      price: price,
    );
  }

  @override
  Override overrideWith(TotalAmount Function() create) {
    return ProviderOverride(
      origin: this,
      override: TotalAmountProvider._internal(
        () => create()
          ..id = id
          ..price = price,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        price: price,
      ),
    );
  }

  @override
  NotifierProviderElement<TotalAmount, int> createElement() {
    return _TotalAmountProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TotalAmountProvider &&
        other.id == id &&
        other.price == price;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, price.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TotalAmountRef on NotifierProviderRef<int> {
  /// The parameter `id` of this provider.
  String get id;

  /// The parameter `price` of this provider.
  int get price;
}

class _TotalAmountProviderElement
    extends NotifierProviderElement<TotalAmount, int> with TotalAmountRef {
  _TotalAmountProviderElement(super.provider);

  @override
  String get id => (origin as TotalAmountProvider).id;
  @override
  int get price => (origin as TotalAmountProvider).price;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
