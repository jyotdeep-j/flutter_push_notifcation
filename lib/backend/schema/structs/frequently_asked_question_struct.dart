// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class FrequentlyAskedQuestionStruct extends FFFirebaseStruct {
  FrequentlyAskedQuestionStruct({
    String? question,
    String? answer,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _question = question,
        _answer = answer,
        super(firestoreUtilData);

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  set question(String? val) => _question = val;

  bool hasQuestion() => _question != null;

  // "answer" field.
  String? _answer;
  String get answer => _answer ?? '';
  set answer(String? val) => _answer = val;

  bool hasAnswer() => _answer != null;

  static FrequentlyAskedQuestionStruct fromMap(Map<String, dynamic> data) =>
      FrequentlyAskedQuestionStruct(
        question: data['question'] as String?,
        answer: data['answer'] as String?,
      );

  static FrequentlyAskedQuestionStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? FrequentlyAskedQuestionStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'question': _question,
        'answer': _answer,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'question': serializeParam(
          _question,
          ParamType.String,
        ),
        'answer': serializeParam(
          _answer,
          ParamType.String,
        ),
      }.withoutNulls;

  static FrequentlyAskedQuestionStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      FrequentlyAskedQuestionStruct(
        question: deserializeParam(
          data['question'],
          ParamType.String,
          false,
        ),
        answer: deserializeParam(
          data['answer'],
          ParamType.String,
          false,
        ),
      );

  static FrequentlyAskedQuestionStruct fromAlgoliaData(
          Map<String, dynamic> data) =>
      FrequentlyAskedQuestionStruct(
        question: convertAlgoliaParam(
          data['question'],
          ParamType.String,
          false,
        ),
        answer: convertAlgoliaParam(
          data['answer'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'FrequentlyAskedQuestionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FrequentlyAskedQuestionStruct &&
        question == other.question &&
        answer == other.answer;
  }

  @override
  int get hashCode => const ListEquality().hash([question, answer]);
}

FrequentlyAskedQuestionStruct createFrequentlyAskedQuestionStruct({
  String? question,
  String? answer,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FrequentlyAskedQuestionStruct(
      question: question,
      answer: answer,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FrequentlyAskedQuestionStruct? updateFrequentlyAskedQuestionStruct(
  FrequentlyAskedQuestionStruct? frequentlyAskedQuestion, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    frequentlyAskedQuestion
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFrequentlyAskedQuestionStructData(
  Map<String, dynamic> firestoreData,
  FrequentlyAskedQuestionStruct? frequentlyAskedQuestion,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (frequentlyAskedQuestion == null) {
    return;
  }
  if (frequentlyAskedQuestion.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      frequentlyAskedQuestion.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final frequentlyAskedQuestionData = getFrequentlyAskedQuestionFirestoreData(
      frequentlyAskedQuestion, forFieldValue);
  final nestedData =
      frequentlyAskedQuestionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      frequentlyAskedQuestion.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFrequentlyAskedQuestionFirestoreData(
  FrequentlyAskedQuestionStruct? frequentlyAskedQuestion, [
  bool forFieldValue = false,
]) {
  if (frequentlyAskedQuestion == null) {
    return {};
  }
  final firestoreData = mapToFirestore(frequentlyAskedQuestion.toMap());

  // Add any Firestore field values
  frequentlyAskedQuestion.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFrequentlyAskedQuestionListFirestoreData(
  List<FrequentlyAskedQuestionStruct>? frequentlyAskedQuestions,
) =>
    frequentlyAskedQuestions
        ?.map((e) => getFrequentlyAskedQuestionFirestoreData(e, true))
        .toList() ??
    [];
