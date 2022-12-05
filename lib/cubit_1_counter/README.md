## Counter Cubit 

- Cubit dediğimiz gibi block mekinazmasının sadeleştirilmiş ve basitleştirilmiş hali olarak geçiyor.
- Kullanım Mekanizması;
1. Bir sınıf oluştur. Sınıfımızın ismi **CounterCubit** olsun
2. Bu sınıfı **Cubit class'ından extends** edeceğiz.
3. 
```dart
class CounterCubit extends Cubit {}
```
4. Ve bu **cubit classı** da hangi tip veri ile çalışacaksa bunu bilmek istiyor.
5. Counter Sayaç uygulaması için **int** veri tipini kullanacağız.
6. 
```dart
class CounterCubit extends Cubit <int> {}
```
7. Cubit class'ın kullanılmak için **flutter bloc** paketinden import etmeyi unutma
8. Cubit classı artık bizden **initialState** isteyecektir.
9. Bu initialState Construct ile vereceğiz.
10. 
```dart
class CounterCubit extends Cubit <int> {
    CounterCubit(int initialState) : super(initialState);
}
```
11. Şimdi biraz düzenleme işlemleri yapalım. *CounterCubit classı herhangi bir instates almasın.* Ama super ini sıfır gibi bir değer yollayalım. Bu mekanizma çalışmaya başlarken elde sıfır ile başlaşın şeklinde yorumlanabilir.
```dart
class CounterCubit extends Cubit <int> {
    CounterCubit() : super(0);
}
```
12. Artık fonksiyon tanımlaması yapabiliriz. **increment** ve **decrement** fonksiyonlarını tanımlayalım.
```dart
class CounterCubit extends Cubit <int> {
    CounterCubit() : super(0);

    void increment (){}
    void decrement (){}
}
```
13. Yapacağımız işlemler artık **CounterCubit** classı tetiklendiğinde fonksiyonlar bize **yeni state** verecektir. Yeni bir state verme olayını **emit** fonsiyonu ile yapıyoruz.*emit* foksiyonun içerisine **yeni state** durumunu içerecek olan nesneyi vermemiz gerekecek. Cubit classının çalıştığı veri tipi *int* olarak belirtmiştik. Dolasıyla CounterCubit classı bizlere *yeni bir state* olarak int bir değer üretecektir. Peki var olan başlangıçtaki state nasıl ele alacağız. initiala verdiğimiz değeri **state** kelimesiyle ulaşıyoruz.
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
14. Yukarıdaki kod yapısını **Lambda Expressions** olarak gösterelim.
```dart
class CounterCubit extends Cubit <int> {
    CounterCubit() : super(0);

    void increment () => emit(state +1);
    void decrement () => emit(state -1);
}
```
15.Cubit mekanizması artık hazır. **BlockProvider** Widgetı ile uygulmanın her yerine aynı instate kullanabileceğiz. 





