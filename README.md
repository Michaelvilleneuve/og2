# Somes notes for the reader

### Running the app
```
bundle exec rails s
```
### Running the worker
```
bundle exec rails factories:work
```
### Running the tests
```
bundle exec rails test
```

### Why an inheritance for the factory ?
Inheritance have some drawbacks, especially when using ActiveRecord, but since all factories have the same columns it made sense to use an STI there.

### Some improvements I would like to add :
- Extract some PORO from the Factory model to clean it
- Add testing to controllers
- Add a procfile to better manage server launch
