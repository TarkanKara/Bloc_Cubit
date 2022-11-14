# bloc_cubit

# Reactive Programming?
- Bizler prosedürel programlama dillerinde kodlarımızı yazar ve ilgili programlamayı yaparız.
- Daha sonra bu kodlar derlenir ve adım adım çalıştırarak işlenir ve ortaya bir sonuç çıkar.
- Ama bu anlayışın bazı sınırlılıkları var.
- Örneğin bizler ardışık olarak birtakım işlemler yapıyoruz ama uygulamanın farklı bir (T) anında, farklı bir noktasında sürece dahil etmek istediğimiz bir parametre veya data olabilir. Side efect?
- Side Effect; uygulamalarda yapılan sorgulamalar neticesinde verilerde herhangi bir değişikliğin oluşup oluşmaması durumudur.Yani kısaca side effect bir işlem esnasında başka bir durumun, değişkenin, nesnesinin yahut değerin değiştirilmesine atıfta bulunan kavramdır.
- uygulamanın farklı bir (T) anında bir side effect söz konusu olabilir. 
- Ve bizler bunu uygulamaya dahil etmek istediğimizde ya var olan çalışan uygulamayı blog layıp süreci enbaşa alacağız ya da örneğin bir CallBack kullanarak uygulamanın O ana kadar çalışmış olan datasını hafızayı alıp var olanı da buna dahil edip süreci en baştan bu oluşan yeni kümeyle başlatabiliriz ve bunlarda bizlere işlemcimizi bir iş yükü olarak geri dönecektir.
- İşte bu gibi durumların ortaya çıkmasıyla aslında bu işi daha efektif nasıl yapabiliriz düşüncesi ortaya çıktı ve bu noktada reaktif anlayış sürece dahil oldu diyebiliriz.
- Reaktif programlama anlayışında ise bizler herhangi bir T anında (herhangi bir zaman diliminde) çalışan uygulamamızın üzerinden var olan veriye bir ekleme yapmak isteyebiliriz.
- Reactive programlama bunu asekron bir şekilde çalışma prensiplerini güderek uygulamamızın çalışmasını herhangi bir olumsuz etki olmadan bu yapının sürekliliğini sağlayacaktır diyebiliriz.
- Reactive anlayışının dart tarafında kullanılmasını sağlayan Rxdart paketinden de olduğunu unutmayalım.
- Reactive programlama anlayışı için en temelde asekron işlemleri baz alıyor diyebiliriz.
- Peki asekron olmak ne demektir?
- Sekron olmanın zıttı denilebilir :)
- Tanım olarak Asekron; bir işlem yapılırken o işlemin sonucunu beklemeden başka bir iş yapabilmeye eşzamnsızklık yani asekronluk diyoruz.
- Örneğin bizler uygulamamızı kullanırken burada bir butona basarak login olmak istiyor olabiliriz ama bu butona bastığımızda login olmamızı sağlayacak olan yapı anında bizlere cevap vermeyecektir.
- Eğer ki Bir web servisi çıkıyorsanız işte uygulamanızda bir mikroservis yapısı veya reacnative bir uygulama veya dağıtık sistemler söz konusu ise burada temelde ele alınan mantık en az kaynak kullanarak bizleri de en az bekleterek hızlı bir şekilde cevap vermektir.
- Bunu için asekronluk çok önemli ve asekron olmak bu bloc yapısınında temelini oluşturuyor.

# Bloc ?
- Daha doğrusu blog yapısını en temelde asekronluğu ele alıyor ve reactive programlama anlayışıyla sürekli bir akışı meydana getiriyor.
- Bizler bu yapıyı kullanarak sürece birtakım olayları ekleyip bunun sonucunda bir durum elde etmek isteyeceğiz ve bu bir akış olarak ele alındığı için UI imiz özellikle uygulama tarafında ilgili kullanıcıya gösterdiğiniz sayfalarımız sürekli güncel kalacaktır.
- En temelde ele alınan mantık budur.
- Bloc yapısı prensip olarak streamlarla çalışıyor.
- Yani data Stream verileriyle bu data stream lerde olaya dahil ettiğimiz her türlü event veya actions olarak nitelendirilebilir.
- Bunun neticesinde de bizlere tamamlanmış olan bir takım datalar veya hatalar gibi çıktılar verilecektir.
- Peki Bloc yapısının temelini oluşturan stream kavramı nedir?
- Flutter da streamlar ne anlama geliyor? Birazda bunlardan bahsedelim,
- Stremlardan bahsediyorsanız future'dan bahsetmemek olmaz
- Peki future nedir derseniz de, Future Tamamlanmamış her türlü bir hesaplama olarak düşünülebilir.
- Yani bir işlem var Bu işlem tamamlanacak ama ne zaman tamamlanacak şuan belli değil ama tamamlanacağını biliyoruz mutlaka o işlem sonucunda elimizde bir State olacak, ama ne zaman olacağını bilmiyoruz.Tamam Future bunu ifade ediyor.
- Stream de birden fazla futuredan meydana gelen yapının adı yani sizin uygulamanızda bir tane feature değil de birden fazla tamamlanması ne zaman sonuçlanacak bilinmeyen iş akışı varsa işte bu noktada kullanacağız data Modelin adı stream oluyor.
- Stream dediğimiz gibi tamamen asekron olaylardan meydana gelen bir veri yapısı ve bu asekron olaylar kelime anlamıyla aslında bir akış diyebilirz. 
- Ve bu stream Temelli Yapı içerisinde de blog en temelde şöyle bir çalışma prensibi güdüyor;
- Uygulamamızda ele almak istediğimiz yapıyı programlayacağımız kısım Bloc kısmı ve blok içerisine alacak event lara göre bir State üretecek bu event lar her türlü şey olabilir bu sizin programlama yeteneğinizi ve uygulamada ne yapmak istediğinize kalmış
- Örneğin; Bir kullanıcının bir uygulamaya login olabilmek için mutlaka size vermesi gereken iki tane parametre var Bunlardan bir tanesi kullanıcı adı, ikincisi şifresi,
- Block yapısında mesela bunu nasıl kontrol edersiniz kullanıcının mail adresi ve şifresini bloc yapısına girecek bir event olarak tanımlayabilirsiniz.
- Eğer kullanıcı adı ve şifreyi alarak ilgili servise çıktığımızda kullandığımız backend de Gerçekten böyle bir kullanıcı varsa bu sefer bir State üretiriz. Bu nedir kullanıcının uygulamaya login olma halidir.
- Veya kullanıcı login olduktan sonra bir butona basarak uygulamadan çıkış yapmak isteyebilir.
- Böyle bir durumda da sizin yeni üreteceğiniz state uygulamadan çıkış yapılmış hali olan logout state denilebilir.

# Cubit?
- Bu paketi tasarlayanlar blok yapısındaki karmaşıktan ötürü Cubit adı verilen daha basit kullanımı olan bir yapıyı da ortaya koydular.
- Cubitte de çalışma prensibi Bloc la aynı. Lakin bu sefer cubit mekanizmasına giren event lar, action lar event ve action adı ile değilde fonksiyonlar olarak artık daha anlaşılır bir şekilde sürece dahil olacaklar.
- Yine bu tetiklenen fonksiyonlar neticesinde cubit yapımız bizlere bir durum meydana getirecek çalışma prensipleri Bloc la aynı kullandıkları yöntem ve teknikler biraz farklı diyebiliriz.
- Cubit yapısını kullanarak ya bu uygulamalarda veya yapacağınız programlamada emit kavramı ve onChange kavramları bizler için önemli,
- Cubit yapımıza fonksiyonlar tetikleyerek birtakım event lar meydana gelecek
- Bunun neticesinde state imizi oluşturacağımız yapı daha doğrusu yeni bir event geldiğinde yeni bir state oluşmasını sağlayacak yapı bu emit fonksiyonları ile tetiklenecek 
- onChange metodu oluşturarak da sürekli ilgili yapıyı tetikleyebilcek olan event ları burada tanımlayarak tetiklendikleri anda hangisi state in kullanacağını, yollayacağını programlayacağız.

# Not:
- Uygulamanın Bloc yapısnın kullanmanın en güzel taraflarından bir tanesi uygulamaya enjekte ettiğimiz block instate ni uygulamanın her yerinde contex üzerinden yakalayabilmemizi, verilerimizi manipüle edebilmemiz olanak sağlar...









       

 


   
  

  

  

       

   


  






