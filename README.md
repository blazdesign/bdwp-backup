# bdwp-backup
Automated WordPress backup bash script, tested on Dreamhost VPS hosting. User account must have shell access.

## Setup

1. Visit https://www.dropbox.com/developers/apps/create to create an app.
  * Choose an API: Dropbox API
  * Choose the type of access you need: App folder
  * Name your app: Something unique of your choice


2. Clone repo `git clone https://github.com/blazdesign/bdwp-backup.git`
3. Make a copy of the config file `cp config.sample.sh config.sh`
4. Add your details to the config file `nano config.sh`
5. Run a backup `./backup.sh`
  * If this is the first time setting up on a domain, you’ll need to follow the prompts add a DropBox app key and secret.

Automatic backups can be configured in Dreamiest by navigating to Goodie, Cron Jobs, then Add New Cron Job. Use the command like:
`/home/<username>/bdwp-backup/backup.sh`
