### Nitrous.IO Setup

Copy and paste the following commands:

```
parts install mongodb
parts start mongodb
cd ~/workspace/teeny_url
bundle install
```

### Launch TeenyURL

Copy and paste the following command:

```
bundle exec puma -p 3000
```
