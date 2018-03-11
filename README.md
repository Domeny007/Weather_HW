# WeatherApp
MKMapView + SDWebImage + API 

## ДЗ: 
Выбрать архитектуру MVP/VIPER/MVVM (можно использовать RxSwift) Нужно будет реализовать приложение по работе с погодой. Используя любое API по работе с погодой нужно будет реализовать приложение для отображение погоды в конкретном городе.   
**Все картинки подгружаются и кэшируются с помощью SDWebImage.**
### Экраны приложения: 

1) Экран с картой  и поиском в навигейшен баре.  
2) Экран детального отображения информации о городе. 
#### Карта с поиском в навигейшен баре: 
Экран позволяет найти город в поиске (при поиске происходит выпадение/появление подсказки мест (прим. как в AppStore при поиске)).  Если город найден - он помечается пин-ом на карте и карта центруется/зумится по нему, чтобы город был виден.   По нажатию на точку открывается окошко пина с  изображением герба города + стрелочкой.  По нажатию на стрелочку происходит переход на экран детального отображения информации о городе.
#### Экран детального отображения информации о городе:
Представляет собой экран с изображением города(достопримечательности города) на весь экран. На экране есть UILabel-ы с:  названием города, текущая температура в городе, погодные условия (типа "дождливо, облачно" и т.д.), время восхода и время заката в городе. Снизу экрана лежит коллекция, где отображаются другие данные о погоде в городе типа: направление ветра, давление, влажность, облачность, дождливость. Коллекция имеет стандартную пагинацию коллекции и скроллится только горизонтально. Т.е. в один момент видим только 1 ячейку с инфой.  
# Weather_HW
