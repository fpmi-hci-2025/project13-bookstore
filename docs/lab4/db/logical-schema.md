# Логическая схема БД — книжный магазин (ЛР4)

Нотация: имя таблицы — поля (тип) — смысл

## Таблица `user`
- `id` (INTEGER): уникальный идентификатор пользователя
- `username` (VARCHAR(255)): имя пользователя
- `password` (VARCHAR(255)): хэш пароля
- `email` (VARCHAR(255)): электронная почта

## Таблица `book`
- `id` (INTEGER): идентификатор книги
- `title` (VARCHAR(255)): название
- `author` (VARCHAR(255)): автор
- `genre` (VARCHAR(100)): жанр
- `price` (DECIMAL(10,2)): цена
- `stock` (INTEGER): количество на складе

## Таблица `order`
- `id` (INTEGER): идентификатор заказа
- `user_id` (INTEGER): ссылка на пользователя
- `total_price` (DECIMAL(10,2)): сумма заказа
- `delivery_address` (VARCHAR(255)): адрес доставки
- `created_at` (TIMESTAMP): дата создания заказа
- `status` (VARCHAR(50)): состояние заказа

## Таблица `order_item`
- `id` (INTEGER): идентификатор позиции
- `order_id` (INTEGER): ссылка на заказ
- `book_id` (INTEGER): ссылка на книгу
- `quantity` (INTEGER): количество
- `price` (DECIMAL(10,2)): цена за единицу на момент покупки

## Таблица `review`
- `id` (INTEGER): идентификатор отзыва
- `user_id` (INTEGER): ссылка на пользователя
- `book_id` (INTEGER): ссылка на книгу
- `rating` (INTEGER): оценка (1–5)
- `comment` (TEXT): комментарий
- `created_at` (TIMESTAMP): дата отзыва
