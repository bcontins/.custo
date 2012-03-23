#!/bin/bash
scriptdir="$( cd "$( dirname "$0" )" && pwd )"
source $scriptdir/../../common/scripts/ini-parser.sh

profile_file="$HOME/.thunderbird/profiles.ini"
backup_dir="$HOME/Documents/backup/mails"
account_name="ssl0.ovh.net"

# Find mail folder

if [ ! -f $profile_file ]; then
    echo "Thunderbird configuration not found: $profile_file"
    exit 1
fi

cfg.parser $profile_file
cfg.section.Profile0
profile_dir="$HOME/.thunderbird/$Path"

if [ ! -d $profile_dir ]; then
    echo "Profile directory not found: $profile_dir"
    exit 1
fi

mail_dir=$profile_dir/ImapMail/ssl0.ovh.net

if [ ! -d $mail_dir ]; then
    echo "Mail directory not found: $mail_dir"
    exit 1
fi

# Backup INBOX

if [ ! -d $backup_dir ]; then
    mkdir -p $backup_dir
fi

if [ -f $backup_dir/ovh-inbox.tar.bz2 ]; then
    mv $backup_dir/ovh-inbox.tar.bz2 $backup_dir/ovh-inbox.tar.bz2.bak
fi

tar cvjf $backup_dir/ovh-inbox.tar.bz2 $mail_dir/INBOX

# Backup perso, pro and com

for type in "perso" "pro" "com"; do
    if [ -f $backup_dir/ovh-$type.tar.bz2 ]; then
        mv $backup_dir/ovh-$type.tar.bz2 $backup_dir/ovh-$type.tar.bz2.bak
    fi

    tar cvjf $backup_dir/ovh-$type.tar.bz2 $mail_dir/INBOX.sbd/$type $mail_dir/INBOX.sbd/archives.sbd/$type.sbd/????
done

