/*
 * Copyright 2017 Joel Tobey <joeltobey@gmail.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * A wrapper facade to the gson project (https://www.javadoc.io/doc/com.google.code.gson/gson/).
 *
 * @author Joel Tobey
 */
component singleton="true"
  extends="cfboom.lang.Object"
  displayname="Class Gson"
  output="false"
{
  property name="loader" inject="javaLoader@cfboomGson";
  property name="wirebox" inject="wirebox";
  property name="populator" inject="wirebox:populator";
  property name="log" inject="logbox:logger:{this}";

  _instance['typeAdapters'] = {};

  public cfboom.gson.Gson function init() {
    return this;
  }

  public void function onDIComplete() {
    if ( loader.isUsingJavaLoader() ) {
      log.debug("Configuring " & this.toString() & " with `cbjavaloader`");
    } else {
      log.debug("Configuring " & this.toString() & " with createObject()");
    }
    _instance['gson'] = loader.create( "com.google.gson.Gson" ).init();
    _instance.typeAdapters['default'] = wirebox.getInstance( "cfboom.gson.DefaultTypeAdapter" );
  }

  /**
   * Configures Gson for custom serialization or deserialization. Overwrites any
   * previously registered TypeAdapter with the same type.
   *
   * @type.hint Class as defined in getComponentMeta().fullname
   * @typeAdapter.hint This object must extend cfboom.gson.TypeAdapter.
   */
  public void function registerTypeAdapter( required string type, required cfboom.gson.TypeAdapter typeAdapter ) {
    _instance.typeAdapters[ type ] = typeAdapter;
  }

  /**
   * This method deserializes the specified Json into an object of the specified class.
   *
   * @json.hint the string from which the object is to be deserialized
   * @class.hint the class of the desired object
   * @return an object of the specified class. Returns null if json is null or if json is empty.
   */
  public any function fromJson( required string json, required string class ) {
    if ( len( json ) && json != "{}" ) {
      var typeAdapter = _instance.typeAdapters.default;
      if ( structKeyExists( _instance.typeAdapters, class ) )
        typeAdapter = _instance.typeAdapters[ class ];
      var obj = typeAdapter.createInstance( class );
      var gson = typeAdapter.deserialize( json );
      if ( structKeyExists( obj, "fromGson" ) ) {
        return obj.fromGson( gson );
      } else {
        return populator.populateFromJson( obj, gson.toString() );
      }
    }
  }

  /**
   * This method serializes the specified object into its equivalent Json representation.
   *
   * @src.hint the object for which Json representation is to be created setting for Gson
   * @return Json representation of src.
   */
  public string function toJson( required any src ) {
    if ( isInstanceOf( src, "com.google.gson.JsonElement" ) ) {
      return _instance.gson.toJson( src ).replaceAll("\\n", "\n");
    } else {
      var class = isInstanceOf( src, "cfboom.lang.Object" ) ? src.getComponentName() : getMetadata( src ).fullname;
      var typeAdapter = _instance.typeAdapters.default;
      if ( structKeyExists( _instance.typeAdapters, class ) )
        typeAdapter = _instance.typeAdapters[ class ];
      return typeAdapter.serialize( src, class ).toString();
    }
  }

  /**
   * Returns a new JSON writer configured for the settings on this Gson instance.
   *
   * @writer.hint A java.io.Writer
   */
  public any function newJsonWriter( required any writer ) {
    return _instance.gson.newJsonWriter( writer );
  }

  /**
   * Returns a new JSON reader configured for the settings on this Gson instance.
   *
   * @reader.hint A java.io.Reader
   */
  public any function newJsonReader( required any reader ) {
    return _instance.gson.newJsonReader( reader );
  }

}
