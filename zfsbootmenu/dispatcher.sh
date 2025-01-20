#!/bin/bash
set -e

## Get the absolute path to the current script directory
script_dir="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" && pwd)"

## Ensure at least one argument is provided
if [[ $# -eq 0 ]]; then
	echo "Error: missing command/argument for 'zorra zfsbootmenu'"
	echo "Enter 'zorra --help' for command syntax"
	exit 1
fi

## Parse the top-level command
command="$1"
shift 1

## Dispatch command
case "${command}" in
	update)
		"${script_dir}/${command}.sh" "$@"
	;;
	remote-access)
		"${script_dir}/${command}.sh" "$@"
	;;
	set-timeout)
		"${script_dir}/${command}.sh" "$@"
	;;
	*)
		echo "Error: unrecognized command 'zorra zfsbootmenu ${command}'"
		echo "Enter 'zorra --help' for command syntax"
		exit 1
	;;
esac