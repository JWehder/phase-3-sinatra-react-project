# SalesTracker Backend

## Introduction

Hello, I am assuming that you are coming here from my frontend readme where I describe my application: SalesTracker. If not, here's my description:

Salestracker is a sales application consisting of a Javascript and React frontend with a Ruby and Sinatra backend that tracks the amount of revenue, units sold, and customers that are accumulated by salespeople. It allows you the ability to create, edit, and delete customers as well as the ability to create salespeople. Also, you may select a particular salesperson to see their customers as well as statistics on their sales performance.

You will need the frontend repo in order to get this project up and running. Check it out [here](https://github.com/JWehder/salestracker-app-frontend).

## Getting Started

### Backend Setup

This repository has all the starter code needed to get a Sinatra backend up and
running. [**Fork and clone**][fork link] this repository to get started. Then, run
`bundle install` to install the gems.

**Important**: Be sure you fork a copy of the repo into your GitHub account
before cloning it. You can do this by using the link above or by clicking the
"Octocat" button at the top of this page, then clicking "Fork" in the upper
right corner of the repo page.

[fork link]: https://github.com/JWehder/phase-3-sinatra-react-project/fork

You can start the server with:

```console
$ bundle exec rake server
```

This will run your server on port
[http://localhost:9292](http://localhost:9292).

You can also seed the database with random data with:

```console
$ bundle exec rake db:seed
```
Lastly, in order to enter a pry session and play with the data in real time use:

```console
$ bundle exec rake console
```

## License

[MIT](https://choosealicense.com/licenses/mit/)
