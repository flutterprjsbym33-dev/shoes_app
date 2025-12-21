import 'package:shoe/features/products/domain/product_entity/shoe.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

List<Shoe> shoes = [

  // ---------- ADIDAS ----------
  Shoe(
    id: "",
    title: "Adidas Flex Runner",
    description:
    "Lightweight Adidas running shoe designed for daily jogging and gym workouts with breathable mesh comfort.",
    brand: 'adidas',
    sizes: [38, 39, 40, 41],
    rating: 4.1,
    oldPrice: 34,
    newPrice: 27,
    images: [
      "https://qvrafmcjgoxprlfyvxxk.supabase.co/storage/v1/object/sign/shoes/adidas1.jpg?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV9mN2E1NGI2Ni05NzMyLTRhMjMtYTY0Mi1kZjBjOTEwNzQxMGMiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJzaG9lcy9hZGlkYXMxLmpwZyIsImlhdCI6MTc2NjMyNTcxNSwiZXhwIjoxNzk3ODYxNzE1fQ.O-Czlh0LV3VlVFvZxGqVCzablu3E_j0He7qaLR7nTcI",
      "https://qvrafmcjgoxprlfyvxxk.supabase.co/storage/v1/object/sign/shoes/adidas11.jpg?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV9mN2E1NGI2Ni05NzMyLTRhMjMtYTY0Mi1kZjBjOTEwNzQxMGMiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJzaG9lcy9hZGlkYXMxMS5qcGciLCJpYXQiOjE3NjYzMjU4MDEsImV4cCI6MTc5Nzg2MTgwMX0.SjhE7LIn_HFDf-jKyiWZFrrvx4DYn0sxHpTKqHflrlM",
    ],
  ),

  Shoe(
    id: "",
    title: "Adidas Street Walk",
    description:
    "Everyday Adidas sneaker built for casual walking with soft cushioning and durable outsole.",
    brand: 'adidas',
    sizes: [38, 39, 40, 41],
    rating: 4.1,
    oldPrice: 34,
    newPrice: 27,
    images: [
      "https://qvrafmcjgoxprlfyvxxk.supabase.co/storage/v1/object/sign/shoes/adidas2.jpg?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV9mN2E1NGI2Ni05NzMyLTRhMjMtYTY0Mi1kZjBjOTEwNzQxMGMiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJzaG9lcy9hZGlkYXMyLmpwZyIsImlhdCI6MTc2NjMyNTgzOCwiZXhwIjoxNzk3ODYxODM4fQ.XCd6CStSG-ozjNlpZl2_5p1nyPBNsmOfcssdx1TavvA",
      "https://qvrafmcjgoxprlfyvxxk.supabase.co/storage/v1/object/sign/shoes/adidas22.jpg?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV9mN2E1NGI2Ni05NzMyLTRhMjMtYTY0Mi1kZjBjOTEwNzQxMGMiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJzaG9lcy9hZGlkYXMyMi5qcGciLCJpYXQiOjE3NjYzMjU5MDUsImV4cCI6MTc5Nzg2MTkwNX0.dGZZRXq7V5xF1jwNZNo299Q52JyhRhzRon5kVq52lZ4",
    ],
  ),

  Shoe(
    id: "",
    title: "Adidas Daily Trainer",
    description:
    "Versatile Adidas shoe suitable for light training and daily wear with flexible sole support.",
    brand: 'adidas',
    sizes: [38, 39, 40, 41],
    rating: 4.1,
    oldPrice: 34,
    newPrice: 27,
    images: [
      "https://qvrafmcjgoxprlfyvxxk.supabase.co/storage/v1/object/sign/shoes/adidas3.jpg?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV9mN2E1NGI2Ni05NzMyLTRhMjMtYTY0Mi1kZjBjOTEwNzQxMGMiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJzaG9lcy9hZGlkYXMzLmpwZyIsImlhdCI6MTc2NjMyNTk0NiwiZXhwIjoxNzk3ODYxOTQ2fQ.hVL98WggJ5KuXJz3HoLRwtLfy2insAYh5J9N_8I4Y1w",
      "https://qvrafmcjgoxprlfyvxxk.supabase.co/storage/v1/object/sign/shoes/adidas33.jpg?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV9mN2E1NGI2Ni05NzMyLTRhMjMtYTY0Mi1kZjBjOTEwNzQxMGMiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJzaG9lcy9hZGlkYXMzMy5qcGciLCJpYXQiOjE3NjYzMjU5NzcsImV4cCI6MTc5Nzg2MTk3N30.-rxm0SQfR-CtaW_f8eIF1XZRjsWnXRw8szElgZuLd9E",
    ],
  ),

  // ---------- NIKE ----------
  Shoe(
    id: "",
    title: "Nike Air Motion",
    description:
    "Nike running shoe with responsive cushioning and strong traction for active training sessions.",
    brand: 'nike',
    sizes: [38, 39, 40, 41],
    rating: 4.1,
    oldPrice: 34,
    newPrice: 27,
    images: [
      "https://qvrafmcjgoxprlfyvxxk.supabase.co/storage/v1/object/sign/shoes/nike1.jpg?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV9mN2E1NGI2Ni05NzMyLTRhMjMtYTY0Mi1kZjBjOTEwNzQxMGMiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJzaG9lcy9uaWtlMS5qcGciLCJpYXQiOjE3NjYzMjYwMTMsImV4cCI6MTc5Nzg2MjAxM30.3lOlJwFjdvc9xo9oIcVoTUez_jV7F41fN7H2wI65aPE",
      "https://qvrafmcjgoxprlfyvxxk.supabase.co/storage/v1/object/sign/shoes/nike11.jpg?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV9mN2E1NGI2Ni05NzMyLTRhMjMtYTY0Mi1kZjBjOTEwNzQxMGMiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJzaG9lcy9uaWtlMTEuanBnIiwiaWF0IjoxNzY2MzI2MDUwLCJleHAiOjE3OTc4NjIwNTB9.R6Bs5fbhxhYfvHqwRyneThkaPiIltBkj7NfYNjtw8tU",
    ],
  ),

  Shoe(
    id: "",
    title: "Nike Street Comfort",
    description:
    "Casual Nike sneaker designed for daily walking with lightweight build and soft inner padding.",
    brand: 'nike',
    sizes: [38, 39, 40, 41],
    rating: 4.1,
    oldPrice: 34,
    newPrice: 27,
    images: [
      "https://qvrafmcjgoxprlfyvxxk.supabase.co/storage/v1/object/sign/shoes/nike2.jpg?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV9mN2E1NGI2Ni05NzMyLTRhMjMtYTY0Mi1kZjBjOTEwNzQxMGMiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJzaG9lcy9uaWtlMi5qcGciLCJpYXQiOjE3NjYzMjYwOTksImV4cCI6MTc5Nzg2MjA5OX0.YBVh05iT0dA0AsHUN7y5IMhL8rQLn-Du2BT-qMjRRMA",
      "https://qvrafmcjgoxprlfyvxxk.supabase.co/storage/v1/object/sign/shoes/nike22.jpg?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV9mN2E1NGI2Ni05NzMyLTRhMjMtYTY0Mi1kZjBjOTEwNzQxMGMiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJzaG9lcy9uaWtlMjIuanBnIiwiaWF0IjoxNzY2MzI2MTY1LCJleHAiOjE3OTc4NjIxNjV9.BB3qiUB2CI_YMPIoC0ysPbG7O2tXCImJbrtRIBm9jsM",
    ],
  ),

  Shoe(
    id: "",
    title: "Nike Flex Trainer",
    description:
    "Flexible Nike training shoe built for movement, agility, and everyday fitness routines.",
    brand: 'nike',
    sizes: [38, 39, 40, 41],
    rating: 4.1,
    oldPrice: 34,
    newPrice: 27,
    images: [
      "https://qvrafmcjgoxprlfyvxxk.supabase.co/storage/v1/object/sign/shoes/nike3.jpg?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV9mN2E1NGI2Ni05NzMyLTRhMjMtYTY0Mi1kZjBjOTEwNzQxMGMiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJzaG9lcy9uaWtlMy5qcGciLCJpYXQiOjE3NjYzMjYyMDUsImV4cCI6MTc5Nzg2MjIwNX0.BfUVUzTxL1J8q-sXfRu3efvm-o4_Jzkc__4SAK-fso4",
      "https://qvrafmcjgoxprlfyvxxk.supabase.co/storage/v1/object/sign/shoes/nike33.jpg?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV9mN2E1NGI2Ni05NzMyLTRhMjMtYTY0Mi1kZjBjOTEwNzQxMGMiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJzaG9lcy9uaWtlMzMuanBnIiwiaWF0IjoxNzY2MzI2MjMxLCJleHAiOjE3OTc4NjIyMzF9.C4lGaYIT7r_KStPna-nbRaKtSWf89DRQ0rcGfg3lz7c",
    ],
  ),

  // ---------- PUMA ----------
  Shoe(
    id: "",
    title: "Puma Street Rider",
    description:
    "Stylish Puma sneaker offering everyday comfort with a sporty street-inspired design.",
    brand: 'puma',
    sizes: [38, 39, 40, 41],
    rating: 4.1,
    oldPrice: 34,
    newPrice: 27,
    images: [
      "https://qvrafmcjgoxprlfyvxxk.supabase.co/storage/v1/object/sign/shoes/puma1.jpg?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV9mN2E1NGI2Ni05NzMyLTRhMjMtYTY0Mi1kZjBjOTEwNzQxMGMiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJzaG9lcy9wdW1hMS5qcGciLCJpYXQiOjE3NjYzMjYyODQsImV4cCI6MTc5Nzg2MjI4NH0.u1o8wSGxoai-_aB1gUneWrSJyil9_XYU3lXHOuxlJH0",
      "https://qvrafmcjgoxprlfyvxxk.supabase.co/storage/v1/object/sign/shoes/puma11.jpg?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV9mN2E1NGI2Ni05NzMyLTRhMjMtYTY0Mi1kZjBjOTEwNzQxMGMiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJzaG9lcy9wdW1hMTEuanBnIiwiaWF0IjoxNzY2MzI2MzA5LCJleHAiOjE3OTc4NjIzMDl9.SpjgbH1Q5vN7mwHjDBjHZomirEJ6BTDtz5uxL8HjPb8",
    ],
  ),

  Shoe(
    id: "",
    title: "Puma Urban Flex",
    description:
    "Comfortable Puma shoe designed for urban use, combining durability with lightweight cushioning.",
    brand: 'puma',
    sizes: [38, 39, 40, 41],
    rating: 4.1,
    oldPrice: 34,
    newPrice: 27,
    images: [
      "https://qvrafmcjgoxprlfyvxxk.supabase.co/storage/v1/object/sign/shoes/puma2.jpg?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV9mN2E1NGI2Ni05NzMyLTRhMjMtYTY0Mi1kZjBjOTEwNzQxMGMiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJzaG9lcy9wdW1hMi5qcGciLCJpYXQiOjE3NjYzMjYzNjcsImV4cCI6MTc5Nzg2MjM2N30.D83NowDjADytWyF2rvM_9UW0c6WkoQCH3PMj9FbXet8",
      "https://qvrafmcjgoxprlfyvxxk.supabase.co/storage/v1/object/sign/shoes/puma22.jpg?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV9mN2E1NGI2Ni05NzMyLTRhMjMtYTY0Mi1kZjBjOTEwNzQxMGMiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJzaG9lcy9wdW1hMjIuanBnIiwiaWF0IjoxNzY2MzI2Mzk1LCJleHAiOjE3OTc4NjIzOTV9.sl23A1Dcg648hx8q3g2_3lc21HqgDVPG6xsOvcSCSMM",
    ],
  ),
];

Future<void> uploadAllShoes(List<Shoe> shoes) async {
  final supabase = Supabase.instance.client;

  for (final shoe in shoes) {
    await supabase.from('shoes').insert({
      'title': shoe.title,
      'description': shoe.description,
      'brand': shoe.brand, // unchanged
      'sizes': shoe.sizes,
      'rating': shoe.rating,
      'old_price': shoe.oldPrice,
      'new_price': shoe.newPrice,
      'images': shoe.images, // unchanged
      'created_by': 'MTwdIAlUPRO3hXoO1WgQ4U02kpv2',
      'is_active': true,
    });
  }
}
