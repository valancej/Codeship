#!/bin/sh
echo "Adding image to Anchore engine"
anchore-cli image add $ANCHORE_IMAGE_SCAN
echo "Waiting for image analysis to complete"
counter=0
while (! (anchore-cli image get $ANCHORE_IMAGE_SCAN | grep 'Status\:\ analyzed') ) ; do echo -n "." ; sleep 10 ; if [ $counter -eq $ANCHORE_RETRIES ] ; then echo " Timeout waiting for analysis" ; exit 1 ; fi ; counter=$(($counter+1)) ; done
echo "Analysis complete"
if [ "$ANCHORE_FAIL_ON_POLICY" == "true" ] ; then anchore-cli evaluate check $ANCHORE_IMAGE_SCAN  ; fi