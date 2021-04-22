#!/usr/bin/env bash

#############################################################
# From https://github.com/JPaulMora/visualizer-and-git      #
# Original https://github.com/mig82/visualizer-and-git      #
# @Author: Miguelangel Fernandez                            #
#############################################################

# Run this script in order to define the filters that will prettify some of the
# files in your visualizer project and ignore the non-important metadata in some
# other project files.

# Sort projectprop.xml and remove the lastmodifiedtime element which keeps changing.
git config filter.kony_projectprop.clean "(head -n 1 %f; cat %f | grep attributes | sed /lastmodifiedtime/d | sort --ignore-case; tail -n -1 %f; echo;)"

# Avoid pushing your Fabric password to source control.
git config filter.kony_headless_props.clean 'sed -e "s/\(.*password.*=\).*/\1/"'

# Ignore blank lines -typically in JS files.
git config filter.rm_whiteline.clean 'sed -e "s/^[[:blank:]]+$//"'

# Prettify and sort projectProperties.json and ignore the non-important keys which keep changing.
git config filter.kony_projectProperties.clean "jq --indent 4 --sort-keys -j 'del(.nativeContainerProperties.isModified)'"

# Prettify and sort all views -i.e. forms, templates, reusable components and pop-ups and ignore WYSIWYG metadata.
git config filter.kony_views.clean "jq --indent 4 -j 'del(.device, .prevDevice, .platform, .prevPlatform, .shellCSS, .context.platform, .currentLocale, .osPlatform, .osVersion, .globalUserWidgetRefs, .context.formID)'"

# Prettify and sort generic JSON files such as mobileFabricServiceConfigMap.json and objectServicesConfigMap.json
git config filter.pretty_json.clean "jq --indent 4 --sort-keys ."

# Version nativeapi.json but not the properties inside it that store absolute paths.
git config filter.kony_native_api_json.clean "jq --indent 4 -j 'del(..|(.url?,.filepath?))'"

# ignore permissions change when visualizer modify a file
git config  core.filemode false

echo "Done: Git filters for Visualizer"
