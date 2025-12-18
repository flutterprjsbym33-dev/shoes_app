class CatModel{
  String img_url,title;
      int id;
      CatModel({required this.id,required this.img_url,required this.title});
}

List<CatModel> cato = [

  CatModel(id: 0, img_url: "https://qvrafmcjgoxprlfyvxxk.supabase.co/storage/v1/object/public/categories/cat1.png", title: "Adidas"),
  CatModel(id: 1, img_url: "https://qvrafmcjgoxprlfyvxxk.supabase.co/storage/v1/object/public/categories/cat2.png", title: "Nike"),
  CatModel(id: 2, img_url: "https://qvrafmcjgoxprlfyvxxk.supabase.co/storage/v1/object/public/categories/cat3.png", title: "Puma"),
  CatModel(id: 3, img_url: "https://qvrafmcjgoxprlfyvxxk.supabase.co/storage/v1/object/public/categories/cat4.png", title: "Skechers"),
  CatModel(id: 4, img_url: "https://qvrafmcjgoxprlfyvxxk.supabase.co/storage/v1/object/public/categories/cat5.png", title: "Reebok"),
  CatModel(id: 5, img_url: "https://qvrafmcjgoxprlfyvxxk.supabase.co/storage/v1/object/public/categories/cat6.png", title: "Lacoste"),

];