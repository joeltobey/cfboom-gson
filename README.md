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

You must either add `modules/cfboom-gson/lib` to your `javaSettings.loadPaths`
in the Application.cfc file or you must install `cbjavaloader`.

## WireBox Mappings
The module registers Gson, GsonUtils, and JsonParser. Check out the API Docs for all the possible functions.

## Settings
There are no additional settings

## GsonUtils

Wirebox mapping `GsonUtils@cfboomGson`

```
var GsonUtils = getInstance( "GsonUtils@cfboomGson" );
var obj = GsonUtils.object();
var arr = GsonUtils.array();
...
```

## JsonParser

Wirebox mapping `JsonParser@cfboomGson`

```
var jsonParser = getInstance( "JsonParser@cfboomGson" );
var element = jsonParser.parse( json );
```

## Gson

Wirebox mapping `Gson@cfboomGson`

```
var gson = getInstance( "Gson@cfboomGson" );

// Deserialize JSON to an object
var json = '{"id":3,"name":"Julie Stephens"}';
var user = gson.fromJson( json, "models.User" );

// Serialize an object to JSON
var json = gson.toJson( user );
```

## TypeAdapter

You can extend cfboom.gson.TypeAdapter and register it to Gson to provide custom
serialization and deserialization.

********************************************************************************
Copyright Since 2016 Joel Tobey
********************************************************************************
