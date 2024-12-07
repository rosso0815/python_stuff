# flask_vue

## Project setup
```
npm install
```

### Compiles and hot-reloads for development
```
npm run serve
```

### Compiles and minifies for production
```
npm run build
```

### Lints and fixes files
```
npm run lint
```

### Customize configuration
See [Configuration Reference](https://cli.vuejs.org/config/).


swaxios -i http://127.0.0.1:8081/swagger.json -o ./generated

swagger-codegen -i http://127.0.0.1:8081/swagger.json -l java -o generated

swagger-codegen generate -i http://127.0.0.1:8081/swagger.json -l java -o generated
