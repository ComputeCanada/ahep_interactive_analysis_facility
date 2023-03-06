#!/bin/bash

curr_folder=`pwd`
echo $curr_folder
cd $curr_folder
for folder in $(ls -d -1 *notebook*/);
do
  cd $curr_folder
  name=${folder%/}
  tag=axionhub/$name
  cd $folder
  docker build . -t $tag
  docker push $tag

done


