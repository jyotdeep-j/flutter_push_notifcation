import '/backend/backend.dart';
import '/elements/footer/footer_widget.dart';
import '/elements/header/header_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:flutter/material.dart';
import 'blog_page_model.dart';
export 'blog_page_model.dart';

class BlogPageWidget extends StatefulWidget {
  const BlogPageWidget({super.key});

  @override
  State<BlogPageWidget> createState() => _BlogPageWidgetState();
}

class _BlogPageWidgetState extends State<BlogPageWidget> {
  late BlogPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BlogPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ArticlesRecord>>(
      stream: queryArticlesRecord(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<ArticlesRecord> blogPageArticlesRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      StickyHeader(
                        overlapHeaders: false,
                        header: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.asset(
                                'assets/images/Frame_65.png',
                              ).image,
                            ),
                          ),
                          child: wrapWithModel(
                            model: _model.headerModel,
                            updateCallback: () => safeSetState(() {}),
                            child: const HeaderWidget(),
                          ),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 60.0, 0.0, 10.0),
                              child: Text(
                                '22 Jul, 2024',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Manrope',
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: Text(
                                'Getting Started with Nimbus: A Beginner\'s Guide',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Manrope',
                                      fontSize: 36.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 10.0),
                              child: Text(
                                'New to Nimbus? This comprehensive guide will walk you through the basics of setting up and using our\n platform, ensuring you get off to a smooth start.',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Manrope',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 20.0),
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                constraints: const BoxConstraints(
                                  maxWidth: 1300.0,
                                  maxHeight: 634.0,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.asset(
                                      'assets/images/Rectangle_192.png',
                                    ).image,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  30.0, 10.0, 30.0, 10.0),
                              child: Text(
                                'Lorem ipsum dolor sit amet consectetur. Duis id suspendisse neque donec scelerisque semper fringilla consectetur. Dictumst sed nullam adipiscing commodo pretium nec malesuada. Id tristique nulla sollicitudin bibendum dui. Vel nulla enim feugiat molestie elit posuere fermentum vel interdum. Vitae sit morbi eget vitae elit lectus. Enim enim id in odio. Tincidunt lacus duis vestibulum nec sapien. Ut volutpat tristique et donec nulla ut eu. Fermentum quis donec habitant amet varius cursus gravida. Maecenas est odio cursus aliquet. Dui tellus vel arcu augue venenatis vitae ornare. A pellentesque dui metus lobortis donec lorem neque pretium. Massa in malesuada pellentesque fermentum sollicitudin. Pellentesque id sed adipiscing morbi diam morbi non.\n\nEt nibh in et a. Donec a cursus eleifend interdum nulla in commodo fames at. Rutrum aliquam tortor diam nulla aenean quisque viverra suspendisse. Rutrum non elit nunc nullam consectetur nibh. Nam blandit ornare amet in phasellus turpis habitasse vivamus vitae. Aliquet aliquet vitae ultricies duis tincidunt. Vestibulum ac blandit odio volutpat viverra. Integer cursus feugiat aliquet suspendisse nisl fringilla aliquam quam. Eu morbi ut viverra in sed ac fringilla eget. Pharetra erat et tellus ornare a.\n\nMauris ornare felis nisl interdum maecenas ultrices amet eros ac. Enim iaculis donec ipsum sit senectus vulputate. Nibh sollicitudin elit lorem habitasse maecenas amet facilisis ut. Morbi tellus consectetur praesent bibendum eu facilisis egestas. Phasellus dolor pharetra ornare lectus ultricies velit eget volutpat. Neque tempor consectetur cursus in viverra nec.\n\nPellentesque amet aliquet purus ac porta donec nullam tincidunt in. Enim mi vehicula mauris vitae. Phasellus tristique velit egestas donec lobortis. Senectus amet arcu luctus ultricies mattis mauris molestie. Aliquam fermentum habitant pellentesque ultricies nec mattis vitae dolor.\nTellus duis mi facilisi tortor urna lectus. In faucibus non viverra quis at non. Felis aliquam elementum sed ut tincidunt. Aenean a nulla luctus quam facilisi. Semper senectus arcu libero amet sagittis iaculis feugiat donec at. Magna sodales in tincidunt tellus egestas.',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Manrope',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  30.0, 10.0, 30.0, 10.0),
                              child: Text(
                                'Lorem ipsum dolor sit amet consectetur. Duis id suspendisse neque donec scelerisque semper fringilla consectetur. Dictumst sed nullam adipiscing commodo pretium nec malesuada. Id tristique nulla sollicitudin bibendum dui. Vel nulla enim feugiat molestie elit posuere fermentum vel interdum. Vitae sit morbi eget vitae elit lectus. Enim enim id in odio. Tincidunt lacus duis vestibulum nec sapien. Ut volutpat tristique et donec nulla ut eu. Fermentum quis donec habitant amet varius cursus gravida. Maecenas est odio cursus aliquet. Dui tellus vel arcu augue venenatis vitae ornare. A pellentesque dui metus lobortis donec lorem neque pretium. Massa in malesuada pellentesque fermentum sollicitudin. Pellentesque id sed adipiscing morbi diam morbi non.\n\nEt nibh in et a. Donec a cursus eleifend interdum nulla in commodo fames at. Rutrum aliquam tortor diam nulla aenean quisque viverra suspendisse. Rutrum non elit nunc nullam consectetur nibh. Nam blandit ornare amet in phasellus turpis habitasse vivamus vitae. Aliquet aliquet vitae ultricies duis tincidunt. Vestibulum ac blandit odio volutpat viverra. Integer cursus feugiat aliquet suspendisse nisl fringilla aliquam quam. Eu morbi ut viverra in sed ac fringilla eget. Pharetra erat et tellus ornare a.\n\nMauris ornare felis nisl interdum maecenas ultrices amet eros ac. Enim iaculis donec ipsum sit senectus vulputate. Nibh sollicitudin elit lorem habitasse maecenas amet facilisis ut. Morbi tellus consectetur praesent bibendum eu facilisis egestas. Phasellus dolor pharetra ornare lectus ultricies velit eget volutpat. Neque tempor consectetur cursus in viverra nec.\n\nPellentesque amet aliquet purus ac porta donec nullam tincidunt in. Enim mi vehicula mauris vitae. Phasellus tristique velit egestas donec lobortis. Senectus amet arcu luctus ultricies mattis mauris molestie. Aliquam fermentum habitant pellentesque ultricies nec mattis vitae dolor.\nTellus duis mi facilisi tortor urna lectus. In faucibus non viverra quis at non. Felis aliquam elementum sed ut tincidunt. Aenean a nulla luctus quam facilisi. Semper senectus arcu libero amet sagittis iaculis feugiat donec at. Magna sodales in tincidunt tellus egestas.',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Manrope',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            if (responsiveVisibility(
                              context: context,
                              phone: false,
                              tablet: false,
                            ))
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    30.0, 30.0, 30.0, 30.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      constraints: const BoxConstraints(
                                        maxWidth: 475.0,
                                        maxHeight: 300.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: Image.asset(
                                            'assets/images/Rectangle_193@2x.png',
                                          ).image,
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            30.0, 10.0, 30.0, 10.0),
                                        child: Text(
                                          'Lorem ipsum dolor sit amet consectetur. Duis id suspendisse neque donec scelerisque semper fringilla consectetur. Dictumst sed nullam adipiscing commodo pretium nec malesuada. Id tristique nulla sollicitudin bibendum dui. Vel nulla enim feugiat molestie elit posuere fermentum vel interdum. Vitae sit morbi eget vitae elit lectus. Enim enim id in odio. Tincidunt lacus duis vestibulum nec sapien. Ut volutpat tristique et donec nulla ut eu. \n\nFermentum quis donec habitant amet varius cursus gravida. Maecenas est odio cursus aliquet. Dui tellus vel arcu augue venenatis vitae ornare. A pellentesque dui metus lobortis donec lorem neque pretium. Massa in malesuada pellentesque fermentum sollicitudin. Pellentesque id sed adipiscing morbi diam morbi non.',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Manrope',
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            if (responsiveVisibility(
                              context: context,
                              tabletLandscape: false,
                              desktop: false,
                            ))
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    30.0, 30.0, 30.0, 30.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      constraints: const BoxConstraints(
                                        maxWidth: 475.0,
                                        maxHeight: 300.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: Image.asset(
                                            'assets/images/Rectangle_193@2x.png',
                                          ).image,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          30.0, 10.0, 30.0, 10.0),
                                      child: Text(
                                        'Lorem ipsum dolor sit amet consectetur. Duis id suspendisse neque donec scelerisque semper fringilla consectetur. Dictumst sed nullam adipiscing commodo pretium nec malesuada. Id tristique nulla sollicitudin bibendum dui. Vel nulla enim feugiat molestie elit posuere fermentum vel interdum. Vitae sit morbi eget vitae elit lectus. Enim enim id in odio. Tincidunt lacus duis vestibulum nec sapien. Ut volutpat tristique et donec nulla ut eu. \n\nFermentum quis donec habitant amet varius cursus gravida. Maecenas est odio cursus aliquet. Dui tellus vel arcu augue venenatis vitae ornare. A pellentesque dui metus lobortis donec lorem neque pretium. Massa in malesuada pellentesque fermentum sollicitudin. Pellentesque id sed adipiscing morbi diam morbi non.',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Manrope',
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  30.0, 10.0, 30.0, 10.0),
                              child: Text(
                                'Lorem ipsum dolor sit amet consectetur. Duis id suspendisse neque donec scelerisque semper fringilla consectetur. Dictumst sed nullam adipiscing commodo pretium nec malesuada. Id tristique nulla sollicitudin bibendum dui. Vel nulla enim feugiat molestie elit posuere fermentum vel interdum. Vitae sit morbi eget vitae elit lectus. Enim enim id in odio. Tincidunt lacus duis vestibulum nec sapien. Ut volutpat tristique et donec nulla ut eu. Fermentum quis donec habitant amet varius cursus gravida. Maecenas est odio cursus aliquet. Dui tellus vel arcu augue venenatis vitae ornare. A pellentesque dui metus lobortis donec lorem neque pretium. Massa in malesuada pellentesque fermentum sollicitudin. Pellentesque id sed adipiscing morbi diam morbi non.\n\nEt nibh in et a. Donec a cursus eleifend interdum nulla in commodo fames at. Rutrum aliquam tortor diam nulla aenean quisque viverra suspendisse. Rutrum non elit nunc nullam consectetur nibh. Nam blandit ornare amet in phasellus turpis habitasse vivamus vitae. Aliquet aliquet vitae ultricies duis tincidunt. Vestibulum ac blandit odio volutpat viverra. Integer cursus feugiat aliquet suspendisse nisl fringilla aliquam quam. Eu morbi ut viverra in sed ac fringilla eget. Pharetra erat et tellus ornare a.\n\nMauris ornare felis nisl interdum maecenas ultrices amet eros ac. Enim iaculis donec ipsum sit senectus vulputate. Nibh sollicitudin elit lorem habitasse maecenas amet facilisis ut. Morbi tellus consectetur praesent bibendum eu facilisis egestas. Phasellus dolor pharetra ornare lectus ultricies velit eget volutpat. Neque tempor consectetur cursus in viverra nec.\n\nPellentesque amet aliquet purus ac porta donec nullam tincidunt in. Enim mi vehicula mauris vitae. Phasellus tristique velit egestas donec lobortis. Senectus amet arcu luctus ultricies mattis mauris molestie. Aliquam fermentum habitant pellentesque ultricies nec mattis vitae dolor.\nTellus duis mi facilisi tortor urna lectus. In faucibus non viverra quis at non. Felis aliquam elementum sed ut tincidunt. Aenean a nulla luctus quam facilisi. Semper senectus arcu libero amet sagittis iaculis feugiat donec at. Magna sodales in tincidunt tellus egestas.',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Manrope',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            if (responsiveVisibility(
                              context: context,
                              phone: false,
                              tablet: false,
                            ))
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    30.0, 30.0, 30.0, 30.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Flexible(
                                      child: Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        constraints: const BoxConstraints(
                                          maxWidth: 475.0,
                                          maxHeight: 300.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: Image.asset(
                                              'assets/images/Rectangle_194.png',
                                            ).image,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        constraints: const BoxConstraints(
                                          maxWidth: 475.0,
                                          maxHeight: 300.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: Image.asset(
                                              'assets/images/Rectangle_195.png',
                                            ).image,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        constraints: const BoxConstraints(
                                          maxWidth: 475.0,
                                          maxHeight: 300.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: Image.asset(
                                              'assets/images/Rectangle_193@2x.png',
                                            ).image,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  30.0, 30.0, 30.0, 30.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Flexible(
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      constraints: const BoxConstraints(
                                        maxWidth: 475.0,
                                        maxHeight: 300.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: Image.asset(
                                            'assets/images/Rectangle_194.png',
                                          ).image,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      constraints: const BoxConstraints(
                                        maxWidth: 475.0,
                                        maxHeight: 300.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: Image.asset(
                                            'assets/images/Rectangle_195.png',
                                          ).image,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      constraints: const BoxConstraints(
                                        maxWidth: 475.0,
                                        maxHeight: 300.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: Image.asset(
                                            'assets/images/Rectangle_193@2x.png',
                                          ).image,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  30.0, 10.0, 30.0, 10.0),
                              child: Text(
                                'Lorem ipsum dolor sit amet consectetur. Duis id suspendisse neque donec scelerisque semper fringilla consectetur. Dictumst sed nullam adipiscing commodo pretium nec malesuada. Id tristique nulla sollicitudin bibendum dui. Vel nulla enim feugiat molestie elit posuere fermentum vel interdum. Vitae sit morbi eget vitae elit lectus. Enim enim id in odio. Tincidunt lacus duis vestibulum nec sapien. Ut volutpat tristique et donec nulla ut eu. Fermentum quis donec habitant amet varius cursus gravida. Maecenas est odio cursus aliquet. Dui tellus vel arcu augue venenatis vitae ornare. A pellentesque dui metus lobortis donec lorem neque pretium. Massa in malesuada pellentesque fermentum sollicitudin. Pellentesque id sed adipiscing morbi diam morbi non.\n\nEt nibh in et a. Donec a cursus eleifend interdum nulla in commodo fames at. Rutrum aliquam tortor diam nulla aenean quisque viverra suspendisse. Rutrum non elit nunc nullam consectetur nibh. Nam blandit ornare amet in phasellus turpis habitasse vivamus vitae. Aliquet aliquet vitae ultricies duis tincidunt. Vestibulum ac blandit odio volutpat viverra. Integer cursus feugiat aliquet suspendisse nisl fringilla aliquam quam. Eu morbi ut viverra in sed ac fringilla eget. Pharetra erat et tellus ornare a.\n\nMauris ornare felis nisl interdum maecenas ultrices amet eros ac. Enim iaculis donec ipsum sit senectus vulputate. Nibh sollicitudin elit lorem habitasse maecenas amet facilisis ut. Morbi tellus consectetur praesent bibendum eu facilisis egestas. Phasellus dolor pharetra ornare lectus ultricies velit eget volutpat. Neque tempor consectetur cursus in viverra nec.\n\nPellentesque amet aliquet purus ac porta donec nullam tincidunt in. Enim mi vehicula mauris vitae. Phasellus tristique velit egestas donec lobortis. Senectus amet arcu luctus ultricies mattis mauris molestie. Aliquam fermentum habitant pellentesque ultricies nec mattis vitae dolor.\nTellus duis mi facilisi tortor urna lectus. In faucibus non viverra quis at non. Felis aliquam elementum sed ut tincidunt. Aenean a nulla luctus quam facilisi. Semper senectus arcu libero amet sagittis iaculis feugiat donec at. Magna sodales in tincidunt tellus egestas.',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Manrope',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  30.0, 30.0, 30.0, 30.0),
                              child: Container(
                                width: double.infinity,
                                height: 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  30.0, 0.0, 30.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 30.0, 10.0),
                                      child: Text(
                                        'Related blogs',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Manrope',
                                              fontSize: 32.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (responsiveVisibility(
                              context: context,
                              desktop: false,
                            ))
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    30.0, 30.0, 30.0, 30.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (responsiveVisibility(
                                          context: context,
                                          phone: false,
                                          tablet: false,
                                          tabletLandscape: false,
                                        ))
                                          Container(
                                            width: double.infinity,
                                            height: double.infinity,
                                            constraints: const BoxConstraints(
                                              maxWidth: 475.0,
                                              maxHeight: 300.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: Image.asset(
                                                  'assets/images/Rectangle_194.png',
                                                ).image,
                                              ),
                                            ),
                                          ),
                                        if (responsiveVisibility(
                                          context: context,
                                          phone: false,
                                          tablet: false,
                                          tabletLandscape: false,
                                        ))
                                          Container(
                                            width: double.infinity,
                                            height: double.infinity,
                                            constraints: const BoxConstraints(
                                              maxWidth: 475.0,
                                              maxHeight: 300.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: Image.asset(
                                                  'assets/images/Rectangle_194.png',
                                                ).image,
                                              ),
                                            ),
                                          ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 10.0),
                                          child: Text(
                                            '22 Jul, 2024',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Manrope',
                                                  fontSize: 20.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 10.0),
                                          child: Text(
                                            'Learn how to integrate Nimbus with other popular tools and platforms like Google Workspace, Microsoft Office 365, Slack, and more.',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Manrope',
                                                  fontSize: 20.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 10.0),
                                          child: Text(
                                            'Integrating Nimbus with Other Tools: A Step-by-Step Guide',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Manrope',
                                                  fontSize: 24.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          constraints: const BoxConstraints(
                                            maxWidth: 475.0,
                                            maxHeight: 300.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: Image.asset(
                                                'assets/images/Rectangle_194.png',
                                              ).image,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 10.0),
                                          child: Text(
                                            '22 Jul, 2024',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Manrope',
                                                  fontSize: 20.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 10.0),
                                          child: Text(
                                            'Integrating Nimbus with Other Tools: A Step-by-Step Guide',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Manrope',
                                                  fontSize: 24.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 10.0),
                                          child: Text(
                                            'Learn how to integrate Nimbus with other popular tools and platforms like Google Workspace, Microsoft Office 365, Slack, and more.',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Manrope',
                                                  fontSize: 20.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          constraints: const BoxConstraints(
                                            maxWidth: 475.0,
                                            maxHeight: 300.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: Image.asset(
                                                'assets/images/Rectangle_194.png',
                                              ).image,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 10.0),
                                          child: Text(
                                            '22 Jul, 2024',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Manrope',
                                                  fontSize: 20.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 10.0),
                                          child: Text(
                                            'Integrating Nimbus with Other Tools: A Step-by-Step Guide',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Manrope',
                                                  fontSize: 24.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 10.0),
                                          child: Text(
                                            'Learn how to integrate Nimbus with other popular tools and platforms like Google Workspace, Microsoft Office 365, Slack, and more.',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Manrope',
                                                  fontSize: 20.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            if (responsiveVisibility(
                              context: context,
                              phone: false,
                              tablet: false,
                              tabletLandscape: false,
                            ))
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    30.0, 30.0, 30.0, 30.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Flexible(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            height: double.infinity,
                                            constraints: const BoxConstraints(
                                              maxWidth: 475.0,
                                              maxHeight: 300.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: Image.asset(
                                                  'assets/images/Rectangle_194.png',
                                                ).image,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 10.0),
                                            child: Text(
                                              '22 Jul, 2024',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 10.0),
                                            child: Text(
                                              'Learn how to integrate Nimbus with other popular tools and platforms like Google Workspace, Microsoft Office 365, Slack, and more.',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 10.0),
                                            child: Text(
                                              'Integrating Nimbus with Other Tools: A Step-by-Step Guide',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        fontSize: 24.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Flexible(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            height: double.infinity,
                                            constraints: const BoxConstraints(
                                              maxWidth: 475.0,
                                              maxHeight: 300.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: Image.asset(
                                                  'assets/images/Rectangle_194.png',
                                                ).image,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 10.0),
                                            child: Text(
                                              '22 Jul, 2024',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 10.0),
                                            child: Text(
                                              'Integrating Nimbus with Other Tools: A Step-by-Step Guide',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        fontSize: 24.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 10.0),
                                            child: Text(
                                              'Learn how to integrate Nimbus with other popular tools and platforms like Google Workspace, Microsoft Office 365, Slack, and more.',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Flexible(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            height: double.infinity,
                                            constraints: const BoxConstraints(
                                              maxWidth: 475.0,
                                              maxHeight: 300.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: Image.asset(
                                                  'assets/images/Rectangle_194.png',
                                                ).image,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 10.0),
                                            child: Text(
                                              '22 Jul, 2024',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 10.0),
                                            child: Text(
                                              'Integrating Nimbus with Other Tools: A Step-by-Step Guide',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        fontSize: 24.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 10.0),
                                            child: Text(
                                              'Learn how to integrate Nimbus with other popular tools and platforms like Google Workspace, Microsoft Office 365, Slack, and more.',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            wrapWithModel(
                              model: _model.footerModel,
                              updateCallback: () => safeSetState(() {}),
                              child: const FooterWidget(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
