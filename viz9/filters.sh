#!/usr/bin/env bash

#############################################################
# From https://github.com/JPaulMora/visualizer-and-git      #
# Original https://github.com/mig82/visualizer-and-git      #
# @Author: Miguelangel Fernandez                            #
#############################################################

# Run this script in order to define the filters that will prettify some of the
# files in your visualizer project and ignore the non-important metadata in some
# other project files.
# Prettify and sort all views -i.e. forms, templates, reusable components and pop-ups and ignore WYSIWYG metadata.
git config filter.kony_views.clean "jq --indent 4 -j 'del(.device, .prevDevice, .platform, .prevPlatform, .shellCSS, .currentLocale, .osPlatform, .osVersion, .globalUserWidgetRefs)'"
# ignore permissions change when visualizer modify a file
git config  core.filemode false
echo "Done: Git filters for Visualizer"