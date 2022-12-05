## [Counter Cubit](https://github.com/TarkanKara/Bloc_Cubit/blob/master/lib/cubit_1_counter/counter_cubit.dart) 

- Cubit dediğimiz gibi block mekinazmasının sadeleştirilmiş ve basitleştirilmiş hali olarak geçiyor.
- Kullanım Mekanizması;
1. Bir sınıf oluştur. Sınıfımızın ismi **CounterCubit** olsun
2. Bu sınıfı **Cubit class'ından extends** edeceğiz. 
```dart
class CounterCubit extends Cubit {}
```
3. Ve bu **cubit classı** da hangi tip veri ile çalışacaksa bunu bilmek istiyor.
4. Counter Sayaç uygulaması için **int** veri tipini kullanacağız. 
```dart
class CounterCubit extends Cubit <int> {}
```
5. Cubit class'ın kullanılmak için **flutter bloc** paketinden import etmeyi unutma
6. Cubit classı artık bizden **initialState** isteyecektir.
7. Bu initialState Construct ile vereceğiz. 
```dart
class CounterCubit extends Cubit <int> {
    CounterCubit(int initialState) : super(initialState);
}
```
8. Şimdi biraz düzenleme işlemleri yapalım. *CounterCubit classı herhangi bir instates almasın.* Ama super ini sıfır gibi bir değer yollayalım. Bu mekanizma çalışmaya başlarken elde sıfır ile başlaşın şeklinde yorumlanabilir.
```dart
class CounterCubit extends Cubit <int> {
    CounterCubit() : super(0);
}
```
9. Artık fonksiyon tanımlaması yapabiliriz. **increment** ve **decrement** fonksiyonlarını tanımlayalım.
```dart
class CounterCubit extends Cubit <int> {
    CounterCubit() : super(0);

    void increment (){}
    void decrement (){}
}
```
10. Yapacağımız işlemler artık **CounterCubit** classı tetiklendiğinde fonksiyonlar bize **yeni state** verecektir. Yeni bir state verme olayını **emit** fonsiyonu ile yapıyoruz.*emit* foksiyonun içerisine **yeni state** durumunu içerecek olan nesneyi vermemiz gerekecek. Cubit classının çalıştığı veri tipi *int* olarak belirtmiştik. Dolasıyla CounterCubit classı bizlere *yeni bir state* olarak int bir değer üretecektir. Peki var olan başlangıçtaki state nasıl ele alacağız. initiala verdiğimiz değeri **state** kelimesiyle ulaşıyoruz.
```dart
class CounterCubit extends Cubit <int> {
    CounterCubit() : super(0);

    void increment (){
        emit(state +1);
    }
    void decrement (){
        emit(state -1);
    }
}
```
11. Yukarıdaki kod yapısını **[Lambda Expressions](https://github.com/TarkanKara/Bloc_Cubit/blob/master/lib/cubit_1_counter/counter_cubit.dart)** olarak gösterelim.
```dart
class CounterCubit extends Cubit <int> {
    CounterCubit() : super(0);

    void increment () => emit(state +1);
    void decrement () => emit(state -1);
}
```
12. Cubit mekanizması artık hazır. **[BlockProvider](https://github.com/TarkanKara/Bloc_Cubit/blob/master/lib/cubit_1_counter/cubit_page.dart)** Widgetı ile uygulmanın her yerine aynı instate kullanabileceğiz. 
```dart
class _Cubit1PageExampleState extends State<Cubit1PageExample> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: const Cubit1PageView(),
    );
  }
}
```
**BlocProvider** Widgetını kullanarak uygulamaya kullanıldığı yerden itibaren **CounterCubit instate** verecektir. Bu widgetı kullanmak için *flutter_bloc* paketini import etmemiz gerekecek. Şimdi bizlere bu *instate* verebilmesi için **create:** parametresine ilgili sınıftan bir örnek tanımlamamız lazım;
```dart
return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit());
```
**BlocProvider** kullanıldığı yerden itibaren uygulama içerisinde kullanılabicek bir **CounterCubit instate** var.
13. Şimdi Text Widgetın içerisinde *CounterCubit classından* bir değer gösterelim. Şimdi bu noktada değişikliği ele almak istediğimiz yapıyı yeni bir widget ile sarmalamaız gerekecek. Bu widgetın adı **BlocBuilder**
14. **BlocBuilder** ile ele aldığımız Cubit veya Block yapısı üzerinden **değişen stateleri** kolaylıkla görüntüleyebilceğiz.
15. **BlocBuilder** yapısı generik olarak bizlerden hangi yapıyı kullanacaksam onu isteyecektir.(CounterCubit classı) ve aynı zamanda bu yapının üreteği state i isteyecektir.(CounterCubit classı int bir state üretiyordu)
```dart
 body: BlocBuilder<CounterCubit, int>(
        builder: (context, appstate) {
          return Center(
            child: Center(
                child: Text(appstate.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(fontSize: 35))),
          );
        },
      ),
```
**builder** parametreside **context** ve **güncel state mi içerecek bir callback** ten başka bişey değil. Güncel state i tutan callback ismini **appstate** verdim. Artık Text Widgetı içerisinde callback çağırma işlemi yapabiliriz. String e çevirmemizin sebeti CounterCubit classın içerisndeki statin int veri tipinde olması ve bu yüzden callback imiz olan appstate int veri tipine sahip olacaktır.
```dart
Text(appstate.toString())                  
```
16. Uygulama ilk çalıştırıldığında CounterCubit classına verdiğimiz **initialState** sıfır olduğu için Text widgetı sıfır ifadesini gösterecektir.
:bangbang: :bangbang:
```dart
NOT : CounterCubit classın içerisindeki metotlar initialState i emit edecektir. BlocBuilder ile bu yayılan emmit işlemlerini aktif olarak dinliyoruz.
BlockBuilder temelde aslında StreamBuilder gibi çalışıyor.                  
```
17. [Buttonlara tıklanma durumlarına bakalım](https://github.com/TarkanKara/Bloc_Cubit/blob/master/lib/cubit_1_counter/cubit_page.dart)
```dart
TextButton(
    onPressed: () {
        context.read<CounterCubit>().increment();
        },
        child: const Text("Inc", style: TextStyle(fontSize: 20))),                
```







