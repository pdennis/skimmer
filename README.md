# skimmer
Parse plaintext LexisNexis news dumps, and output only article metadata (publication, date, headline, byline, etc) and the portion of the article containing a chosen keyword.

Skimmer is a quick and dirty shell script to parse LexisNexis news dumps (currently only accepts plaintext input) and output article metadata (publication, byline, date, etc) plus the portion of the article containing a keyword keyword (like target's last name. It also displays 600 chars of context before and after the keyword. 

I made it to save myself scrolling on initial target overviews.

synax: ./skimmer [keyword] [/path/to/nexis/dump.txt]

Requires pcregrep, which can be installed as part of PCRE. On mac, you can install it with 'brew install pcre', assuming you have homebrew installed. On Ubuntu 'apt-get install pcregrep'

Mainly, this was an excuse for me to learn regular expressions, and as a result the script is basically a single line: pcregrep -i -M -e '\d{1,3} of \d{1,3} DOCUMENTS[\s\S]{1,1000}LENGTH[\s\S]{1,10}words' -e "\d[\s\S]{1,600}$1[\s\S]{1,600}" $2
