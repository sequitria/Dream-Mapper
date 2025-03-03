// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetJournalCollection on Isar {
  IsarCollection<Journal> get journals => this.collection();
}

const JournalSchema = CollectionSchema(
  name: r'Journal',
  id: -4704215588566915531,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'date': PropertySchema(
      id: 1,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'dominantSense': PropertySchema(
      id: 2,
      name: r'dominantSense',
      type: IsarType.string,
    ),
    r'dreamDescription': PropertySchema(
      id: 3,
      name: r'dreamDescription',
      type: IsarType.string,
    ),
    r'dreamVividnessScore': PropertySchema(
      id: 4,
      name: r'dreamVividnessScore',
      type: IsarType.double,
    ),
    r'journalTitle': PropertySchema(
      id: 5,
      name: r'journalTitle',
      type: IsarType.string,
    ),
    r'lucidityLevel': PropertySchema(
      id: 6,
      name: r'lucidityLevel',
      type: IsarType.string,
    ),
    r'mapDescription': PropertySchema(
      id: 7,
      name: r'mapDescription',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 8,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _journalEstimateSize,
  serialize: _journalSerialize,
  deserialize: _journalDeserialize,
  deserializeProp: _journalDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'dreamTags': LinkSchema(
      id: -7510481775643470181,
      name: r'dreamTags',
      target: r'DreamTag',
      single: false,
    ),
    r'mapTags': LinkSchema(
      id: 9018798431234739186,
      name: r'mapTags',
      target: r'MapTag',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _journalGetId,
  getLinks: _journalGetLinks,
  attach: _journalAttach,
  version: '3.1.0+1',
);

int _journalEstimateSize(
  Journal object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.dominantSense;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.dreamDescription.length * 3;
  bytesCount += 3 + object.journalTitle.length * 3;
  {
    final value = object.lucidityLevel;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.mapDescription;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _journalSerialize(
  Journal object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeDateTime(offsets[1], object.date);
  writer.writeString(offsets[2], object.dominantSense);
  writer.writeString(offsets[3], object.dreamDescription);
  writer.writeDouble(offsets[4], object.dreamVividnessScore);
  writer.writeString(offsets[5], object.journalTitle);
  writer.writeString(offsets[6], object.lucidityLevel);
  writer.writeString(offsets[7], object.mapDescription);
  writer.writeDateTime(offsets[8], object.updatedAt);
}

Journal _journalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Journal();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.date = reader.readDateTime(offsets[1]);
  object.dominantSense = reader.readStringOrNull(offsets[2]);
  object.dreamDescription = reader.readString(offsets[3]);
  object.dreamVividnessScore = reader.readDoubleOrNull(offsets[4]);
  object.id = id;
  object.journalTitle = reader.readString(offsets[5]);
  object.lucidityLevel = reader.readStringOrNull(offsets[6]);
  object.mapDescription = reader.readStringOrNull(offsets[7]);
  object.updatedAt = reader.readDateTime(offsets[8]);
  return object;
}

P _journalDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDoubleOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _journalGetId(Journal object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _journalGetLinks(Journal object) {
  return [object.dreamTags, object.mapTags];
}

void _journalAttach(IsarCollection<dynamic> col, Id id, Journal object) {
  object.id = id;
  object.dreamTags
      .attach(col, col.isar.collection<DreamTag>(), r'dreamTags', id);
  object.mapTags.attach(col, col.isar.collection<MapTag>(), r'mapTags', id);
}

extension JournalQueryWhereSort on QueryBuilder<Journal, Journal, QWhere> {
  QueryBuilder<Journal, Journal, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension JournalQueryWhere on QueryBuilder<Journal, Journal, QWhereClause> {
  QueryBuilder<Journal, Journal, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Journal, Journal, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Journal, Journal, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Journal, Journal, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension JournalQueryFilter
    on QueryBuilder<Journal, Journal, QFilterCondition> {
  QueryBuilder<Journal, Journal, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> dateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> dominantSenseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dominantSense',
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition>
      dominantSenseIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dominantSense',
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> dominantSenseEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dominantSense',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition>
      dominantSenseGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dominantSense',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> dominantSenseLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dominantSense',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> dominantSenseBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dominantSense',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> dominantSenseStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dominantSense',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> dominantSenseEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dominantSense',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> dominantSenseContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dominantSense',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> dominantSenseMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dominantSense',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> dominantSenseIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dominantSense',
        value: '',
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition>
      dominantSenseIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dominantSense',
        value: '',
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> dreamDescriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dreamDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition>
      dreamDescriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dreamDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition>
      dreamDescriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dreamDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> dreamDescriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dreamDescription',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition>
      dreamDescriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dreamDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition>
      dreamDescriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dreamDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition>
      dreamDescriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dreamDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> dreamDescriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dreamDescription',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition>
      dreamDescriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dreamDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition>
      dreamDescriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dreamDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition>
      dreamVividnessScoreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dreamVividnessScore',
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition>
      dreamVividnessScoreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dreamVividnessScore',
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition>
      dreamVividnessScoreEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dreamVividnessScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition>
      dreamVividnessScoreGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dreamVividnessScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition>
      dreamVividnessScoreLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dreamVividnessScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition>
      dreamVividnessScoreBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dreamVividnessScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> journalTitleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'journalTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> journalTitleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'journalTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> journalTitleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'journalTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> journalTitleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'journalTitle',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> journalTitleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'journalTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> journalTitleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'journalTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> journalTitleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'journalTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> journalTitleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'journalTitle',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> journalTitleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'journalTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition>
      journalTitleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'journalTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> lucidityLevelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lucidityLevel',
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition>
      lucidityLevelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lucidityLevel',
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> lucidityLevelEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lucidityLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition>
      lucidityLevelGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lucidityLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> lucidityLevelLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lucidityLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> lucidityLevelBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lucidityLevel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> lucidityLevelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lucidityLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> lucidityLevelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lucidityLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> lucidityLevelContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lucidityLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> lucidityLevelMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lucidityLevel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> lucidityLevelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lucidityLevel',
        value: '',
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition>
      lucidityLevelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lucidityLevel',
        value: '',
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> mapDescriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'mapDescription',
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition>
      mapDescriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'mapDescription',
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> mapDescriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mapDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition>
      mapDescriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mapDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> mapDescriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mapDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> mapDescriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mapDescription',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition>
      mapDescriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mapDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> mapDescriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mapDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> mapDescriptionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mapDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> mapDescriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mapDescription',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition>
      mapDescriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mapDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition>
      mapDescriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mapDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> updatedAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> updatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> updatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension JournalQueryObject
    on QueryBuilder<Journal, Journal, QFilterCondition> {}

extension JournalQueryLinks
    on QueryBuilder<Journal, Journal, QFilterCondition> {
  QueryBuilder<Journal, Journal, QAfterFilterCondition> dreamTags(
      FilterQuery<DreamTag> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'dreamTags');
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> dreamTagsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'dreamTags', length, true, length, true);
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> dreamTagsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'dreamTags', 0, true, 0, true);
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> dreamTagsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'dreamTags', 0, false, 999999, true);
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> dreamTagsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'dreamTags', 0, true, length, include);
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition>
      dreamTagsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'dreamTags', length, include, 999999, true);
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> dreamTagsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'dreamTags', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> mapTags(
      FilterQuery<MapTag> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'mapTags');
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> mapTagsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'mapTags', length, true, length, true);
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> mapTagsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'mapTags', 0, true, 0, true);
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> mapTagsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'mapTags', 0, false, 999999, true);
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> mapTagsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'mapTags', 0, true, length, include);
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition>
      mapTagsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'mapTags', length, include, 999999, true);
    });
  }

  QueryBuilder<Journal, Journal, QAfterFilterCondition> mapTagsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'mapTags', lower, includeLower, upper, includeUpper);
    });
  }
}

extension JournalQuerySortBy on QueryBuilder<Journal, Journal, QSortBy> {
  QueryBuilder<Journal, Journal, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Journal, Journal, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Journal, Journal, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<Journal, Journal, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<Journal, Journal, QAfterSortBy> sortByDominantSense() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dominantSense', Sort.asc);
    });
  }

  QueryBuilder<Journal, Journal, QAfterSortBy> sortByDominantSenseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dominantSense', Sort.desc);
    });
  }

  QueryBuilder<Journal, Journal, QAfterSortBy> sortByDreamDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dreamDescription', Sort.asc);
    });
  }

  QueryBuilder<Journal, Journal, QAfterSortBy> sortByDreamDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dreamDescription', Sort.desc);
    });
  }

  QueryBuilder<Journal, Journal, QAfterSortBy> sortByDreamVividnessScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dreamVividnessScore', Sort.asc);
    });
  }

  QueryBuilder<Journal, Journal, QAfterSortBy> sortByDreamVividnessScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dreamVividnessScore', Sort.desc);
    });
  }

  QueryBuilder<Journal, Journal, QAfterSortBy> sortByJournalTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'journalTitle', Sort.asc);
    });
  }

  QueryBuilder<Journal, Journal, QAfterSortBy> sortByJournalTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'journalTitle', Sort.desc);
    });
  }

  QueryBuilder<Journal, Journal, QAfterSortBy> sortByLucidityLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lucidityLevel', Sort.asc);
    });
  }

  QueryBuilder<Journal, Journal, QAfterSortBy> sortByLucidityLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lucidityLevel', Sort.desc);
    });
  }

  QueryBuilder<Journal, Journal, QAfterSortBy> sortByMapDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mapDescription', Sort.asc);
    });
  }

  QueryBuilder<Journal, Journal, QAfterSortBy> sortByMapDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mapDescription', Sort.desc);
    });
  }

  QueryBuilder<Journal, Journal, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Journal, Journal, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension JournalQuerySortThenBy
    on QueryBuilder<Journal, Journal, QSortThenBy> {
  QueryBuilder<Journal, Journal, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Journal, Journal, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Journal, Journal, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<Journal, Journal, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<Journal, Journal, QAfterSortBy> thenByDominantSense() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dominantSense', Sort.asc);
    });
  }

  QueryBuilder<Journal, Journal, QAfterSortBy> thenByDominantSenseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dominantSense', Sort.desc);
    });
  }

  QueryBuilder<Journal, Journal, QAfterSortBy> thenByDreamDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dreamDescription', Sort.asc);
    });
  }

  QueryBuilder<Journal, Journal, QAfterSortBy> thenByDreamDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dreamDescription', Sort.desc);
    });
  }

  QueryBuilder<Journal, Journal, QAfterSortBy> thenByDreamVividnessScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dreamVividnessScore', Sort.asc);
    });
  }

  QueryBuilder<Journal, Journal, QAfterSortBy> thenByDreamVividnessScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dreamVividnessScore', Sort.desc);
    });
  }

  QueryBuilder<Journal, Journal, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Journal, Journal, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Journal, Journal, QAfterSortBy> thenByJournalTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'journalTitle', Sort.asc);
    });
  }

  QueryBuilder<Journal, Journal, QAfterSortBy> thenByJournalTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'journalTitle', Sort.desc);
    });
  }

  QueryBuilder<Journal, Journal, QAfterSortBy> thenByLucidityLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lucidityLevel', Sort.asc);
    });
  }

  QueryBuilder<Journal, Journal, QAfterSortBy> thenByLucidityLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lucidityLevel', Sort.desc);
    });
  }

  QueryBuilder<Journal, Journal, QAfterSortBy> thenByMapDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mapDescription', Sort.asc);
    });
  }

  QueryBuilder<Journal, Journal, QAfterSortBy> thenByMapDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mapDescription', Sort.desc);
    });
  }

  QueryBuilder<Journal, Journal, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Journal, Journal, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension JournalQueryWhereDistinct
    on QueryBuilder<Journal, Journal, QDistinct> {
  QueryBuilder<Journal, Journal, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<Journal, Journal, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<Journal, Journal, QDistinct> distinctByDominantSense(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dominantSense',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Journal, Journal, QDistinct> distinctByDreamDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dreamDescription',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Journal, Journal, QDistinct> distinctByDreamVividnessScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dreamVividnessScore');
    });
  }

  QueryBuilder<Journal, Journal, QDistinct> distinctByJournalTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'journalTitle', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Journal, Journal, QDistinct> distinctByLucidityLevel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lucidityLevel',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Journal, Journal, QDistinct> distinctByMapDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mapDescription',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Journal, Journal, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension JournalQueryProperty
    on QueryBuilder<Journal, Journal, QQueryProperty> {
  QueryBuilder<Journal, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Journal, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<Journal, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<Journal, String?, QQueryOperations> dominantSenseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dominantSense');
    });
  }

  QueryBuilder<Journal, String, QQueryOperations> dreamDescriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dreamDescription');
    });
  }

  QueryBuilder<Journal, double?, QQueryOperations>
      dreamVividnessScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dreamVividnessScore');
    });
  }

  QueryBuilder<Journal, String, QQueryOperations> journalTitleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'journalTitle');
    });
  }

  QueryBuilder<Journal, String?, QQueryOperations> lucidityLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lucidityLevel');
    });
  }

  QueryBuilder<Journal, String?, QQueryOperations> mapDescriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mapDescription');
    });
  }

  QueryBuilder<Journal, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
