// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class AdminList extends StatefulWidget {
  const AdminList({Key? key}) : super(key: key);

  @override
  State<AdminList> createState() => _AdminListState();
}

class _RestorableDessertSelections extends RestorableProperty<Set<int>> {
  Set<int> _dessertSelections = {};

  /// Returns whether or not a dessert row is selected by index.
  bool isSelected(int index) => _dessertSelections.contains(index);

  // /// Takes a list of [_Dessert]s and saves the row indices of selected rows
  // /// into a [Set].
  // void setDessertSelections(List<_Dessert> desserts) {
  //   final updatedSet = <int>{};
  //   for (var i = 0; i < desserts.length; i += 1) {
  //     var dessert = desserts[i];
  //     if (dessert.selected) {
  //       updatedSet.add(i);
  //     }
  //   }
  //   _dessertSelections = updatedSet;
  //   notifyListeners();
  // }

  @override
  Set<int> createDefaultValue() => _dessertSelections;

  @override
  Set<int> fromPrimitives(Object? data) {
    final selectedItemIndices = data as List<dynamic>;
    _dessertSelections = {
      ...selectedItemIndices.map<int>((dynamic id) => id as int),
    };
    return _dessertSelections;
  }

  @override
  void initWithValue(Set<int> value) {
    _dessertSelections = value;
  }

  @override
  Object toPrimitives() => _dessertSelections.toList();
}

class _AdminListState extends State<AdminList> with RestorationMixin {
  final _RestorableDessertSelections _dessertSelections =
      _RestorableDessertSelections();
  final RestorableInt _rowIndex = RestorableInt(0);
  final RestorableInt _rowsPerPage =
      RestorableInt(PaginatedDataTable.defaultRowsPerPage);
  final RestorableBool _sortAscending = RestorableBool(true);
  final RestorableIntN _sortColumnIndex = RestorableIntN(null);
  _DessertDataSource? _dessertsDataSource;

  int pageIndex = 0;
  late PageController controller;
  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  //This is for blood group dropdown form
  List<String> items = ["A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"];
  String? selectBloodGroup;

  //This is for gender dropdown form
  List<String> genderList = ["Male", "Female", "Other"];
  String? selectGender;

  @override
  String get restorationId => 'data_table_demo';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_dessertSelections, 'selected_row_indices');
    registerForRestoration(_rowIndex, 'current_row_index');
    registerForRestoration(_rowsPerPage, 'rows_per_page');
    registerForRestoration(_sortAscending, 'sort_ascending');
    registerForRestoration(_sortColumnIndex, 'sort_column_index');

    _dessertsDataSource ??= _DessertDataSource(context, controller);
    switch (_sortColumnIndex.value) {
      case 0:
        _dessertsDataSource!._sort<num>((d) => d.id, _sortAscending.value);
        break;
      case 1:
        _dessertsDataSource!
            ._sort<String>((d) => d.firstName, _sortAscending.value);
        break;
      case 2:
        _dessertsDataSource!
            ._sort<String>((d) => d.lastName, _sortAscending.value);
        break;
      case 3:
        _dessertsDataSource!
            ._sort<String>((d) => d.username, _sortAscending.value);
        break;
      case 4:
        _dessertsDataSource!
            ._sort<String>((d) => d.email, _sortAscending.value);
        break;
    }
    // _dessertsDataSource!.updateSelectedDesserts(_dessertSelections);
    // _dessertsDataSource!.addListener(_updateSelectedDessertRowListener);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _dessertsDataSource ??= _DessertDataSource(context, controller);
    //_dessertsDataSource!.addListener(_updateSelectedDessertRowListener);
  }

  // void _updateSelectedDessertRowListener() {
  //   _dessertSelections.setDessertSelections(_dessertsDataSource!._desserts);
  // }

  void _sort<T>(
    Comparable<T> Function(_Dessert d) getField,
    int columnIndex,
    bool ascending,
  ) {
    _dessertsDataSource!._sort<T>(getField, ascending);
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
    // _dessertsDataSource!.removeListener(_updateSelectedDessertRowListener);
    _dessertsDataSource!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final localizations = GalleryLocalizations.of(context)!;
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller,
      children: [
        ListView(
          restorationId: 'data_table_list_view',
          //padding: const EdgeInsets.all(16),
          children: [
            PaginatedDataTable(
              showCheckboxColumn: false,
              actions: [
                Container(
                  height: 30,
                  child: ElevatedButton(
                      onPressed: () {
                        controller.jumpToPage(1);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      child: const Text(
                        "Add",
                        style: TextStyle(fontSize: 16.0),
                      )),
                ),
                // Container(
                //   height: 30,
                //   child: ElevatedButton(
                //       onPressed: () {},
                //       child: const Text(
                //         "Delete",
                //         style: TextStyle(fontSize: 16.0),
                //       )),
                // ),
              ],
              header: Text(
                "Administrators",
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
                print("onPageChanged $rowIndex");
                setState(() {
                  _rowIndex.value = rowIndex;
                });
              },
              sortColumnIndex: _sortColumnIndex.value,
              sortAscending: _sortAscending.value,
              columns: [
                DataColumn(
                  label: const Text("Id"),
                  onSort: (columnIndex, ascending) =>
                      _sort<num>((d) => d.id, columnIndex, ascending),
                ),
                DataColumn(
                  label: const Text("First Name"),
                  onSort: (columnIndex, ascending) =>
                      _sort<String>((d) => d.firstName, columnIndex, ascending),
                ),
                DataColumn(
                  label: const Text("Last Name"),
                  onSort: (columnIndex, ascending) =>
                      _sort<String>((d) => d.email, columnIndex, ascending),
                ),
                DataColumn(
                  label: const Text("Username"),
                  onSort: (columnIndex, ascending) =>
                      _sort<String>((d) => d.username, columnIndex, ascending),
                ),
                DataColumn(
                  label: const Text("email"),
                  onSort: (columnIndex, ascending) =>
                      _sort<String>((d) => d.email, columnIndex, ascending),
                ),
                const DataColumn(
                  label: Text("action"),
                ),
              ],
              source: _dessertsDataSource!,
            ),
          ],
        ),
        ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        controller.jumpToPage(0);
                      },
                      iconSize: 25.0,
                      icon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Theme.of(context).textTheme.headline2!.color,
                      )),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    "Administrator Form",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ],
              ),
            ),
            const Divider(
              height: 1,
              thickness: 1,
            ),
            Container(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Flexible(
                        child: AddNewDonorTextFormField(
                          hintText: "First Name",
                          textInputType: TextInputType.text,
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Flexible(
                        child: AddNewDonorTextFormField(
                          hintText: "Last Name",
                          textInputType: TextInputType.text,
                        ),
                      ),
                      Spacer()
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: const [
                      Flexible(
                        child: AddNewDonorTextFormField(
                          hintText: "Username",
                          textInputType: TextInputType.number,
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Flexible(
                        child: AddNewDonorTextFormField(
                          hintText: "Email",
                          textInputType: TextInputType.text,
                        ),
                      ),
                      Spacer()
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: const [
                      Flexible(
                        child: AddNewDonorTextFormField(
                          hintText: "Password",
                          textInputType: TextInputType.text,
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Flexible(
                        child: AddNewDonorTextFormField(
                          hintText: "Confirm Password",
                          textInputType: TextInputType.text,
                        ),
                      ),
                      Spacer()
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        // width: SizeConfig.blockSizeHorizontal! * 40,
                        child: SizedBox(
                          height: 35,
                          child: ElevatedButton(
                              onPressed: () {},
                              child: const Text(
                                "Submit",
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.white),
                              )),
                        ),
                      ),
                      Spacer()
                    ],
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}

class AddNewDonorTextFormField extends StatelessWidget {
  const AddNewDonorTextFormField(
      {Key? key, this.hintText, this.controller, this.textInputType})
      : super(key: key);

  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        isDense: true,
        contentPadding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
        labelStyle: TextStyle(
            fontSize: 16.0, color: const Color(0xFF000000).withOpacity(0.6)),
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: const Color(0xFF000000).withOpacity(0.38)),
            borderRadius: const BorderRadius.all(Radius.circular(10.0))),
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: const Color(0xFF000000).withOpacity(0.38)),
            borderRadius: const BorderRadius.all(Radius.circular(10.0))),
        border: OutlineInputBorder(
            borderSide:
                BorderSide(color: const Color(0xFF000000).withOpacity(0.38)),
            borderRadius: const BorderRadius.all(Radius.circular(10.0))),
      ),
    );
  }
}

class _Dessert {
  _Dessert(this.id, this.firstName, this.lastName, this.email, this.username);

  final int id;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
}

class _DessertDataSource extends DataTableSource {
  _DessertDataSource(this.context, this.controller) {
    _desserts = <_Dessert>[
      _Dessert(
        1,
        "firstname",
        "lastname",
        "username",
        "a@b.com",
      ),
      _Dessert(
        1,
        "firstname",
        "lastname",
        "username",
        "a@b.com",
      ),
      _Dessert(
        1,
        "firstname",
        "lastname",
        "username",
        "a@b.com",
      ),
      _Dessert(
        1,
        "firstname",
        "lastname",
        "username",
        "a@b.com",
      ),
      _Dessert(
        1,
        "firstname",
        "lastname",
        "username",
        "a@b.com",
      ),
      _Dessert(
        1,
        "firstname",
        "lastname",
        "username",
        "a@b.com",
      ),
      _Dessert(
        1,
        "firstname",
        "lastname",
        "username",
        "a@b.com",
      ),
      _Dessert(
        1,
        "firstname",
        "lastname",
        "username",
        "a@b.com",
      ),
      _Dessert(
        1,
        "firstname",
        "lastname",
        "username",
        "a@b.com",
      ),
      _Dessert(
        1,
        "firstname",
        "lastname",
        "username",
        "a@b.com",
      ),
    ];
  }

  final BuildContext context;
  late List<_Dessert> _desserts;

  final PageController controller;

  void _sort<T>(Comparable<T> Function(_Dessert d) getField, bool ascending) {
    _desserts.sort((a, b) {
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
  //   for (var i = 0; i < _desserts.length; i += 1) {
  //     var dessert = _desserts[i];
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
    assert(index >= 0);
    if (index >= _desserts.length) return null;
    final dessert = _desserts[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(dessert.id.toString())),
        DataCell(Text(dessert.firstName)),
        DataCell(Text(dessert.lastName)),
        DataCell(Text(dessert.username)),
        DataCell(Text(dessert.email)),
        DataCell(Row(
          children: [
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.black54),
              onPressed: () {
                controller.jumpToPage(1);
              },
              child: const Text(
                "Edit",
                style: TextStyle(fontSize: 12),
              ),
            ),
            TextButton(
              onPressed: () {
                controller.jumpToPage(1);
              },
              child: const Text(
                "Delete",
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        )),
      ],
    );
  }

  @override
  int get rowCount => _desserts.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}
