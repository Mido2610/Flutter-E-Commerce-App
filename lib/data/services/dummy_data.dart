


import 'package:waflo_admin/features/shop/models/banner_model.dart';
import 'package:waflo_admin/features/shop/models/brand_category_model.dart';
import 'package:waflo_admin/features/shop/models/brand_model.dart';
import 'package:waflo_admin/features/shop/models/category_model.dart';
import 'package:waflo_admin/features/shop/models/product_attribute_model.dart';
import 'package:waflo_admin/features/shop/models/product_category_model.dart';
import 'package:waflo_admin/features/shop/models/product_model.dart';
import 'package:waflo_admin/features/shop/models/product_variation_model.dart';
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
    BannerModel(imageUrl: TImages.banner7, targetScreen: Routes.userProfile, active: true),
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

// --Cart

// -- List of all Categories
  static final List<CategoryModel> categories = [
    CategoryModel(id: '1', image: TImages.sportIcon, name: 'Sports', isFeatured: true),
    CategoryModel(id: '5', image: TImages.furnitureIcon, name: 'Furniture', isFeatured: true),
    CategoryModel(id: '2', image: TImages.electronicsIcon, name: 'Electronics', isFeatured: true),
    CategoryModel(id: '3', image: TImages.clothIcon, name: 'Clothes', isFeatured: true),
    CategoryModel(id: '4', image: TImages.animalIcon, name: 'Animals', isFeatured: true),
    CategoryModel(id: '6', image: TImages.shoeIcon, name: 'Shoes', isFeatured: true),
    CategoryModel(id: '7', image: TImages.cosmeticsIcon, name: 'Cosmetics', isFeatured: true),
    CategoryModel(id: '14', image: TImages.jeweleryIcon, name: 'Jewellery', isFeatured: true),

    // sub-categories
    CategoryModel(id: '8', image: TImages.sportIcon, name: 'Sport Shoes', parentId: '1', isFeatured: false),
    CategoryModel(id: '9', image: TImages.sportIcon, name: 'Track suits', parentId: '1', isFeatured: false),
    CategoryModel(id: '10', image: TImages.sportIcon, name: 'Sport Equipment', parentId: '1', isFeatured: false),

    // Furniture
    CategoryModel(id: '11', image: TImages.furnitureIcon, name: 'Bedroom furniture', parentId: '5', isFeatured: false),
    CategoryModel(id: '12', image: TImages.furnitureIcon, name: 'Kitchen furniture', parentId: '5', isFeatured: false),
    CategoryModel(id: '13', image: TImages.furnitureIcon, name: 'Office furniture', parentId: '5', isFeatured: false),

    // Electronics
    CategoryModel(id: '14', image: TImages.electronicsIcon, name: 'Laptop', parentId: '2', isFeatured: false),
    CategoryModel(id: '15', image: TImages.electronicsIcon, name: 'Mobile', parentId: '2', isFeatured: false),

    CategoryModel(id: '16', image: TImages.clothIcon, name: 'Shirts', parentId: '3', isFeatured: false),

  ];
  // List of all brands
  static final List<BrandModel> brands = [
    BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike', productsCount: 265, isFeatured: true),
    BrandModel(id: '2', image: TImages.adidasLogo, name: 'Adidas', productsCount: 95, isFeatured: true),
    BrandModel(id: '8', image: TImages.kenwoodLogo, name: 'Kenwood', productsCount: 36, isFeatured: false),
    BrandModel(id: '9', image: TImages.ikeaLogo, name: 'IKEA', productsCount: 36, isFeatured: false),
    BrandModel(id: '5', image: TImages.appleLogo, name: 'Apple', productsCount: 16, isFeatured: true),
    BrandModel(id: '10', image: TImages.acerlogo, name: 'Acer', productsCount: 36, isFeatured: false),
    BrandModel(id: '3', image: TImages.jordanLogo, name: 'Jordan', productsCount: 36, isFeatured: true),
    BrandModel(id: '4', image: TImages.pumaLogo, name: 'Puma', productsCount: 65, isFeatured: true),
    BrandModel(id: '6', image: TImages.zaraLogo, name: 'ZARA', productsCount: 36, isFeatured: true),
    BrandModel(id: '7', image: TImages.electronicsIcon, name: 'Samsung', productsCount: 36, isFeatured: false),
  ];

  // List of all Brand Categories
  static final List<BrandCategoryModel> brandCategory = [
    BrandCategoryModel(brandId: '1', categoryId: '1'),
    BrandCategoryModel(brandId: '1', categoryId: '8'),
    BrandCategoryModel(brandId: '1', categoryId: '9'),
    BrandCategoryModel(brandId: '1', categoryId: '10'),
    BrandCategoryModel(brandId: '2', categoryId: '1'),
    BrandCategoryModel(brandId: '2', categoryId: '8'),
    BrandCategoryModel(brandId: '2', categoryId: '9'),
    BrandCategoryModel(brandId: '2', categoryId: '10'),
    BrandCategoryModel(brandId: '3', categoryId: '1'),
    BrandCategoryModel(brandId: '3', categoryId: '8'),
    BrandCategoryModel(brandId: '3', categoryId: '9'),
    BrandCategoryModel(brandId: '3', categoryId: '10'),
    BrandCategoryModel(brandId: '4', categoryId: '1'),
    BrandCategoryModel(brandId: '4', categoryId: '8'),
    BrandCategoryModel(brandId: '4', categoryId: '9'),
    BrandCategoryModel(brandId: '4', categoryId: '10'),
    BrandCategoryModel(brandId: '5', categoryId: '15'),
    BrandCategoryModel(brandId: '5', categoryId: '2'),
    BrandCategoryModel(brandId: '10', categoryId: '2'),
    BrandCategoryModel(brandId: '10', categoryId: '14'),
    BrandCategoryModel(brandId: '6', categoryId: '3'),
    BrandCategoryModel(brandId: '6', categoryId: '16'),
    BrandCategoryModel(brandId: '7', categoryId: '2'),
    BrandCategoryModel(brandId: '1', categoryId: '1'),
    BrandCategoryModel(brandId: '8', categoryId: '5'),
    BrandCategoryModel(brandId: '8', categoryId: '11'),
    BrandCategoryModel(brandId: '8', categoryId: '12'),
    BrandCategoryModel(brandId: '8', categoryId: '13'),
    BrandCategoryModel(brandId: '9', categoryId: '5'),
    BrandCategoryModel(brandId: '9', categoryId: '11'),
    BrandCategoryModel(brandId: '9', categoryId: '12'),
    BrandCategoryModel(brandId: '9', categoryId: '13'),
  ];

  // -- List of all Product Categories
  static final List<ProductCategoryModel> productCategories = [
    ProductCategoryModel(productId: '001', categoryId: '1'),
    ProductCategoryModel(productId: '001', categoryId: '8'),
    ProductCategoryModel(productId: '004', categoryId: '3'),
    ProductCategoryModel(productId: '002', categoryId: '3'),
    ProductCategoryModel(productId: '002', categoryId: '16'),
    ProductCategoryModel(productId: '003', categoryId: '3'),
    ProductCategoryModel(productId: '005', categoryId: '1'),
    ProductCategoryModel(productId: '005', categoryId: '8'),
    ProductCategoryModel(productId: '040', categoryId: '2'),
    ProductCategoryModel(productId: '040', categoryId: '15'),
    ProductCategoryModel(productId: '006', categoryId: '2'),
    ProductCategoryModel(productId: '007', categoryId: '4'),
    ProductCategoryModel(productId: '009', categoryId: '1'),
    ProductCategoryModel(productId: '009', categoryId: '8'),
    ProductCategoryModel(productId: '010', categoryId: '1'),
    ProductCategoryModel(productId: '010', categoryId: '8'),
    ProductCategoryModel(productId: '010', categoryId: '3'),
    ProductCategoryModel(productId: '011', categoryId: '1'),
    ProductCategoryModel(productId: '011', categoryId: '8'),
    ProductCategoryModel(productId: '012', categoryId: '1'),
    ProductCategoryModel(productId: '012', categoryId: '8'),
    ProductCategoryModel(productId: '013', categoryId: '1'),
    ProductCategoryModel(productId: '013', categoryId: '8'),

    ProductCategoryModel(productId: '014', categoryId: '1'),
    ProductCategoryModel(productId: '014', categoryId: '9'),
    ProductCategoryModel(productId: '015', categoryId: '1'),
    ProductCategoryModel(productId: '015', categoryId: '9'),
    ProductCategoryModel(productId: '016', categoryId: '1'),
    ProductCategoryModel(productId: '016', categoryId: '9'),
    ProductCategoryModel(productId: '017', categoryId: '1'),
    ProductCategoryModel(productId: '017', categoryId: '9'),

    ProductCategoryModel(productId: '018', categoryId: '1'),
    ProductCategoryModel(productId: '018', categoryId: '10'),
    ProductCategoryModel(productId: '019', categoryId: '1'),
    ProductCategoryModel(productId: '019', categoryId: '10'),
    ProductCategoryModel(productId: '020', categoryId: '1'),
    ProductCategoryModel(productId: '020', categoryId: '10'),
    ProductCategoryModel(productId: '021', categoryId: '1'),
    ProductCategoryModel(productId: '021', categoryId: '10'),


    ProductCategoryModel(productId: '022', categoryId: '5'),
    ProductCategoryModel(productId: '022', categoryId: '11'),
    ProductCategoryModel(productId: '023', categoryId: '5'),
    ProductCategoryModel(productId: '023', categoryId: '11'),
    ProductCategoryModel(productId: '024', categoryId: '5'),
    ProductCategoryModel(productId: '024', categoryId: '11'),
    ProductCategoryModel(productId: '025', categoryId: '5'),
    ProductCategoryModel(productId: '025', categoryId: '11'),

    ProductCategoryModel(productId: '026', categoryId: '5'),
    ProductCategoryModel(productId: '026', categoryId: '12'),
    ProductCategoryModel(productId: '027', categoryId: '5'),
    ProductCategoryModel(productId: '027', categoryId: '12'),
    ProductCategoryModel(productId: '028', categoryId: '5'),
    ProductCategoryModel(productId: '028', categoryId: '12'),


    ProductCategoryModel(productId: '029', categoryId: '5'),
    ProductCategoryModel(productId: '029', categoryId: '13'),
    ProductCategoryModel(productId: '030', categoryId: '5'),
    ProductCategoryModel(productId: '030', categoryId: '13'),
    ProductCategoryModel(productId: '031', categoryId: '5'),
    ProductCategoryModel(productId: '031', categoryId: '13'),
    ProductCategoryModel(productId: '032', categoryId: '5'),
    ProductCategoryModel(productId: '032', categoryId: '13'),

    ProductCategoryModel(productId: '033', categoryId: '2'),
    ProductCategoryModel(productId: '033', categoryId: '14'),
    ProductCategoryModel(productId: '034', categoryId: '2'),
    ProductCategoryModel(productId: '034', categoryId: '14'),
    ProductCategoryModel(productId: '035', categoryId: '2'),
    ProductCategoryModel(productId: '035', categoryId: '14'),
    ProductCategoryModel(productId: '036', categoryId: '2'),
    ProductCategoryModel(productId: '036', categoryId: '14'),

    ProductCategoryModel(productId: '037', categoryId: '2'),
    ProductCategoryModel(productId: '037', categoryId: '15'),
    ProductCategoryModel(productId: '038', categoryId: '2'),
    ProductCategoryModel(productId: '038', categoryId: '15'),
    ProductCategoryModel(productId: '039', categoryId: '2'),
    ProductCategoryModel(productId: '039', categoryId: '15'),
    // 040 after product 005
    ProductCategoryModel(productId: '008', categoryId: '2')
    
  ];

  static final List<ProductModel> products = [
    ProductModel(
      id: '001',
      title: 'Green Nike sport shoes',
      stock: 15,
      price: 135,
      thumbnail: TImages.productImage1,
      images: [TImages.productImage1, TImages.productImage23, TImages.productImage21, TImages.productImage9],
      description: 'The Nike Air Max 270 delivers visible air under every step. Updated for modern comfort, it nods to the original 1991 Air Max 180 with its exaggerated tongue top and heritage tongue logo.',
      brand: BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike', productsCount: 265, isFeatured: true),
      salePrice: 30,
      sku: 'NK001',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Blue', 'Red']),
        ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1', 
          stock: 34,
          price: 134,
          salePrice: 122.6,
          image: TImages.productImage1,
          description: 'This is a product description for Green Nike sports shoe.',
          attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
        ProductVariationModel(
          id: '2', stock: 15, price: 132, image: TImages.productImage23, attributeValues: {'Color': 'Black', 'Size': 'EU 32'}),
        ProductVariationModel(
          id: '3', stock: 0, price: 234, image: TImages.productImage23, attributeValues: {'Color': 'Black', 'Size': 'EU 34'}),
        ProductVariationModel(
          id: '4', stock: 222, price: 232, image: TImages.productImage1, attributeValues: {'Color': 'Green', 'Size': 'EU 32'}),
        ProductVariationModel(
          id: '5', stock: 0, price: 334, image: TImages.productImage21, attributeValues: {'Color': 'Red', 'Size': 'EU 34'}),
        ProductVariationModel(
          id: '6', stock: 11, price: 332, image: TImages.productImage21, attributeValues: {'Color': 'Red', 'Size': 'EU 32'}),          
      ],
        productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '002',
      title: 'Blue T-Shirt for all ages',
      stock: 15,
      price: 35,
      isFeatured: true,
      images: [TImages.productImage68, TImages.productImage69, TImages.productImage5],
      thumbnail: TImages.productImage69,
      description: 'This is a product description for Blue T-Shirt for all ages.',
      brand: BrandModel(id: '6', image: TImages.zaraLogo, name: 'ZARA'),
      salePrice: 30,
      sku: 'BD123',
      categoryId: '16',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],    
      productType: 'ProductType.single'  
    ),
    ProductModel(
      id: '003',
      title: 'Leather brown Jacket',
      stock: 15,
      price: 38000,
      isFeatured: false,
      images: [TImages.productImage64, TImages.productImage65, TImages.productImage66, TImages.productImage67],
      thumbnail: TImages.productImage64,
      description: 'This is a product description for Blue T-Shirt for all ages.',
      brand: BrandModel(id: '6', image: TImages.zaraLogo, name: 'ZARA'),
      salePrice: 30,
      sku: 'LBD002',
      categoryId: '16',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],    
      productType: 'ProductType.single'  
    ),
    ProductModel(
      id: '004',
      title: '4 Color collar t-shirt dry fit',
      stock: 15,
      price: 135,
      isFeatured: false,
      images: [TImages.productImage60, TImages.productImage61, TImages.productImage62, TImages.productImage63],
      thumbnail: TImages.productImage60,
      description: 'This is a product description for 4 Color collar t-shirt dry fit.',
      brand: BrandModel(id: '6', image: TImages.zaraLogo, name: 'ZARA'),
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '16',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32', 'EU 30']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue', 'Yellow']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1', 
          stock: 34,
          price: 134,
          salePrice: 122.6,
          image: TImages.productImage60,
          description: 'This is a product description for 4 Color collar t-shirt dry fit.',
          attributeValues: {'Color': 'Red', 'Size': 'EU 34'}),
        ProductVariationModel(
          id: '2', stock: 15, price: 35, image: TImages.productImage60, attributeValues: {'Color': 'Red', 'Size': 'EU 32'}),
        ProductVariationModel(
          id: '3', stock: 0, price: 234, image: TImages.productImage61, attributeValues: {'Color': 'Yellow', 'Size': 'EU 34'}),
        ProductVariationModel(
          id: '4', stock: 222, price: 232, image: TImages.productImage61, attributeValues: {'Color': 'Yellow', 'Size': 'EU 32'}),
        ProductVariationModel(
          id: '5', stock: 0, price: 334, image: TImages.productImage62, attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
        ProductVariationModel(
          id: '6', stock: 11, price: 332, image: TImages.productImage62, attributeValues: {'Color': 'Green', 'Size': 'EU 32'}),  
        ProductVariationModel(
          id: '7', stock: 0, price: 434, image: TImages.productImage63, attributeValues: {'Color': 'Blue', 'Size': 'EU 34'}),
        ProductVariationModel(
          id: '8', stock: 11, price: 432, image: TImages.productImage63, attributeValues: {'Color': 'Blue', 'Size': 'EU 32'}),        
      ],      
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '005',
      title: 'Nike Air Jordan Shoes',
      stock: 15,
      price: 35,
      isFeatured: false,
      images: [TImages.productImage7, TImages.productImage8, TImages.productImage9, TImages.productImage10],
      thumbnail: TImages.productImage10,
      description: 'Nike Air Jordan shoes',
      brand: BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike', productsCount: 265, isFeatured: true),
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '8',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
        ProductAttributeModel(name: 'Color', values: ['Orange', 'Black', 'Brown']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1', 
          stock: 15,
          price: 36,
          salePrice: 12.6,
          image: TImages.productImage8,
          description: 'This is a product description for Green Nike sports shoe.',
          attributeValues: {'Color': 'Orange', 'Size': 'EU 34'}),
        ProductVariationModel(
          id: '2', stock: 15, price: 35, image: TImages.productImage7, attributeValues: {'Color': 'Black', 'Size': 'EU 32'}),
        ProductVariationModel(
          id: '3', stock: 0, price: 34, image: TImages.productImage9, attributeValues: {'Color': 'Brown', 'Size': 'EU 34'}),
        ProductVariationModel(
          id: '4', stock: 13, price: 33, image: TImages.productImage7, attributeValues: {'Color': 'Black', 'Size': 'EU 34'}),
        ProductVariationModel(
          id: '5', stock: 12, price: 32, image: TImages.productImage9, attributeValues: {'Color': 'Brown', 'Size': 'EU 34'}),
        ProductVariationModel(
          id: '6', stock: 11, price: 31, image: TImages.productImage8, attributeValues: {'Color': 'Orange', 'Size': 'EU 32'}),      
      ],         
      productType: 'ProductType.variable',  
    ),    
    ProductModel(
      id: '006',
      title: 'SAMSUNG GALAXY S9 (Pink 64GB) ',
      stock: 15,
      price: 750,
      isFeatured: false,
      thumbnail: TImages.productImage11,
      images: [TImages.productImage11, TImages.productImage12, TImages.productImage13, TImages.productImage12],
      description: 'SAMSUNG GALAXY S9 (Pink 64GB).',
      brand: BrandModel(id: '7', image: TImages.appleLogo, name: 'Samsung'),
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '2',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],    
      productType: 'ProductType.single'  
    ),
    ProductModel(
      id: '007',
      title: 'TOMI DOG FOOD',
      stock: 15,
      price: 20,
      isFeatured: false,
      thumbnail: TImages.productImage18,
      images: [TImages.productImage11, TImages.productImage12, TImages.productImage13, TImages.productImage12],
      description: 'this is a description for TOMI DOG FOOD',
      brand: BrandModel(id: '7', image: TImages.animalIcon, name: 'Tomi'),
      salePrice: 10,
      sku: 'ABR4568',
      categoryId: '4',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],    
      productType: 'ProductType.single'  
    ),
      ProductModel(
      id: '008',
      title: 'Adidas Running Shoes',
      stock: 20,
      price: 120,
      thumbnail: TImages.productImage28,
      images: [TImages.productImage28, TImages.productImage7, TImages.productImage9],
      description: 'Adidas Running Shoes for comfort and performance.',
      brand: BrandModel(id: '2', image: TImages.adidasLogo, name: 'Adidas', productsCount: 190),
      salePrice: 100,
      sku: 'AD1234',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU 40', 'EU 42', 'EU 44']),
        ProductAttributeModel(name: 'Color', values: ['Black', 'White']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 10,
          price: 120,
          salePrice: 100,
          image: TImages.productImage7,
          description: 'Black Adidas Running Shoes.',
          attributeValues: {'Color': 'Black', 'Size': 'EU 42'}
        ),
        ProductVariationModel(
          id: '2',
          stock: 10,
          price: 120,
          salePrice: 100,
          image: TImages.productImage9,
          description: 'White Adidas Running Shoes.',
          attributeValues: {'Color': 'White', 'Size': 'EU 44'}
        ),
      ],
      productType: 'ProductType.variable',
    ),  
    ProductModel(
      id: '009',
      title: 'Nike Air Jordan 19 Blue',
      stock: 15,
      price: 400,
      isFeatured: false,
      thumbnail: TImages.productImage19,
      images: [TImages.productImage19, TImages.productImage20, TImages.productImage21, TImages.productImage22],
      description: 'this is a description for nike Air Jordan 19 Blue',
      brand: BrandModel(id: '7', image: TImages.animalIcon, name: 'Tomi'),
      salePrice: 200,
      sku: 'ABR4568',
      categoryId: '4',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],    
      productType: 'ProductType.single'  
    ),
    ProductModel(
      id: '010',
      title: 'Sony Headphones',
      stock: 30,
      price: 150,
      isFeatured: true,
      images: [TImages.productImage14, TImages.productImage15, TImages.productImage16],
      thumbnail: TImages.productImage14,
      description: 'High quality Sony headphones with noise cancellation.',
      brand: BrandModel(id: '5', image: TImages.appleLogo, name: 'Sony'),
      salePrice: 130,
      sku: 'SONY456',
      categoryId: '2',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Black', 'Silver']),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
    id: '011',
    title: 'Apple MacBook Pro 16',
    stock: 20,
    price: 2500,
    isFeatured: true,
    thumbnail: TImages.productImage47,
    images: [TImages.productImage47, TImages.productImage48, TImages.productImage49, TImages.productImage50],
    description: 'Apple MacBook Pro 16-inch with M1 Max chip, 32GB RAM, and 1TB SSD.',
    brand: BrandModel(id: '7', image: TImages.appleLogo, name: 'Apple'),
    salePrice: 2400,
    sku: 'MBP16M1',
    categoryId: '3',
    productAttributes: [
      ProductAttributeModel(name: 'Color', values: ['Silver', 'Space Grey']),
      ProductAttributeModel(name: 'Storage', values: ['512GB', '1TB', '2TB']),
    ],
    productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 10,
          price: 120,
          salePrice: 100,
          image: TImages.productImage47,
          description: 'Apple MacBook Pro 16.',
          attributeValues: {'Color': 'Black'}
        ),
        ProductVariationModel(
          id: '2',
          stock: 10,
          price: 120,
          salePrice: 100,
          image: TImages.productImage49,
          description: 'Orange Jordan Running Shoes.',
          attributeValues: {'Color': 'Orange'}
        ),
      ],
    productType: 'ProductType.variable',
    ),
    // Animal
  ProductModel(
    id: '012',
    title: 'Whiskas Cat Food',
    stock: 50,
    price: 25,
    isFeatured: true,
    thumbnail: TImages.productImage18,
    images: [TImages.productImage18, TImages.productImage19, TImages.productImage20],
    description: 'Whiskas cat food for adult cats, 1.2kg pack.',
    brand: BrandModel(id: '9', image: TImages.animalIcon, name: 'Whiskas'),
    salePrice: 20,
    sku: 'WHISKAS1200',
    categoryId: '4',
    productAttributes: [
      ProductAttributeModel(name: 'Flavor', values: ['Chicken', 'Fish', 'Lamb']),
    ],
    productType: 'ProductType.single',
  ),
   // Clothes
  ProductModel(
    id: '013',
    title: 'Adidas Running T-Shirt',
    stock: 30,
    price: 45,
    isFeatured: false,
    thumbnail: TImages.productImage5,
    images: [TImages.productImage5, TImages.productImage54, TImages.productImage55],
    description: 'Adidas running t-shirt for men, made with breathable fabric.',
    brand: BrandModel(id: '2', image: TImages.adidasLogo, name: 'Adidas'),
    salePrice: 40,
    sku: 'ADIRUNTSHIRT',
    categoryId: '16',
    productAttributes: [
      ProductAttributeModel(name: 'Size', values: ['S', 'M', 'L', 'XL']),
      ProductAttributeModel(name: 'Color', values: ['Black', 'White', 'Blue']),
    ],
    productType: 'ProductType.single',
  ),
   // Furniture
  ProductModel(
    id: '014',
    title: 'IKEA Office Chair',
    stock: 25,
    price: 120,
    isFeatured: false,
    thumbnail: TImages.productImage39,
    images: [TImages.productImage39, TImages.productImage40],
    description: 'Comfortable office chair from IKEA with adjustable height and back support.',
    brand: BrandModel(id: '11', image: TImages.ikeaLogo, name: 'IKEA'),
    salePrice: 110,
    sku: 'IKEAOFFICECHAIR',
    categoryId: '5',
    productAttributes: [
      ProductAttributeModel(name: 'Color', values: ['Black', 'Grey']),
      ProductAttributeModel(name: 'Material', values: ['Fabric', 'Leather']),
    ],
    productType: 'ProductType.single',
    ),
    ProductModel(
    id: '015',
    title: 'Adidas Ultraboost 21',
    stock: 15,
    price: 180,
    isFeatured: true,
    thumbnail: TImages.productImage21,
    images: [TImages.productImage21, TImages.productImage22, TImages.productImage23],
    description: 'Adidas Ultraboost 21 running shoes for men, designed for ultimate comfort and performance.',
    brand: BrandModel(id: '10', image: TImages.adidasLogo, name: 'Adidas'),
    salePrice: 170,
    sku: 'ADIBOOST21',
    categoryId: '1',
    productAttributes: [
      ProductAttributeModel(name: 'Size', values: ['8', '9', '10', '11']),
      ProductAttributeModel(name: 'Color', values: ['Black', 'White', 'Blue']),
    ],
    productVariations: [
      ProductVariationModel(
        id: '1',
        stock: 10,
        price: 180,
        salePrice: 170,
        image: TImages.productImage21,
        description: 'Black Adidas Ultraboost 21 size 9.',
        attributeValues: {'Color': 'Black', 'Size': '9'}),
      ProductVariationModel(
        id: '2', stock: 5, price: 180, image: TImages.productImage22, attributeValues: {'Color': 'White', 'Size': '10'}),
    ],
    productType: 'ProductType.variable',
  ),

  ProductModel(
      id: '016',
      title: 'Jordan Running Shoes',
      stock: 20,
      price: 120,
      isFeatured: true,
      thumbnail: TImages.productImage7,
      images: [TImages.productImage7, TImages.productImage8, TImages.productImage9],
      description: 'Adidas Running Shoes for comfort and performance.',
      brand: BrandModel(id: '3', image: TImages.jordanLogo, name: 'Jordan', productsCount: 190),
      salePrice: 100,
      sku: 'AD1234',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU 40', 'EU 42', 'EU 44']),
        ProductAttributeModel(name: 'Color', values: ['Black', 'White']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 10,
          price: 120,
          salePrice: 100,
          image: TImages.productImage7,
          description: 'Black Adidas Running Shoes.',
          attributeValues: {'Color': 'Black', 'Size': 'EU 42'}
        ),
        ProductVariationModel(
          id: '2',
          stock: 10,
          price: 120,
          salePrice: 100,
          image: TImages.productImage8,
          description: 'Orange Jordan Running Shoes.',
          attributeValues: {'Color': 'Orange', 'Size': 'EU 44'}
        ),
      ],
      productType: 'ProductType.variable',
    ),
      ProductModel(
      id: '017',
      title: 'TrackSuit',
      stock: 20,
      price: 120,
      isFeatured: true,
      thumbnail: TImages.productImage24,
      images: [TImages.productImage24, TImages.productImage25, TImages.productImage26],
      description: 'Adidas Running Shoes for comfort and performance.',
      brand: BrandModel(id: '3', image: TImages.jordanLogo, name: 'Jordan', productsCount: 190),
      salePrice: 100,
      sku: 'AD1234',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU 40', 'EU 42', 'EU 44']),
        ProductAttributeModel(name: 'Color', values: ['Black', 'White']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 10,
          price: 120,
          salePrice: 100,
          image: TImages.productImage7,
          description: 'Black Adidas Running Shoes.',
          attributeValues: {'Color': 'Black', 'Size': 'EU 42'}
        ),
        ProductVariationModel(
          id: '2',
          stock: 10,
          price: 120,
          salePrice: 100,
          image: TImages.productImage8,
          description: 'Orange Jordan Running Shoes.',
          attributeValues: {'Color': 'Orange', 'Size': 'EU 44'}
        ),
      ],
      productType: 'ProductType.variable',
    ),  
  ]; 
}