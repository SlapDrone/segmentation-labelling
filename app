#!/bin/bash

# Source the .env file to load environment variables
if [ -f .env ]; then
  source .env
fi

# Function to display help message
display_help() {
  echo "Usage: $0 [OPTIONS] SSE_IMAGES_PATH"
  echo
  echo "OPTIONS:"
  echo "  -s PATH      Path to the settings.json file (default: ./settings.json)"
  echo "  -p PORT      Port for the application (APP_PORT environment variable)"
  echo "  -h, --help   Display this help message and exit"
}

# Set default values for arguments
SETTINGS_PATH="./settings.json"
APP_PORT_ARG="81"

# Parse the arguments using flags
while getopts ":s:p:h-:" flag; do
  case "${flag}" in
    s) SETTINGS_PATH="${OPTARG}";;
    p) APP_PORT_ARG="${OPTARG}";;
    h) display_help; exit 0;;
    -) case "${OPTARG}" in
        help) display_help; exit 0;;
        *) echo "Unknown option --${OPTARG}"; display_help; exit 1;;
      esac;;
    *) echo "Unknown option -${OPTARG}"; display_help; exit 1;;
  esac
done

# Shift to process remaining arguments
shift $((OPTIND-1))

# Check if there's a remaining argument for SSE_IMAGES
if [ $# -gt 0 ]; then
  SSE_IMAGES_ARG="$1"
else
  SSE_IMAGES_ARG="$SSE_IMAGES"
fi

# Validate that SSE_IMAGES is set, either as an argument or as an environment variable
if [ -z "$SSE_IMAGES_ARG" ]; then
  echo "Error: SSE_IMAGES must be provided as an argument or set as an environment variable."
  display_help
  exit 1
fi

# Check if APP_PORT is provided as an argument; if not, use the existing environment variable
if [ -z "$APP_PORT_ARG" ]; then
  APP_PORT_ARG="$APP_PORT"
fi

# Validate that APP_PORT is set, either as an argument or as an environment variable
if [ -z "$APP_PORT_ARG" ]; then
  echo "Error: APP_PORT must be provided with the -p flag or set as an environment variable."
  display_help
  exit 1
fi

# Export the environment variables
export METEOR_SETTINGS=$(cat "$SETTINGS_PATH")
export SSE_IMAGES="$SSE_IMAGES_ARG"
export APP_PORT="$APP_PORT_ARG"

# Run the docker-compose command
docker compose up
