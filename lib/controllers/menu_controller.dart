
import 'package:felpus/controllers/adoption_controller.dart';
import 'package:felpus/controllers/my_pet_controller.dart';
import 'package:felpus/utils/App_Utils/app_utils.dart';
import 'package:felpus/views/screens/adoption/create_adoption_view.dart';
import 'package:felpus/views/screens/menu/views/create_lost_pet_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'dart:developer' as print;

import '../helpers/other_helper.dart';
import '../helpers/prefs_helper.dart';
import '../services/api_service.dart';
import '../utils/App_Urls/app_urls.dart';


class MenuDataController extends GetxController {
  //TODO: Implement MenuController

  static MenuDataController get instance => Get.put(MenuDataController());

  final count = 0.obs;

  bool isLoading = false;
  String? image;

  // String selectedPet = 'Choose Your Pet';
  // final List<String> pets = [
  //   'Choose Your Pet',
  //   'Dogs',
  //   'Cats',
  //   'Birds',
  //   'Fish',
  //   'Rodents',
  //   'Rabbits',
  //   'Reptiles',
  //   'Invertebrates',
  //   'Ferrets',
  //   'Hedgehogs',
  //   'Horse'
  // ];

  // Pet breeds list containing both pets and their breeds
  final List<Map<String, dynamic>> petBreedsList = [
    {
      "category": "Dogs",
      "breeds": [
        "Labrador Retriever",
        "German Shepherd",
        "Golden Retriever",
        "Poodle",
        "French Bulldog",
        "Beagle",
        "Shih Tzu",
        "Dachshund",
        "Boxer",
        "Rottweiler"
      ]
    },
    {
      "category": "Cats",
      "breeds": [
        "Persian Cat",
        "Maine Coon",
        "Siamese Cat",
        "Bengal Cat",
        "Ragdoll",
        "Sphynx",
        "British Shorthair",
        "Scottish Fold",
        "Abyssinian",
        "Russian Blue"
      ]
    },
    {
      "category": "Birds",
      "breeds": [
        "African Grey Parrot",
        "Budgerigar",
        "Cockatiel",
        "Macaw",
        "Canary",
        "Lovebird",
        "Finch",
        "Amazon Parrot",
        "Cockatoo",
        "Eclectus Parrot"
      ]
    },
    {
      "category": "Fish",
      "breeds": [
        "Betta Fish",
        "Goldfish",
        "Guppy",
        "Angelfish",
        "Discus",
        "Clownfish",
        "Tetra",
        "Swordtail",
        "Cichlid",
        "Koi"
      ]
    },
    {
      "category": "Rodents",
      "breeds": [
        "Syrian Hamster",
        "Dwarf Hamster",
        "Guinea Pig",
        "Gerbil",
        "Mouse",
        "Chinchilla",
        "Degus",
        "Capybara",
        "Prairie Dog",
        "Rat"
      ]
    },
    {
      "category": "Rabbits",
      "breeds": [
        "Holland Lop",
        "Netherland Dwarf",
        "Flemish Giant",
        "Mini Rex",
        "English Angora",
        "Lionhead",
        "French Lop",
        "Californian Rabbit",
        "Harlequin Rabbit",
        "Silver Marten"
      ]
    },
    {
      "category": "Reptiles",
      "breeds": [
        "Leopard Gecko",
        "Ball Python",
        "Bearded Dragon",
        "Corn Snake",
        "Russian Tortoise",
        "Chameleon",
        "Green Iguana",
        "Red-Eared Slider",
        "Crested Gecko",
        "Blue-Tongued Skink"
      ]
    },
    {
      "category": "Invertebrates",
      "breeds": [
        "Tarantula",
        "Emperor Scorpion",
        "Madagascar Hissing Cockroach",
        "Hermit Crab",
        "Giant African Millipede",
        "Giant Asian Mantis",
        "Stick Insect",
        "Jumping Spider",
        "Ants",
        "Sea Monkeys"
      ]
    },
    {
      "category": "Ferrets",
      "breeds": [
        "Standard Ferret",
        "Angora Ferret",
        "Black Sable Ferret",
        "Albino Ferret",
        "Cinnamon Ferret",
        "Silver Ferret",
        "Chocolate Ferret",
        "Blaze Ferret",
        "Panda Ferret",
        "Champagne Ferret"
      ]
    },
    {
      "category": "Hedgehogs",
      "breeds": [
        "African Pygmy Hedgehog",
        "European Hedgehog",
        "Indian Long-Eared Hedgehog",
        "Algerian Hedgehog",
        "Southern White-Breasted Hedgehog",
        "Northern White-Breasted Hedgehog",
        "Egyptian Hedgehog",
        "Desert Hedgehog",
        "Somali Hedgehog",
        "Amur Hedgehog"
      ]
    },
    {
      "category": "Horse",
      "breeds": [
        "Arabian Horse",
        "Thoroughbred",
        "American Quarter Horse",
        "Friesian Horse",
        "Clydesdale",
        "Shetland Pony",
        "Appaloosa",
        "Andalusian",
        "Haflinger",
        "Belgian Draft Horse"
      ]
    }
  ];

  // Selected pet and breed
  String? selectedPet;
  String? selectedBreed;

  // Available breeds for selected pet
  List<String> availableBreeds = [];

  // Extract pet categories from petBreedsList
  List<String> get petCategories {
    return petBreedsList
        .map((category) => category['category'] as String)
        .toList();
  }

  // Method to handle pet selection
  void selectPet(String? value) {
    if (value != null) {
      selectedPet = value;

      // Find the breeds based on the selected pet
      availableBreeds = petBreedsList
          .firstWhere((category) => category['category'] == value)['breeds']
          .cast<String>();

      // Reset breed selection when pet changes
      selectedBreed = null;
      update(); // Notify UI of changes
    }
  }

  // Method to handle breed selection
  void selectBreed(String? value) {
    if (value != null) {
      selectedBreed = value;
      update(); // Notify UI of changes
    }
  }


  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController breedController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController microchipNumberController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController petTypeController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  ///<<<============ Additional text editing field to add adaptation pet =================>>>

  TextEditingController healthConditionController = TextEditingController();
  TextEditingController neuterController = TextEditingController();
  TextEditingController vaccineController = TextEditingController();
  TextEditingController temperController = TextEditingController();
  TextEditingController activityLevelController = TextEditingController();
  TextEditingController behaviorController = TextEditingController();
  TextEditingController specialNeedsController = TextEditingController();
  TextEditingController petHistoryController = TextEditingController();
  TextEditingController contactInfoController = TextEditingController();

  // selectPet(value) {
  //   selectedPet = value ?? 'Choose Your Pet';
  //   update();
  //   petTypeController.text = value;
  // }

  selectImage() async {
    image = await OtherHelper.openGallery();
    update();
  }


  ///<<<=================== Add Lost/ Found Pet Repo ======================>>>
  Future<void> addPetsRepo({required String forPets}) async {
    isLoading = true;
    update();

    Map<String, String> header = {
      'Authorization': PrefsHelper.token,
    };

    Map<String, String> body = {
      "userId": PrefsHelper.userId,
      "forPets": forPets,
      "age": ageController.text,
      "breed": breedController.text,
      "sex": genderController.text,
      "address": addressController.text,
      "description": descriptionController.text,
      "petName": nameController.text,
      "petType": petTypeController.text,
      "color" : colorController.text,
      "weight" : weightController.text,
      "microchipNumber" : microchipNumberController.text,

      ///<<<============ Additional information to add adaptation pet =================>>>
      "healthCondition" : healthConditionController.text,
      "neuter" : neuterController.text,
      "vaccine" : vaccineController.text,
      "temper" : temperController.text,
      "activityLevel" : activityLevelController.text,
      "behavior" : behaviorController.text,
      "specialNeeds" : specialNeedsController.text,
      "petHistory" : petHistoryController.text,
      "contactInformation" : contactInfoController.text
    };

    var response = await ApiService.multipartRequest(
      url: AppUrls.petsAdd,
      body: body,
      method: "POST",
      imageName: "photo",
      imagePath: image,
      header: header
    );

    print.log("Create Lost Pet Response: ${response.message}, ${response.body}");

    if (response.statusCode == 200) {
      if(forPets == "adopt"){
        AdoptionController.instance.getAdoptPetRepo();
      }
      Get.back();
      Utils.snackBarSuccessMessage("Success:", response.message);
      makeEmptyTextField();
    } else {
      Get.snackbar(response.statusCode.toString(), response.message);
    }

    isLoading = false;
    update();
  }


  Future<void> updatePetDetailsRepo({required String petId}) async {
    isLoading = true;
    update();

    Map<String, String> header = {
      'Authorization': PrefsHelper.token,
    };

    Map<String, String> body = {
      "age": ageController.text,
      "breed": breedController.text,
      "sex": genderController.text,
      "address": addressController.text,
      "description": descriptionController.text,
      "petName": nameController.text,
      "petType": petTypeController.text,
      "color" : colorController.text,
      "weight" : weightController.text,
      "microchipNumber" : microchipNumberController.text,

      ///<<<============ Additional information to add adaptation pet =================>>>
      "healthCondition" : healthConditionController.text,
      "neuter" : neuterController.text,
      "vaccine" : vaccineController.text,
      "temper" : temperController.text,
      "activityLevel" : activityLevelController.text,
      "behavior" : behaviorController.text,
      "specialNeeds" : specialNeedsController.text,
      "petHistory" : petHistoryController.text,
      "contactInformation" : contactInfoController.text
    };

    var response = await ApiService.multipartRequest(
        url: "${AppUrls.pets}/$petId",
        body: body,
        method: "PATCH",
        imageName: "photo",
        imagePath: image,
        header: header
    );

    print.log("Update Pet Response: ${response.message}, ${response.body}");

    if (response.statusCode == 200) {
      MyPetController.instance.getMyPet();

      Get.back();
      Utils.snackBarSuccessMessage("Success:", response.message);
      makeEmptyTextField();
      CreateLostPetView.isUpdate = false;
      CreateAdoptionView.isUpdate = false;

    } else {
      Get.snackbar(response.statusCode.toString(), response.message);
    }

    isLoading = false;
    update();
  }

  ///<<<================== Make Empty All Text Editing Field ===================>>>

  makeEmptyTextField(){
   nameController.clear();
    ageController.clear();
    breedController.clear();
    genderController.clear();
    addressController.clear();
    microchipNumberController.clear();
    descriptionController.clear();
    petTypeController.clear();
    colorController.clear();
    weightController.clear();

    healthConditionController.clear();
    neuterController.clear();
    vaccineController.clear();
    temperController.clear();
    activityLevelController.clear();
    behaviorController.clear();
    specialNeedsController.clear();
    petHistoryController.clear();
    contactInfoController.clear();
  }

  ///<<<==================

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
