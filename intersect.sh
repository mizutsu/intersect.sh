#!/usr/bin/env bash

set -u

#######################################
# Define usage
# Globals:
#   ${0}
# Arguments:
#   None
# Returns:
#   None
#######################################
function usage {
    cat <<EOF
$(basename ${0}) is a tool to get common lines from multiple files.

Usage:
    sh $(basename ${0}) file1 file2 file3 file4 ...
    sh $(basename ${0}) file?
    sh $(basename ${0}) file*


Options:
    --version, -v     print ${0} version
    --help, -h        print this
EOF

exit 0
}

#######################################
# Define version
# Globals:
#   ${0}
# Arguments:
#   None
# Returns:
#   None
#######################################
function version {
  echo "$(basename ${0}) version 0.0.1 "

  exit 0
}


#######################################
# Print message with color
# Globals:
#   None
# Arguments:
#   color
# Returns:
#   None
#######################################
function cecho {
    local color=$1
    shift
    echo -e "\033[${color}m$@\033[m"
}

# If there is no argument then print usage.
if [ $# -eq 0 ]; then
  usage
fi

# Check 1st argument
case ${1} in
  --help|-h)
    usage
  ;;

  --version|-v)
    version
  ;;
esac

# Define readonly values for color code
declare -r GREEN=32
declare -r RED=31
declare -r YELLOW=33
declare -r BLUE=34

declare -i is_error=0
declare -a file_path_list=()

# Get target file path from command arguments
for argument in "${@}"
do
  if [ -r "${argument}" ]; then
    file_path_list+=( "${argument}" )
  else
    cecho ${RED} $(printf "Cannot read file (%s)." "${argument}")
    is_error=1
  fi
done

if [ ${is_error} -eq 1 ]; then
    exit 1
fi

declare -a intersect_value_list=()
# Get intersect values by grep each file
for line in $(cat "${file_path_list[0]}" | sort | uniq)
do
  is_error=0

  for file_path in "${file_path_list[@]}"; do
    result=$(grep -E "^${line}$" "${file_path}")
    if [ $? -ne 0 ]; then
      is_error=1
      break
    fi
  done

  if [ ${is_error} -eq 0 ]; then
    intersect_value_list+=( "${line}" )
  fi

done

# print intersect values
for intersect_value in "${intersect_value_list[@]}"; do
  echo -e "${intersect_value}"
done

exit 0