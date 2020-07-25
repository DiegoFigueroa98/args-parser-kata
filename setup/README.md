# Setup

## Team Members
* Diego Aaron Figueroa Campos
* Andrea Silva Machado

## Steps to execute the project
1. Download the repository
2. Install gems with the command
  ``` 
  bundle install 
  ```

3. Execute project
```
ruby app/main.rb -l -p 8080 -d /usr/logs
``` 
```
ruby app/main.rb -g this,is,a,list -d 1,2,3,4,-5
```
## Pasos para ejecutar el archivo de pruebas
1. Ejecutar pruebas con el comando
```
rspec specs
```

## Verificar puntuacion de rubycritic en el proyecto
1. Ejecutar comando
```
rubycritic lib
```

# Verificar la puntuacion de rubycritic en las pruebas
1. Ejecutar comando 
```
rubycritic specs
```

# Verificar puntuación Sandi-meter
1. Ejecutar comando
```
sandi_meter 
 ```