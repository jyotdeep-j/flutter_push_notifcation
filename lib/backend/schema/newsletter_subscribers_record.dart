import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NewsletterSubscribersRecord extends FirestoreRecord {
  NewsletterSubscribersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "subscriber" field.
  String? _subscriber;
  String get subscriber => _subscriber ?? '';
  bool hasSubscriber() => _subscriber != null;

  void _initializeFields() {
    _subscriber = snapshotData['subscriber'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('newsletter_subscribers');

  static Stream<NewsletterSubscribersRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => NewsletterSubscribersRecord.fromSnapshot(s));

  static Future<NewsletterSubscribersRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => NewsletterSubscribersRecord.fromSnapshot(s));

  static NewsletterSubscribersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NewsletterSubscribersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NewsletterSubscribersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NewsletterSubscribersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NewsletterSubscribersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NewsletterSubscribersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNewsletterSubscribersRecordData({
  String? subscriber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'subscriber': subscriber,
    }.withoutNulls,
  );

  return firestoreData;
}

class NewsletterSubscribersRecordDocumentEquality
    implements Equality<NewsletterSubscribersRecord> {
  const NewsletterSubscribersRecordDocumentEquality();

  @override
  bool equals(
      NewsletterSubscribersRecord? e1, NewsletterSubscribersRecord? e2) {
    return e1?.subscriber == e2?.subscriber;
  }

  @override
  int hash(NewsletterSubscribersRecord? e) =>
      const ListEquality().hash([e?.subscriber]);

  @override
  bool isValidKey(Object? o) => o is NewsletterSubscribersRecord;
}
