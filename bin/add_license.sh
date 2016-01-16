#!/usr/bin/env bash

declare -a arr=("activenetwork-dec-2013" "backstopsolutions_2014_nov" "careerbuilder-2014-april" "careerbuilder-2014-march" "careerbuilder-2015-jan" "enova-2014-nov" "influitive-2015-jan" "jim" "matt_poodl" "orametrix_2014_july" "pennstate-2015-july" "phishme-2015-04" "poodl_2014_july" "poodl_2014_june" "poodnc-oct-2014" "procore-2014-aug" "procore-2015-mar" "rentpath-2014-aug" "rentpath-2014-march-trial" "rentpath-2014-may" "rentpath-2015-april" "sarah" "spaconf_2014" "sweetspot-feb-2014" "sweetspot-miracle" "workshop-cond-2-poly")

## now loop through the above array
for i in "${arr[@]}"
do
   cd "${i}"
   git checkout master
   git pull
   cp ~/Projects/classes/exercises/COPYRIGHT .
   cp ~/Projects/classes/exercises/LICENSE .
   git add .
   git commit -m 'add copyright and license'
   git push
   cd ..
   echo "done with $i"
done
