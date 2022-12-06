## Random list of names with Cubit

1. Rastgale bir isim listesi oluşturalım. Vs code içerisinde **[vscode-faker](https://marketplace.visualstudio.com/items?itemName=deerawan.vscode-faker)** adlı Extensions ile dummy datalar oluşturabiliriz.

- Bu isim listesini **Iterable** türünden tanımlayalım. Yani **Lazy Liste** olsun. Çağrıldığı noktada hafızada tutulsun onun dışında hafızada yer kaplamasın diye. Kısaca özetlersek bu yaklaşım bizlere, listeyi çağırdığımızda **hafızada bir instance** oluştursun. Bu sayede **uygulama ayağa kaldırırken hafızada gereksiz yer kaplamaz.**
```dart
const Iterable<String> _userList = <String>[
  "Nia",
  "Keenan",
  "Erik",
  "Parker",
  "Jamal",
  "Veronica",
  "Christine",
];
```
2. **Cubit** mekanizması ile yapacağımız uygulama; butuna her tıklandığında yukarıdaki liste içerisindeki isimleri rastgele ekranda göstereceğiz.

3. **Cubit** mekanizmasını kuralım. Peki Cubit mekanizması ne tip verilerle çalışacak. Uygulama içerisinde bir butona tıklandığında bizlere bir **state** olarak yani sonuç olarak **String** tipinde veriler getireceğinden dolayı Cubit mekanizmasının tipini **String** olarak belirliyoruz. Ama ilk etapta **state** mizin **null** olabileceğinide göz önünde bulundurmamız gerekir.
```dart
class NamesCubit extends Cubit <String?> {}
```
4. Cubit için construct oluşturalım. **initialState** miz **null** olarak belirtiyoruz.
```dart
class NamesCubit extends Cubit <String?> {
    NamesCubit() : super(null);
}
```
5. Cubit mekanizmasının içerisinde bir metot oluşturalım. Bu metot bizlere rastgele isim verecek. Peki bu ismi neye göre verecek. **math** kütüphanesini import etmemiz gerekecek.
```dart
//import "dart:math" as math show Random

class NamesCubit extends Cubit {
  NamesCubit() : super(null);
  void getRandomName() {}
}

```
6. Şimdi ise liste içerisinde rastgele isim seçme olayını **extensions** ile yapalım. **extension** neden kullanırız. Uygulamamıza esneklik katar, Var olan yapıyı bozmadan yeni bir yetenek kazandırmamızı sağlıyorlar.

7. **extension** kullanbilmek için **extension** kelimesini yazarak, yazacağımız bu **costum extensions** a bir isim vereceğiz. buna şimdilik **RandomElemnt** adında bir isim verelim. Ne tür veri ile çalışacağını bilmediğimiz için generik olarak <<T>> parametresini veriyoruz. Daha sonra **on** ifadesi ile bu **extensions** hangi sınıfa hangi yapıya yada hangi var olan yapıya bir yetenek kazandıracak isek onun ismini vermemiz gerekecek. Listemiz **Iterable** yapı ile çalıştığından dolayı **on** parametresinden sonra bunu yazıyoruz. Çünkü bu listeye bir yetenek kazandırmış olacağız.
```dart
extension RandomElement<T> on Iterable<T>{

}
```
8. extension'ı hangi class'a yazıyorsak, artık bu extensions içerisinde yazdığımız class yapısından elde ettiğimiz bir **instance** var. Veya soyut bir instance olduğunu düşünebiliriz. 
```dart
extension RandomElement<T> on Iterable<T> {
  void getRandomElement() {
    elementAt(math.Random().nextInt(length));
  }
}
```
9. **getRandomElement()** metodu tetiklendiğinde elimizde bir instance varmış gibi onun üzerinden **elementAt()** metodunu çağırıyoruz. **elementAt()** metodunun tanımlamasında ele almış olduğumuz liste üzerinden index numarasını belirttiğimiz değeri bizlere döndürecektir. bu değer rastgele olacağı için math kütüphanesinin **Random()** class ı üzerinden **nextInt()** metodunu çalıştıracağız.

10. Kod yapımızı **Lambda Expressions** olarak düzenleyelim. **getRandomElement()** metodu bizlere bir değer döndürmesini bekliyoruz. generik olara **<T>** parametresini kullandığımız için **metodun dönüş tipide generik <<T>> olmak zorunda**  
```dart
extension RandomElement<T> on Iterable<T> {
  T getRandomElement() => elementAt(math.Random().nextInt(length));
}
```
11. **Özetleyecek** olursak; **Iterable** class ımıza bir metot kazandırdık bir yetenek kazandırmış olduk, adıda **getRandomElement(),** peki bu metot ne zaman tetiklenecek, Cubit mekanizması içerisindeki **getRandomName()** metodu tetiklendiğinde **emit fonksiyonu ile yeni bir state yaymamız lazım.** Yayacağımız **bu state _userList üzerinden getRandomElement() metodunu çalıştır.**
```dart
class NamesCubit extends Cubit<String ?>{
  NamesCubit() : super(null);
  void getRandomName() => emit(_userList.getRandomElement());
}

```
:bangbang::bangbang:

12. **Bu Cubit mekanizması içerisindeki tanımladığımız metotlar geriye bir şey döndürmüyor.** Çünkü bu **event** bir **actions** bu bir **tetiklenme mekanizması,** **getRandomName()** metodu tetiklenerek **uygulamaya bir state yaymasını sağlıyoruz.** Dolasıyla buraya yani cubit içerisindeki metotun bir değer döndürmesi gerekmiyor.

13. Uygulamanın arayüz kısmına geçebiliriz artık. Widgetı **[BlocProvider](https://github.com/TarkanKara/Bloc_Cubit/blob/master/lib/cubit_2_random/cubit_page.dart)** ile saralım.
```dart
 @override
  Widget build(BuildContext context) {
    return BlocProvider<NamesCubit>(
      create: (context) => NamesCubit(userList: _userList),
      child: const Cubit2View(),
    );
  }
```
14. **BlocBuilder()** bir kaç parametre alıyor. Bunların kullanımına bakalım. **builder:** Var olan değişikleri kullanıcıya göstereceğimiz geriye bir widget dönen fonksiyon bir callback ifade aslında, **block:** Uygulama içerisindeki block instance verilebilir. **buildWhen:** builder callback in hangi durumlarda tetikleneceğini daha doğrusu state değişiminin hangi durumlarda ele alınacağını ifade eden bir parametre geriye true ve false değer döndürür. Örneğin; Uygulamam içerisindeki status un initial dan Lodinge geçerse veya Loding den succes e geçerse o zaman widget tree mi güncele gibi

15. **[BlocBuilder](https://github.com/TarkanKara/Bloc_Cubit/blob/master/lib/cubit_2_random/cubit_page.dart)** Kullanımı; Uygulamanın arayüzünde buttona her tıklandığında rastagele isimleri getirecek şekilde widgetlarımızı oluşturuyoruz.
```dart
BlocBuilder<NamesCubit, String?>(
        builder: (context, String? nameState) {
        .
        .
        .
        onPressed: () {
                  context.read<NamesCubit>().getRandomName();
                },
        }
```
16. Cubit mekanizması gördüğümüz gibi aslında kendi içerisinde tanımlamış olduğumuz metotların tetiklenmesiyle yeni bir durum yani state üretmekte ve emit metodu her defasında ui için yeni bir state döndürüyor. State değişimi ile ui güncelliyoruz.

:bangbang::bangbang:

17. **Block ve Cubit mekanizmasının çalışma prensibi her yeni event geldiğinde farklı yeni bir state oluşturarak kullanıcıya, akışa bunu dahil etmek. Dolasıyla ilgili ui ın güncellemesini sağlamak** 

| Page  |
| ------------ |
|  ![RandomCubit](https://user-images.githubusercontent.com/59411109/206017187-8fdfd9e3-1714-43fd-a577-9fa603acbd9c.gif) |
