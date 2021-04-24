###Installing Ruby в 3 шага

#**************************
#Шаг 1

sudo apt update
sudo apt install curl
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get update
sudo apt-get install git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn

#**************************
#Шаг 2
#1 из 3 способов:
#1 способ
cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

rbenv install 3.0.1
rbenv global 3.0.1
ruby -v

#2 способ
sudo apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
rvm install 3.0.1
rvm use 3.0.1 --default
ruby -v

#3 способ
cd
wget http://ftp.ruby-lang.org/pub/ruby/3.0/ruby-3.0.1.tar.gz
tar -xzvf ruby-3.0.1.tar.gz
cd ruby-3.0.1/
./configure
make
sudo make install
ruby -v

#**************************
#Шаг 3
gem install bundler

###Configuring Git

#**************************
git config --global color.ui true
git config --global user.name "YOUR NAME"
git config --global user.email "YOUR@EMAIL.com"
ssh-keygen -t rsa -b 4096 -C "YOUR@EMAIL.com"

cat ~/.ssh/id_rsa.pub

ssh -T git@github.com

###Installing Rails

#**************************
gem install rails -v 6.1.3.1

rbenv rehash

rails -v
# Rails 6.1.3.1

###Setting Up A Database

#**************************
#Setting Up MySQL
sudo apt-get install mysql-server mysql-client libmysqlclient-dev

#Setting Up PostgreSQL
sudo apt install postgresql-11 libpq-dev
sudo -u postgres createuser chris -s
# If you would like to set a password for the user, you can do the following
sudo -u postgres psql
postgres=# \password chris

###Final Steps
#**************************
## If you want to use SQLite (not recommended)
rails new myapp
### If you want to use MySQL
rails new myapp -d mysql
### If you want to use Postgres
# Note that this will expect a postgres user with the same username
# as your app, you may need to edit config/database.yml to match the
# user you created earlier
rails new myapp -d postgresql
# Move into the application directory
cd myapp
# If you setup MySQL or Postgres with a username/password, modify the
# config/database.yml file to contain the username/password that you specified
# Create the database
rake db:create
rails server
#You can now visit http://localhost:3000 to view your new website!