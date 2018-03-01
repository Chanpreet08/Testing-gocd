#!/bin/bash

branch="master"
inc=.1

tag_array=($(git ls-remote --tags))

latest_tag=${tag_array[-1]}

tag_ver=${latest_tag//[!0-9!.]/}

new_ver=`echo $tag_ver + $inc | bc`

new_tag='v'$new_ver

echo $new_tag

git add .

git commit -m "$1"

git tag $new_tag

git push origin $new_tag

echo 'Everything Completed'



