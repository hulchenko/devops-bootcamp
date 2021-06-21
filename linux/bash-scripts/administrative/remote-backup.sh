#!/bin/bash

rsync -avz -e "ssh " /path/to/file user@backupserver.com:/backup/ # archive + descriptive + compressed -> indicate path
echo "backup for $(date) " | mail -s "backup complete" user@example.com