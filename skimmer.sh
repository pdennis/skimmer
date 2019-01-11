#!/bin/sh
#skimmer is a quick and dirty shell script to parse LexisNexis news dumps (currently plaintext only) and only display article metadata + a keyword (like candidate last name) + surrounding context. 
it saves you a lot of  scrolling. 
# synax: skimmer [keyword] [targetfile]

#Requires pcregrep, which can be installed as part of pcre. on mac, brew install pcre. on ubuntu apt-get install pcregrep

pcregrep -i -M -e '\d{1,3} of \d{1,3} DOCUMENTS[\s\S]{1,1000}LENGTH[\s\S]{1,10}words' -e "\d[\s\S]{1,600}$1[\s\S]{1,600}" $2

