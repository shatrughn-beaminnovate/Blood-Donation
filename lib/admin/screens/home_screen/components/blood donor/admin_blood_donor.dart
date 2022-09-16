// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:blood_donation/admin/controller/donor%20details/donor_data_api_fetch_bloc.dart';
import 'package:blood_donation/admin/data/model/donor_info/donor_details.dart';
import 'package:blood_donation/admin/screens/home_screen/components/blood%20donor/components/add_new_donor_form.dart';
import 'package:blood_donation/constant/size_config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminBloodDonor extends StatefulWidget {
  const AdminBloodDonor({Key? key}) : super(key: key);

  @override
  State<AdminBloodDonor> createState() => _AdminBloodDonorState();
}

class _RestorableDessertSelections extends RestorableProperty<Set<int>> {
  Set<int> _donorDataelections = {};

  /// Returns whether or not a dessert row is selected by index.
  bool isSelected(int index) => _donorDataelections.contains(index);

  /// Takes a list of [_Donor]s and saves the row indices of selected rows
  /// into a [Set].
  // void setDessertSelections(List<_Donor> desserts) {
  //   final updatedSet = <int>{};
  //   for (var i = 0; i < desserts.length; i += 1) {
  //     var dessert = desserts[i];
  //     if (dessert.selected) {
  //       updatedSet.add(i);
  //     }
  //   }
  //   _donorDataelections = updatedSet;
  //   notifyListeners();
  // }

  @override
  Set<int> createDefaultValue() => _donorDataelections;

  @override
  Set<int> fromPrimitives(Object? data) {
    final selectedItemIndices = data as List<dynamic>;
    _donorDataelections = {
      ...selectedItemIndices.map<int>((dynamic id) => id as int),
    };
    return _donorDataelections;
  }

  @override
  void initWithValue(Set<int> value) {
    _donorDataelections = value;
  }

  @override
  Object toPrimitives() => _donorDataelections.toList();
}

class _AdminBloodDonorState extends State<AdminBloodDonor>
    with RestorationMixin {
  final _RestorableDessertSelections _donorDataelections =
      _RestorableDessertSelections();
  final RestorableInt _rowIndex = RestorableInt(0);
  final RestorableInt _rowsPerPage =
      RestorableInt(PaginatedDataTable.defaultRowsPerPage);
  final RestorableBool _sortAscending = RestorableBool(true);
  final RestorableIntN _sortColumnIndex = RestorableIntN(null);
  _DonorDataSource? _donorDataDataSource;

  //creating bloc instance
  DonorDataApiFetchBloc donorDataApiFetchBloc = DonorDataApiFetchBloc();

  DonorDetails? donorDetails;

  @override
  void initState() {
    super.initState();
  }

  @override
  String get restorationId => 'data_table_demo';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_donorDataelections, 'selected_row_indices');
    registerForRestoration(_rowIndex, 'current_row_index');
    registerForRestoration(_rowsPerPage, 'rows_per_page');
    registerForRestoration(_sortAscending, 'sort_ascending');
    registerForRestoration(_sortColumnIndex, 'sort_column_index');

    _donorDataDataSource ??=
        _DonorDataSource(context, [], donorDataApiFetchBloc);
    switch (_sortColumnIndex.value) {
      case 0:
        _donorDataDataSource!._sort<num>((d) => d.id, _sortAscending.value);
        break;
      case 1:
        _donorDataDataSource!
            ._sort<String>((d) => d.name, _sortAscending.value);
        break;
      case 2:
        _donorDataDataSource!
            ._sort<String>((d) => d.email, _sortAscending.value);
        break;
      case 3:
        _donorDataDataSource!._sort<num>((d) => d.phone, _sortAscending.value);
        break;
      case 4:
        _donorDataDataSource!
            ._sort<String>((d) => d.bloodGroup, _sortAscending.value);
        break;
      case 5:
        _donorDataDataSource!
            ._sort<String>((d) => d.gender, _sortAscending.value);
        break;
      case 6:
        _donorDataDataSource!._sort<num>((d) => d.age, _sortAscending.value);
        break;
      case 7:
        _donorDataDataSource!
            ._sort<String>((d) => d.donationHistory, _sortAscending.value);
        break;
    }
    // _donorDataDataSource!.updateSelectedDesserts(_donorDataelections);
    // _donorDataDataSource!.addListener(_updateSelectedDessertRowListener);
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   //_donorDataDataSource ??= _DonorDataSource(context, controller);
  //   _donorDataDataSource!.addListener(_updateSelectedDessertRowListener);
  // }

  // void _updateSelectedDessertRowListener() {
  //   _donorDataelections.setDessertSelections(_donorDataDataSource!._donorData);
  // }

  void _sort<T>(
    Comparable<T> Function(_Donor d) getField,
    int columnIndex,
    bool ascending,
  ) {
    _donorDataDataSource!._sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex.value = columnIndex;
      _sortAscending.value = ascending;
    });
  }

  @override
  void dispose() {
    _rowsPerPage.dispose();
    _sortColumnIndex.dispose();
    _sortAscending.dispose();
    // _donorDataDataSource!.removeListener(_updateSelectedDessertRowListener);
    _donorDataDataSource!.dispose();
    super.dispose();
  }

  List<_Donor> setDonorData(DonorDetails donorDetails) {
    List<_Donor> donor = [];
    for (var element in donorDetails.data!) {
      donor.add(_Donor(
          element.id!,
          element.name!,
          element.email ?? " ",
          element.mobile_no_1!,
          element.blood_group!,
          element.gender ?? " ",
          element.age!,
          element.donated_blood_date!));
    }
    return donor;
  }

  //pushing to next screen and callback navigation
  Future<void> _navigateAndDisplaySelection(BuildContext context) async {
    // final result = await Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //       builder: (context) =>
    //           const SelectionScreen()),
    // );
    final result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const AddNewDonorForm(
          title: "Add New Donor", purpose: "add", id: 0);
    }));

    if (!mounted) return;
    print(result);
    if (result != null) {
      donorDataApiFetchBloc.add(const LoadDonorData());
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
          content: Text(
            result,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
          backgroundColor: Colors.green,
          dismissDirection: DismissDirection.up,
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(
              top: 20,
              bottom: MediaQuery.of(context).size.height - 110,
              right: SizeConfig.blockSizeHorizontal! * 30,
              left: SizeConfig.blockSizeHorizontal! * 30),
        ));
    }
  }

  @override
  Widget build(BuildContext context) {
    //final localizations = GalleryLocalizations.of(context)!;
    return BlocProvider(
      create: (context) => donorDataApiFetchBloc..add(const LoadDonorData()),
      child: BlocListener<DonorDataApiFetchBloc, DonorDataApiFetchState>(
        listener: (context, state) {
          if (state is DonorDataApiFetchLoaded) {
            setState(() {
              donorDetails = state.donorDetails;

              _donorDataDataSource = _DonorDataSource(
                  context, setDonorData(donorDetails!), donorDataApiFetchBloc);
            });
          }
          if (state is DonorDeletedSuccess) {
            setState(() {
              donorDetails!.data!.removeWhere(
                  (element) => element.id == state.deleteDonorResponse["data"]);
              _donorDataDataSource = _DonorDataSource(
                  context, setDonorData(donorDetails!), donorDataApiFetchBloc);
            });
            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text(
                  state.deleteDonorResponse["message"],
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
                backgroundColor: Colors.green,
                dismissDirection: DismissDirection.up,
                duration: const Duration(seconds: 2),
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.only(
                    top: 20,
                    bottom: MediaQuery.of(context).size.height - 110,
                    right: SizeConfig.blockSizeHorizontal! * 30,
                    left: SizeConfig.blockSizeHorizontal! * 30),
              ));
          }
        },
        child: ListView(
          restorationId: 'data_table_list_view',
          //padding: const EdgeInsets.all(16),
          children: [
            BlocBuilder<DonorDataApiFetchBloc, DonorDataApiFetchState>(
              builder: (context, state) {
                if (state is DonorDataApiFetchLoading) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: SizeConfig.blockSizeVertical! * 45,
                      ),
                      const CircularProgressIndicator(
                        strokeWidth: 5,
                      ),
                    ],
                  );
                }

                if (state is DonorDataApiFetchEmpty) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Text(
                              "Blood Donor List",
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            Spacer(),
                            Container(
                              height: 30,
                              child: ElevatedButton(
                                  onPressed: () {
                                    _navigateAndDisplaySelection(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue),
                                  child: const Text(
                                    "Add",
                                    style: TextStyle(fontSize: 16.0),
                                  )),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        height: 1,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical! * 40,
                      ),
                      Text(
                        state.message,
                        style: Theme.of(context).textTheme.headline3,
                      )
                    ],
                  );
                }
                if (state is DonorDataApiFetchFailure) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: SizeConfig.blockSizeVertical! * 45,
                      ),
                      Text(
                        state.message,
                        style: Theme.of(context).textTheme.headline3,
                      )
                    ],
                  );
                }
                return PaginatedDataTable(
                  actions: [
                    Container(
                      height: 30,
                      child: ElevatedButton(
                          onPressed: () {
                            _navigateAndDisplaySelection(context);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue),
                          child: const Text(
                            "Add",
                            style: TextStyle(fontSize: 16.0),
                          )),
                    ),
                  ],
                  header: Text(
                    "Blood Donor List",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  rowsPerPage: _rowsPerPage.value,
                  onRowsPerPageChanged: (value) {
                    print("onRowsPerPageChanged $value");
                    setState(() {
                      _rowsPerPage.value = value!;
                    });
                  },
                  initialFirstRowIndex: _rowIndex.value,
                  onPageChanged: (rowIndex) {
                    print("onPageChanged ");
                    setState(() {
                      _rowIndex.value = rowIndex;
                    });
                  },
                  sortColumnIndex: _sortColumnIndex.value,
                  sortAscending: _sortAscending.value,
                  //onSelectAll: _donorDataDataSource!._selectAll,
                  columns: [
                    DataColumn(
                      label: const Text("Id"),
                      numeric: false,
                      onSort: (columnIndex, ascending) =>
                          _sort<num>((d) => d.id, columnIndex, ascending),
                    ),
                    DataColumn(
                      label: const Text("Name"),
                      onSort: (columnIndex, ascending) =>
                          _sort<String>((d) => d.name, columnIndex, ascending),
                    ),
                    DataColumn(
                      label: const Text("Email"),
                      onSort: (columnIndex, ascending) =>
                          _sort<String>((d) => d.email, columnIndex, ascending),
                    ),
                    DataColumn(
                      label: const Text("Phone"),
                      onSort: (columnIndex, ascending) =>
                          _sort<num>((d) => d.phone, columnIndex, ascending),
                    ),
                    DataColumn(
                      label: const Text("Blood group"),
                      onSort: (columnIndex, ascending) => _sort<String>(
                          (d) => d.bloodGroup, columnIndex, ascending),
                    ),
                    DataColumn(
                      label: const Text("Gender"),
                      onSort: (columnIndex, ascending) => _sort<String>(
                          (d) => d.gender, columnIndex, ascending),
                    ),
                    DataColumn(
                      label: const Text("Age"),
                      numeric: true,
                      onSort: (columnIndex, ascending) =>
                          _sort<num>((d) => d.age, columnIndex, ascending),
                    ),
                    const DataColumn(
                      label: Text("Action"),
                    ),
                  ],
                  source: _donorDataDataSource!,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _Donor {
  _Donor(this.id, this.name, this.email, this.phone, this.bloodGroup,
      this.gender, this.age, this.donationHistory);

  final int id;
  final String name;
  final String email;
  final int phone;
  final String bloodGroup;
  final String gender;
  final int age;
  final String donationHistory;
  // bool selected = false;
}

class _DonorDataSource extends DataTableSource {
  _DonorDataSource(this.context, this._donorData, this.donorDataApiFetchBloc);

  final BuildContext context;
  final List<_Donor> _donorData;
  final DonorDataApiFetchBloc donorDataApiFetchBloc;

  void _sort<T>(Comparable<T> Function(_Donor d) getField, bool ascending) {
    _donorData.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });
    notifyListeners();
  }

  int _selectedCount = 0;

  // void updateSelectedDesserts(_RestorableDessertSelections selectedRows) {
  //   _selectedCount = 0;
  //   for (var i = 0; i < _donorData.length; i += 1) {
  //     var dessert = _donorData[i];
  //     if (selectedRows.isSelected(i)) {
  //       dessert.selected = true;
  //       _selectedCount += 1;
  //     } else {
  //       dessert.selected = false;
  //     }
  //   }
  //   notifyListeners();
  // }

  @override
  DataRow? getRow(int index) {
    final format = NumberFormat.decimalPercentPattern(
      decimalDigits: 0,
    );
    assert(index >= 0);
    if (index >= _donorData.length) return null;
    final dessert = _donorData[index];
    return DataRow.byIndex(
      index: index,
      //selected: dessert.selected,
      // onSelectChanged: (value) {
      //   if (dessert.selected != value) {
      //     _selectedCount += value! ? 1 : -1;
      //     assert(_selectedCount >= 0);
      //     dessert.selected = value;
      //     notifyListeners();
      //   }
      // },
      cells: [
        DataCell(Text(dessert.id.toString())),
        DataCell(Text(dessert.name)),
        DataCell(Text(dessert.email)),
        DataCell(Text(dessert.phone.toString())),
        DataCell(Text(dessert.bloodGroup)),
        DataCell(Text(dessert.gender)),
        DataCell(Text(dessert.age.toString())),
        DataCell(Row(
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AddNewDonorForm(
                      title: "Donor Info", purpose: "edit", id: dessert.id);
                }));
              },
              child: Text(
                "Edit",
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).colorScheme.onSurface,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Confirm Delete'),
                    content: const Text(
                        'Are you sure you want to delete this donor?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => donorDataApiFetchBloc
                            .add(DeleteDonorData(dessert.id)),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text(
                "Delete",
                style: TextStyle(
                  fontSize: 12,
                  height: 1.2,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        )),
      ],
    );
  }

  @override
  int get rowCount => _donorData.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  // void _selectAll(bool? checked) {
  //   for (final dessert in _donorData) {
  //     dessert.selected = checked ?? false;
  //   }
  //   _selectedCount = checked! ? _donorData.length : 0;
  //   notifyListeners();
  // }
}
