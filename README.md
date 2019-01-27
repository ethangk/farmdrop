# UrlShorterner

I've setup docker and compose for this project. To run, just run `docker-compose up`

To send a request, it's necessary to include a `content-type` header:

```
curl localhost:4000 -XPOST  -H "Content-Type: application/json" -d '{ "url": "http://www.farmdrop.com" }'
```

I've implemented prepending `http` to the url in `UrlShorterner.Storage.Url`. I've opted for `http`, vs `https` as my assumption is that more websites will be supporting `http`.