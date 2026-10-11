# Bash Log Analyzer

## Overview

A command-line Bash script that summarizes a web server access log using standard Linux utilities.

## Features

- Validates command-line arguments.
- Checks whether the input is a regular file.
- Counts total lines.
- Counts GET and POST requests.
- Counts HTTP 404 and 500 responses.
- Counts unique IP addresses, assuming a conventional access-log format.

## Requirements

- Bash
- grep
- cut
- sort
- uniq
- wc

## Usage

Run the script from your terminal:

```bash
chmod +x log-summary.sh
./log-summary.sh access.log
```

## How It Works

The script validates the input file and uses Linux text-processing utilities and pipelines to calculate summary statistics.

## Limitations

- Assumes a conventional access-log format.
- Assumes the HTTP status code is in the ninth space-separated field.
- `wc -l` counts newline characters.
- The unique-IP calculation assumes the IP address is the first field and may count blank lines incorrectly.

## Implementation Details

- Validates command-line arguments and input files.
- Uses Bash variables and command substitution to process log data.
- Uses standard Linux utilities (grep, cut, sort, uniq, and wc) to extract and summarize request statistics.
- Handles basic error cases and reports results through the terminal.
