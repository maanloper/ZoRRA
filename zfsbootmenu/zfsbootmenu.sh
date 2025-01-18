#!/bin/bash
set -e

## Get the absolute path to the current script directory
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

## Ensure at least one argument is provided
if [[ $# -eq 0 ]]; then
	echo "Error: missing command/argument for 'zorra zfsbootmenu'"
	echo "Enter 'zorra --help' for usage"
	exit 1
fi

## Parse the top-level command
command="$1"
shift 1

## Dispatch command
case "${command}" in
	set)
		"${script_dir}/set/set.sh" "$@"
	;;
	update)
		"${script_dir}/update.sh" "$@"
	;;
	remote-access)
		"${script_dir}/remote-access.sh" "$@"
	;;
	*)
		echo "Error: unrecognized command 'zorra zfsbootmenu ${command}'"
		echo "Enter 'zorra --help' for usage"
		exit 1
	;;
esac