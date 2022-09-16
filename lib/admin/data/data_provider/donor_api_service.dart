import 'dart:convert';

import 'package:blood_donation/admin/data/model/donor_info/donor_data.dart';
import 'package:blood_donation/admin/data/model/donor_info/donor_details.dart';
import 'package:blood_donation/admin/data/model/donor_info/single%20donor%20info/single_donor_data.dart';
import 'package:dio/dio.dart';

import '../../../constant/admin/admin_constant.dart';
import '../service/api_interceptor.dart';
import '../service/api_service.dart';

class DonorApiService {
  //get all list of donor
  Future<DonorDetails> getDonorDetails() async {
    Response response =
        await ApiService.dio.get("$kDefaultAdminBaseUrl/v1/donor/all");

    if (response.statusCode == 200) {
      var data = DonorDetails.fromJson(response.data);
      //  print(data);
      return data;
    } else {
      throw BadRequestException(response.requestOptions);
    }
  }

  //get specific donor data
  Future<SingleDonorData> getSingleDonorDetails(int id) async {
    Response response = await ApiService.dio
        .get("$kDefaultAdminBaseUrl/v1/donor/get-detail?donor_info=$id");

    if (response.statusCode == 200) {
      var data = SingleDonorData.fromJson(response.data);
      //  print(data);
      return data;
    } else {
      throw BadRequestException(response.requestOptions);
    }
  }

  //To add new donor
  Future<Map<String, dynamic>> addNewDonor(
      Map<String, dynamic> donorData) async {
    String body = json.encode(donorData);
    print(body);

    Response response = await ApiService.dio
        .post("$kDefaultAdminBaseUrl/v1/donor/create-new", data: body);
    if (response.statusCode == 200) {
      var data = response.data;
      return data;
    } else {
      throw BadRequestException(response.requestOptions);
    }
  }

  //update donor
  Future<Map<String, dynamic>> updateNewDonor(
      Map<String, dynamic> donorData) async {
    String body = json.encode(donorData);
    print(body);

    Response response = await ApiService.dio
        .put("$kDefaultAdminBaseUrl/v1/donor/update", data: body);
    if (response.statusCode == 200) {
      var data = response.data;
      return data;
    } else {
      throw BadRequestException(response.requestOptions);
    }
  }

  //Delete donor
  Future<Map<String, dynamic>> deleteNewDonor(int id) async {
    Response response = await ApiService.dio
        .delete("$kDefaultAdminBaseUrl/v1/donor/delete?id=$id");
    if (response.statusCode == 200) {
      var data = response.data;
      return data;
    } else {
      throw BadRequestException(response.requestOptions);
    }
  }
}
