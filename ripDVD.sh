#!/bin/bash

OUTPUT_DIR="/data/DVD_RIPS"
SOURCE_DRIVE="/dev/sr0"

function rip_dvd() {
    if [ ! -d "$OUTPUT_DIR" ]; then
      	echo "ERROR: The DVD Ripping directory ${OUTPUT_DIR} is not found"
	exit 1
    fi

    # Grab the DVD title
    DVD_TITLE=$(blkid -o value -s LABEL $SOURCE_DRIVE)

    # Replace spaces with underscores
    DVD_TITLE=${DVD_TITLE// /_}

    # Backup the DVD to out hard drive
    dvdbackup -p -i $SOURCE_DRIVE -o $OUTPUT_DIR -M -n $DVD_TITLE

    # The bits are written, remove the disk
    eject $SOURCE_DRIVE
}

function detect_disk() {
    echo "Detecting Disk"
    blkid $SOURCE_DRIVE
    DISK_INSERTED=$?
    if [ "$DISK_INSERTED" = "0" ]; then
        echo "  Disk Found"
    else
        echo "  ERROR: The Disk Not Detected"
        exit 1
    fi
}

echo "Starting Ripper..."
detect_disk
rip_dvd
