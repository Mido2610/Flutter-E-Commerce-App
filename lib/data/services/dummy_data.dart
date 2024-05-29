


import 'package:waflo_admin/features/shop/models/banner_model.dart';
import 'package:waflo_admin/features/shop/models/category_model.dart';
import 'package:waflo_admin/routes/routes.dart';
import 'package:waflo_admin/utils/constants/images_strings.dart';

class DummyData {
  // -Banner 
  static final List<BannerModel> banners = [
    BannerModel(imageUrl: TImages.banner1, targetScreen: Routes.order, active: false),
    BannerModel(imageUrl: TImages.banner2, targetScreen: Routes.cart, active: true),
    BannerModel(imageUrl: TImages.banner3, targetScreen: Routes.favourites, active: true),
    BannerModel(imageUrl: TImages.banner4, targetScreen: Routes.search, active: true),
    BannerModel(imageUrl: TImages.banner5, targetScreen: Routes.settings, active: true),
    BannerModel(imageUrl: TImages.banner6, targetScreen: Routes.userAddress, active: true),
    BannerModel(imageUrl: TImages.banner8, targetScreen: Routes.checkout, active: false),
  ];


//   // --User
//   static final UserModel user = UserModel(
//     firstName: 'Nguyen',
//     lastName: 'Kiet',
//     email: 'ngtuankiet2610@gmail.com',
//     phoneNumber: '+84 123 456 789',
//     profilePicture: TImages.user,
//     addresses: [
//       AddressModel(
//         id: '1',
//         name: 'Nguyen Tuan Kiet',
//         phoneNumber: '+84 123 456 789',
//         street: '123 Nguyen Trai',
//         city: 'Ha Noi',
//         state: 'Viet Nam',
//         postalCode: '123456',
//         country: 'Viet Nam',
//     ]
//   );

// -- List of all Categories
  static final List<CategoryModel> categories = [
    CategoryModel(id: '1', image: TImages.sportIcon, name: 'Sports', isFeatured: true),
    CategoryModel(id: '5', image: TImages.furnitureIcon, name: 'Furniture', isFeatured: true),
    CategoryModel(id: '2', image: TImages.electronicsIcon, name: 'Electronics', isFeatured: true),
    CategoryModel(id: '3', image: TImages.clothIcon, name: 'Clothes', isFeatured: true),
    CategoryModel(id: '4', image: TImages.animalIcon, name: 'Animals', isFeatured: true),
    CategoryModel(id: '6', image: TImages.shoesIcon, name: 'Shoes', isFeatured: true),
    CategoryModel(id: '7', image: TImages.cosmeticsIcon, name: 'Cosmetics', isFeatured: true),
    CategoryModel(id: '14', image: TImages.jewelryIcon, name: 'Jewellery', isFeatured: true),

    // sub-categories
    CategoryModel(id: '8', image: TImages.sportIcon, name: 'Sport Shoes', parentId: '1', isFeatured: false),
    CategoryModel(id: '9', image: TImages.sportIcon, name: 'Track suits', parentId: '1', isFeatured: false),
    CategoryModel(id: '10', image: TImages.sportIcon, name: 'Sport Equipment', parentId: '1', isFeatured: false),

    // Furniture
    CategoryModel(id: '11', image: TImages.furnitureIcon, name: 'Bedroom furniture', parentId: '5', isFeatured: false),
    CategoryModel(id: '12', image: TImages.furnitureIcon, name: 'Kitchen furniture', parentId: '5', isFeatured: false),
    CategoryModel(id: '13', image: TImages.furnitureIcon, name: 'Office furniture', parentId: '5', isFeatured: false),

    // Electronics
    CategoryModel(id: '15', image: TImages.electronicsIcon, name: 'Laptop', parentId: '2', isFeatured: false),
    CategoryModel(id: '16', image: TImages.electronicsIcon, name: 'Phone', parentId: '2', isFeatured: false),
    CategoryModel(id: '17', image: TImages.electronicsIcon, name: 'Tablet', parentId: '2', isFeatured: false),

    //clothes
    CategoryModel(id: '18', image: TImages.clothIcon, name: 'Shirts', parentId: '3', isFeatured: false),
    CategoryModel(id: '19', image: TImages.clothIcon, name: 'Trousers', parentId: '3', isFeatured: false),

    // Jewellery
    CategoryModel(id: '20', image: TImages.jewelryIcon, name: 'Earrings', parentId: '14', isFeatured: false),
    CategoryModel(id: '21', image: TImages.jewelryIcon, name: 'Bracelets', parentId: '14', isFeatured: false),
    CategoryModel(id: '22', image: TImages.jewelryIcon, name: 'Necklace', parentId: '14', isFeatured: false),
    CategoryModel(id: '23', image: TImages.jewelryIcon, name: 'Rings', parentId: '14', isFeatured: false),

    // Shoes
    CategoryModel(id: '24', image: TImages.shoesIcon, name: 'Boots', parentId: '6', isFeatured: false),

    // Cosmetics
    CategoryModel(id: '25', image: TImages.cosmeticsIcon, name: 'Makeup', parentId: '7', isFeatured: false),

    // Animal
    CategoryModel(id: '26', image: TImages.animalIcon, name: 'Cats', parentId: '4', isFeatured: false),
    CategoryModel(id: '27', image: TImages.animalIcon, name: 'Dogs', parentId: '4', isFeatured: false),

    
  ];
}