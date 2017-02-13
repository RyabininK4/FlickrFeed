# MobileAppOnSwift

## **FleckrFeed:**

### Описание задачи

Надо реализовать приложение для просмотра картинок из Flickr Public Feed.
Программный интерфейс Flick Public Feed описан тут:
https://www.flickr.com/services/feeds/docs/photos_pub..
Страница представляет из себя список фотографий с датой создания, названием и
списком тегов.
Должна быть возможность задавать список тегов для поиска фотографий,
сортировать фотографии по дате создания и названию.
При нажатии на фото оно должно открываться на весь экран.     

### Описание проделанной работы 

Приложение выдает список фотографий с их наименованием, датой и тегами. У пользователя есть возможность открыть изображение в полный экран. 
Процесс поиска по тегам и сортировки по дате и имени находится в разработке.

### Проблемы

Не получилось считать изображение с json файла, а именно не понял как перейти в директорию "media" -> "m"

![ProblemsScreen](https://github.com/RyabininK4/FlickrFeed/blob/master/FlickerMA/Image/Снимок%20экрана%202017-02-13%20в%2011.33.32.png)

### Скриншоты работы программы

![image1](https://github.com/RyabininK4/FlickrFeed/blob/master/FlickerMA/Image/Снимок%20экрана%202017-02-13%20в%2011.48.59.png)
![image2](https://github.com/RyabininK4/FlickrFeed/blob/master/FlickerMA/Image/Снимок%20экрана%202017-02-13%20в%2011.47.17.png)
![image3](https://github.com/RyabininK4/FlickrFeed/blob/master/FlickerMA/Image/Снимок%20экрана%202017-02-13%20в%2011.47.31.png)

### P.S
Также пробовал сделать приложение с использованием фреймворка alamofire, там получилось получить изображение, ссылка на проект [FlickrUsingFrame](https://github.com/RyabininK4/MobileAppOnSwift/tree/master/FlickrFeed)
