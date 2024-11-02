class BottomNavigationBarEntity {
  final String activeImage, inactiveImage;
  final String name;

  BottomNavigationBarEntity({
    required this.activeImage,
    required this.inactiveImage,
    required this.name,
  });
}

List<BottomNavigationBarEntity> get bottomNavigationBarList => [
      BottomNavigationBarEntity(
        activeImage: 'assets/images/vuesax/bold/home.svg',
        inactiveImage: 'assets/images/vuesax/outline/home.svg',
        name: 'الرئيسية',
      ),
      BottomNavigationBarEntity(
        activeImage: 'assets/images/vuesax/bold/products.svg',
        inactiveImage: 'assets/images/vuesax/outline/products.svg',
        name: 'المنتجات',
      ),
      BottomNavigationBarEntity(
        activeImage: 'assets/images/vuesax/bold/shopping-cart.svg',
        inactiveImage: 'assets/images/vuesax/outline/shopping-cart.svg',
        name: 'سلةالتسوق',
      ),
      BottomNavigationBarEntity(
        activeImage: 'assets/images/vuesax/bold/user.svg',
        inactiveImage: 'assets/images/vuesax/outline/user.svg',
        name: 'حسابي',
      ),
    ];
