#!/bin/bash

branch="master"
inc=.1

tag_array=($(git ls-remote --tags))

latest_tag=${tag_array[-1]}

tag_ver=${latest_tag//[!0-9!.]/}

new_ver=`echo $tag_ver + $inc | bc`

new_tag='v'$new_ver

echo 'Git Status'

git status 

echo 'Adding changes to git'

git add .

echo 'Status After Addition'

git status

echo 'Commiting changes with message:'$1

git commit -m "$1"

echo 'Creating new tag:'$new_tag

git tag $new_tag

echo'Pushing Tag '$new_tag' to remote'
 
git push origin $new_tag

echo 'Everything completed'




