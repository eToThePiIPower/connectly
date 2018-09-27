# Connectly

Connectly is an application to keep track of your professional contacts,
including the nature and content of each individual connection you make with
them.

It was build by it's author to help him keep track of the people he didn't
interact with on a daily basis but still wished to maintain professional
connections with. As such, it's main goals are to:

* Keep track of the contacts (the basic CRUD stuff)
* Keep track of the individual `connections` made with each contact
  * In-person conversations
  * Email (possibly integrating with Gmail)
  * Real-time text (possibly integrating with Slack)
  * ...
* Keep track of the 'freshness' of each contact
* Show a dashboard with contacts that should be connected with this week to
  maintain a certain level of freshness
* Keep track of `promises` made to contacts

## Setup

### System dependencies

Connectly was build on Ruby 2.5.1 and Node 10.8.0.
It uses `.ruby-version` and `.node-version` files to integrate with version
managers such as `rbenv` and `nodenv`.

Connectly also uses Postgres for the database, with the OSSP-uuid extension.
Some Linux distributions don't ship with the OSSP-uuid extension installed by
default, and your database user must be a superuser to enable the extension.
Below are notes on OS-specific instructions for enabling OSSP-uuid.

#### Ubuntu

No special installation is needed.

#### OpenSUSE

```
sudo zypper in ossp-uuid postgresql-contrib
```

#### MacOS

TODO: Test on MacOS

### Install dependencies and database

Once the system dependencies are installed, a basic rails+webpack setup
procedure will get up you and running.

```
bundle install
yarn install
rake db:setup
```

### Generate a secrets.yml

You will likely need to generate a `config/secrets.yml` file to work with
Devise. Because best practices dictate not to keep this file in version control,
you can use the following template to get started. Replace the `secret_key_base`
entries with a random 512-bit hex number 512-bit hex number.

```
development:
  secret_key_base: #insert_random_512_bit_hex_here

test:
  secret_key_base: #insert_random_512_bit_hex_here

production:
  secret_key_base: <%= ENV["SECRET_KEY_BASE"] %>
```

You can generate a random 512-bit (128 character) hex key on Linux/Mac via

```
tr -dc 'a-f0-9' < /dev/urandom | head -c128
```

## Running the tests and dev server

### The Test Suite

Run RSpec tests via:

```
rake
```

### The Linters

Run the entire suite of linters via:

```
rake lint
```

Individual linters can be run using:

```
rake lint:rubocop lint:reek lint:erblint lint:eslint lint:scss_lint
```

### Running Foreman

We're using foreman to run both the rails server and the webpack-dev-server in
development. You can either run it manually (passing in the development
Procfile) via: `foreman start -f Procfile.dev` or using a provided binstub to
automatically find the development Procfile:

```
bin/foreman
```
