# Installation

Ruby & postgresql should be already installed on your computer.

Install gems:

`bundle`

Create DB and fill it with data:

```
rails db:create
rails db:migrate
rails db:seed
```

Install redis for Linux:

```
sudo apt install redis
```

OR install for MacOs:

```
brew install redis
```

Run first task through the terminal:
```
rails c
DisburseOrdersForWeekJob.perform_later(Time.now.next_week)
```
