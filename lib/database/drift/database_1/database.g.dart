// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $TradeDatasTable extends TradeDatas
    with TableInfo<$TradeDatasTable, TradeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TradeDatasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _currencyPairMeta =
      const VerificationMeta('currencyPair');
  @override
  late final GeneratedColumn<String> currencyPair = GeneratedColumn<String>(
      'currency_pair', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _premiseMeta =
      const VerificationMeta('premise');
  @override
  late final GeneratedColumn<String> premise = GeneratedColumn<String>(
      'premise', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _pipsMeta = const VerificationMeta('pips');
  @override
  late final GeneratedColumn<int> pips = GeneratedColumn<int>(
      'pips', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _moneyMeta = const VerificationMeta('money');
  @override
  late final GeneratedColumn<double> money = GeneratedColumn<double>(
      'money', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _lotMeta = const VerificationMeta('lot');
  @override
  late final GeneratedColumn<double> lot = GeneratedColumn<double>(
      'lot', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _isBuyMeta = const VerificationMeta('isBuy');
  @override
  late final GeneratedColumn<bool> isBuy = GeneratedColumn<bool>(
      'is_buy', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_buy" IN (0, 1))'));
  static const VerificationMeta _urlTextMeta =
      const VerificationMeta('urlText');
  @override
  late final GeneratedColumn<String> urlText = GeneratedColumn<String>(
      'url_text', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now());
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now());
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String> tags =
      GeneratedColumn<String>('tags', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<String>?>($TradeDatasTable.$convertertagsn);
  static const VerificationMeta _imagePathBeforeMeta =
      const VerificationMeta('imagePathBefore');
  @override
  late final GeneratedColumn<String> imagePathBefore = GeneratedColumn<String>(
      'image_path_before', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _imagePathAfterMeta =
      const VerificationMeta('imagePathAfter');
  @override
  late final GeneratedColumn<String> imagePathAfter = GeneratedColumn<String>(
      'image_path_after', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _startPriceMeta =
      const VerificationMeta('startPrice');
  @override
  late final GeneratedColumn<double> startPrice = GeneratedColumn<double>(
      'start_price', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _endPriceMeta =
      const VerificationMeta('endPrice');
  @override
  late final GeneratedColumn<double> endPrice = GeneratedColumn<double>(
      'end_price', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _startPriceResultMeta =
      const VerificationMeta('startPriceResult');
  @override
  late final GeneratedColumn<double> startPriceResult = GeneratedColumn<double>(
      'start_price_result', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _endPriceResultMeta =
      const VerificationMeta('endPriceResult');
  @override
  late final GeneratedColumn<double> endPriceResult = GeneratedColumn<double>(
      'end_price_result', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        currencyPair,
        title,
        premise,
        pips,
        money,
        lot,
        isBuy,
        urlText,
        createdAt,
        updatedAt,
        tags,
        imagePathBefore,
        imagePathAfter,
        startPrice,
        endPrice,
        startPriceResult,
        endPriceResult
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'trade_datas';
  @override
  VerificationContext validateIntegrity(Insertable<TradeData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('currency_pair')) {
      context.handle(
          _currencyPairMeta,
          currencyPair.isAcceptableOrUnknown(
              data['currency_pair']!, _currencyPairMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('premise')) {
      context.handle(_premiseMeta,
          premise.isAcceptableOrUnknown(data['premise']!, _premiseMeta));
    }
    if (data.containsKey('pips')) {
      context.handle(
          _pipsMeta, pips.isAcceptableOrUnknown(data['pips']!, _pipsMeta));
    }
    if (data.containsKey('money')) {
      context.handle(
          _moneyMeta, money.isAcceptableOrUnknown(data['money']!, _moneyMeta));
    }
    if (data.containsKey('lot')) {
      context.handle(
          _lotMeta, lot.isAcceptableOrUnknown(data['lot']!, _lotMeta));
    }
    if (data.containsKey('is_buy')) {
      context.handle(
          _isBuyMeta, isBuy.isAcceptableOrUnknown(data['is_buy']!, _isBuyMeta));
    } else if (isInserting) {
      context.missing(_isBuyMeta);
    }
    if (data.containsKey('url_text')) {
      context.handle(_urlTextMeta,
          urlText.isAcceptableOrUnknown(data['url_text']!, _urlTextMeta));
    } else if (isInserting) {
      context.missing(_urlTextMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    context.handle(_tagsMeta, const VerificationResult.success());
    if (data.containsKey('image_path_before')) {
      context.handle(
          _imagePathBeforeMeta,
          imagePathBefore.isAcceptableOrUnknown(
              data['image_path_before']!, _imagePathBeforeMeta));
    }
    if (data.containsKey('image_path_after')) {
      context.handle(
          _imagePathAfterMeta,
          imagePathAfter.isAcceptableOrUnknown(
              data['image_path_after']!, _imagePathAfterMeta));
    }
    if (data.containsKey('start_price')) {
      context.handle(
          _startPriceMeta,
          startPrice.isAcceptableOrUnknown(
              data['start_price']!, _startPriceMeta));
    }
    if (data.containsKey('end_price')) {
      context.handle(_endPriceMeta,
          endPrice.isAcceptableOrUnknown(data['end_price']!, _endPriceMeta));
    }
    if (data.containsKey('start_price_result')) {
      context.handle(
          _startPriceResultMeta,
          startPriceResult.isAcceptableOrUnknown(
              data['start_price_result']!, _startPriceResultMeta));
    }
    if (data.containsKey('end_price_result')) {
      context.handle(
          _endPriceResultMeta,
          endPriceResult.isAcceptableOrUnknown(
              data['end_price_result']!, _endPriceResultMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TradeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TradeData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      currencyPair: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}currency_pair']),
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title']),
      premise: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}premise']),
      pips: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}pips']),
      money: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}money']),
      lot: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}lot']),
      isBuy: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_buy'])!,
      urlText: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url_text'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      tags: $TradeDatasTable.$convertertagsn.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tags'])),
      imagePathBefore: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}image_path_before']),
      imagePathAfter: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}image_path_after']),
      startPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}start_price']),
      endPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}end_price']),
      startPriceResult: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}start_price_result']),
      endPriceResult: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}end_price_result']),
    );
  }

  @override
  $TradeDatasTable createAlias(String alias) {
    return $TradeDatasTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $convertertags =
      const TagListConverter();
  static TypeConverter<List<String>?, String?> $convertertagsn =
      NullAwareTypeConverter.wrap($convertertags);
}

class TradeData extends DataClass implements Insertable<TradeData> {
  final int id;
  final String? currencyPair;
  final String? title;
  final String? premise;
  final int? pips;
  final double? money;
  final double? lot;
  final bool isBuy;
  final String urlText;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<String>? tags;
  final String? imagePathBefore;
  final String? imagePathAfter;
  final double? startPrice;
  final double? endPrice;
  final double? startPriceResult;
  final double? endPriceResult;
  const TradeData(
      {required this.id,
      this.currencyPair,
      this.title,
      this.premise,
      this.pips,
      this.money,
      this.lot,
      required this.isBuy,
      required this.urlText,
      required this.createdAt,
      required this.updatedAt,
      this.tags,
      this.imagePathBefore,
      this.imagePathAfter,
      this.startPrice,
      this.endPrice,
      this.startPriceResult,
      this.endPriceResult});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || currencyPair != null) {
      map['currency_pair'] = Variable<String>(currencyPair);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || premise != null) {
      map['premise'] = Variable<String>(premise);
    }
    if (!nullToAbsent || pips != null) {
      map['pips'] = Variable<int>(pips);
    }
    if (!nullToAbsent || money != null) {
      map['money'] = Variable<double>(money);
    }
    if (!nullToAbsent || lot != null) {
      map['lot'] = Variable<double>(lot);
    }
    map['is_buy'] = Variable<bool>(isBuy);
    map['url_text'] = Variable<String>(urlText);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || tags != null) {
      map['tags'] =
          Variable<String>($TradeDatasTable.$convertertagsn.toSql(tags));
    }
    if (!nullToAbsent || imagePathBefore != null) {
      map['image_path_before'] = Variable<String>(imagePathBefore);
    }
    if (!nullToAbsent || imagePathAfter != null) {
      map['image_path_after'] = Variable<String>(imagePathAfter);
    }
    if (!nullToAbsent || startPrice != null) {
      map['start_price'] = Variable<double>(startPrice);
    }
    if (!nullToAbsent || endPrice != null) {
      map['end_price'] = Variable<double>(endPrice);
    }
    if (!nullToAbsent || startPriceResult != null) {
      map['start_price_result'] = Variable<double>(startPriceResult);
    }
    if (!nullToAbsent || endPriceResult != null) {
      map['end_price_result'] = Variable<double>(endPriceResult);
    }
    return map;
  }

  TradeDatasCompanion toCompanion(bool nullToAbsent) {
    return TradeDatasCompanion(
      id: Value(id),
      currencyPair: currencyPair == null && nullToAbsent
          ? const Value.absent()
          : Value(currencyPair),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      premise: premise == null && nullToAbsent
          ? const Value.absent()
          : Value(premise),
      pips: pips == null && nullToAbsent ? const Value.absent() : Value(pips),
      money:
          money == null && nullToAbsent ? const Value.absent() : Value(money),
      lot: lot == null && nullToAbsent ? const Value.absent() : Value(lot),
      isBuy: Value(isBuy),
      urlText: Value(urlText),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      tags: tags == null && nullToAbsent ? const Value.absent() : Value(tags),
      imagePathBefore: imagePathBefore == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePathBefore),
      imagePathAfter: imagePathAfter == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePathAfter),
      startPrice: startPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(startPrice),
      endPrice: endPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(endPrice),
      startPriceResult: startPriceResult == null && nullToAbsent
          ? const Value.absent()
          : Value(startPriceResult),
      endPriceResult: endPriceResult == null && nullToAbsent
          ? const Value.absent()
          : Value(endPriceResult),
    );
  }

  factory TradeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TradeData(
      id: serializer.fromJson<int>(json['id']),
      currencyPair: serializer.fromJson<String?>(json['currencyPair']),
      title: serializer.fromJson<String?>(json['title']),
      premise: serializer.fromJson<String?>(json['premise']),
      pips: serializer.fromJson<int?>(json['pips']),
      money: serializer.fromJson<double?>(json['money']),
      lot: serializer.fromJson<double?>(json['lot']),
      isBuy: serializer.fromJson<bool>(json['isBuy']),
      urlText: serializer.fromJson<String>(json['urlText']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      tags: serializer.fromJson<List<String>?>(json['tags']),
      imagePathBefore: serializer.fromJson<String?>(json['imagePathBefore']),
      imagePathAfter: serializer.fromJson<String?>(json['imagePathAfter']),
      startPrice: serializer.fromJson<double?>(json['startPrice']),
      endPrice: serializer.fromJson<double?>(json['endPrice']),
      startPriceResult: serializer.fromJson<double?>(json['startPriceResult']),
      endPriceResult: serializer.fromJson<double?>(json['endPriceResult']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'currencyPair': serializer.toJson<String?>(currencyPair),
      'title': serializer.toJson<String?>(title),
      'premise': serializer.toJson<String?>(premise),
      'pips': serializer.toJson<int?>(pips),
      'money': serializer.toJson<double?>(money),
      'lot': serializer.toJson<double?>(lot),
      'isBuy': serializer.toJson<bool>(isBuy),
      'urlText': serializer.toJson<String>(urlText),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'tags': serializer.toJson<List<String>?>(tags),
      'imagePathBefore': serializer.toJson<String?>(imagePathBefore),
      'imagePathAfter': serializer.toJson<String?>(imagePathAfter),
      'startPrice': serializer.toJson<double?>(startPrice),
      'endPrice': serializer.toJson<double?>(endPrice),
      'startPriceResult': serializer.toJson<double?>(startPriceResult),
      'endPriceResult': serializer.toJson<double?>(endPriceResult),
    };
  }

  TradeData copyWith(
          {int? id,
          Value<String?> currencyPair = const Value.absent(),
          Value<String?> title = const Value.absent(),
          Value<String?> premise = const Value.absent(),
          Value<int?> pips = const Value.absent(),
          Value<double?> money = const Value.absent(),
          Value<double?> lot = const Value.absent(),
          bool? isBuy,
          String? urlText,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<List<String>?> tags = const Value.absent(),
          Value<String?> imagePathBefore = const Value.absent(),
          Value<String?> imagePathAfter = const Value.absent(),
          Value<double?> startPrice = const Value.absent(),
          Value<double?> endPrice = const Value.absent(),
          Value<double?> startPriceResult = const Value.absent(),
          Value<double?> endPriceResult = const Value.absent()}) =>
      TradeData(
        id: id ?? this.id,
        currencyPair:
            currencyPair.present ? currencyPair.value : this.currencyPair,
        title: title.present ? title.value : this.title,
        premise: premise.present ? premise.value : this.premise,
        pips: pips.present ? pips.value : this.pips,
        money: money.present ? money.value : this.money,
        lot: lot.present ? lot.value : this.lot,
        isBuy: isBuy ?? this.isBuy,
        urlText: urlText ?? this.urlText,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        tags: tags.present ? tags.value : this.tags,
        imagePathBefore: imagePathBefore.present
            ? imagePathBefore.value
            : this.imagePathBefore,
        imagePathAfter:
            imagePathAfter.present ? imagePathAfter.value : this.imagePathAfter,
        startPrice: startPrice.present ? startPrice.value : this.startPrice,
        endPrice: endPrice.present ? endPrice.value : this.endPrice,
        startPriceResult: startPriceResult.present
            ? startPriceResult.value
            : this.startPriceResult,
        endPriceResult:
            endPriceResult.present ? endPriceResult.value : this.endPriceResult,
      );
  @override
  String toString() {
    return (StringBuffer('TradeData(')
          ..write('id: $id, ')
          ..write('currencyPair: $currencyPair, ')
          ..write('title: $title, ')
          ..write('premise: $premise, ')
          ..write('pips: $pips, ')
          ..write('money: $money, ')
          ..write('lot: $lot, ')
          ..write('isBuy: $isBuy, ')
          ..write('urlText: $urlText, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('tags: $tags, ')
          ..write('imagePathBefore: $imagePathBefore, ')
          ..write('imagePathAfter: $imagePathAfter, ')
          ..write('startPrice: $startPrice, ')
          ..write('endPrice: $endPrice, ')
          ..write('startPriceResult: $startPriceResult, ')
          ..write('endPriceResult: $endPriceResult')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      currencyPair,
      title,
      premise,
      pips,
      money,
      lot,
      isBuy,
      urlText,
      createdAt,
      updatedAt,
      tags,
      imagePathBefore,
      imagePathAfter,
      startPrice,
      endPrice,
      startPriceResult,
      endPriceResult);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TradeData &&
          other.id == this.id &&
          other.currencyPair == this.currencyPair &&
          other.title == this.title &&
          other.premise == this.premise &&
          other.pips == this.pips &&
          other.money == this.money &&
          other.lot == this.lot &&
          other.isBuy == this.isBuy &&
          other.urlText == this.urlText &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.tags == this.tags &&
          other.imagePathBefore == this.imagePathBefore &&
          other.imagePathAfter == this.imagePathAfter &&
          other.startPrice == this.startPrice &&
          other.endPrice == this.endPrice &&
          other.startPriceResult == this.startPriceResult &&
          other.endPriceResult == this.endPriceResult);
}

class TradeDatasCompanion extends UpdateCompanion<TradeData> {
  final Value<int> id;
  final Value<String?> currencyPair;
  final Value<String?> title;
  final Value<String?> premise;
  final Value<int?> pips;
  final Value<double?> money;
  final Value<double?> lot;
  final Value<bool> isBuy;
  final Value<String> urlText;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<List<String>?> tags;
  final Value<String?> imagePathBefore;
  final Value<String?> imagePathAfter;
  final Value<double?> startPrice;
  final Value<double?> endPrice;
  final Value<double?> startPriceResult;
  final Value<double?> endPriceResult;
  const TradeDatasCompanion({
    this.id = const Value.absent(),
    this.currencyPair = const Value.absent(),
    this.title = const Value.absent(),
    this.premise = const Value.absent(),
    this.pips = const Value.absent(),
    this.money = const Value.absent(),
    this.lot = const Value.absent(),
    this.isBuy = const Value.absent(),
    this.urlText = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.tags = const Value.absent(),
    this.imagePathBefore = const Value.absent(),
    this.imagePathAfter = const Value.absent(),
    this.startPrice = const Value.absent(),
    this.endPrice = const Value.absent(),
    this.startPriceResult = const Value.absent(),
    this.endPriceResult = const Value.absent(),
  });
  TradeDatasCompanion.insert({
    this.id = const Value.absent(),
    this.currencyPair = const Value.absent(),
    this.title = const Value.absent(),
    this.premise = const Value.absent(),
    this.pips = const Value.absent(),
    this.money = const Value.absent(),
    this.lot = const Value.absent(),
    required bool isBuy,
    required String urlText,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.tags = const Value.absent(),
    this.imagePathBefore = const Value.absent(),
    this.imagePathAfter = const Value.absent(),
    this.startPrice = const Value.absent(),
    this.endPrice = const Value.absent(),
    this.startPriceResult = const Value.absent(),
    this.endPriceResult = const Value.absent(),
  })  : isBuy = Value(isBuy),
        urlText = Value(urlText);
  static Insertable<TradeData> custom({
    Expression<int>? id,
    Expression<String>? currencyPair,
    Expression<String>? title,
    Expression<String>? premise,
    Expression<int>? pips,
    Expression<double>? money,
    Expression<double>? lot,
    Expression<bool>? isBuy,
    Expression<String>? urlText,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? tags,
    Expression<String>? imagePathBefore,
    Expression<String>? imagePathAfter,
    Expression<double>? startPrice,
    Expression<double>? endPrice,
    Expression<double>? startPriceResult,
    Expression<double>? endPriceResult,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (currencyPair != null) 'currency_pair': currencyPair,
      if (title != null) 'title': title,
      if (premise != null) 'premise': premise,
      if (pips != null) 'pips': pips,
      if (money != null) 'money': money,
      if (lot != null) 'lot': lot,
      if (isBuy != null) 'is_buy': isBuy,
      if (urlText != null) 'url_text': urlText,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (tags != null) 'tags': tags,
      if (imagePathBefore != null) 'image_path_before': imagePathBefore,
      if (imagePathAfter != null) 'image_path_after': imagePathAfter,
      if (startPrice != null) 'start_price': startPrice,
      if (endPrice != null) 'end_price': endPrice,
      if (startPriceResult != null) 'start_price_result': startPriceResult,
      if (endPriceResult != null) 'end_price_result': endPriceResult,
    });
  }

  TradeDatasCompanion copyWith(
      {Value<int>? id,
      Value<String?>? currencyPair,
      Value<String?>? title,
      Value<String?>? premise,
      Value<int?>? pips,
      Value<double?>? money,
      Value<double?>? lot,
      Value<bool>? isBuy,
      Value<String>? urlText,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<List<String>?>? tags,
      Value<String?>? imagePathBefore,
      Value<String?>? imagePathAfter,
      Value<double?>? startPrice,
      Value<double?>? endPrice,
      Value<double?>? startPriceResult,
      Value<double?>? endPriceResult}) {
    return TradeDatasCompanion(
      id: id ?? this.id,
      currencyPair: currencyPair ?? this.currencyPair,
      title: title ?? this.title,
      premise: premise ?? this.premise,
      pips: pips ?? this.pips,
      money: money ?? this.money,
      lot: lot ?? this.lot,
      isBuy: isBuy ?? this.isBuy,
      urlText: urlText ?? this.urlText,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      tags: tags ?? this.tags,
      imagePathBefore: imagePathBefore ?? this.imagePathBefore,
      imagePathAfter: imagePathAfter ?? this.imagePathAfter,
      startPrice: startPrice ?? this.startPrice,
      endPrice: endPrice ?? this.endPrice,
      startPriceResult: startPriceResult ?? this.startPriceResult,
      endPriceResult: endPriceResult ?? this.endPriceResult,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (currencyPair.present) {
      map['currency_pair'] = Variable<String>(currencyPair.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (premise.present) {
      map['premise'] = Variable<String>(premise.value);
    }
    if (pips.present) {
      map['pips'] = Variable<int>(pips.value);
    }
    if (money.present) {
      map['money'] = Variable<double>(money.value);
    }
    if (lot.present) {
      map['lot'] = Variable<double>(lot.value);
    }
    if (isBuy.present) {
      map['is_buy'] = Variable<bool>(isBuy.value);
    }
    if (urlText.present) {
      map['url_text'] = Variable<String>(urlText.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (tags.present) {
      map['tags'] =
          Variable<String>($TradeDatasTable.$convertertagsn.toSql(tags.value));
    }
    if (imagePathBefore.present) {
      map['image_path_before'] = Variable<String>(imagePathBefore.value);
    }
    if (imagePathAfter.present) {
      map['image_path_after'] = Variable<String>(imagePathAfter.value);
    }
    if (startPrice.present) {
      map['start_price'] = Variable<double>(startPrice.value);
    }
    if (endPrice.present) {
      map['end_price'] = Variable<double>(endPrice.value);
    }
    if (startPriceResult.present) {
      map['start_price_result'] = Variable<double>(startPriceResult.value);
    }
    if (endPriceResult.present) {
      map['end_price_result'] = Variable<double>(endPriceResult.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TradeDatasCompanion(')
          ..write('id: $id, ')
          ..write('currencyPair: $currencyPair, ')
          ..write('title: $title, ')
          ..write('premise: $premise, ')
          ..write('pips: $pips, ')
          ..write('money: $money, ')
          ..write('lot: $lot, ')
          ..write('isBuy: $isBuy, ')
          ..write('urlText: $urlText, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('tags: $tags, ')
          ..write('imagePathBefore: $imagePathBefore, ')
          ..write('imagePathAfter: $imagePathAfter, ')
          ..write('startPrice: $startPrice, ')
          ..write('endPrice: $endPrice, ')
          ..write('startPriceResult: $startPriceResult, ')
          ..write('endPriceResult: $endPriceResult')
          ..write(')'))
        .toString();
  }
}

class $TagsTable extends Tags with TableInfo<$TagsTable, Tag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _tagNameMeta =
      const VerificationMeta('tagName');
  @override
  late final GeneratedColumn<String> tagName = GeneratedColumn<String>(
      'tag_name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now());
  static const VerificationMeta _useCountMeta =
      const VerificationMeta('useCount');
  @override
  late final GeneratedColumn<int> useCount = GeneratedColumn<int>(
      'use_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _genreMeta = const VerificationMeta('genre');
  @override
  late final GeneratedColumn<String> genre = GeneratedColumn<String>(
      'genre', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => "分類なし");
  @override
  List<GeneratedColumn> get $columns =>
      [id, tagName, createdAt, useCount, genre];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tags';
  @override
  VerificationContext validateIntegrity(Insertable<Tag> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('tag_name')) {
      context.handle(_tagNameMeta,
          tagName.isAcceptableOrUnknown(data['tag_name']!, _tagNameMeta));
    } else if (isInserting) {
      context.missing(_tagNameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('use_count')) {
      context.handle(_useCountMeta,
          useCount.isAcceptableOrUnknown(data['use_count']!, _useCountMeta));
    }
    if (data.containsKey('genre')) {
      context.handle(
          _genreMeta, genre.isAcceptableOrUnknown(data['genre']!, _genreMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Tag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Tag(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      tagName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tag_name'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      useCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}use_count'])!,
      genre: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}genre'])!,
    );
  }

  @override
  $TagsTable createAlias(String alias) {
    return $TagsTable(attachedDatabase, alias);
  }
}

class Tag extends DataClass implements Insertable<Tag> {
  final int id;
  final String tagName;
  final DateTime createdAt;
  final int useCount;
  final String genre;
  const Tag(
      {required this.id,
      required this.tagName,
      required this.createdAt,
      required this.useCount,
      required this.genre});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['tag_name'] = Variable<String>(tagName);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['use_count'] = Variable<int>(useCount);
    map['genre'] = Variable<String>(genre);
    return map;
  }

  TagsCompanion toCompanion(bool nullToAbsent) {
    return TagsCompanion(
      id: Value(id),
      tagName: Value(tagName),
      createdAt: Value(createdAt),
      useCount: Value(useCount),
      genre: Value(genre),
    );
  }

  factory Tag.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Tag(
      id: serializer.fromJson<int>(json['id']),
      tagName: serializer.fromJson<String>(json['tagName']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      useCount: serializer.fromJson<int>(json['useCount']),
      genre: serializer.fromJson<String>(json['genre']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'tagName': serializer.toJson<String>(tagName),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'useCount': serializer.toJson<int>(useCount),
      'genre': serializer.toJson<String>(genre),
    };
  }

  Tag copyWith(
          {int? id,
          String? tagName,
          DateTime? createdAt,
          int? useCount,
          String? genre}) =>
      Tag(
        id: id ?? this.id,
        tagName: tagName ?? this.tagName,
        createdAt: createdAt ?? this.createdAt,
        useCount: useCount ?? this.useCount,
        genre: genre ?? this.genre,
      );
  @override
  String toString() {
    return (StringBuffer('Tag(')
          ..write('id: $id, ')
          ..write('tagName: $tagName, ')
          ..write('createdAt: $createdAt, ')
          ..write('useCount: $useCount, ')
          ..write('genre: $genre')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, tagName, createdAt, useCount, genre);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tag &&
          other.id == this.id &&
          other.tagName == this.tagName &&
          other.createdAt == this.createdAt &&
          other.useCount == this.useCount &&
          other.genre == this.genre);
}

class TagsCompanion extends UpdateCompanion<Tag> {
  final Value<int> id;
  final Value<String> tagName;
  final Value<DateTime> createdAt;
  final Value<int> useCount;
  final Value<String> genre;
  const TagsCompanion({
    this.id = const Value.absent(),
    this.tagName = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.useCount = const Value.absent(),
    this.genre = const Value.absent(),
  });
  TagsCompanion.insert({
    this.id = const Value.absent(),
    required String tagName,
    this.createdAt = const Value.absent(),
    this.useCount = const Value.absent(),
    this.genre = const Value.absent(),
  }) : tagName = Value(tagName);
  static Insertable<Tag> custom({
    Expression<int>? id,
    Expression<String>? tagName,
    Expression<DateTime>? createdAt,
    Expression<int>? useCount,
    Expression<String>? genre,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tagName != null) 'tag_name': tagName,
      if (createdAt != null) 'created_at': createdAt,
      if (useCount != null) 'use_count': useCount,
      if (genre != null) 'genre': genre,
    });
  }

  TagsCompanion copyWith(
      {Value<int>? id,
      Value<String>? tagName,
      Value<DateTime>? createdAt,
      Value<int>? useCount,
      Value<String>? genre}) {
    return TagsCompanion(
      id: id ?? this.id,
      tagName: tagName ?? this.tagName,
      createdAt: createdAt ?? this.createdAt,
      useCount: useCount ?? this.useCount,
      genre: genre ?? this.genre,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (tagName.present) {
      map['tag_name'] = Variable<String>(tagName.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (useCount.present) {
      map['use_count'] = Variable<int>(useCount.value);
    }
    if (genre.present) {
      map['genre'] = Variable<String>(genre.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TagsCompanion(')
          ..write('id: $id, ')
          ..write('tagName: $tagName, ')
          ..write('createdAt: $createdAt, ')
          ..write('useCount: $useCount, ')
          ..write('genre: $genre')
          ..write(')'))
        .toString();
  }
}

class $TaggedTradeDatasTable extends TaggedTradeDatas
    with TableInfo<$TaggedTradeDatasTable, TaggedTradeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaggedTradeDatasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _tradeDataIdMeta =
      const VerificationMeta('tradeDataId');
  @override
  late final GeneratedColumn<int> tradeDataId = GeneratedColumn<int>(
      'trade_data_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES trade_datas(id) ON DELETE CASCADE');
  static const VerificationMeta _tagIdMeta = const VerificationMeta('tagId');
  @override
  late final GeneratedColumn<int> tagId = GeneratedColumn<int>(
      'tag_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES tags(id) ON DELETE CASCADE');
  @override
  List<GeneratedColumn> get $columns => [tradeDataId, tagId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tagged_trade_datas';
  @override
  VerificationContext validateIntegrity(Insertable<TaggedTradeData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('trade_data_id')) {
      context.handle(
          _tradeDataIdMeta,
          tradeDataId.isAcceptableOrUnknown(
              data['trade_data_id']!, _tradeDataIdMeta));
    } else if (isInserting) {
      context.missing(_tradeDataIdMeta);
    }
    if (data.containsKey('tag_id')) {
      context.handle(
          _tagIdMeta, tagId.isAcceptableOrUnknown(data['tag_id']!, _tagIdMeta));
    } else if (isInserting) {
      context.missing(_tagIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {tradeDataId, tagId};
  @override
  TaggedTradeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaggedTradeData(
      tradeDataId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}trade_data_id'])!,
      tagId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}tag_id'])!,
    );
  }

  @override
  $TaggedTradeDatasTable createAlias(String alias) {
    return $TaggedTradeDatasTable(attachedDatabase, alias);
  }
}

class TaggedTradeData extends DataClass implements Insertable<TaggedTradeData> {
  final int tradeDataId;
  final int tagId;
  const TaggedTradeData({required this.tradeDataId, required this.tagId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['trade_data_id'] = Variable<int>(tradeDataId);
    map['tag_id'] = Variable<int>(tagId);
    return map;
  }

  TaggedTradeDatasCompanion toCompanion(bool nullToAbsent) {
    return TaggedTradeDatasCompanion(
      tradeDataId: Value(tradeDataId),
      tagId: Value(tagId),
    );
  }

  factory TaggedTradeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaggedTradeData(
      tradeDataId: serializer.fromJson<int>(json['tradeDataId']),
      tagId: serializer.fromJson<int>(json['tagId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'tradeDataId': serializer.toJson<int>(tradeDataId),
      'tagId': serializer.toJson<int>(tagId),
    };
  }

  TaggedTradeData copyWith({int? tradeDataId, int? tagId}) => TaggedTradeData(
        tradeDataId: tradeDataId ?? this.tradeDataId,
        tagId: tagId ?? this.tagId,
      );
  @override
  String toString() {
    return (StringBuffer('TaggedTradeData(')
          ..write('tradeDataId: $tradeDataId, ')
          ..write('tagId: $tagId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(tradeDataId, tagId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaggedTradeData &&
          other.tradeDataId == this.tradeDataId &&
          other.tagId == this.tagId);
}

class TaggedTradeDatasCompanion extends UpdateCompanion<TaggedTradeData> {
  final Value<int> tradeDataId;
  final Value<int> tagId;
  final Value<int> rowid;
  const TaggedTradeDatasCompanion({
    this.tradeDataId = const Value.absent(),
    this.tagId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TaggedTradeDatasCompanion.insert({
    required int tradeDataId,
    required int tagId,
    this.rowid = const Value.absent(),
  })  : tradeDataId = Value(tradeDataId),
        tagId = Value(tagId);
  static Insertable<TaggedTradeData> custom({
    Expression<int>? tradeDataId,
    Expression<int>? tagId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (tradeDataId != null) 'trade_data_id': tradeDataId,
      if (tagId != null) 'tag_id': tagId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TaggedTradeDatasCompanion copyWith(
      {Value<int>? tradeDataId, Value<int>? tagId, Value<int>? rowid}) {
    return TaggedTradeDatasCompanion(
      tradeDataId: tradeDataId ?? this.tradeDataId,
      tagId: tagId ?? this.tagId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (tradeDataId.present) {
      map['trade_data_id'] = Variable<int>(tradeDataId.value);
    }
    if (tagId.present) {
      map['tag_id'] = Variable<int>(tagId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaggedTradeDatasCompanion(')
          ..write('tradeDataId: $tradeDataId, ')
          ..write('tagId: $tagId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TagAttributesTable extends TagAttributes
    with TableInfo<$TagAttributesTable, TagAttribute> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TagAttributesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _dataTypeMeta =
      const VerificationMeta('dataType');
  @override
  late final GeneratedColumn<String> dataType = GeneratedColumn<String>(
      'data_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, dataType];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tag_attributes';
  @override
  VerificationContext validateIntegrity(Insertable<TagAttribute> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('data_type')) {
      context.handle(_dataTypeMeta,
          dataType.isAcceptableOrUnknown(data['data_type']!, _dataTypeMeta));
    } else if (isInserting) {
      context.missing(_dataTypeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TagAttribute map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TagAttribute(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      dataType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data_type'])!,
    );
  }

  @override
  $TagAttributesTable createAlias(String alias) {
    return $TagAttributesTable(attachedDatabase, alias);
  }
}

class TagAttribute extends DataClass implements Insertable<TagAttribute> {
  final int id;
  final String name;
  final String dataType;
  const TagAttribute(
      {required this.id, required this.name, required this.dataType});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['data_type'] = Variable<String>(dataType);
    return map;
  }

  TagAttributesCompanion toCompanion(bool nullToAbsent) {
    return TagAttributesCompanion(
      id: Value(id),
      name: Value(name),
      dataType: Value(dataType),
    );
  }

  factory TagAttribute.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TagAttribute(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      dataType: serializer.fromJson<String>(json['dataType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'dataType': serializer.toJson<String>(dataType),
    };
  }

  TagAttribute copyWith({int? id, String? name, String? dataType}) =>
      TagAttribute(
        id: id ?? this.id,
        name: name ?? this.name,
        dataType: dataType ?? this.dataType,
      );
  @override
  String toString() {
    return (StringBuffer('TagAttribute(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('dataType: $dataType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, dataType);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TagAttribute &&
          other.id == this.id &&
          other.name == this.name &&
          other.dataType == this.dataType);
}

class TagAttributesCompanion extends UpdateCompanion<TagAttribute> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> dataType;
  const TagAttributesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.dataType = const Value.absent(),
  });
  TagAttributesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String dataType,
  })  : name = Value(name),
        dataType = Value(dataType);
  static Insertable<TagAttribute> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? dataType,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (dataType != null) 'data_type': dataType,
    });
  }

  TagAttributesCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<String>? dataType}) {
    return TagAttributesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      dataType: dataType ?? this.dataType,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (dataType.present) {
      map['data_type'] = Variable<String>(dataType.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TagAttributesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('dataType: $dataType')
          ..write(')'))
        .toString();
  }
}

class $TagAttributeValuesTable extends TagAttributeValues
    with TableInfo<$TagAttributeValuesTable, TagAttributeValue> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TagAttributeValuesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _tagIdMeta = const VerificationMeta('tagId');
  @override
  late final GeneratedColumn<int> tagId = GeneratedColumn<int>(
      'tag_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES tags(id) ON DELETE CASCADE');
  static const VerificationMeta _attributeIdMeta =
      const VerificationMeta('attributeId');
  @override
  late final GeneratedColumn<int> attributeId = GeneratedColumn<int>(
      'attribute_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES tag_attributes(id) ON DELETE CASCADE');
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
      'value', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [tagId, attributeId, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tag_attribute_values';
  @override
  VerificationContext validateIntegrity(Insertable<TagAttributeValue> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('tag_id')) {
      context.handle(
          _tagIdMeta, tagId.isAcceptableOrUnknown(data['tag_id']!, _tagIdMeta));
    } else if (isInserting) {
      context.missing(_tagIdMeta);
    }
    if (data.containsKey('attribute_id')) {
      context.handle(
          _attributeIdMeta,
          attributeId.isAcceptableOrUnknown(
              data['attribute_id']!, _attributeIdMeta));
    } else if (isInserting) {
      context.missing(_attributeIdMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {tagId, attributeId};
  @override
  TagAttributeValue map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TagAttributeValue(
      tagId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}tag_id'])!,
      attributeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}attribute_id'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value'])!,
    );
  }

  @override
  $TagAttributeValuesTable createAlias(String alias) {
    return $TagAttributeValuesTable(attachedDatabase, alias);
  }
}

class TagAttributeValue extends DataClass
    implements Insertable<TagAttributeValue> {
  final int tagId;
  final int attributeId;
  final String value;
  const TagAttributeValue(
      {required this.tagId, required this.attributeId, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['tag_id'] = Variable<int>(tagId);
    map['attribute_id'] = Variable<int>(attributeId);
    map['value'] = Variable<String>(value);
    return map;
  }

  TagAttributeValuesCompanion toCompanion(bool nullToAbsent) {
    return TagAttributeValuesCompanion(
      tagId: Value(tagId),
      attributeId: Value(attributeId),
      value: Value(value),
    );
  }

  factory TagAttributeValue.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TagAttributeValue(
      tagId: serializer.fromJson<int>(json['tagId']),
      attributeId: serializer.fromJson<int>(json['attributeId']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'tagId': serializer.toJson<int>(tagId),
      'attributeId': serializer.toJson<int>(attributeId),
      'value': serializer.toJson<String>(value),
    };
  }

  TagAttributeValue copyWith({int? tagId, int? attributeId, String? value}) =>
      TagAttributeValue(
        tagId: tagId ?? this.tagId,
        attributeId: attributeId ?? this.attributeId,
        value: value ?? this.value,
      );
  @override
  String toString() {
    return (StringBuffer('TagAttributeValue(')
          ..write('tagId: $tagId, ')
          ..write('attributeId: $attributeId, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(tagId, attributeId, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TagAttributeValue &&
          other.tagId == this.tagId &&
          other.attributeId == this.attributeId &&
          other.value == this.value);
}

class TagAttributeValuesCompanion extends UpdateCompanion<TagAttributeValue> {
  final Value<int> tagId;
  final Value<int> attributeId;
  final Value<String> value;
  final Value<int> rowid;
  const TagAttributeValuesCompanion({
    this.tagId = const Value.absent(),
    this.attributeId = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TagAttributeValuesCompanion.insert({
    required int tagId,
    required int attributeId,
    required String value,
    this.rowid = const Value.absent(),
  })  : tagId = Value(tagId),
        attributeId = Value(attributeId),
        value = Value(value);
  static Insertable<TagAttributeValue> custom({
    Expression<int>? tagId,
    Expression<int>? attributeId,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (tagId != null) 'tag_id': tagId,
      if (attributeId != null) 'attribute_id': attributeId,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TagAttributeValuesCompanion copyWith(
      {Value<int>? tagId,
      Value<int>? attributeId,
      Value<String>? value,
      Value<int>? rowid}) {
    return TagAttributeValuesCompanion(
      tagId: tagId ?? this.tagId,
      attributeId: attributeId ?? this.attributeId,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (tagId.present) {
      map['tag_id'] = Variable<int>(tagId.value);
    }
    if (attributeId.present) {
      map['attribute_id'] = Variable<int>(attributeId.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TagAttributeValuesCompanion(')
          ..write('tagId: $tagId, ')
          ..write('attributeId: $attributeId, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SettingsTable extends Settings with TableInfo<$SettingsTable, Setting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
      clientDefault: () => 0);
  static const VerificationMeta _themeModeMeta =
      const VerificationMeta('themeMode');
  @override
  late final GeneratedColumn<int> themeMode = GeneratedColumn<int>(
      'theme_mode', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _databaseNameMeta =
      const VerificationMeta('databaseName');
  @override
  late final GeneratedColumn<String> databaseName = GeneratedColumn<String>(
      'database_name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => "データベース1");
  @override
  List<GeneratedColumn> get $columns => [id, themeMode, databaseName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'settings';
  @override
  VerificationContext validateIntegrity(Insertable<Setting> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('theme_mode')) {
      context.handle(_themeModeMeta,
          themeMode.isAcceptableOrUnknown(data['theme_mode']!, _themeModeMeta));
    }
    if (data.containsKey('database_name')) {
      context.handle(
          _databaseNameMeta,
          databaseName.isAcceptableOrUnknown(
              data['database_name']!, _databaseNameMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Setting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Setting(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      themeMode: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}theme_mode']),
      databaseName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}database_name'])!,
    );
  }

  @override
  $SettingsTable createAlias(String alias) {
    return $SettingsTable(attachedDatabase, alias);
  }
}

class Setting extends DataClass implements Insertable<Setting> {
  final int id;
  final int? themeMode;
  final String databaseName;
  const Setting({required this.id, this.themeMode, required this.databaseName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || themeMode != null) {
      map['theme_mode'] = Variable<int>(themeMode);
    }
    map['database_name'] = Variable<String>(databaseName);
    return map;
  }

  SettingsCompanion toCompanion(bool nullToAbsent) {
    return SettingsCompanion(
      id: Value(id),
      themeMode: themeMode == null && nullToAbsent
          ? const Value.absent()
          : Value(themeMode),
      databaseName: Value(databaseName),
    );
  }

  factory Setting.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Setting(
      id: serializer.fromJson<int>(json['id']),
      themeMode: serializer.fromJson<int?>(json['themeMode']),
      databaseName: serializer.fromJson<String>(json['databaseName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'themeMode': serializer.toJson<int?>(themeMode),
      'databaseName': serializer.toJson<String>(databaseName),
    };
  }

  Setting copyWith(
          {int? id,
          Value<int?> themeMode = const Value.absent(),
          String? databaseName}) =>
      Setting(
        id: id ?? this.id,
        themeMode: themeMode.present ? themeMode.value : this.themeMode,
        databaseName: databaseName ?? this.databaseName,
      );
  @override
  String toString() {
    return (StringBuffer('Setting(')
          ..write('id: $id, ')
          ..write('themeMode: $themeMode, ')
          ..write('databaseName: $databaseName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, themeMode, databaseName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Setting &&
          other.id == this.id &&
          other.themeMode == this.themeMode &&
          other.databaseName == this.databaseName);
}

class SettingsCompanion extends UpdateCompanion<Setting> {
  final Value<int> id;
  final Value<int?> themeMode;
  final Value<String> databaseName;
  final Value<int> rowid;
  const SettingsCompanion({
    this.id = const Value.absent(),
    this.themeMode = const Value.absent(),
    this.databaseName = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SettingsCompanion.insert({
    this.id = const Value.absent(),
    this.themeMode = const Value.absent(),
    this.databaseName = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  static Insertable<Setting> custom({
    Expression<int>? id,
    Expression<int>? themeMode,
    Expression<String>? databaseName,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (themeMode != null) 'theme_mode': themeMode,
      if (databaseName != null) 'database_name': databaseName,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SettingsCompanion copyWith(
      {Value<int>? id,
      Value<int?>? themeMode,
      Value<String>? databaseName,
      Value<int>? rowid}) {
    return SettingsCompanion(
      id: id ?? this.id,
      themeMode: themeMode ?? this.themeMode,
      databaseName: databaseName ?? this.databaseName,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (themeMode.present) {
      map['theme_mode'] = Variable<int>(themeMode.value);
    }
    if (databaseName.present) {
      map['database_name'] = Variable<String>(databaseName.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsCompanion(')
          ..write('id: $id, ')
          ..write('themeMode: $themeMode, ')
          ..write('databaseName: $databaseName, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  _$MyDatabaseManager get managers => _$MyDatabaseManager(this);
  late final $TradeDatasTable tradeDatas = $TradeDatasTable(this);
  late final $TagsTable tags = $TagsTable(this);
  late final $TaggedTradeDatasTable taggedTradeDatas =
      $TaggedTradeDatasTable(this);
  late final $TagAttributesTable tagAttributes = $TagAttributesTable(this);
  late final $TagAttributeValuesTable tagAttributeValues =
      $TagAttributeValuesTable(this);
  late final $SettingsTable settings = $SettingsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        tradeDatas,
        tags,
        taggedTradeDatas,
        tagAttributes,
        tagAttributeValues,
        settings
      ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('trade_datas',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('tagged_trade_datas', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('tags',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('tagged_trade_datas', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('tags',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('tag_attribute_values', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('tag_attributes',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('tag_attribute_values', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

typedef $$TradeDatasTableInsertCompanionBuilder = TradeDatasCompanion Function({
  Value<int> id,
  Value<String?> currencyPair,
  Value<String?> title,
  Value<String?> premise,
  Value<int?> pips,
  Value<double?> money,
  Value<double?> lot,
  required bool isBuy,
  required String urlText,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<List<String>?> tags,
  Value<String?> imagePathBefore,
  Value<String?> imagePathAfter,
  Value<double?> startPrice,
  Value<double?> endPrice,
  Value<double?> startPriceResult,
  Value<double?> endPriceResult,
});
typedef $$TradeDatasTableUpdateCompanionBuilder = TradeDatasCompanion Function({
  Value<int> id,
  Value<String?> currencyPair,
  Value<String?> title,
  Value<String?> premise,
  Value<int?> pips,
  Value<double?> money,
  Value<double?> lot,
  Value<bool> isBuy,
  Value<String> urlText,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<List<String>?> tags,
  Value<String?> imagePathBefore,
  Value<String?> imagePathAfter,
  Value<double?> startPrice,
  Value<double?> endPrice,
  Value<double?> startPriceResult,
  Value<double?> endPriceResult,
});

class $$TradeDatasTableTableManager extends RootTableManager<
    _$MyDatabase,
    $TradeDatasTable,
    TradeData,
    $$TradeDatasTableFilterComposer,
    $$TradeDatasTableOrderingComposer,
    $$TradeDatasTableProcessedTableManager,
    $$TradeDatasTableInsertCompanionBuilder,
    $$TradeDatasTableUpdateCompanionBuilder> {
  $$TradeDatasTableTableManager(_$MyDatabase db, $TradeDatasTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TradeDatasTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TradeDatasTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$TradeDatasTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String?> currencyPair = const Value.absent(),
            Value<String?> title = const Value.absent(),
            Value<String?> premise = const Value.absent(),
            Value<int?> pips = const Value.absent(),
            Value<double?> money = const Value.absent(),
            Value<double?> lot = const Value.absent(),
            Value<bool> isBuy = const Value.absent(),
            Value<String> urlText = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<List<String>?> tags = const Value.absent(),
            Value<String?> imagePathBefore = const Value.absent(),
            Value<String?> imagePathAfter = const Value.absent(),
            Value<double?> startPrice = const Value.absent(),
            Value<double?> endPrice = const Value.absent(),
            Value<double?> startPriceResult = const Value.absent(),
            Value<double?> endPriceResult = const Value.absent(),
          }) =>
              TradeDatasCompanion(
            id: id,
            currencyPair: currencyPair,
            title: title,
            premise: premise,
            pips: pips,
            money: money,
            lot: lot,
            isBuy: isBuy,
            urlText: urlText,
            createdAt: createdAt,
            updatedAt: updatedAt,
            tags: tags,
            imagePathBefore: imagePathBefore,
            imagePathAfter: imagePathAfter,
            startPrice: startPrice,
            endPrice: endPrice,
            startPriceResult: startPriceResult,
            endPriceResult: endPriceResult,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String?> currencyPair = const Value.absent(),
            Value<String?> title = const Value.absent(),
            Value<String?> premise = const Value.absent(),
            Value<int?> pips = const Value.absent(),
            Value<double?> money = const Value.absent(),
            Value<double?> lot = const Value.absent(),
            required bool isBuy,
            required String urlText,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<List<String>?> tags = const Value.absent(),
            Value<String?> imagePathBefore = const Value.absent(),
            Value<String?> imagePathAfter = const Value.absent(),
            Value<double?> startPrice = const Value.absent(),
            Value<double?> endPrice = const Value.absent(),
            Value<double?> startPriceResult = const Value.absent(),
            Value<double?> endPriceResult = const Value.absent(),
          }) =>
              TradeDatasCompanion.insert(
            id: id,
            currencyPair: currencyPair,
            title: title,
            premise: premise,
            pips: pips,
            money: money,
            lot: lot,
            isBuy: isBuy,
            urlText: urlText,
            createdAt: createdAt,
            updatedAt: updatedAt,
            tags: tags,
            imagePathBefore: imagePathBefore,
            imagePathAfter: imagePathAfter,
            startPrice: startPrice,
            endPrice: endPrice,
            startPriceResult: startPriceResult,
            endPriceResult: endPriceResult,
          ),
        ));
}

class $$TradeDatasTableProcessedTableManager extends ProcessedTableManager<
    _$MyDatabase,
    $TradeDatasTable,
    TradeData,
    $$TradeDatasTableFilterComposer,
    $$TradeDatasTableOrderingComposer,
    $$TradeDatasTableProcessedTableManager,
    $$TradeDatasTableInsertCompanionBuilder,
    $$TradeDatasTableUpdateCompanionBuilder> {
  $$TradeDatasTableProcessedTableManager(super.$state);
}

class $$TradeDatasTableFilterComposer
    extends FilterComposer<_$MyDatabase, $TradeDatasTable> {
  $$TradeDatasTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get currencyPair => $state.composableBuilder(
      column: $state.table.currencyPair,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get premise => $state.composableBuilder(
      column: $state.table.premise,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get pips => $state.composableBuilder(
      column: $state.table.pips,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get money => $state.composableBuilder(
      column: $state.table.money,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get lot => $state.composableBuilder(
      column: $state.table.lot,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isBuy => $state.composableBuilder(
      column: $state.table.isBuy,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get urlText => $state.composableBuilder(
      column: $state.table.urlText,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<List<String>?, List<String>, String>
      get tags => $state.composableBuilder(
          column: $state.table.tags,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnFilters<String> get imagePathBefore => $state.composableBuilder(
      column: $state.table.imagePathBefore,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get imagePathAfter => $state.composableBuilder(
      column: $state.table.imagePathAfter,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get startPrice => $state.composableBuilder(
      column: $state.table.startPrice,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get endPrice => $state.composableBuilder(
      column: $state.table.endPrice,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get startPriceResult => $state.composableBuilder(
      column: $state.table.startPriceResult,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get endPriceResult => $state.composableBuilder(
      column: $state.table.endPriceResult,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter taggedTradeDatasRefs(
      ComposableFilter Function($$TaggedTradeDatasTableFilterComposer f) f) {
    final $$TaggedTradeDatasTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.taggedTradeDatas,
            getReferencedColumn: (t) => t.tradeDataId,
            builder: (joinBuilder, parentComposers) =>
                $$TaggedTradeDatasTableFilterComposer(ComposerState($state.db,
                    $state.db.taggedTradeDatas, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$TradeDatasTableOrderingComposer
    extends OrderingComposer<_$MyDatabase, $TradeDatasTable> {
  $$TradeDatasTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get currencyPair => $state.composableBuilder(
      column: $state.table.currencyPair,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get premise => $state.composableBuilder(
      column: $state.table.premise,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get pips => $state.composableBuilder(
      column: $state.table.pips,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get money => $state.composableBuilder(
      column: $state.table.money,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get lot => $state.composableBuilder(
      column: $state.table.lot,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isBuy => $state.composableBuilder(
      column: $state.table.isBuy,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get urlText => $state.composableBuilder(
      column: $state.table.urlText,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get tags => $state.composableBuilder(
      column: $state.table.tags,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get imagePathBefore => $state.composableBuilder(
      column: $state.table.imagePathBefore,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get imagePathAfter => $state.composableBuilder(
      column: $state.table.imagePathAfter,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get startPrice => $state.composableBuilder(
      column: $state.table.startPrice,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get endPrice => $state.composableBuilder(
      column: $state.table.endPrice,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get startPriceResult => $state.composableBuilder(
      column: $state.table.startPriceResult,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get endPriceResult => $state.composableBuilder(
      column: $state.table.endPriceResult,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$TagsTableInsertCompanionBuilder = TagsCompanion Function({
  Value<int> id,
  required String tagName,
  Value<DateTime> createdAt,
  Value<int> useCount,
  Value<String> genre,
});
typedef $$TagsTableUpdateCompanionBuilder = TagsCompanion Function({
  Value<int> id,
  Value<String> tagName,
  Value<DateTime> createdAt,
  Value<int> useCount,
  Value<String> genre,
});

class $$TagsTableTableManager extends RootTableManager<
    _$MyDatabase,
    $TagsTable,
    Tag,
    $$TagsTableFilterComposer,
    $$TagsTableOrderingComposer,
    $$TagsTableProcessedTableManager,
    $$TagsTableInsertCompanionBuilder,
    $$TagsTableUpdateCompanionBuilder> {
  $$TagsTableTableManager(_$MyDatabase db, $TagsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TagsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TagsTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) => $$TagsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> tagName = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> useCount = const Value.absent(),
            Value<String> genre = const Value.absent(),
          }) =>
              TagsCompanion(
            id: id,
            tagName: tagName,
            createdAt: createdAt,
            useCount: useCount,
            genre: genre,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String tagName,
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> useCount = const Value.absent(),
            Value<String> genre = const Value.absent(),
          }) =>
              TagsCompanion.insert(
            id: id,
            tagName: tagName,
            createdAt: createdAt,
            useCount: useCount,
            genre: genre,
          ),
        ));
}

class $$TagsTableProcessedTableManager extends ProcessedTableManager<
    _$MyDatabase,
    $TagsTable,
    Tag,
    $$TagsTableFilterComposer,
    $$TagsTableOrderingComposer,
    $$TagsTableProcessedTableManager,
    $$TagsTableInsertCompanionBuilder,
    $$TagsTableUpdateCompanionBuilder> {
  $$TagsTableProcessedTableManager(super.$state);
}

class $$TagsTableFilterComposer
    extends FilterComposer<_$MyDatabase, $TagsTable> {
  $$TagsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get tagName => $state.composableBuilder(
      column: $state.table.tagName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get useCount => $state.composableBuilder(
      column: $state.table.useCount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get genre => $state.composableBuilder(
      column: $state.table.genre,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter taggedTradeDatasRefs(
      ComposableFilter Function($$TaggedTradeDatasTableFilterComposer f) f) {
    final $$TaggedTradeDatasTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.taggedTradeDatas,
            getReferencedColumn: (t) => t.tagId,
            builder: (joinBuilder, parentComposers) =>
                $$TaggedTradeDatasTableFilterComposer(ComposerState($state.db,
                    $state.db.taggedTradeDatas, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter tagAttributeValuesRefs(
      ComposableFilter Function($$TagAttributeValuesTableFilterComposer f) f) {
    final $$TagAttributeValuesTableFilterComposer composer = $state
        .composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.tagAttributeValues,
            getReferencedColumn: (t) => t.tagId,
            builder: (joinBuilder, parentComposers) =>
                $$TagAttributeValuesTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.tagAttributeValues,
                    joinBuilder,
                    parentComposers)));
    return f(composer);
  }
}

class $$TagsTableOrderingComposer
    extends OrderingComposer<_$MyDatabase, $TagsTable> {
  $$TagsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get tagName => $state.composableBuilder(
      column: $state.table.tagName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get useCount => $state.composableBuilder(
      column: $state.table.useCount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get genre => $state.composableBuilder(
      column: $state.table.genre,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$TaggedTradeDatasTableInsertCompanionBuilder
    = TaggedTradeDatasCompanion Function({
  required int tradeDataId,
  required int tagId,
  Value<int> rowid,
});
typedef $$TaggedTradeDatasTableUpdateCompanionBuilder
    = TaggedTradeDatasCompanion Function({
  Value<int> tradeDataId,
  Value<int> tagId,
  Value<int> rowid,
});

class $$TaggedTradeDatasTableTableManager extends RootTableManager<
    _$MyDatabase,
    $TaggedTradeDatasTable,
    TaggedTradeData,
    $$TaggedTradeDatasTableFilterComposer,
    $$TaggedTradeDatasTableOrderingComposer,
    $$TaggedTradeDatasTableProcessedTableManager,
    $$TaggedTradeDatasTableInsertCompanionBuilder,
    $$TaggedTradeDatasTableUpdateCompanionBuilder> {
  $$TaggedTradeDatasTableTableManager(
      _$MyDatabase db, $TaggedTradeDatasTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TaggedTradeDatasTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TaggedTradeDatasTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$TaggedTradeDatasTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> tradeDataId = const Value.absent(),
            Value<int> tagId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TaggedTradeDatasCompanion(
            tradeDataId: tradeDataId,
            tagId: tagId,
            rowid: rowid,
          ),
          getInsertCompanionBuilder: ({
            required int tradeDataId,
            required int tagId,
            Value<int> rowid = const Value.absent(),
          }) =>
              TaggedTradeDatasCompanion.insert(
            tradeDataId: tradeDataId,
            tagId: tagId,
            rowid: rowid,
          ),
        ));
}

class $$TaggedTradeDatasTableProcessedTableManager
    extends ProcessedTableManager<
        _$MyDatabase,
        $TaggedTradeDatasTable,
        TaggedTradeData,
        $$TaggedTradeDatasTableFilterComposer,
        $$TaggedTradeDatasTableOrderingComposer,
        $$TaggedTradeDatasTableProcessedTableManager,
        $$TaggedTradeDatasTableInsertCompanionBuilder,
        $$TaggedTradeDatasTableUpdateCompanionBuilder> {
  $$TaggedTradeDatasTableProcessedTableManager(super.$state);
}

class $$TaggedTradeDatasTableFilterComposer
    extends FilterComposer<_$MyDatabase, $TaggedTradeDatasTable> {
  $$TaggedTradeDatasTableFilterComposer(super.$state);
  $$TradeDatasTableFilterComposer get tradeDataId {
    final $$TradeDatasTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tradeDataId,
        referencedTable: $state.db.tradeDatas,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$TradeDatasTableFilterComposer(ComposerState($state.db,
                $state.db.tradeDatas, joinBuilder, parentComposers)));
    return composer;
  }

  $$TagsTableFilterComposer get tagId {
    final $$TagsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tagId,
        referencedTable: $state.db.tags,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$TagsTableFilterComposer(
            ComposerState(
                $state.db, $state.db.tags, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$TaggedTradeDatasTableOrderingComposer
    extends OrderingComposer<_$MyDatabase, $TaggedTradeDatasTable> {
  $$TaggedTradeDatasTableOrderingComposer(super.$state);
  $$TradeDatasTableOrderingComposer get tradeDataId {
    final $$TradeDatasTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tradeDataId,
        referencedTable: $state.db.tradeDatas,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$TradeDatasTableOrderingComposer(ComposerState($state.db,
                $state.db.tradeDatas, joinBuilder, parentComposers)));
    return composer;
  }

  $$TagsTableOrderingComposer get tagId {
    final $$TagsTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tagId,
        referencedTable: $state.db.tags,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$TagsTableOrderingComposer(
            ComposerState(
                $state.db, $state.db.tags, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$TagAttributesTableInsertCompanionBuilder = TagAttributesCompanion
    Function({
  Value<int> id,
  required String name,
  required String dataType,
});
typedef $$TagAttributesTableUpdateCompanionBuilder = TagAttributesCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<String> dataType,
});

class $$TagAttributesTableTableManager extends RootTableManager<
    _$MyDatabase,
    $TagAttributesTable,
    TagAttribute,
    $$TagAttributesTableFilterComposer,
    $$TagAttributesTableOrderingComposer,
    $$TagAttributesTableProcessedTableManager,
    $$TagAttributesTableInsertCompanionBuilder,
    $$TagAttributesTableUpdateCompanionBuilder> {
  $$TagAttributesTableTableManager(_$MyDatabase db, $TagAttributesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TagAttributesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TagAttributesTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$TagAttributesTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> dataType = const Value.absent(),
          }) =>
              TagAttributesCompanion(
            id: id,
            name: name,
            dataType: dataType,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String dataType,
          }) =>
              TagAttributesCompanion.insert(
            id: id,
            name: name,
            dataType: dataType,
          ),
        ));
}

class $$TagAttributesTableProcessedTableManager extends ProcessedTableManager<
    _$MyDatabase,
    $TagAttributesTable,
    TagAttribute,
    $$TagAttributesTableFilterComposer,
    $$TagAttributesTableOrderingComposer,
    $$TagAttributesTableProcessedTableManager,
    $$TagAttributesTableInsertCompanionBuilder,
    $$TagAttributesTableUpdateCompanionBuilder> {
  $$TagAttributesTableProcessedTableManager(super.$state);
}

class $$TagAttributesTableFilterComposer
    extends FilterComposer<_$MyDatabase, $TagAttributesTable> {
  $$TagAttributesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get dataType => $state.composableBuilder(
      column: $state.table.dataType,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter tagAttributeValuesRefs(
      ComposableFilter Function($$TagAttributeValuesTableFilterComposer f) f) {
    final $$TagAttributeValuesTableFilterComposer composer = $state
        .composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.tagAttributeValues,
            getReferencedColumn: (t) => t.attributeId,
            builder: (joinBuilder, parentComposers) =>
                $$TagAttributeValuesTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.tagAttributeValues,
                    joinBuilder,
                    parentComposers)));
    return f(composer);
  }
}

class $$TagAttributesTableOrderingComposer
    extends OrderingComposer<_$MyDatabase, $TagAttributesTable> {
  $$TagAttributesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get dataType => $state.composableBuilder(
      column: $state.table.dataType,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$TagAttributeValuesTableInsertCompanionBuilder
    = TagAttributeValuesCompanion Function({
  required int tagId,
  required int attributeId,
  required String value,
  Value<int> rowid,
});
typedef $$TagAttributeValuesTableUpdateCompanionBuilder
    = TagAttributeValuesCompanion Function({
  Value<int> tagId,
  Value<int> attributeId,
  Value<String> value,
  Value<int> rowid,
});

class $$TagAttributeValuesTableTableManager extends RootTableManager<
    _$MyDatabase,
    $TagAttributeValuesTable,
    TagAttributeValue,
    $$TagAttributeValuesTableFilterComposer,
    $$TagAttributeValuesTableOrderingComposer,
    $$TagAttributeValuesTableProcessedTableManager,
    $$TagAttributeValuesTableInsertCompanionBuilder,
    $$TagAttributeValuesTableUpdateCompanionBuilder> {
  $$TagAttributeValuesTableTableManager(
      _$MyDatabase db, $TagAttributeValuesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TagAttributeValuesTableFilterComposer(ComposerState(db, table)),
          orderingComposer: $$TagAttributeValuesTableOrderingComposer(
              ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$TagAttributeValuesTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> tagId = const Value.absent(),
            Value<int> attributeId = const Value.absent(),
            Value<String> value = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TagAttributeValuesCompanion(
            tagId: tagId,
            attributeId: attributeId,
            value: value,
            rowid: rowid,
          ),
          getInsertCompanionBuilder: ({
            required int tagId,
            required int attributeId,
            required String value,
            Value<int> rowid = const Value.absent(),
          }) =>
              TagAttributeValuesCompanion.insert(
            tagId: tagId,
            attributeId: attributeId,
            value: value,
            rowid: rowid,
          ),
        ));
}

class $$TagAttributeValuesTableProcessedTableManager
    extends ProcessedTableManager<
        _$MyDatabase,
        $TagAttributeValuesTable,
        TagAttributeValue,
        $$TagAttributeValuesTableFilterComposer,
        $$TagAttributeValuesTableOrderingComposer,
        $$TagAttributeValuesTableProcessedTableManager,
        $$TagAttributeValuesTableInsertCompanionBuilder,
        $$TagAttributeValuesTableUpdateCompanionBuilder> {
  $$TagAttributeValuesTableProcessedTableManager(super.$state);
}

class $$TagAttributeValuesTableFilterComposer
    extends FilterComposer<_$MyDatabase, $TagAttributeValuesTable> {
  $$TagAttributeValuesTableFilterComposer(super.$state);
  ColumnFilters<String> get value => $state.composableBuilder(
      column: $state.table.value,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$TagsTableFilterComposer get tagId {
    final $$TagsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tagId,
        referencedTable: $state.db.tags,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$TagsTableFilterComposer(
            ComposerState(
                $state.db, $state.db.tags, joinBuilder, parentComposers)));
    return composer;
  }

  $$TagAttributesTableFilterComposer get attributeId {
    final $$TagAttributesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.attributeId,
        referencedTable: $state.db.tagAttributes,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$TagAttributesTableFilterComposer(ComposerState($state.db,
                $state.db.tagAttributes, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$TagAttributeValuesTableOrderingComposer
    extends OrderingComposer<_$MyDatabase, $TagAttributeValuesTable> {
  $$TagAttributeValuesTableOrderingComposer(super.$state);
  ColumnOrderings<String> get value => $state.composableBuilder(
      column: $state.table.value,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$TagsTableOrderingComposer get tagId {
    final $$TagsTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tagId,
        referencedTable: $state.db.tags,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$TagsTableOrderingComposer(
            ComposerState(
                $state.db, $state.db.tags, joinBuilder, parentComposers)));
    return composer;
  }

  $$TagAttributesTableOrderingComposer get attributeId {
    final $$TagAttributesTableOrderingComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.attributeId,
            referencedTable: $state.db.tagAttributes,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$TagAttributesTableOrderingComposer(ComposerState($state.db,
                    $state.db.tagAttributes, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$SettingsTableInsertCompanionBuilder = SettingsCompanion Function({
  Value<int> id,
  Value<int?> themeMode,
  Value<String> databaseName,
  Value<int> rowid,
});
typedef $$SettingsTableUpdateCompanionBuilder = SettingsCompanion Function({
  Value<int> id,
  Value<int?> themeMode,
  Value<String> databaseName,
  Value<int> rowid,
});

class $$SettingsTableTableManager extends RootTableManager<
    _$MyDatabase,
    $SettingsTable,
    Setting,
    $$SettingsTableFilterComposer,
    $$SettingsTableOrderingComposer,
    $$SettingsTableProcessedTableManager,
    $$SettingsTableInsertCompanionBuilder,
    $$SettingsTableUpdateCompanionBuilder> {
  $$SettingsTableTableManager(_$MyDatabase db, $SettingsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$SettingsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$SettingsTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$SettingsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int?> themeMode = const Value.absent(),
            Value<String> databaseName = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SettingsCompanion(
            id: id,
            themeMode: themeMode,
            databaseName: databaseName,
            rowid: rowid,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int?> themeMode = const Value.absent(),
            Value<String> databaseName = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SettingsCompanion.insert(
            id: id,
            themeMode: themeMode,
            databaseName: databaseName,
            rowid: rowid,
          ),
        ));
}

class $$SettingsTableProcessedTableManager extends ProcessedTableManager<
    _$MyDatabase,
    $SettingsTable,
    Setting,
    $$SettingsTableFilterComposer,
    $$SettingsTableOrderingComposer,
    $$SettingsTableProcessedTableManager,
    $$SettingsTableInsertCompanionBuilder,
    $$SettingsTableUpdateCompanionBuilder> {
  $$SettingsTableProcessedTableManager(super.$state);
}

class $$SettingsTableFilterComposer
    extends FilterComposer<_$MyDatabase, $SettingsTable> {
  $$SettingsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get themeMode => $state.composableBuilder(
      column: $state.table.themeMode,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get databaseName => $state.composableBuilder(
      column: $state.table.databaseName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$SettingsTableOrderingComposer
    extends OrderingComposer<_$MyDatabase, $SettingsTable> {
  $$SettingsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get themeMode => $state.composableBuilder(
      column: $state.table.themeMode,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get databaseName => $state.composableBuilder(
      column: $state.table.databaseName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$MyDatabaseManager {
  final _$MyDatabase _db;
  _$MyDatabaseManager(this._db);
  $$TradeDatasTableTableManager get tradeDatas =>
      $$TradeDatasTableTableManager(_db, _db.tradeDatas);
  $$TagsTableTableManager get tags => $$TagsTableTableManager(_db, _db.tags);
  $$TaggedTradeDatasTableTableManager get taggedTradeDatas =>
      $$TaggedTradeDatasTableTableManager(_db, _db.taggedTradeDatas);
  $$TagAttributesTableTableManager get tagAttributes =>
      $$TagAttributesTableTableManager(_db, _db.tagAttributes);
  $$TagAttributeValuesTableTableManager get tagAttributeValues =>
      $$TagAttributeValuesTableTableManager(_db, _db.tagAttributeValues);
  $$SettingsTableTableManager get settings =>
      $$SettingsTableTableManager(_db, _db.settings);
}
