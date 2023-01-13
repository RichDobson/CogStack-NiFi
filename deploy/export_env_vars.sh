#!/bin/bash

set -o allexport

current_dir=$(pwd)
security_dir="../security/"

env_files=("nifi.env"
           "elasticsearch.env"
           "database.env"
           "jupyter.env"
           "nlp_service.env"
           "project.env"
           $security_dir"certificates_nifi.env"
           $security_dir"certificates_general.env"
           $security_dir"certificates_elasticsearch.env"
           $security_dir"es_cogstack_users.env"
           $security_dir"elasticsearch_users.env"
           )

unamestr=$(uname)


for env_file in ${env_files[@]}; do
  file_text=""

  if [ "$unamestr" = 'Linux' ]; then
    file_text=$(grep -v '^#' $env_file | xargs -d '\n' -0)
    IFS_="$IFS"
    unset IFS
    IFS=$'\n'

    for line in ${file_text};
    do
      if [ ! -z "$line" ]; then
        env_var_name=${line%%\=*}
        unset $env_var_name
        export "${line[@]}"
      fi
    IFS=$IFS_
    done

  elif [ "$unamestr" = 'FreeBSD' ] || [ "$unamestr" = 'Darwin' ]; then
    file_text=$(grep -v '^#' $env_file | xargs -0)
    echo $file_text | while read line 
    do 
      if [ ! -z "$line" ]; then
        env_var_name=${line%%\=*}
        unset $env_var_name
        export $line
      fi
    done
  fi


done

set +o allexport