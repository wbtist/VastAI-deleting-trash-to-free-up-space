#!/bin/bash
# Purpose: Empty the Trash folder for root and display disk usage before/after.
# Overview: Verifies the Trash directory exists, measures its size, lists
#           current contents, deletes everything inside (including hidden items),
#           then reports size before and after the cleanup.

TRASH_PATH="/root/.local/share/Trash/files"
# Location of the Trash "files" directory per the FreeDesktop Trash spec for the root user.

if [ -d "$TRASH_PATH" ]; then
    echo "Calculating size before cleanup..."
    # Get total size of the Trash directory in human-readable form.
    # 'du -sh' summarizes; '2>/dev/null' hides non-critical warnings;
    # 'awk {print $1}' extracts just the size value.
    SIZE_BEFORE=$(du -sh "$TRASH_PATH" 2>/dev/null | awk '{print $1}')

    echo "Deleting files from: $TRASH_PATH"

    # List what will be deleted (one level only, includes hidden entries).
    # -mindepth 1 avoids printing the directory itself.
    # -maxdepth 1 limits to immediate children (no recursion).
    find "$TRASH_PATH" -mindepth 1 -maxdepth 1 -print

    # Delete everything inside the Trash directory.
    # 'rm -rf' removes files and directories; '{}' is each path from find.
    # The trailing '+' batches deletions for efficiency.
    # Hidden entries are included automatically by 'find'.
    find "$TRASH_PATH" -mindepth 1 -maxdepth 1 -exec rm -rf {} +

    # Show size before/after; after should be minimal/zero if deletion succeeded.
    echo "Size before: $SIZE_BEFORE"
    echo "Size after:  $(du -sh "$TRASH_PATH" 2>/dev/null | awk '{print $1}')"

    # Report recovered space. Here it assumes everything was removed;
    # if something failed to delete, the real recovered size may be less.
    echo "Recovered:   $SIZE_BEFORE"
else
    # Trash directory is missing; nothing to clean.
    echo "Folder not found: $TRASH_PATH"
fi