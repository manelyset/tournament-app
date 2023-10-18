# tournament-app

Ruby: 2.7.2
Rails: 7.1.1
Database: PostgreSQL 12

How to launch an app:
```
bundle install
rails db:create && rails db:migrate
rails s
```

How it works:
Scores are generated randomly from 1 to 100, the winner of each round is defined by round score
In playoff, the best team out of 4 is matched with the worst team, the remaining teams match with each other (it is chosen based on scores of the previous round)

Tournament bracket HTML and CSS by Kristen Nielsen: https://codepen.io/kenielsen/pen/aVYJLX
