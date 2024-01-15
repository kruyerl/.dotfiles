#!/usr/bin/env bash
# This script should be sourced.

# Where to store current ssh-agent pid.
SSH_AGENT_PID_FILE="${HOME}/.cache/ssh-agent.pid"

# Use persistent path to ssh-agent socket.
export SSH_AUTH_SOCK="${HOME}/.cache/ssh-agent.sock"

# Ensure that cache directory exists.
if [ ! -d "${HOME}/.cache" ]; then
	mkdir -p -m 700 "${HOME}/.cache"
fi

# Get ssh-agent pid from file if available.
if [ -e "${SSH_AGENT_PID_FILE}" ]; then
	if [ ! -f "${SSH_AGENT_PID_FILE}" ]; then
		# If pidfile is not a regular file - delete unconditionally.
		# That's unexpected case.
		rm -rf "${SSH_AGENT_PID_FILE:?}"
	else
		# Read no more than 8 bytes from file.
		SSH_AGENT_PID=$(dd if="${SSH_AGENT_PID_FILE}" bs=1 count=8 2>/dev/null)
	fi
fi

# Using 'kill -CONT pid' to check for running processes appears to be portable
# and is required on Android for circumvention of proc hidepid mount option.
# Even though ssh-agent is running as same user as current shell, it is not
# visible under /proc for current user for unknown reason, but can be listed
# by root and adb.
if ! kill -CONT "${SSH_AGENT_PID-null}" >/dev/null 2>&1; then
	unset SSH_AGENT_PID
	rm -f "${SSH_AUTH_SOCK:?}"
	eval "$(ssh-agent -a "$SSH_AUTH_SOCK" -s -t 86400)" >/dev/null

	if [ -n "$SSH_AGENT_PID" ]; then
		echo "$SSH_AGENT_PID" > "$SSH_AGENT_PID_FILE"
	fi
fi

# Remove unneeded variables.
unset SSH_AGENT_PID_FILE