import 'package:blood_donation/admin/data/data_provider/donor_api_service.dart';

import '../model/donor_info/donor_details.dart';
import '../model/donor_info/single donor info/single_donor_data.dart';

class DonorRepository {
  DonorApiService donorApiService = DonorApiService();

  Future<DonorDetails> getDonorDetails() {
    return donorApiService.getDonorDetails();
  }

  Future<SingleDonorData> getSingleDonorDetails(int id) {
    return donorApiService.getSingleDonorDetails(id);
  }

  Future<Map<String, dynamic>> addNewDonor(Map<String, dynamic> donorData) {
    return donorApiService.addNewDonor(donorData);
  }

  //update donor
  Future<Map<String, dynamic>> updateNewDonor(Map<String, dynamic> donorData) {
    return donorApiService.updateNewDonor(donorData);
  }

  //Delete donor
  Future<Map<String, dynamic>> deleteNewDonor(int id) {
    return donorApiService.deleteNewDonor(id);
  }
}
