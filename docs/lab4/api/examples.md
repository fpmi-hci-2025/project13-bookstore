# Примеры запросов (curl)

Перед началом задайте переменную окружения с базовым URL Mock-сервера:
```bash
export MOCK_URL="https://virtserver.swaggerhub.com/<user>/<api>/<version>"
```

Авторизация:
```bash
curl -s -X POST "$MOCK_URL/auth/login" \
  -H 'Content-Type: application/json' \
  -d '{"username":"anna","password":"P@ssw0rd"}'
```

Список книг:
```bash
curl -s "$MOCK_URL/books?q=python&genre=education&sort=newest"
```

Детали книги:
```bash
curl -s "$MOCK_URL/books/1"
```

Добавить в корзину:
```bash
curl -s -X POST "$MOCK_URL/cart/items" \
  -H 'Content-Type: application/json' \
  -d '{"bookId":1,"quantity":2}'
```

Оформить заказ:
```bash
curl -s -X POST "$MOCK_URL/orders" \
  -H 'Content-Type: application/json' \
  -d '{"deliveryAddress":"Москва, ул. Пушкина, 1","payment":{"method":"card","pan":"4111111111111111","exp":"12/26"}}'
```

Оставить отзыв:
```bash
curl -s -X POST "$MOCK_URL/books/1/reviews" \
  -H 'Content-Type: application/json' \
  -d '{"rating":5,"comment":"Отличная книга!"}'
```
