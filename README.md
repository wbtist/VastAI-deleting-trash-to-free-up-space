# Trash Cleanup Script
### By Istvan Toth

## Overview

This Bash script is designed to **empty the Trash folder for the root
user** and display disk usage before and after the cleanup.\
It ensures that files are properly deleted, including hidden items, and
provides a clear report of space recovered.

------------------------------------------------------------------------

## Features

-   Verifies the existence of the Trash directory.
-   Measures and reports size before cleanup.
-   Lists files and directories to be deleted (including hidden ones).
-   Deletes all contents of the Trash directory.
-   Displays size before and after cleanup.
-   Reports total space recovered.

------------------------------------------------------------------------

## File Path

By default, the script targets the following directory according to the
[FreeDesktop Trash
specification](https://specifications.freedesktop.org/trash-spec/trashspec-latest.html):

    /root/.local/share/Trash/files

------------------------------------------------------------------------

## Script Usage

### 1. Save the Script

Create a new file called `empty_trash.sh` and paste the script contents
into it.

``` bash
nano empty_trash.sh
```

Paste the script inside, then save and exit.

------------------------------------------------------------------------

### 2. Make It Executable

``` bash
chmod +x empty_trash.sh
```

------------------------------------------------------------------------

### 3. Run the Script

Execute with root privileges (since the Trash directory belongs to
root):

``` bash
sudo ./empty_trash.sh
```

------------------------------------------------------------------------

## Example Output

    Calculating size before cleanup...
    Deleting files from: /root/.local/share/Trash/files
    /root/.local/share/Trash/files/old_file.txt
    /root/.local/share/Trash/files/.hidden_temp
    Size before: 2.1G
    Size after:  4.0K
    Recovered:   2.1G

------------------------------------------------------------------------

## Notes

-   This script **irreversibly deletes** files inside the Trash folder.
    Use with caution.
-   If the Trash directory does not exist, the script will report
    `Folder not found`.
-   Designed for Linux systems following the FreeDesktop Trash
    specification.

------------------------------------------------------------------------

## License

This script is provided as-is, without warranty. You are free to use,
modify, and distribute it.
