import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:vost/common/event.dart';
import 'package:vost/domain/models/occurrence_model.dart';
import 'package:vost/keys.dart';
import 'package:vost/localization/vost_localizations.dart';
import 'package:vost/presentation/assets/colors.dart';
import 'package:vost/presentation/assets/dimensions.dart';
import 'package:vost/presentation/assets/error_messages.dart';
import 'package:vost/presentation/assets/text_styles.dart';
import 'package:vost/presentation/navigation/navigation.dart';
import 'package:vost/presentation/ui/_base/base_page.dart';
import 'package:vost/presentation/ui/home/home_bloc.dart';
import 'package:vost/presentation/ui/utils/occurrences_list_item.dart';
import 'package:vost/presentation/utils/misc.dart';

class HomePage extends BasePage<HomeBloc> {
  HomePage({Key key, this.title, HomeBloc bloc}) : super(key: key, bloc: bloc);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends BaseState<HomePage> {
  @override
  void initState() {
    super.initState();
    // this will help us fetch new data from the server
    widget.bloc.fetchNewDataSink.add(Event());

    // initialize the pages
    _initializePages();
  }

  List<Widget> _pages = [];

  void _initializePages() {
    _pages.add(RecentListWidget(widget.bloc));
    _pages.add(MapWidget(widget.bloc));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: StreamBuilder<int>(
          initialData: widget.bloc.currentPageSubject.value,
          stream: widget.bloc.currentPageStream,
          builder: (context, snapshot) {
            return _pages[snapshot.data];
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: StreamBuilder<int>(
          initialData: widget.bloc.currentPageSubject.value,
          stream: widget.bloc.currentPageStream,
          builder: (context, snapshot) {
            return FloatingActionButton(
              onPressed: _onToggleViewTap,
              child: Icon(
                  snapshot.data == HomeBloc.listIndex ? Icons.list : Icons.map),
              elevation: 2.0,
              backgroundColor: colorPrimary,
              foregroundColor: Colors.white,
            );
          }),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            StreamBuilder<int>(
                initialData: widget.bloc.currentTypeOfDataSubject.value,
                stream: widget.bloc.currentTypeOfDataStream,
                builder: (context, snapshot) {
                  return Container(
                    margin: EdgeInsets.only(right: marginSmall),
                    child: InkWell(
                      onTap: _onToggleTypeTap,
                      child: SizedBox(
                        // we find the biggest possible string and give it a margin
                        width: _findBiggestTextWidth(),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            IconButton(
                              padding: EdgeInsets.only(
                                  left: marginSmall,
                                  right: marginSmall,
                                  top: marginSmall),
                              icon: Icon(snapshot.data == HomeBloc.recentsIndex
                                  ? Icons.list
                                  : Icons.star),
                              onPressed: null,
                              // since the onClick is handled by another widget, this
                              // button is disabled
                              disabledColor: Theme.of(context).primaryColor,
                            ),
                            Text(
                              snapshot.data == HomeBloc.recentsIndex
                                  ? VostLocalizations.of(context)
                                      .textRecent
                                      .toUpperCase()
                                  : VostLocalizations.of(context)
                                      .textFollowing
                                      .toUpperCase(),
                              style: styleBottomBarText(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
            PopupMenuButton<String>(
              icon: Icon(Icons.more_vert),
              onSelected: choiceAction,
              itemBuilder: (BuildContext context) {
                return [
                  VostLocalizations.of(context).textAbout,
                  VostLocalizations.of(context).textReportProblem
                ].map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            )
          ],
        ),
        shape: CircularNotchedRectangle(),
        color: Colors.white,
      ),
    );
  }

  void choiceAction(String choice) {
    if (choice == VostLocalizations.of(context).textAbout) _onAboutTap();
    if (choice == VostLocalizations.of(context).textReportProblem) {
      _onReportTap();
    }
  }

  /// Finds the biggest text size in the bottom bar button so that the button is
  /// always centered
  double _findBiggestTextWidth() {
    return max(
      findTextWidth(VostLocalizations.of(context).textFollowing.toUpperCase(),
          styleBottomBarText()),
      findTextWidth(VostLocalizations.of(context).textRecent.toUpperCase(),
          styleBottomBarText()),
    );
  }

  @override
  String getMessage(String error) {
    if (error == genericErrorMessage) {
      return "Ocorreu um erro";
    }
    return "";
  }

  /// Callback to toggle between Map and List view
  void _onToggleViewTap() {
    widget.bloc.changePageSink.add(Event());
  }

  /// Callback to toggle between Map and List view
  void _onToggleTypeTap() {
    widget.bloc.changeTypeOfDataSink.add(Event());
  }

  /// Callback to navigate to About screen
  void _onAboutTap() {
    navigateToAboutScreen(context);
  }

  /// Callback to navigate to Report a Problem screen
  void _onReportTap() {
    navigateToReportAProblem(context);
  }
}

class RecentListWidget extends StatelessWidget {
  final HomeBloc bloc;

  RecentListWidget(this.bloc);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<OccurrenceModel>>(
        stream: bloc.occurrencesStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text("A carregar"));
          }

          if (snapshot.data != null) {
            return Container(
                color: Colors.white,
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    indent: 50.0,
                    thickness: 2.0,
                  ),
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return OccurrencesListItemWidget(occurrence: snapshot.data[index]);
                  },
                ));
          }
          return Container(
            child: Center(
              child: Image.asset('assets/images/vost_logo_white.png'),
            ),
          );
        });
  }
}

/*
 * Map Widget
 *
 * In order to use the map widget, a `keys.dart` file must be created at the root
 * of the project with the following constants:
 *
 * `MAPBOX_ACCESS_TOKEN` - the token for mapbox
 * `MAPBOX_URL_TEMPLATE` the template for mapbox, this can have the default value of
 *      `https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}`
 *
 * In order to have a new key, go to https://www.mapbox.com/ and create a free account
 * and a project for this open-source project
 */
class MapWidget extends StatelessWidget {
  final HomeBloc bloc;
  final MapController mapController = MapController();
  final LatLng _center = LatLng(39.806251, -8.088591);
  MapWidget(this.bloc);


  final List<Marker> _markers = List<Marker>();

  Widget _loadingWidget = Center(
    child: Container(
      color: Colors.white70,
      height: 100.0,
      child: Padding(
        padding: const EdgeInsets.all(marginSmall),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CircularProgressIndicator(
              strokeWidth: 4.0,
              valueColor: AlwaysStoppedAnimation<Color>(colorPrimary),
            ),
            Text("A carregar pontos")
          ],
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        StreamBuilder<List<OccurrenceModel>>(
            stream: bloc.occurrencesStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                _markers.clear();
                _markers.addAll(snapshot.data
                    .map((occurrence) => _createMarker(occurrence))
                    .toList());
                _loadingWidget = Container();
              }

              return Stack(
                children: <Widget>[
                  FlutterMap(
                    mapController: mapController,
                    options: MapOptions(
                      center: _center,
                      zoom: 7.0,
                      minZoom: 1.0,
                      maxZoom: 20.0,
                    ),
                    layers: [
                      TileLayerOptions(
                        urlTemplate: MAPBOX_URL_TEMPLATE,
                        additionalOptions: {
                          'accessToken': MAPBOX_ACCESS_TOKEN,
                          'id': 'mapbox.streets',
                        },
                      ),
                      MarkerLayerOptions(markers: _markers)
                    ],
                  ),
                  _loadingWidget,
                ],
              );
            }),
      ],
    );
  }

  Marker _createMarker(OccurrenceModel occurrence) {
    return new Marker(
        width: 100,
        height: 100,
        point: occurrence.coordinates,
        builder: (context) {
          return IconButton(
            icon: Icon(
              Icons.place,
              color: Colors.green,
            ),
            onPressed: () => print("clicked"),
          );
        });
  }
}
