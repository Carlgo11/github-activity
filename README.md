# GitHub Activity

This ruby script let's you know when you've been slacking on GitHub updates :wink:

# Installation

First you need to change the username and email in [script.rb](script.rb). Change the variables below:

```ruby
# GitHub username
username="carlgo11"
# Email address to send to
email_address="user@example.com"
# Path for email template to use
email_template="$HOME/github-activity/email_template.txt"
```

- `username` is your GitHub username.
- `email_address` is the email address you want to send the messages to.
- `email_template` is the location of [email_template.txt](email_template.txt). Enter the full path.

Next you need to change the sender's email address in [email_template.txt](email_template.txt).  
You can also change the message there if you want, to however this is optional.

When you're done with that we can try and run [script.rb](script.rb).  
The output should look something like the one below:

```
carlgo11@carlgo11:~/github-activity# ruby script.rb
Carlgo11 haven't been active on GitHub today. (last activity 2017-01-22)
Emailing them...
```

Next we want to run the script every day. For this I chose a simple cron job.  
As it's rather tricky to run Ruby via crontab as the PATH variables don't come along I made a shell script called [script.sh](script.sh).

In [script.sh](script.sh), change `$HOME/.rbenv/versions/2.4.0/bin/ruby` to the location of your ruby installation.

Then to create the cron job in crontab simply open crontab `crontab -e` and append the following line to the end of the document:

```shell
0 18 * * * bash -l -c "$HOME/github-activity/script.sh" > /dev/null
```

Change `$HOME/github-activity/script.sh` with the path to your [script.sh](script.sh). The `0 18` means the script will run at 6 PM (18:00) every day.

# Questions

If you have any questions or suggestions I'd love to hear from you!  
Just create an [issue](https://github.com/Carlgo11/github-activity/issues/new).
