class Hotel {
  String url;
  String title;
  String location;
  int price;
  String description;
  double rating;
  int bedroom;
  String type;

  Hotel({
    required this.url,
    required this.title,
    required this.location,
    required this.price,
    required this.description,
    required this.rating,
    required this.bedroom,
    required this.type,
  });
}

List<Hotel> dummyData = [
  Hotel(
    url: 'https://picsum.photos/1080/720?random=1',
    title: 'Luxury Resort',
    location: 'Paradise Island, Maldives',
    price: 500,
    description:
        'Enjoy the ultimate luxury experience at our beachfront resort.',
    rating: 4.8,
    bedroom: 2,
    type: 'studio',
  ),
  Hotel(
    url: 'https://picsum.photos/1080/720?random=2',
    title: 'City View Hotel',
    location: 'New York City, USA',
    price: 200,
    description:
        'Stay in the heart of the city and enjoy stunning cityscape views.',
    rating: 4.9,
    bedroom: 1,
    type: 'apartment',
  ),
  Hotel(
    url: 'https://picsum.photos/1080/720?random=3',
    title: 'Mountain Lodge',
    location: 'Aspen, Colorado, USA',
    price: 350,
    description: 'Escape to the mountains and cozy up in our rustic lodge.',
    rating: 4.3,
    bedroom: 2,
    type: 'villa',
  ),
  Hotel(
    url: 'https://picsum.photos/1080/720?random=4',
    title: 'Beachfront Villa',
    location: 'Phuket, Thailand',
    price: 800,
    description:
        'Relax in a private villa by the beach with all the amenities you need.',
    rating: 4.6,
    bedroom: 3,
    type: 'apartment',
  ),
  Hotel(
    url: 'https://picsum.photos/1080/720?random=55',
    title: 'Historic Mansion',
    location: 'Paris, France',
    price: 600,
    description:
        'Experience the charm of a historic mansion in the heart of Paris.',
    rating: 4.7,
    bedroom: 3,
    type: 'villa',
  ),
  Hotel(
    url: 'https://picsum.photos/1080/720?random=6',
    title: 'Tropical Paradise Resort',
    location: 'Bali, Indonesia',
    price: 450,
    description:
        'Escape to a tropical paradise and relax by the crystal-clear waters.',
    rating: 5,
    bedroom: 3,
    type: 'studio',
  ),
  Hotel(
    url: 'https://picsum.photos/1080/720?random=7',
    title: 'Ski Chalet',
    location: 'Chamonix, France',
    price: 300,
    description: 'Ski-in, ski-out chalet for winter sports enthusiasts.',
    rating: 4.1,
    bedroom: 2,
    type: 'apartment',
  ),
  Hotel(
    url: 'https://picsum.photos/1080/720?random=8',
    title: 'Desert Oasis',
    location: 'Dubai, UAE',
    price: 700,
    description:
        'Discover luxury in the middle of the desert at our oasis resort.',
    rating: 4,
    bedroom: 2,
    type: 'villa',
  ),
  Hotel(
    url: 'https://picsum.photos/1080/720?random=9',
    title: 'Coastal Retreat',
    location: 'Monterey, California, USA',
    price: 350,
    description: 'Enjoy breathtaking ocean views at our coastal retreat.',
    rating: 4.2,
    bedroom: 3,
    type: 'villa',
  ),
  Hotel(
    url: 'https://picsum.photos/1080/720?random=10',
    title: 'Mountain View Inn',
    location: 'Banff, Canada',
    price: 250,
    description: 'Wake up to stunning mountain views at our cozy inn.',
    rating: 3.9,
    bedroom: 1,
    type: 'apartment',
  ),
];
