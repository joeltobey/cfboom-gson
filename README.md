[![Build Status](https://api.travis-ci.org/joeltobey/cfboom-gson.svg?branch=development)](https://travis-ci.org/joeltobey/cfboom-gson)

# WELCOME TO THE CFBOOM GSON COLDBOX MODULE
A wrapper facade to the gson project (https://www.javadoc.io/doc/com.google.code.gson/gson/).

##LICENSE
Apache License, Version 2.0.

##IMPORTANT LINKS
- https://github.com/joeltobey/cfboom-gson/wiki

##SYSTEM REQUIREMENTS
- Lucee 4.5+
- ColdFusion 9+

# INSTRUCTIONS
Just drop into your **modules** folder or use CommandBox to install

`box install cfboom-gson`

You must either add `modules/cfboom-gson/lib` to your `javaSettings.loadPaths` in the Application.cfc file or you must install `cbjavaloader`.

## WireBox Mappings
The module registers the GsonService: `GsonService@cfboomGson` that you can use to perform GSON functions. Check out the API Docs for all the possible functions.

## Settings
There are no additional settings
