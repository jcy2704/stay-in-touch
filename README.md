# Stay In Touch

Stay In Touch is a Social Media App, created using the RoRSocialScaffold by Microverse. We implemented a Friendship system where you can add/invite to be friends as well as a decline feature. We also added a friend list in the right side so people can see who befriended who.

## Built With

- Ruby v2.7.0
- Ruby on Rails v5.2.4

## Live Demo

[SIT - Social Media](http://sit-social-media.herokuapp.com/)


## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

Ruby: 2.6.3
Rails: 5.2.3
Postgres: >=9.5

### Setup

Instal gems with:

```
bundle install
```

Setup database with:

```
   rails db:create
   rails db:migrate
```

### Usage

Start server with:

```
    rails server
```

Open `http://localhost:3000/` in your browser.

### Run tests

```
    rpsec --format documentation
```


### Deployment

In order to deploy this app to Heroku follow the steps below

Install the Heroku CLI available [here](https://devcenter.heroku.com/articles/heroku-cli)

After that type the command to create the app and add the heroku repository to your project

```
    heroku create
```

Then deploy the app.

```
    git push -u heroku {you-branch}:master
```
    
Change {your-branch} for the name of your local branch

Follow the instructions on your terminal to get the URL where your app was deployed


Finally run the command to create your database and tables on Heroku's server

```
    heroku run rails db:migrate
``` 

## Authors

👤 **Steven Jack Chung**

- GitHub: [@jcy2704](https://github.com/jcy2704)
- Twitter: [@yiak_](https://twitter.com/yiak_)
- LinkedIn: [Steven Jack Chung](https://linkedin.com/in/stevenjchung)

👤 **Marcelo Fernandes**

- GitHub: [@marcelomaidden](https://github.com/marcelomaidden)
- Twitter: [@marcelomaidden](https://twitter.com/marcelomaidden)
- LinkedIn: [Marcelo Fernandes](https://linkedin.com/in/marcelofernandesdearaujo)


## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/jcy2704/stay-in-touch/issues/).

## Show your support

Give a ⭐️ if you like this project!
