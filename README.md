# How To Install

## The OS components
You'll need
- A RedHat based distro, like [CentOS](https://centos.org) or [Fedora](https://getfedora.org) (I'll be using CentOS 7, for Fedora substitute `yum` with `dnf`)

Let's start.

First, you'll need to log in to your new VPS or dedicated server, on Windows, you can use [PuTTY](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html), [KiTTY](http://www.9bis.net/kitty/?page=Download), or [Bitvise](https://www.bitvise.com/download-area). Other paid options exist, but that's outside the scope of this article. For Linux, and Mac OS X (<10.12) or macOS Sierra (10.12), you should know how to do this natively, by running `ssh <root>@<server>` from your terminal emulator (my favourite is [iTerm2](https://www.iterm2.com/))

Next, let's update the OS, you can do this by issuing `yum update -y`

![CentOS updating](https://user-images.githubusercontent.com/9508934/30196631-52f1ba86-94b6-11e7-9502-76f4530879c8.png)
_CentOS updating_

____

### Extra Packages for Enterprise Linux

Next, we want to install the Extra Packages for Enterprise Linux (this only applies to CentOS, don't do this on Fedora), so issue `yum install -y epel-release`
![EPEL installation](https://user-images.githubusercontent.com/9508934/30196755-1e031ada-94b7-11e7-87b5-337436a74d72.png)
_EPEL Installation_

____

### PostgreSQL

Now install PostgreSQL with `yum install postgresql-server postgresql-contrib postgresql-devel -y`
![Installing PostgreSQL](https://user-images.githubusercontent.com/9508934/30196912-44c2117a-94b8-11e7-8ae0-8e43c560ba0c.png)
_Installing PostgreSQL_

Yay, almost half way there. Next we need the Development Tools group to be installed (this is required for Ruby). You can install this with `yum groupinstall -y "Development Tools"`
![Installing the Development Tools group](https://user-images.githubusercontent.com/9508934/30196935-65edec98-94b8-11e7-95d5-046681889677.png)
_Installing the Development Tools group_

Let's set PostgreSQL up next. Issue `postgresql-setup initdb` in your terminal.
![Initializing PostgreSQL](https://user-images.githubusercontent.com/9508934/30196971-d7060e88-94b8-11e7-8ccf-626d79dcdea4.png)
_Initializing PostgreSQL_

Now start the PostgreSQL service, and make sure it starts on boot with `systemctl start postgresql` and `systemctl enable postgresql`
![Starting and enabling PostgreSQL](https://user-images.githubusercontent.com/9508934/30197099-bc7265e8-94b9-11e7-83da-267f35eb5b64.png)
_Starting and enabling PostgreSQL_

PostgreSQL on CentOS has a little issue with template1 (the default template) not being UTF-8, let's fix that.

Start by running `sudo -upostgres -i psql` to drop to the PostgreSQL shell, once you're there, issue these commands to recreate `template1`

```sql
UPDATE pg_database SET datistemplate = FALSE WHERE datname = 'template1';
DROP DATABASE template1;
CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UNICODE';
UPDATE pg_database SET datistemplate = TRUE WHERE datname = 'template1';
\c template1
VACUUM FREEZE;
```

Finally, execute `\q` to quit
![Recreating template1](https://user-images.githubusercontent.com/9508934/30197179-391f8aee-94ba-11e7-8252-8ec3c1698d52.png)
_Recreating `template1`_

Now that's done, we need to create the user in PostgreSQL (so close to finished). Let's do that now with `sudo -upostgres -i createuser -d panther`
![Creating the PostgreSQL user](https://user-images.githubusercontent.com/9508934/30197259-cb4cac8a-94ba-11e7-9151-102b9f5d0e09.png)
_Creating the PostgreSQL user_

Finally, let's create the user Panther will run as with `useradd -m -s /bin/bash panther`
![Creating the user](https://user-images.githubusercontent.com/9508934/30197296-f874ce18-94ba-11e7-80ce-5bedd23bdbaa.png)
_Creating the user_

____


# Installing Node.js

Now to install Node.js. This will be the simplest part of this. Import the Node.js repo with `curl --silent --location https://rpm.nodesource.com/setup_8.x | sudo bash -`
![Importing the Node.js repo](https://user-images.githubusercontent.com/9508934/30197789-1a73e1ea-94be-11e7-8695-a6c1dd37b964.png)
_Importing the Node.js repo_

Finally, install Node.js with `yum -y install nodejs`
![Installing Node.js](https://user-images.githubusercontent.com/9508934/30197807-3a39ff14-94be-11e7-807d-5be6dfb53fb6.png)
_Installing Node.js_

____

# Installing Ruby

Next up is Ruby. Let's start by installing the extra packages rbenv will need with `yum install -y git-core zlib zlib-devel gcc-c++ patch readline readline-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison curl wget sqlite-devel`
![Installing Ruby requirements](https://user-images.githubusercontent.com/9508934/30197398-a71160f8-94bb-11e7-95ed-73e5223e8acc.png)
_Installing Ruby requirements_

Now switch to `panther` with `su - panther`
![Switching user to panther](https://user-images.githubusercontent.com/9508934/30197422-c2a5a9a0-94bb-11e7-939a-d0bd7f9f3732.png)
_Switching user to `panther`_

Next let's install rbenv with the following commands:
```shell
cd
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bash_profile
. ~/.bash_profile
```
![Installing rbenv](https://user-images.githubusercontent.com/9508934/30197485-236149e8-94bc-11e7-8e13-5db6923f8ca5.png)
_Installing `rbenv`_

Now let's install Ruby 2.4.0 with `rbenv install -v 2.4.0`
![Installing Ruby 2.4.0](https://user-images.githubusercontent.com/9508934/30197520-59016402-94bc-11e7-8bf8-26a6d730c34b.png)
_Installing Ruby 2.4.0_

Let's set ruby 2.4.0 as the default with `rbenv global 2.4.0`. Now to save space, you'll want to stop gem generating documentation with `echo "gem: --no-document" > ~/.gemrc`
![Making Ruby 2.4.0 the default](https://user-images.githubusercontent.com/9508934/30197680-4c1fa450-94bd-11e7-978c-a887dfdc24b8.png)
![Stopping gem from generating documentation](https://user-images.githubusercontent.com/9508934/30197681-4c22da62-94bd-11e7-887b-e0b91a8bf33a.png)
_Making Ruby 2.4.0 the default and stopping gem from generating documentation_

Now install bundler with `gem install bundler`
![Installing Bundler](https://user-images.githubusercontent.com/9508934/30197710-88a75080-94bd-11e7-9bfe-d6e9e2a4cd16.png)
_Installing Bundler_

_Just a few commands left!_

Next, you'll want to install Rails (5.0.0 only please!) with `gem install rails -v 5.0.0`
![Installing Rails](https://user-images.githubusercontent.com/9508934/30197712-8e7be5de-94bd-11e7-9855-f64e516f07d2.png)
_Installing Rails_

Finally, rehash rbenv with `rbenv rehash`

____

## Installing Panther

### Downloading Panther

Start by copying the link for the version of Panther you want to download (at the time of writing, only 53x is available)

Next, `wget` it with `wget <URL-you-just-copied>`
![Downloading Panther](https://user-images.githubusercontent.com/9508934/30197964-57819af4-94bf-11e7-8604-2da20bc1a543.png)
_Downloading Panther_

Change directory to it with `cd RMS-*`

Next, `bundle` the application with `bundle install`
![Bundling the application](https://user-images.githubusercontent.com/9508934/30198041-b4c29560-94bf-11e7-9dc7-df4b6fe014d0.png)
_Bundling the application_

Migrate the database with `rake db:create db:migrate`

Update the Postmark API token with your own from [Postmark](https://postmarkapp.com) by using `vi config/secrets.yml`, going to the line that says `replace-me` pressing <kbd>I</kbd> to insert, and when you're done, hitting <kbd>ESC</kbd> and typing `:wq`

Finally, start Panther with `rails s`
![Starting Panther for the first time](https://user-images.githubusercontent.com/9508934/30198211-98185b06-94c0-11e7-97fd-83aa89e875ba.png)
_Starting Panther for the first time_

Finally, browse to your server's IP on port 3000
![Visiting your site](https://user-images.githubusercontent.com/9508934/30198237-c362f460-94c0-11e7-9a11-bda19d955643.png)
_Visiting your site_

And create an account, by browsing to `<server-ip>:3000/signup`.
![Creating an account](https://user-images.githubusercontent.com/9508934/30198333-3f695860-94c1-11e7-965b-d78d424e3501.png)
_Creating an account_

After that, you might want to set your site's settings. Don't worry about the Dash and Blog options, they'll be autofilled for you. You'll need to grab a Facebook App ID if you want people to be able to share your content.

![Setting up your site](https://user-images.githubusercontent.com/9508934/30198416-aea2a86c-94c1-11e7-8d8d-bceecf584ef0.png)
_Setting up your site_

If you'd like to change the style of your site, use the colour options. My favourites are:

- Blog body and header: #212327
- Blog text: #ffffff
- Blog post: #353941
- Blog button: #e6e5e5
- Dash background: #212327
- Dash text: #ffffff
- Dash highlight: #23E1F4
- Dash menu text: #ffffff
- New Logo Image: `/images/logo-text-white.png`

This is what they look like:
![Blog Admin](https://user-images.githubusercontent.com/9508934/30198621-bc56d748-94c2-11e7-8751-d3ef9fd0a0ae.png)
![Blog](https://user-images.githubusercontent.com/9508934/30198635-cb7ccd0e-94c2-11e7-9828-68f6d5f8b145.png)

_____

## What next?

- Consider running this in a `screen` or `tmux` session, so it stays up when you close the terminal
- Use Apache's HTTPd or nginx for reverse proxying the application to port 80 and 443 if using SSL
- If using a reverse proxy, bind to 127.0.0.1 with `rails s -b127.0.0.1`

Have fun,

Theo
