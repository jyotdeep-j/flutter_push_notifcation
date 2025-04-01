import '/elements/categories/categories_widget.dart';
import '/elements/footer/footer_widget.dart';
import '/elements/footer_with_contact_field/footer_with_contact_field_widget.dart';
import '/elements/header/header_widget.dart';
import '/elements/hero_image/hero_image_widget.dart';
import '/elements/search_field/search_field_widget.dart';
import '/elements/signed_up_companies/signed_up_companies_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/landing_page/empower_business_session/empower_business_session_widget.dart';
import '/landing_page/key_benefits/key_benefits_widget.dart';
import '/landing_page/the_advantages/the_advantages_widget.dart';
import 'landing_page_widget.dart' show LandingPageWidget;
import 'package:flutter/material.dart';

class LandingPageModel extends FlutterFlowModel<LandingPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for HeroImage component.
  late HeroImageModel heroImageModel;
  // Model for Categories component.
  late CategoriesModel categoriesModel1;
  // Model for SearchField component.
  late SearchFieldModel searchFieldModel1;
  // Model for SearchField component.
  late SearchFieldModel searchFieldModel2;
  // Model for Categories component.
  late CategoriesModel categoriesModel2;
  // Model for SignedUpCompanies component.
  late SignedUpCompaniesModel signedUpCompaniesModel;
  // Model for EmpowerBusinessSession component.
  late EmpowerBusinessSessionModel empowerBusinessSessionModel;
  // Model for TheAdvantages component.
  late TheAdvantagesModel theAdvantagesModel;
  // Model for KeyBenefits component.
  late KeyBenefitsModel keyBenefitsModel;
  // Model for Footer component.
  late FooterModel footerModel;
  // Model for FooterWithContactField component.
  late FooterWithContactFieldModel footerWithContactFieldModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    heroImageModel = createModel(context, () => HeroImageModel());
    categoriesModel1 = createModel(context, () => CategoriesModel());
    searchFieldModel1 = createModel(context, () => SearchFieldModel());
    searchFieldModel2 = createModel(context, () => SearchFieldModel());
    categoriesModel2 = createModel(context, () => CategoriesModel());
    signedUpCompaniesModel =
        createModel(context, () => SignedUpCompaniesModel());
    empowerBusinessSessionModel =
        createModel(context, () => EmpowerBusinessSessionModel());
    theAdvantagesModel = createModel(context, () => TheAdvantagesModel());
    keyBenefitsModel = createModel(context, () => KeyBenefitsModel());
    footerModel = createModel(context, () => FooterModel());
    footerWithContactFieldModel =
        createModel(context, () => FooterWithContactFieldModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    heroImageModel.dispose();
    categoriesModel1.dispose();
    searchFieldModel1.dispose();
    searchFieldModel2.dispose();
    categoriesModel2.dispose();
    signedUpCompaniesModel.dispose();
    empowerBusinessSessionModel.dispose();
    theAdvantagesModel.dispose();
    keyBenefitsModel.dispose();
    footerModel.dispose();
    footerWithContactFieldModel.dispose();
  }
}
