#!/bin/bash

# TODO
# Add list of stuff to say
# Add option to install xcowsay


# Check if we have everything needed installed
if ! [ -x "$(command -v xcowsay)" ]; then
	echo "Aww, you do not have xcowsay installed" >&2
	exit 1
fi


# Temporary location to store our image
image_location=/tmp/pickle.png


# Lets be polite and clean up after ourselves
trap "{ rm -f $image_location; }" exit


# Generate the image
dig -t TXT @ns.zone.eu rick.ott.ee +short | sed  "s/[\" ]//g" | base64 -d  > $image_location

# Main function to be as annoying as possible
function say_moo {
	muuu=$(curl -s -X GET 'https://geek-jokes.sameerkumar.website/api')
        xcowsay -t 2 --image=$image_location $muuu &
}


# Start the annoying loop
while true
do
        say_moo
        sleep 0.5
done


# Hopefully we will not get so far but if we do ...
exit

