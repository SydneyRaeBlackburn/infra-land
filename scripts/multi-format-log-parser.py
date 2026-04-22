# given list of log files of different structures,
# parse by log level, key word, or phrase
# return full log message
# add --count

import argparse

parser = argparse.ArgumentParser(
  description="Parse multi-format logs (JSON, syslog, unstructured) and extract error patterns",
  usage="multi-format-log-parser.py \"pattern\" file1 file2 ..."
)
parser.add_argument(
  "pattern",
  help="string/keyword or quoted phrase to search for"
)
parser.add_argument(
  "files",
  nargs="+",
  help="list of log files to parse"
)
args = parser.parse_args()


print(args.pattern)
print(args.files)