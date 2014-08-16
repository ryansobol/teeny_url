### Install MongoDB

Copy and paste the following commands:

```
parts install mongodb
parts start mongodb
```

### Start Puma

Open a new console, run the following commands:

```
cd ~/workspace/teeny_url
bundle install
bundle exec puma teeny_url.ru -p 3000
```
