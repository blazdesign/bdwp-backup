# bdwp-backup
Automated WordPress FTP backup bash script, tested on Dreamhost VPS hosting. User account must have shell access. May work on other hosting providers, but WP-CLI must be installed as the database backup utilizes it.

## Setup

1. Clone repo `git clone https://github.com/blazdesign/bdwp-backup.git`
3. Add your details to the config section
4. Run a backup `./backup.sh`
  * If this is the first time setting up on a domain, you’ll need to follow the prompts add a DropBox app key and secret.

Automatic backups can be configured in Dreamiest by navigating to Goodie, Cron Jobs, then Add New Cron Job. Use the command like:
`/home/<username>/bdwp-backup/backup.sh`
