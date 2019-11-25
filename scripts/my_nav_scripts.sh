#!/bin/bash

navigate_to_code() {
  if [ -d $PATH_TO_CHADS_CODE/projects/$1 ];
  then
    cd $PATH_TO_CHADS_CODE/projects/$1
  else
    echo "$PATH_TO_CHADS_CODE/projects/$1 was not found! Dumping you in $PATH_TO_CHADS_CODE/projects"
    cd $PATH_TO_CHADS_CODE/projects
  fi
}