#!/bin/bash

sudo apt-get purge empathy* -f -y;

sudo apt-get purge thunderbird* -f -y;

sudo apt-get purge remmina* -f -y;

sudo apt-get purge landscape* -f -y;

sudo apt-get purge gnome-orca -f -y;

sudo apt-get purge openjdk* -f -y;

sudo apt-get purge xterm -f -y;


# Remove lens ############################################################################################# START
GS="/usr/bin/gsettings"
CCUL="com.canonical.Unity.lenses"

# Figure out the version of Ubuntu that you're running
V=`/usr/bin/lsb_release -rs`
# The privacy problems started with 12.10, so earlier versions should do nothing
if awk "BEGIN {exit !($V < 12.10 || $V >= 14.10)}"; then
  echo "Good news! This version of Ubuntu is not known to invade your privacy."
else
  # Check Canonical schema is present. Take first match, ignoring case.
  SCHEMA="`$GS list-schemas | grep -i $CCUL | head -1`"
  if [ -z "$SCHEMA" ]
    then
    printf "Error: could not find Canonical schema %s.\n" "$CCUL" 1>&2
    exit 1
  else
    CCUL="$SCHEMA"
  fi

  # Turn off "Remote Search", so search terms in Dash don't get sent to the internet
  $GS set $CCUL remote-content-search none

  sudo apt-get purge unity-lens-shopping -f -y;
  sudo apt-get purge unity-lens-friends -f -y;
  sudo apt-get purge unity-lens-photos -f -y;
  sudo apt-get purge unity-lens-music -f -y;
  sudo apt-get purge unity-lens-video -f -y;
  sudo apt-get purge unity-lens-gwibber -f -y;
  
  $GS set $CCUL disabled-scopes \
    "['more_suggestions-amazon.scope', 'more_suggestions-u1ms.scope',
    'more_suggestions-populartracks.scope', 'music-musicstore.scope',
    'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope',
    'more_suggestions-skimlinks.scope']"

  # Block connections to Ubuntu's ad server, just in case
  if ! grep -q "127.0.0.1 productsearch.ubuntu.com" /etc/hosts; then
    echo -e "\n127.0.0.1 productsearch.ubuntu.com" | sudo tee -a /etc/hosts >/dev/null
  fi

  echo "All done. Enjoy your privacy."
fi
# Remove lens ############################################################################################# END
