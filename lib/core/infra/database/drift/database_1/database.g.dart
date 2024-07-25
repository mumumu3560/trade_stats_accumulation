// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $DriftTradeDatasTable extends DriftTradeDatas
    with TableInfo<$DriftTradeDatasTable, DriftTradeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DriftTradeDatasTable(this.attachedDatabase, [this._alias]);
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
      'url_text', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
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
  static const VerificationMeta _entriedAtMeta =
      const VerificationMeta('entriedAt');
  @override
  late final GeneratedColumn<DateTime> entriedAt = GeneratedColumn<DateTime>(
      'entried_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _exitedAtMeta =
      const VerificationMeta('exitedAt');
  @override
  late final GeneratedColumn<DateTime> exitedAt = GeneratedColumn<DateTime>(
      'exited_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String> tags =
      GeneratedColumn<String>('tags', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<String>?>($DriftTradeDatasTable.$convertertagsn);
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
  static const VerificationMeta _entryPriceMeta =
      const VerificationMeta('entryPrice');
  @override
  late final GeneratedColumn<double> entryPrice = GeneratedColumn<double>(
      'entry_price', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _exitPriceMeta =
      const VerificationMeta('exitPrice');
  @override
  late final GeneratedColumn<double> exitPrice = GeneratedColumn<double>(
      'exit_price', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
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
        entriedAt,
        exitedAt,
        tags,
        imagePathBefore,
        imagePathAfter,
        entryPrice,
        exitPrice,
        startPrice,
        endPrice,
        startPriceResult,
        endPriceResult
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'drift_trade_datas';
  @override
  VerificationContext validateIntegrity(Insertable<DriftTradeData> instance,
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
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('entried_at')) {
      context.handle(_entriedAtMeta,
          entriedAt.isAcceptableOrUnknown(data['entried_at']!, _entriedAtMeta));
    }
    if (data.containsKey('exited_at')) {
      context.handle(_exitedAtMeta,
          exitedAt.isAcceptableOrUnknown(data['exited_at']!, _exitedAtMeta));
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
    if (data.containsKey('entry_price')) {
      context.handle(
          _entryPriceMeta,
          entryPrice.isAcceptableOrUnknown(
              data['entry_price']!, _entryPriceMeta));
    }
    if (data.containsKey('exit_price')) {
      context.handle(_exitPriceMeta,
          exitPrice.isAcceptableOrUnknown(data['exit_price']!, _exitPriceMeta));
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
  DriftTradeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DriftTradeData(
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
          .read(DriftSqlType.string, data['${effectivePrefix}url_text']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      entriedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}entried_at']),
      exitedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}exited_at']),
      tags: $DriftTradeDatasTable.$convertertagsn.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tags'])),
      imagePathBefore: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}image_path_before']),
      imagePathAfter: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}image_path_after']),
      entryPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}entry_price']),
      exitPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}exit_price']),
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
  $DriftTradeDatasTable createAlias(String alias) {
    return $DriftTradeDatasTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $convertertags =
      const TagListConverter();
  static TypeConverter<List<String>?, String?> $convertertagsn =
      NullAwareTypeConverter.wrap($convertertags);
}

class DriftTradeData extends DataClass implements Insertable<DriftTradeData> {
  final int id;
  final String? currencyPair;
  final String? title;
  final String? premise;
  final int? pips;
  final double? money;
  final double? lot;
  final bool isBuy;
  final String? urlText;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? entriedAt;
  final DateTime? exitedAt;
  final List<String>? tags;
  final String? imagePathBefore;
  final String? imagePathAfter;
  final double? entryPrice;
  final double? exitPrice;
  final double? startPrice;
  final double? endPrice;
  final double? startPriceResult;
  final double? endPriceResult;
  const DriftTradeData(
      {required this.id,
      this.currencyPair,
      this.title,
      this.premise,
      this.pips,
      this.money,
      this.lot,
      required this.isBuy,
      this.urlText,
      required this.createdAt,
      required this.updatedAt,
      this.entriedAt,
      this.exitedAt,
      this.tags,
      this.imagePathBefore,
      this.imagePathAfter,
      this.entryPrice,
      this.exitPrice,
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
    if (!nullToAbsent || urlText != null) {
      map['url_text'] = Variable<String>(urlText);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || entriedAt != null) {
      map['entried_at'] = Variable<DateTime>(entriedAt);
    }
    if (!nullToAbsent || exitedAt != null) {
      map['exited_at'] = Variable<DateTime>(exitedAt);
    }
    if (!nullToAbsent || tags != null) {
      map['tags'] =
          Variable<String>($DriftTradeDatasTable.$convertertagsn.toSql(tags));
    }
    if (!nullToAbsent || imagePathBefore != null) {
      map['image_path_before'] = Variable<String>(imagePathBefore);
    }
    if (!nullToAbsent || imagePathAfter != null) {
      map['image_path_after'] = Variable<String>(imagePathAfter);
    }
    if (!nullToAbsent || entryPrice != null) {
      map['entry_price'] = Variable<double>(entryPrice);
    }
    if (!nullToAbsent || exitPrice != null) {
      map['exit_price'] = Variable<double>(exitPrice);
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

  DriftTradeDatasCompanion toCompanion(bool nullToAbsent) {
    return DriftTradeDatasCompanion(
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
      urlText: urlText == null && nullToAbsent
          ? const Value.absent()
          : Value(urlText),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      entriedAt: entriedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(entriedAt),
      exitedAt: exitedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(exitedAt),
      tags: tags == null && nullToAbsent ? const Value.absent() : Value(tags),
      imagePathBefore: imagePathBefore == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePathBefore),
      imagePathAfter: imagePathAfter == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePathAfter),
      entryPrice: entryPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(entryPrice),
      exitPrice: exitPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(exitPrice),
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

  factory DriftTradeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DriftTradeData(
      id: serializer.fromJson<int>(json['id']),
      currencyPair: serializer.fromJson<String?>(json['currencyPair']),
      title: serializer.fromJson<String?>(json['title']),
      premise: serializer.fromJson<String?>(json['premise']),
      pips: serializer.fromJson<int?>(json['pips']),
      money: serializer.fromJson<double?>(json['money']),
      lot: serializer.fromJson<double?>(json['lot']),
      isBuy: serializer.fromJson<bool>(json['isBuy']),
      urlText: serializer.fromJson<String?>(json['urlText']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      entriedAt: serializer.fromJson<DateTime?>(json['entriedAt']),
      exitedAt: serializer.fromJson<DateTime?>(json['exitedAt']),
      tags: serializer.fromJson<List<String>?>(json['tags']),
      imagePathBefore: serializer.fromJson<String?>(json['imagePathBefore']),
      imagePathAfter: serializer.fromJson<String?>(json['imagePathAfter']),
      entryPrice: serializer.fromJson<double?>(json['entryPrice']),
      exitPrice: serializer.fromJson<double?>(json['exitPrice']),
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
      'urlText': serializer.toJson<String?>(urlText),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'entriedAt': serializer.toJson<DateTime?>(entriedAt),
      'exitedAt': serializer.toJson<DateTime?>(exitedAt),
      'tags': serializer.toJson<List<String>?>(tags),
      'imagePathBefore': serializer.toJson<String?>(imagePathBefore),
      'imagePathAfter': serializer.toJson<String?>(imagePathAfter),
      'entryPrice': serializer.toJson<double?>(entryPrice),
      'exitPrice': serializer.toJson<double?>(exitPrice),
      'startPrice': serializer.toJson<double?>(startPrice),
      'endPrice': serializer.toJson<double?>(endPrice),
      'startPriceResult': serializer.toJson<double?>(startPriceResult),
      'endPriceResult': serializer.toJson<double?>(endPriceResult),
    };
  }

  DriftTradeData copyWith(
          {int? id,
          Value<String?> currencyPair = const Value.absent(),
          Value<String?> title = const Value.absent(),
          Value<String?> premise = const Value.absent(),
          Value<int?> pips = const Value.absent(),
          Value<double?> money = const Value.absent(),
          Value<double?> lot = const Value.absent(),
          bool? isBuy,
          Value<String?> urlText = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> entriedAt = const Value.absent(),
          Value<DateTime?> exitedAt = const Value.absent(),
          Value<List<String>?> tags = const Value.absent(),
          Value<String?> imagePathBefore = const Value.absent(),
          Value<String?> imagePathAfter = const Value.absent(),
          Value<double?> entryPrice = const Value.absent(),
          Value<double?> exitPrice = const Value.absent(),
          Value<double?> startPrice = const Value.absent(),
          Value<double?> endPrice = const Value.absent(),
          Value<double?> startPriceResult = const Value.absent(),
          Value<double?> endPriceResult = const Value.absent()}) =>
      DriftTradeData(
        id: id ?? this.id,
        currencyPair:
            currencyPair.present ? currencyPair.value : this.currencyPair,
        title: title.present ? title.value : this.title,
        premise: premise.present ? premise.value : this.premise,
        pips: pips.present ? pips.value : this.pips,
        money: money.present ? money.value : this.money,
        lot: lot.present ? lot.value : this.lot,
        isBuy: isBuy ?? this.isBuy,
        urlText: urlText.present ? urlText.value : this.urlText,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        entriedAt: entriedAt.present ? entriedAt.value : this.entriedAt,
        exitedAt: exitedAt.present ? exitedAt.value : this.exitedAt,
        tags: tags.present ? tags.value : this.tags,
        imagePathBefore: imagePathBefore.present
            ? imagePathBefore.value
            : this.imagePathBefore,
        imagePathAfter:
            imagePathAfter.present ? imagePathAfter.value : this.imagePathAfter,
        entryPrice: entryPrice.present ? entryPrice.value : this.entryPrice,
        exitPrice: exitPrice.present ? exitPrice.value : this.exitPrice,
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
    return (StringBuffer('DriftTradeData(')
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
          ..write('entriedAt: $entriedAt, ')
          ..write('exitedAt: $exitedAt, ')
          ..write('tags: $tags, ')
          ..write('imagePathBefore: $imagePathBefore, ')
          ..write('imagePathAfter: $imagePathAfter, ')
          ..write('entryPrice: $entryPrice, ')
          ..write('exitPrice: $exitPrice, ')
          ..write('startPrice: $startPrice, ')
          ..write('endPrice: $endPrice, ')
          ..write('startPriceResult: $startPriceResult, ')
          ..write('endPriceResult: $endPriceResult')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
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
        entriedAt,
        exitedAt,
        tags,
        imagePathBefore,
        imagePathAfter,
        entryPrice,
        exitPrice,
        startPrice,
        endPrice,
        startPriceResult,
        endPriceResult
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DriftTradeData &&
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
          other.entriedAt == this.entriedAt &&
          other.exitedAt == this.exitedAt &&
          other.tags == this.tags &&
          other.imagePathBefore == this.imagePathBefore &&
          other.imagePathAfter == this.imagePathAfter &&
          other.entryPrice == this.entryPrice &&
          other.exitPrice == this.exitPrice &&
          other.startPrice == this.startPrice &&
          other.endPrice == this.endPrice &&
          other.startPriceResult == this.startPriceResult &&
          other.endPriceResult == this.endPriceResult);
}

class DriftTradeDatasCompanion extends UpdateCompanion<DriftTradeData> {
  final Value<int> id;
  final Value<String?> currencyPair;
  final Value<String?> title;
  final Value<String?> premise;
  final Value<int?> pips;
  final Value<double?> money;
  final Value<double?> lot;
  final Value<bool> isBuy;
  final Value<String?> urlText;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> entriedAt;
  final Value<DateTime?> exitedAt;
  final Value<List<String>?> tags;
  final Value<String?> imagePathBefore;
  final Value<String?> imagePathAfter;
  final Value<double?> entryPrice;
  final Value<double?> exitPrice;
  final Value<double?> startPrice;
  final Value<double?> endPrice;
  final Value<double?> startPriceResult;
  final Value<double?> endPriceResult;
  const DriftTradeDatasCompanion({
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
    this.entriedAt = const Value.absent(),
    this.exitedAt = const Value.absent(),
    this.tags = const Value.absent(),
    this.imagePathBefore = const Value.absent(),
    this.imagePathAfter = const Value.absent(),
    this.entryPrice = const Value.absent(),
    this.exitPrice = const Value.absent(),
    this.startPrice = const Value.absent(),
    this.endPrice = const Value.absent(),
    this.startPriceResult = const Value.absent(),
    this.endPriceResult = const Value.absent(),
  });
  DriftTradeDatasCompanion.insert({
    this.id = const Value.absent(),
    this.currencyPair = const Value.absent(),
    this.title = const Value.absent(),
    this.premise = const Value.absent(),
    this.pips = const Value.absent(),
    this.money = const Value.absent(),
    this.lot = const Value.absent(),
    required bool isBuy,
    this.urlText = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.entriedAt = const Value.absent(),
    this.exitedAt = const Value.absent(),
    this.tags = const Value.absent(),
    this.imagePathBefore = const Value.absent(),
    this.imagePathAfter = const Value.absent(),
    this.entryPrice = const Value.absent(),
    this.exitPrice = const Value.absent(),
    this.startPrice = const Value.absent(),
    this.endPrice = const Value.absent(),
    this.startPriceResult = const Value.absent(),
    this.endPriceResult = const Value.absent(),
  }) : isBuy = Value(isBuy);
  static Insertable<DriftTradeData> custom({
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
    Expression<DateTime>? entriedAt,
    Expression<DateTime>? exitedAt,
    Expression<String>? tags,
    Expression<String>? imagePathBefore,
    Expression<String>? imagePathAfter,
    Expression<double>? entryPrice,
    Expression<double>? exitPrice,
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
      if (entriedAt != null) 'entried_at': entriedAt,
      if (exitedAt != null) 'exited_at': exitedAt,
      if (tags != null) 'tags': tags,
      if (imagePathBefore != null) 'image_path_before': imagePathBefore,
      if (imagePathAfter != null) 'image_path_after': imagePathAfter,
      if (entryPrice != null) 'entry_price': entryPrice,
      if (exitPrice != null) 'exit_price': exitPrice,
      if (startPrice != null) 'start_price': startPrice,
      if (endPrice != null) 'end_price': endPrice,
      if (startPriceResult != null) 'start_price_result': startPriceResult,
      if (endPriceResult != null) 'end_price_result': endPriceResult,
    });
  }

  DriftTradeDatasCompanion copyWith(
      {Value<int>? id,
      Value<String?>? currencyPair,
      Value<String?>? title,
      Value<String?>? premise,
      Value<int?>? pips,
      Value<double?>? money,
      Value<double?>? lot,
      Value<bool>? isBuy,
      Value<String?>? urlText,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? entriedAt,
      Value<DateTime?>? exitedAt,
      Value<List<String>?>? tags,
      Value<String?>? imagePathBefore,
      Value<String?>? imagePathAfter,
      Value<double?>? entryPrice,
      Value<double?>? exitPrice,
      Value<double?>? startPrice,
      Value<double?>? endPrice,
      Value<double?>? startPriceResult,
      Value<double?>? endPriceResult}) {
    return DriftTradeDatasCompanion(
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
      entriedAt: entriedAt ?? this.entriedAt,
      exitedAt: exitedAt ?? this.exitedAt,
      tags: tags ?? this.tags,
      imagePathBefore: imagePathBefore ?? this.imagePathBefore,
      imagePathAfter: imagePathAfter ?? this.imagePathAfter,
      entryPrice: entryPrice ?? this.entryPrice,
      exitPrice: exitPrice ?? this.exitPrice,
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
    if (entriedAt.present) {
      map['entried_at'] = Variable<DateTime>(entriedAt.value);
    }
    if (exitedAt.present) {
      map['exited_at'] = Variable<DateTime>(exitedAt.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(
          $DriftTradeDatasTable.$convertertagsn.toSql(tags.value));
    }
    if (imagePathBefore.present) {
      map['image_path_before'] = Variable<String>(imagePathBefore.value);
    }
    if (imagePathAfter.present) {
      map['image_path_after'] = Variable<String>(imagePathAfter.value);
    }
    if (entryPrice.present) {
      map['entry_price'] = Variable<double>(entryPrice.value);
    }
    if (exitPrice.present) {
      map['exit_price'] = Variable<double>(exitPrice.value);
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
    return (StringBuffer('DriftTradeDatasCompanion(')
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
          ..write('entriedAt: $entriedAt, ')
          ..write('exitedAt: $exitedAt, ')
          ..write('tags: $tags, ')
          ..write('imagePathBefore: $imagePathBefore, ')
          ..write('imagePathAfter: $imagePathAfter, ')
          ..write('entryPrice: $entryPrice, ')
          ..write('exitPrice: $exitPrice, ')
          ..write('startPrice: $startPrice, ')
          ..write('endPrice: $endPrice, ')
          ..write('startPriceResult: $startPriceResult, ')
          ..write('endPriceResult: $endPriceResult')
          ..write(')'))
        .toString();
  }
}

class $DriftTradeTagsTable extends DriftTradeTags
    with TableInfo<$DriftTradeTagsTable, DriftTradeTag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DriftTradeTagsTable(this.attachedDatabase, [this._alias]);
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
  static const String $name = 'drift_trade_tags';
  @override
  VerificationContext validateIntegrity(Insertable<DriftTradeTag> instance,
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
  DriftTradeTag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DriftTradeTag(
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
  $DriftTradeTagsTable createAlias(String alias) {
    return $DriftTradeTagsTable(attachedDatabase, alias);
  }
}

class DriftTradeTag extends DataClass implements Insertable<DriftTradeTag> {
  final int id;
  final String tagName;
  final DateTime createdAt;
  final int useCount;
  final String genre;
  const DriftTradeTag(
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

  DriftTradeTagsCompanion toCompanion(bool nullToAbsent) {
    return DriftTradeTagsCompanion(
      id: Value(id),
      tagName: Value(tagName),
      createdAt: Value(createdAt),
      useCount: Value(useCount),
      genre: Value(genre),
    );
  }

  factory DriftTradeTag.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DriftTradeTag(
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

  DriftTradeTag copyWith(
          {int? id,
          String? tagName,
          DateTime? createdAt,
          int? useCount,
          String? genre}) =>
      DriftTradeTag(
        id: id ?? this.id,
        tagName: tagName ?? this.tagName,
        createdAt: createdAt ?? this.createdAt,
        useCount: useCount ?? this.useCount,
        genre: genre ?? this.genre,
      );
  @override
  String toString() {
    return (StringBuffer('DriftTradeTag(')
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
      (other is DriftTradeTag &&
          other.id == this.id &&
          other.tagName == this.tagName &&
          other.createdAt == this.createdAt &&
          other.useCount == this.useCount &&
          other.genre == this.genre);
}

class DriftTradeTagsCompanion extends UpdateCompanion<DriftTradeTag> {
  final Value<int> id;
  final Value<String> tagName;
  final Value<DateTime> createdAt;
  final Value<int> useCount;
  final Value<String> genre;
  const DriftTradeTagsCompanion({
    this.id = const Value.absent(),
    this.tagName = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.useCount = const Value.absent(),
    this.genre = const Value.absent(),
  });
  DriftTradeTagsCompanion.insert({
    this.id = const Value.absent(),
    required String tagName,
    this.createdAt = const Value.absent(),
    this.useCount = const Value.absent(),
    this.genre = const Value.absent(),
  }) : tagName = Value(tagName);
  static Insertable<DriftTradeTag> custom({
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

  DriftTradeTagsCompanion copyWith(
      {Value<int>? id,
      Value<String>? tagName,
      Value<DateTime>? createdAt,
      Value<int>? useCount,
      Value<String>? genre}) {
    return DriftTradeTagsCompanion(
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
    return (StringBuffer('DriftTradeTagsCompanion(')
          ..write('id: $id, ')
          ..write('tagName: $tagName, ')
          ..write('createdAt: $createdAt, ')
          ..write('useCount: $useCount, ')
          ..write('genre: $genre')
          ..write(')'))
        .toString();
  }
}

class $DriftTaggedTradeDatasTable extends DriftTaggedTradeDatas
    with TableInfo<$DriftTaggedTradeDatasTable, DriftTaggedTradeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DriftTaggedTradeDatasTable(this.attachedDatabase, [this._alias]);
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
  static const String $name = 'drift_tagged_trade_datas';
  @override
  VerificationContext validateIntegrity(
      Insertable<DriftTaggedTradeData> instance,
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
  DriftTaggedTradeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DriftTaggedTradeData(
      tradeDataId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}trade_data_id'])!,
      tagId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}tag_id'])!,
    );
  }

  @override
  $DriftTaggedTradeDatasTable createAlias(String alias) {
    return $DriftTaggedTradeDatasTable(attachedDatabase, alias);
  }
}

class DriftTaggedTradeData extends DataClass
    implements Insertable<DriftTaggedTradeData> {
  final int tradeDataId;
  final int tagId;
  const DriftTaggedTradeData({required this.tradeDataId, required this.tagId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['trade_data_id'] = Variable<int>(tradeDataId);
    map['tag_id'] = Variable<int>(tagId);
    return map;
  }

  DriftTaggedTradeDatasCompanion toCompanion(bool nullToAbsent) {
    return DriftTaggedTradeDatasCompanion(
      tradeDataId: Value(tradeDataId),
      tagId: Value(tagId),
    );
  }

  factory DriftTaggedTradeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DriftTaggedTradeData(
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

  DriftTaggedTradeData copyWith({int? tradeDataId, int? tagId}) =>
      DriftTaggedTradeData(
        tradeDataId: tradeDataId ?? this.tradeDataId,
        tagId: tagId ?? this.tagId,
      );
  @override
  String toString() {
    return (StringBuffer('DriftTaggedTradeData(')
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
      (other is DriftTaggedTradeData &&
          other.tradeDataId == this.tradeDataId &&
          other.tagId == this.tagId);
}

class DriftTaggedTradeDatasCompanion
    extends UpdateCompanion<DriftTaggedTradeData> {
  final Value<int> tradeDataId;
  final Value<int> tagId;
  final Value<int> rowid;
  const DriftTaggedTradeDatasCompanion({
    this.tradeDataId = const Value.absent(),
    this.tagId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DriftTaggedTradeDatasCompanion.insert({
    required int tradeDataId,
    required int tagId,
    this.rowid = const Value.absent(),
  })  : tradeDataId = Value(tradeDataId),
        tagId = Value(tagId);
  static Insertable<DriftTaggedTradeData> custom({
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

  DriftTaggedTradeDatasCompanion copyWith(
      {Value<int>? tradeDataId, Value<int>? tagId, Value<int>? rowid}) {
    return DriftTaggedTradeDatasCompanion(
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
    return (StringBuffer('DriftTaggedTradeDatasCompanion(')
          ..write('tradeDataId: $tradeDataId, ')
          ..write('tagId: $tagId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DriftTagAttributesTable extends DriftTagAttributes
    with TableInfo<$DriftTagAttributesTable, DriftTagAttribute> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DriftTagAttributesTable(this.attachedDatabase, [this._alias]);
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
  static const String $name = 'drift_tag_attributes';
  @override
  VerificationContext validateIntegrity(Insertable<DriftTagAttribute> instance,
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
  DriftTagAttribute map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DriftTagAttribute(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      dataType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data_type'])!,
    );
  }

  @override
  $DriftTagAttributesTable createAlias(String alias) {
    return $DriftTagAttributesTable(attachedDatabase, alias);
  }
}

class DriftTagAttribute extends DataClass
    implements Insertable<DriftTagAttribute> {
  final int id;
  final String name;
  final String dataType;
  const DriftTagAttribute(
      {required this.id, required this.name, required this.dataType});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['data_type'] = Variable<String>(dataType);
    return map;
  }

  DriftTagAttributesCompanion toCompanion(bool nullToAbsent) {
    return DriftTagAttributesCompanion(
      id: Value(id),
      name: Value(name),
      dataType: Value(dataType),
    );
  }

  factory DriftTagAttribute.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DriftTagAttribute(
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

  DriftTagAttribute copyWith({int? id, String? name, String? dataType}) =>
      DriftTagAttribute(
        id: id ?? this.id,
        name: name ?? this.name,
        dataType: dataType ?? this.dataType,
      );
  @override
  String toString() {
    return (StringBuffer('DriftTagAttribute(')
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
      (other is DriftTagAttribute &&
          other.id == this.id &&
          other.name == this.name &&
          other.dataType == this.dataType);
}

class DriftTagAttributesCompanion extends UpdateCompanion<DriftTagAttribute> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> dataType;
  const DriftTagAttributesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.dataType = const Value.absent(),
  });
  DriftTagAttributesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String dataType,
  })  : name = Value(name),
        dataType = Value(dataType);
  static Insertable<DriftTagAttribute> custom({
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

  DriftTagAttributesCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<String>? dataType}) {
    return DriftTagAttributesCompanion(
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
    return (StringBuffer('DriftTagAttributesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('dataType: $dataType')
          ..write(')'))
        .toString();
  }
}

class $DriftTagAttributeValuesTable extends DriftTagAttributeValues
    with TableInfo<$DriftTagAttributeValuesTable, DriftTagAttributeValue> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DriftTagAttributeValuesTable(this.attachedDatabase, [this._alias]);
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
  static const String $name = 'drift_tag_attribute_values';
  @override
  VerificationContext validateIntegrity(
      Insertable<DriftTagAttributeValue> instance,
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
  DriftTagAttributeValue map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DriftTagAttributeValue(
      tagId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}tag_id'])!,
      attributeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}attribute_id'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value'])!,
    );
  }

  @override
  $DriftTagAttributeValuesTable createAlias(String alias) {
    return $DriftTagAttributeValuesTable(attachedDatabase, alias);
  }
}

class DriftTagAttributeValue extends DataClass
    implements Insertable<DriftTagAttributeValue> {
  final int tagId;
  final int attributeId;
  final String value;
  const DriftTagAttributeValue(
      {required this.tagId, required this.attributeId, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['tag_id'] = Variable<int>(tagId);
    map['attribute_id'] = Variable<int>(attributeId);
    map['value'] = Variable<String>(value);
    return map;
  }

  DriftTagAttributeValuesCompanion toCompanion(bool nullToAbsent) {
    return DriftTagAttributeValuesCompanion(
      tagId: Value(tagId),
      attributeId: Value(attributeId),
      value: Value(value),
    );
  }

  factory DriftTagAttributeValue.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DriftTagAttributeValue(
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

  DriftTagAttributeValue copyWith(
          {int? tagId, int? attributeId, String? value}) =>
      DriftTagAttributeValue(
        tagId: tagId ?? this.tagId,
        attributeId: attributeId ?? this.attributeId,
        value: value ?? this.value,
      );
  @override
  String toString() {
    return (StringBuffer('DriftTagAttributeValue(')
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
      (other is DriftTagAttributeValue &&
          other.tagId == this.tagId &&
          other.attributeId == this.attributeId &&
          other.value == this.value);
}

class DriftTagAttributeValuesCompanion
    extends UpdateCompanion<DriftTagAttributeValue> {
  final Value<int> tagId;
  final Value<int> attributeId;
  final Value<String> value;
  final Value<int> rowid;
  const DriftTagAttributeValuesCompanion({
    this.tagId = const Value.absent(),
    this.attributeId = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DriftTagAttributeValuesCompanion.insert({
    required int tagId,
    required int attributeId,
    required String value,
    this.rowid = const Value.absent(),
  })  : tagId = Value(tagId),
        attributeId = Value(attributeId),
        value = Value(value);
  static Insertable<DriftTagAttributeValue> custom({
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

  DriftTagAttributeValuesCompanion copyWith(
      {Value<int>? tagId,
      Value<int>? attributeId,
      Value<String>? value,
      Value<int>? rowid}) {
    return DriftTagAttributeValuesCompanion(
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
    return (StringBuffer('DriftTagAttributeValuesCompanion(')
          ..write('tagId: $tagId, ')
          ..write('attributeId: $attributeId, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DriftSettingsTable extends DriftSettings
    with TableInfo<$DriftSettingsTable, DriftSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DriftSettingsTable(this.attachedDatabase, [this._alias]);
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
  static const String $name = 'drift_settings';
  @override
  VerificationContext validateIntegrity(Insertable<DriftSetting> instance,
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
  DriftSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DriftSetting(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      themeMode: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}theme_mode']),
      databaseName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}database_name'])!,
    );
  }

  @override
  $DriftSettingsTable createAlias(String alias) {
    return $DriftSettingsTable(attachedDatabase, alias);
  }
}

class DriftSetting extends DataClass implements Insertable<DriftSetting> {
  final int id;
  final int? themeMode;
  final String databaseName;
  const DriftSetting(
      {required this.id, this.themeMode, required this.databaseName});
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

  DriftSettingsCompanion toCompanion(bool nullToAbsent) {
    return DriftSettingsCompanion(
      id: Value(id),
      themeMode: themeMode == null && nullToAbsent
          ? const Value.absent()
          : Value(themeMode),
      databaseName: Value(databaseName),
    );
  }

  factory DriftSetting.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DriftSetting(
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

  DriftSetting copyWith(
          {int? id,
          Value<int?> themeMode = const Value.absent(),
          String? databaseName}) =>
      DriftSetting(
        id: id ?? this.id,
        themeMode: themeMode.present ? themeMode.value : this.themeMode,
        databaseName: databaseName ?? this.databaseName,
      );
  @override
  String toString() {
    return (StringBuffer('DriftSetting(')
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
      (other is DriftSetting &&
          other.id == this.id &&
          other.themeMode == this.themeMode &&
          other.databaseName == this.databaseName);
}

class DriftSettingsCompanion extends UpdateCompanion<DriftSetting> {
  final Value<int> id;
  final Value<int?> themeMode;
  final Value<String> databaseName;
  final Value<int> rowid;
  const DriftSettingsCompanion({
    this.id = const Value.absent(),
    this.themeMode = const Value.absent(),
    this.databaseName = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DriftSettingsCompanion.insert({
    this.id = const Value.absent(),
    this.themeMode = const Value.absent(),
    this.databaseName = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  static Insertable<DriftSetting> custom({
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

  DriftSettingsCompanion copyWith(
      {Value<int>? id,
      Value<int?>? themeMode,
      Value<String>? databaseName,
      Value<int>? rowid}) {
    return DriftSettingsCompanion(
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
    return (StringBuffer('DriftSettingsCompanion(')
          ..write('id: $id, ')
          ..write('themeMode: $themeMode, ')
          ..write('databaseName: $databaseName, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DriftTradingAssetDatasTable extends DriftTradingAssetDatas
    with TableInfo<$DriftTradingAssetDatasTable, DriftTradingAssetData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DriftTradingAssetDatasTable(this.attachedDatabase, [this._alias]);
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
      'name', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, name, type];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'drift_trading_asset_datas';
  @override
  VerificationContext validateIntegrity(
      Insertable<DriftTradingAssetData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DriftTradingAssetData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DriftTradingAssetData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type']),
    );
  }

  @override
  $DriftTradingAssetDatasTable createAlias(String alias) {
    return $DriftTradingAssetDatasTable(attachedDatabase, alias);
  }
}

class DriftTradingAssetData extends DataClass
    implements Insertable<DriftTradingAssetData> {
  final int id;
  final String? name;
  final String? type;
  const DriftTradingAssetData({required this.id, this.name, this.type});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    return map;
  }

  DriftTradingAssetDatasCompanion toCompanion(bool nullToAbsent) {
    return DriftTradingAssetDatasCompanion(
      id: Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
    );
  }

  factory DriftTradingAssetData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DriftTradingAssetData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      type: serializer.fromJson<String?>(json['type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String?>(name),
      'type': serializer.toJson<String?>(type),
    };
  }

  DriftTradingAssetData copyWith(
          {int? id,
          Value<String?> name = const Value.absent(),
          Value<String?> type = const Value.absent()}) =>
      DriftTradingAssetData(
        id: id ?? this.id,
        name: name.present ? name.value : this.name,
        type: type.present ? type.value : this.type,
      );
  @override
  String toString() {
    return (StringBuffer('DriftTradingAssetData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DriftTradingAssetData &&
          other.id == this.id &&
          other.name == this.name &&
          other.type == this.type);
}

class DriftTradingAssetDatasCompanion
    extends UpdateCompanion<DriftTradingAssetData> {
  final Value<int> id;
  final Value<String?> name;
  final Value<String?> type;
  const DriftTradingAssetDatasCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
  });
  DriftTradingAssetDatasCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
  });
  static Insertable<DriftTradingAssetData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? type,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
    });
  }

  DriftTradingAssetDatasCompanion copyWith(
      {Value<int>? id, Value<String?>? name, Value<String?>? type}) {
    return DriftTradingAssetDatasCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
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
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DriftTradingAssetDatasCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  _$MyDatabaseManager get managers => _$MyDatabaseManager(this);
  late final $DriftTradeDatasTable driftTradeDatas =
      $DriftTradeDatasTable(this);
  late final $DriftTradeTagsTable driftTradeTags = $DriftTradeTagsTable(this);
  late final $DriftTaggedTradeDatasTable driftTaggedTradeDatas =
      $DriftTaggedTradeDatasTable(this);
  late final $DriftTagAttributesTable driftTagAttributes =
      $DriftTagAttributesTable(this);
  late final $DriftTagAttributeValuesTable driftTagAttributeValues =
      $DriftTagAttributeValuesTable(this);
  late final $DriftSettingsTable driftSettings = $DriftSettingsTable(this);
  late final $DriftTradingAssetDatasTable driftTradingAssetDatas =
      $DriftTradingAssetDatasTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        driftTradeDatas,
        driftTradeTags,
        driftTaggedTradeDatas,
        driftTagAttributes,
        driftTagAttributeValues,
        driftSettings,
        driftTradingAssetDatas
      ];
}

typedef $$DriftTradeDatasTableInsertCompanionBuilder = DriftTradeDatasCompanion
    Function({
  Value<int> id,
  Value<String?> currencyPair,
  Value<String?> title,
  Value<String?> premise,
  Value<int?> pips,
  Value<double?> money,
  Value<double?> lot,
  required bool isBuy,
  Value<String?> urlText,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> entriedAt,
  Value<DateTime?> exitedAt,
  Value<List<String>?> tags,
  Value<String?> imagePathBefore,
  Value<String?> imagePathAfter,
  Value<double?> entryPrice,
  Value<double?> exitPrice,
  Value<double?> startPrice,
  Value<double?> endPrice,
  Value<double?> startPriceResult,
  Value<double?> endPriceResult,
});
typedef $$DriftTradeDatasTableUpdateCompanionBuilder = DriftTradeDatasCompanion
    Function({
  Value<int> id,
  Value<String?> currencyPair,
  Value<String?> title,
  Value<String?> premise,
  Value<int?> pips,
  Value<double?> money,
  Value<double?> lot,
  Value<bool> isBuy,
  Value<String?> urlText,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> entriedAt,
  Value<DateTime?> exitedAt,
  Value<List<String>?> tags,
  Value<String?> imagePathBefore,
  Value<String?> imagePathAfter,
  Value<double?> entryPrice,
  Value<double?> exitPrice,
  Value<double?> startPrice,
  Value<double?> endPrice,
  Value<double?> startPriceResult,
  Value<double?> endPriceResult,
});

class $$DriftTradeDatasTableTableManager extends RootTableManager<
    _$MyDatabase,
    $DriftTradeDatasTable,
    DriftTradeData,
    $$DriftTradeDatasTableFilterComposer,
    $$DriftTradeDatasTableOrderingComposer,
    $$DriftTradeDatasTableProcessedTableManager,
    $$DriftTradeDatasTableInsertCompanionBuilder,
    $$DriftTradeDatasTableUpdateCompanionBuilder> {
  $$DriftTradeDatasTableTableManager(
      _$MyDatabase db, $DriftTradeDatasTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$DriftTradeDatasTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$DriftTradeDatasTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$DriftTradeDatasTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String?> currencyPair = const Value.absent(),
            Value<String?> title = const Value.absent(),
            Value<String?> premise = const Value.absent(),
            Value<int?> pips = const Value.absent(),
            Value<double?> money = const Value.absent(),
            Value<double?> lot = const Value.absent(),
            Value<bool> isBuy = const Value.absent(),
            Value<String?> urlText = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> entriedAt = const Value.absent(),
            Value<DateTime?> exitedAt = const Value.absent(),
            Value<List<String>?> tags = const Value.absent(),
            Value<String?> imagePathBefore = const Value.absent(),
            Value<String?> imagePathAfter = const Value.absent(),
            Value<double?> entryPrice = const Value.absent(),
            Value<double?> exitPrice = const Value.absent(),
            Value<double?> startPrice = const Value.absent(),
            Value<double?> endPrice = const Value.absent(),
            Value<double?> startPriceResult = const Value.absent(),
            Value<double?> endPriceResult = const Value.absent(),
          }) =>
              DriftTradeDatasCompanion(
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
            entriedAt: entriedAt,
            exitedAt: exitedAt,
            tags: tags,
            imagePathBefore: imagePathBefore,
            imagePathAfter: imagePathAfter,
            entryPrice: entryPrice,
            exitPrice: exitPrice,
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
            Value<String?> urlText = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> entriedAt = const Value.absent(),
            Value<DateTime?> exitedAt = const Value.absent(),
            Value<List<String>?> tags = const Value.absent(),
            Value<String?> imagePathBefore = const Value.absent(),
            Value<String?> imagePathAfter = const Value.absent(),
            Value<double?> entryPrice = const Value.absent(),
            Value<double?> exitPrice = const Value.absent(),
            Value<double?> startPrice = const Value.absent(),
            Value<double?> endPrice = const Value.absent(),
            Value<double?> startPriceResult = const Value.absent(),
            Value<double?> endPriceResult = const Value.absent(),
          }) =>
              DriftTradeDatasCompanion.insert(
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
            entriedAt: entriedAt,
            exitedAt: exitedAt,
            tags: tags,
            imagePathBefore: imagePathBefore,
            imagePathAfter: imagePathAfter,
            entryPrice: entryPrice,
            exitPrice: exitPrice,
            startPrice: startPrice,
            endPrice: endPrice,
            startPriceResult: startPriceResult,
            endPriceResult: endPriceResult,
          ),
        ));
}

class $$DriftTradeDatasTableProcessedTableManager extends ProcessedTableManager<
    _$MyDatabase,
    $DriftTradeDatasTable,
    DriftTradeData,
    $$DriftTradeDatasTableFilterComposer,
    $$DriftTradeDatasTableOrderingComposer,
    $$DriftTradeDatasTableProcessedTableManager,
    $$DriftTradeDatasTableInsertCompanionBuilder,
    $$DriftTradeDatasTableUpdateCompanionBuilder> {
  $$DriftTradeDatasTableProcessedTableManager(super.$state);
}

class $$DriftTradeDatasTableFilterComposer
    extends FilterComposer<_$MyDatabase, $DriftTradeDatasTable> {
  $$DriftTradeDatasTableFilterComposer(super.$state);
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

  ColumnFilters<DateTime> get entriedAt => $state.composableBuilder(
      column: $state.table.entriedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get exitedAt => $state.composableBuilder(
      column: $state.table.exitedAt,
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

  ColumnFilters<double> get entryPrice => $state.composableBuilder(
      column: $state.table.entryPrice,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get exitPrice => $state.composableBuilder(
      column: $state.table.exitPrice,
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
}

class $$DriftTradeDatasTableOrderingComposer
    extends OrderingComposer<_$MyDatabase, $DriftTradeDatasTable> {
  $$DriftTradeDatasTableOrderingComposer(super.$state);
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

  ColumnOrderings<DateTime> get entriedAt => $state.composableBuilder(
      column: $state.table.entriedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get exitedAt => $state.composableBuilder(
      column: $state.table.exitedAt,
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

  ColumnOrderings<double> get entryPrice => $state.composableBuilder(
      column: $state.table.entryPrice,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get exitPrice => $state.composableBuilder(
      column: $state.table.exitPrice,
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

typedef $$DriftTradeTagsTableInsertCompanionBuilder = DriftTradeTagsCompanion
    Function({
  Value<int> id,
  required String tagName,
  Value<DateTime> createdAt,
  Value<int> useCount,
  Value<String> genre,
});
typedef $$DriftTradeTagsTableUpdateCompanionBuilder = DriftTradeTagsCompanion
    Function({
  Value<int> id,
  Value<String> tagName,
  Value<DateTime> createdAt,
  Value<int> useCount,
  Value<String> genre,
});

class $$DriftTradeTagsTableTableManager extends RootTableManager<
    _$MyDatabase,
    $DriftTradeTagsTable,
    DriftTradeTag,
    $$DriftTradeTagsTableFilterComposer,
    $$DriftTradeTagsTableOrderingComposer,
    $$DriftTradeTagsTableProcessedTableManager,
    $$DriftTradeTagsTableInsertCompanionBuilder,
    $$DriftTradeTagsTableUpdateCompanionBuilder> {
  $$DriftTradeTagsTableTableManager(_$MyDatabase db, $DriftTradeTagsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$DriftTradeTagsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$DriftTradeTagsTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$DriftTradeTagsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> tagName = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> useCount = const Value.absent(),
            Value<String> genre = const Value.absent(),
          }) =>
              DriftTradeTagsCompanion(
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
              DriftTradeTagsCompanion.insert(
            id: id,
            tagName: tagName,
            createdAt: createdAt,
            useCount: useCount,
            genre: genre,
          ),
        ));
}

class $$DriftTradeTagsTableProcessedTableManager extends ProcessedTableManager<
    _$MyDatabase,
    $DriftTradeTagsTable,
    DriftTradeTag,
    $$DriftTradeTagsTableFilterComposer,
    $$DriftTradeTagsTableOrderingComposer,
    $$DriftTradeTagsTableProcessedTableManager,
    $$DriftTradeTagsTableInsertCompanionBuilder,
    $$DriftTradeTagsTableUpdateCompanionBuilder> {
  $$DriftTradeTagsTableProcessedTableManager(super.$state);
}

class $$DriftTradeTagsTableFilterComposer
    extends FilterComposer<_$MyDatabase, $DriftTradeTagsTable> {
  $$DriftTradeTagsTableFilterComposer(super.$state);
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
}

class $$DriftTradeTagsTableOrderingComposer
    extends OrderingComposer<_$MyDatabase, $DriftTradeTagsTable> {
  $$DriftTradeTagsTableOrderingComposer(super.$state);
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

typedef $$DriftTaggedTradeDatasTableInsertCompanionBuilder
    = DriftTaggedTradeDatasCompanion Function({
  required int tradeDataId,
  required int tagId,
  Value<int> rowid,
});
typedef $$DriftTaggedTradeDatasTableUpdateCompanionBuilder
    = DriftTaggedTradeDatasCompanion Function({
  Value<int> tradeDataId,
  Value<int> tagId,
  Value<int> rowid,
});

class $$DriftTaggedTradeDatasTableTableManager extends RootTableManager<
    _$MyDatabase,
    $DriftTaggedTradeDatasTable,
    DriftTaggedTradeData,
    $$DriftTaggedTradeDatasTableFilterComposer,
    $$DriftTaggedTradeDatasTableOrderingComposer,
    $$DriftTaggedTradeDatasTableProcessedTableManager,
    $$DriftTaggedTradeDatasTableInsertCompanionBuilder,
    $$DriftTaggedTradeDatasTableUpdateCompanionBuilder> {
  $$DriftTaggedTradeDatasTableTableManager(
      _$MyDatabase db, $DriftTaggedTradeDatasTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$DriftTaggedTradeDatasTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$DriftTaggedTradeDatasTableOrderingComposer(
              ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$DriftTaggedTradeDatasTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> tradeDataId = const Value.absent(),
            Value<int> tagId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DriftTaggedTradeDatasCompanion(
            tradeDataId: tradeDataId,
            tagId: tagId,
            rowid: rowid,
          ),
          getInsertCompanionBuilder: ({
            required int tradeDataId,
            required int tagId,
            Value<int> rowid = const Value.absent(),
          }) =>
              DriftTaggedTradeDatasCompanion.insert(
            tradeDataId: tradeDataId,
            tagId: tagId,
            rowid: rowid,
          ),
        ));
}

class $$DriftTaggedTradeDatasTableProcessedTableManager
    extends ProcessedTableManager<
        _$MyDatabase,
        $DriftTaggedTradeDatasTable,
        DriftTaggedTradeData,
        $$DriftTaggedTradeDatasTableFilterComposer,
        $$DriftTaggedTradeDatasTableOrderingComposer,
        $$DriftTaggedTradeDatasTableProcessedTableManager,
        $$DriftTaggedTradeDatasTableInsertCompanionBuilder,
        $$DriftTaggedTradeDatasTableUpdateCompanionBuilder> {
  $$DriftTaggedTradeDatasTableProcessedTableManager(super.$state);
}

class $$DriftTaggedTradeDatasTableFilterComposer
    extends FilterComposer<_$MyDatabase, $DriftTaggedTradeDatasTable> {
  $$DriftTaggedTradeDatasTableFilterComposer(super.$state);
  ColumnFilters<int> get tradeDataId => $state.composableBuilder(
      column: $state.table.tradeDataId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get tagId => $state.composableBuilder(
      column: $state.table.tagId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$DriftTaggedTradeDatasTableOrderingComposer
    extends OrderingComposer<_$MyDatabase, $DriftTaggedTradeDatasTable> {
  $$DriftTaggedTradeDatasTableOrderingComposer(super.$state);
  ColumnOrderings<int> get tradeDataId => $state.composableBuilder(
      column: $state.table.tradeDataId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get tagId => $state.composableBuilder(
      column: $state.table.tagId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$DriftTagAttributesTableInsertCompanionBuilder
    = DriftTagAttributesCompanion Function({
  Value<int> id,
  required String name,
  required String dataType,
});
typedef $$DriftTagAttributesTableUpdateCompanionBuilder
    = DriftTagAttributesCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> dataType,
});

class $$DriftTagAttributesTableTableManager extends RootTableManager<
    _$MyDatabase,
    $DriftTagAttributesTable,
    DriftTagAttribute,
    $$DriftTagAttributesTableFilterComposer,
    $$DriftTagAttributesTableOrderingComposer,
    $$DriftTagAttributesTableProcessedTableManager,
    $$DriftTagAttributesTableInsertCompanionBuilder,
    $$DriftTagAttributesTableUpdateCompanionBuilder> {
  $$DriftTagAttributesTableTableManager(
      _$MyDatabase db, $DriftTagAttributesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$DriftTagAttributesTableFilterComposer(ComposerState(db, table)),
          orderingComposer: $$DriftTagAttributesTableOrderingComposer(
              ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$DriftTagAttributesTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> dataType = const Value.absent(),
          }) =>
              DriftTagAttributesCompanion(
            id: id,
            name: name,
            dataType: dataType,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String dataType,
          }) =>
              DriftTagAttributesCompanion.insert(
            id: id,
            name: name,
            dataType: dataType,
          ),
        ));
}

class $$DriftTagAttributesTableProcessedTableManager
    extends ProcessedTableManager<
        _$MyDatabase,
        $DriftTagAttributesTable,
        DriftTagAttribute,
        $$DriftTagAttributesTableFilterComposer,
        $$DriftTagAttributesTableOrderingComposer,
        $$DriftTagAttributesTableProcessedTableManager,
        $$DriftTagAttributesTableInsertCompanionBuilder,
        $$DriftTagAttributesTableUpdateCompanionBuilder> {
  $$DriftTagAttributesTableProcessedTableManager(super.$state);
}

class $$DriftTagAttributesTableFilterComposer
    extends FilterComposer<_$MyDatabase, $DriftTagAttributesTable> {
  $$DriftTagAttributesTableFilterComposer(super.$state);
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
}

class $$DriftTagAttributesTableOrderingComposer
    extends OrderingComposer<_$MyDatabase, $DriftTagAttributesTable> {
  $$DriftTagAttributesTableOrderingComposer(super.$state);
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

typedef $$DriftTagAttributeValuesTableInsertCompanionBuilder
    = DriftTagAttributeValuesCompanion Function({
  required int tagId,
  required int attributeId,
  required String value,
  Value<int> rowid,
});
typedef $$DriftTagAttributeValuesTableUpdateCompanionBuilder
    = DriftTagAttributeValuesCompanion Function({
  Value<int> tagId,
  Value<int> attributeId,
  Value<String> value,
  Value<int> rowid,
});

class $$DriftTagAttributeValuesTableTableManager extends RootTableManager<
    _$MyDatabase,
    $DriftTagAttributeValuesTable,
    DriftTagAttributeValue,
    $$DriftTagAttributeValuesTableFilterComposer,
    $$DriftTagAttributeValuesTableOrderingComposer,
    $$DriftTagAttributeValuesTableProcessedTableManager,
    $$DriftTagAttributeValuesTableInsertCompanionBuilder,
    $$DriftTagAttributeValuesTableUpdateCompanionBuilder> {
  $$DriftTagAttributeValuesTableTableManager(
      _$MyDatabase db, $DriftTagAttributeValuesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$DriftTagAttributeValuesTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$DriftTagAttributeValuesTableOrderingComposer(
              ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$DriftTagAttributeValuesTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> tagId = const Value.absent(),
            Value<int> attributeId = const Value.absent(),
            Value<String> value = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DriftTagAttributeValuesCompanion(
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
              DriftTagAttributeValuesCompanion.insert(
            tagId: tagId,
            attributeId: attributeId,
            value: value,
            rowid: rowid,
          ),
        ));
}

class $$DriftTagAttributeValuesTableProcessedTableManager
    extends ProcessedTableManager<
        _$MyDatabase,
        $DriftTagAttributeValuesTable,
        DriftTagAttributeValue,
        $$DriftTagAttributeValuesTableFilterComposer,
        $$DriftTagAttributeValuesTableOrderingComposer,
        $$DriftTagAttributeValuesTableProcessedTableManager,
        $$DriftTagAttributeValuesTableInsertCompanionBuilder,
        $$DriftTagAttributeValuesTableUpdateCompanionBuilder> {
  $$DriftTagAttributeValuesTableProcessedTableManager(super.$state);
}

class $$DriftTagAttributeValuesTableFilterComposer
    extends FilterComposer<_$MyDatabase, $DriftTagAttributeValuesTable> {
  $$DriftTagAttributeValuesTableFilterComposer(super.$state);
  ColumnFilters<int> get tagId => $state.composableBuilder(
      column: $state.table.tagId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get attributeId => $state.composableBuilder(
      column: $state.table.attributeId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get value => $state.composableBuilder(
      column: $state.table.value,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$DriftTagAttributeValuesTableOrderingComposer
    extends OrderingComposer<_$MyDatabase, $DriftTagAttributeValuesTable> {
  $$DriftTagAttributeValuesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get tagId => $state.composableBuilder(
      column: $state.table.tagId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get attributeId => $state.composableBuilder(
      column: $state.table.attributeId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get value => $state.composableBuilder(
      column: $state.table.value,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$DriftSettingsTableInsertCompanionBuilder = DriftSettingsCompanion
    Function({
  Value<int> id,
  Value<int?> themeMode,
  Value<String> databaseName,
  Value<int> rowid,
});
typedef $$DriftSettingsTableUpdateCompanionBuilder = DriftSettingsCompanion
    Function({
  Value<int> id,
  Value<int?> themeMode,
  Value<String> databaseName,
  Value<int> rowid,
});

class $$DriftSettingsTableTableManager extends RootTableManager<
    _$MyDatabase,
    $DriftSettingsTable,
    DriftSetting,
    $$DriftSettingsTableFilterComposer,
    $$DriftSettingsTableOrderingComposer,
    $$DriftSettingsTableProcessedTableManager,
    $$DriftSettingsTableInsertCompanionBuilder,
    $$DriftSettingsTableUpdateCompanionBuilder> {
  $$DriftSettingsTableTableManager(_$MyDatabase db, $DriftSettingsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$DriftSettingsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$DriftSettingsTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$DriftSettingsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int?> themeMode = const Value.absent(),
            Value<String> databaseName = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DriftSettingsCompanion(
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
              DriftSettingsCompanion.insert(
            id: id,
            themeMode: themeMode,
            databaseName: databaseName,
            rowid: rowid,
          ),
        ));
}

class $$DriftSettingsTableProcessedTableManager extends ProcessedTableManager<
    _$MyDatabase,
    $DriftSettingsTable,
    DriftSetting,
    $$DriftSettingsTableFilterComposer,
    $$DriftSettingsTableOrderingComposer,
    $$DriftSettingsTableProcessedTableManager,
    $$DriftSettingsTableInsertCompanionBuilder,
    $$DriftSettingsTableUpdateCompanionBuilder> {
  $$DriftSettingsTableProcessedTableManager(super.$state);
}

class $$DriftSettingsTableFilterComposer
    extends FilterComposer<_$MyDatabase, $DriftSettingsTable> {
  $$DriftSettingsTableFilterComposer(super.$state);
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

class $$DriftSettingsTableOrderingComposer
    extends OrderingComposer<_$MyDatabase, $DriftSettingsTable> {
  $$DriftSettingsTableOrderingComposer(super.$state);
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

typedef $$DriftTradingAssetDatasTableInsertCompanionBuilder
    = DriftTradingAssetDatasCompanion Function({
  Value<int> id,
  Value<String?> name,
  Value<String?> type,
});
typedef $$DriftTradingAssetDatasTableUpdateCompanionBuilder
    = DriftTradingAssetDatasCompanion Function({
  Value<int> id,
  Value<String?> name,
  Value<String?> type,
});

class $$DriftTradingAssetDatasTableTableManager extends RootTableManager<
    _$MyDatabase,
    $DriftTradingAssetDatasTable,
    DriftTradingAssetData,
    $$DriftTradingAssetDatasTableFilterComposer,
    $$DriftTradingAssetDatasTableOrderingComposer,
    $$DriftTradingAssetDatasTableProcessedTableManager,
    $$DriftTradingAssetDatasTableInsertCompanionBuilder,
    $$DriftTradingAssetDatasTableUpdateCompanionBuilder> {
  $$DriftTradingAssetDatasTableTableManager(
      _$MyDatabase db, $DriftTradingAssetDatasTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$DriftTradingAssetDatasTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$DriftTradingAssetDatasTableOrderingComposer(
              ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$DriftTradingAssetDatasTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String?> name = const Value.absent(),
            Value<String?> type = const Value.absent(),
          }) =>
              DriftTradingAssetDatasCompanion(
            id: id,
            name: name,
            type: type,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String?> name = const Value.absent(),
            Value<String?> type = const Value.absent(),
          }) =>
              DriftTradingAssetDatasCompanion.insert(
            id: id,
            name: name,
            type: type,
          ),
        ));
}

class $$DriftTradingAssetDatasTableProcessedTableManager
    extends ProcessedTableManager<
        _$MyDatabase,
        $DriftTradingAssetDatasTable,
        DriftTradingAssetData,
        $$DriftTradingAssetDatasTableFilterComposer,
        $$DriftTradingAssetDatasTableOrderingComposer,
        $$DriftTradingAssetDatasTableProcessedTableManager,
        $$DriftTradingAssetDatasTableInsertCompanionBuilder,
        $$DriftTradingAssetDatasTableUpdateCompanionBuilder> {
  $$DriftTradingAssetDatasTableProcessedTableManager(super.$state);
}

class $$DriftTradingAssetDatasTableFilterComposer
    extends FilterComposer<_$MyDatabase, $DriftTradingAssetDatasTable> {
  $$DriftTradingAssetDatasTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$DriftTradingAssetDatasTableOrderingComposer
    extends OrderingComposer<_$MyDatabase, $DriftTradingAssetDatasTable> {
  $$DriftTradingAssetDatasTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$MyDatabaseManager {
  final _$MyDatabase _db;
  _$MyDatabaseManager(this._db);
  $$DriftTradeDatasTableTableManager get driftTradeDatas =>
      $$DriftTradeDatasTableTableManager(_db, _db.driftTradeDatas);
  $$DriftTradeTagsTableTableManager get driftTradeTags =>
      $$DriftTradeTagsTableTableManager(_db, _db.driftTradeTags);
  $$DriftTaggedTradeDatasTableTableManager get driftTaggedTradeDatas =>
      $$DriftTaggedTradeDatasTableTableManager(_db, _db.driftTaggedTradeDatas);
  $$DriftTagAttributesTableTableManager get driftTagAttributes =>
      $$DriftTagAttributesTableTableManager(_db, _db.driftTagAttributes);
  $$DriftTagAttributeValuesTableTableManager get driftTagAttributeValues =>
      $$DriftTagAttributeValuesTableTableManager(
          _db, _db.driftTagAttributeValues);
  $$DriftSettingsTableTableManager get driftSettings =>
      $$DriftSettingsTableTableManager(_db, _db.driftSettings);
  $$DriftTradingAssetDatasTableTableManager get driftTradingAssetDatas =>
      $$DriftTradingAssetDatasTableTableManager(
          _db, _db.driftTradingAssetDatas);
}
