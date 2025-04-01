import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

Future verifyIfExistingPartner(BuildContext context) async {
  PartnersRecord? partnerData;
  PartnersRecord? partner;

  final firestoreBatch = FirebaseFirestore.instance.batch();
  try {
    partnerData = await queryPartnersRecordOnce(
      queryBuilder: (partnersRecord) => partnersRecord.where(
        'id',
        isEqualTo: currentUserUid,
      ),
      singleRecord: true,
    ).then((s) => s.firstOrNull);
    if (!(partnerData != null)) {
      var partnersRecordReference =
          PartnersRecord.collection.doc(currentUserUid);
      firestoreBatch.set(
          partnersRecordReference,
          createPartnersRecordData(
            id: currentUserUid,
          ));
      partner = PartnersRecord.getDocumentFromData(
          createPartnersRecordData(
            id: currentUserUid,
          ),
          partnersRecordReference);

      firestoreBatch.update(
          currentUserReference!,
          createCustomersRecordData(
            partnerData: partner.reference,
          ));
    }
  } finally {
    await firestoreBatch.commit();
  }
}
