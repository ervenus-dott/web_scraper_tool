#!/bin/bash

echo hello down there

echo the size of the samples directory is:
du -sh samples
printf "report:\n----\n\n" > report.txt

curl localhost:8000/unmodified.html > temp/test.html

grep -q -i '<h1>Welcome to the webpage!</h1>' temp/test.html\
  && echo default header located >> report.txt
grep -q -i '<p>this is a page the student hasn'"'"'t bothered modifying yet</p>' temp/test.html\
  && echo default page content located >> report.txt
grep -q -i '<h1>Welcome to the secret goat internet</h1>' temp/test.html\
  && echo Secret goat header located >> report.txt

printf "\n----\nreport concluded" >> report.txt