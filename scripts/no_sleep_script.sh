#!/bin/zsh
MAILTO=""
PATH=/usr/local/bin:/usr/local/sbin:~/bin:/usr/bin:/bin:/usr/sbin:/sbin
# Used to not let a volume named MYBOOK sleep

volpresent=$(mount | grep -i MYBook1 | wc -c)

if [ $volpresent -gt 0 ]
then
    cd /Volumes/MYBook1
    echo "Last Runtime : [ $(date) ]">/Volumes/MYBook1/.hiddenfile
    /bin/cp -f ~/Downloads/tmp-copy-to-mybook-to-keep-alive.zip /Volumes/MYBook1/
    cd
fi
volpresent=$(mount | grep MYBook2 | wc -c)
if [ $volpresent -gt 0 ]
then
    cd /Volumes/MYBook2
    echo "Last Runtime : [ $(date) ]">/Volumes/MYBook2/.hiddenfile
    /bin/cp -f ~/Downloads/tmp-copy-to-mybook-to-keep-alive.zip /Volumes/MYBook2
    cd
fi
volpresent=$(mount | grep MYBook3| wc -c)
if [ $volpresent -gt 0 ]
then
    cd /Volumes/MYBook3
    echo "Last Runtime : [ $(date) ]">/Volumes/MYBook3/.hiddenfile
    /bin/cp -f ~/Downloads/tmp-copy-to-mybook-to-keep-alive.zip /Volumes/MYBook3
    cd
fi
volpresent=$(mount | grep MYBook4 | wc -c)
if [ $volpresent -gt 0 ]
then
    cd /Volumes/MYBook4
    echo "Last Runtime : [ $(date) ]">/Volumes/MYBook4/.hiddenfile
    /bin/cp -f ~/Downloads/tmp-copy-to-mybook-to-keep-alive.zip /Volumes/MYBook4
    cd
fi

volpresent=$(mount | grep MYBook5 | wc -c)
if [ $volpresent -gt 0 ]
then
    cd /Volumes/MYBook5
    echo "Last Runtime : [ $(date) ]">/Volumes/MYBook5/.hiddenfile
    /bin/cp -f ~/Downloads/tmp-copy-to-mybook-to-keep-alive.zip /Volumes/MYBook5
    cd
fi
volpresent=$(mount |grep WDTVLiveHub |wc -c)
if [ $volpresent -gt 0 ]
then
    cd /Volumes/WDTVLiveHub
    echo "Last Runtime : [ $(date) ]" > /Volumes/WDTVLiveHub/.hiddenfile
    /bin/cp -f ~/Downloads/tmp-copy-to-mybook-to-keep-alive.zip /Volumes/WDTVLiveHub/
    cd
fi

volpresent=$(mount | grep SeagateHub|wc -l)
if [ $volpresent -gt 0 ]
then
    cd /Volumes/SeagateHub 
    echo "Last Runtime : [ $(date) ]">/Volumes/SeagateHub/.hiddenfile
    /bin/cp -f ~/Downloads/tmp-copy-to-mybook-to-keep-alive.zip /Volumes/SeagateHub
    cd
fi
