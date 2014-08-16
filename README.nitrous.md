### Nitrous.IO Setup

Copy and paste the following commands:

```
parts install mongodb
parts start mongodb
cd ~/workspace/teeny_url
bundle install
```

### Launch TeenyURL

Run the following command:

```
bundle exec puma teeny_url.ru -p 3000
```
