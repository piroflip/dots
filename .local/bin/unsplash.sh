#!/bin/bash
myplace="/home/piroflip/wp/"

# get images from unsplash.com
picurl=`curl -# https://unsplash.com/ | grep '<img src="https' | tr '"?' '\n' | grep ^https`
cPics=`echo $picurl | wc -w`
if [ $cPics -lt 1 ]
then
        echo 'check connection'
        exit;
fi

cd $myplace
# images from today?
present=`ls | grep $(date +%Y%m%d) | wc -l`
if [ $present -gt 1 ]
then
        echo 'last fetch today'
        exit;
fi

## Remove old images
rm *unsplash*

## retrieve new Images
cd /tmp/
for line in $picurl; do
     curl -O -# "$line"
     filename=`echo ${line} | sed 's/.*\///g'`
     nfilename=`date +%Y%m%d-unsplash-$filename`
     mv ${filename} ${myplace}${nfilename}
done
