#!/bin/bash

OUTPUT_DIR="/data/Ripping/DVD"
SOURCE_DRIVE="/dev/sr0"

function rip_dvd() {

        # Grab the DVD title
        DVD_TITLE=$(blkid -o value -s LABEL $SOURCE_DRIVE)

        # Replace spaces with underscores
        DVD_TITLE=${DVD_TITLE// /_}

        # Backup the DVD to out hard drive
        dvdbackup -i $SOURCE_DRIVE -o $OUTPUT_DIR -M -n $DVD_TITLE

        # The bits are written, remove the disk
        eject $SOURCE_DRIVE
}

rip_dvd