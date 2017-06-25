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
 **/
component singleton
  extends="cfboom.lang.Object"
  displayname="Class GsonService"
  output=false
{
  property name="wirebox" inject="wirebox";

  _instance['useJavaLoader'] = false;

  public cfboom.gson.models.GsonService function init() {
    return this;
  }

  public void function onDIComplete() {
    try {
      createObject("java", "com.google.gson.JsonPrimitive");
    } catch (any ex) {
      _instance['useJavaLoader'] = true;
      _instance['javaLoader'] = wirebox.getInstance( "loader@cbjavaloader" );
    }
  }

  public any function fromJson(required string json) {
    return create( "com.google.gson.Gson" ).init().fromJson( arguments.json );
  }

  public any function parse(required string json) {
    return create( "com.google.gson.JsonParser" ).init().parse( arguments.json );
  }

  public any function object() {
    return create( "com.google.gson.JsonObject" ).init();
  }

  public any function array() {
    return create( "com.google.gson.JsonArray" ).init();
  }

  public any function null() {
    return create( "com.google.gson.JsonNull" ).init();
  }

  public any function bigDecimal(numeric bigdecimal) {
    return create( "com.google.gson.JsonPrimitive" ).init( javaCast("bigdecimal", arguments.bigdecimal) );
  }

  public any function bigInteger(numeric biginteger) {
    return create( "com.google.gson.JsonPrimitive" ).init( javaCast("int", arguments.biginteger) );
  }

  public any function boolean(boolean bit) {
    return create( "com.google.gson.JsonPrimitive" ).init( javaCast("boolean", arguments.bit) );
  }

  public any function byte(any byte) {
    return create( "com.google.gson.JsonPrimitive" ).init( javaCast("byte", arguments.byte) );
  }

  public any function char(any char) {
    return create( "com.google.gson.JsonPrimitive" ).init( javaCast("char", arguments.char) );
  }

  public any function double(numeric double) {
    return create( "com.google.gson.JsonPrimitive" ).init( javaCast("double", arguments.double) );
  }

  public any function float(numeric float) {
    return create( "com.google.gson.JsonPrimitive" ).init( javaCast("float", arguments.float) );
  }

  public any function int(numeric integer) {
    return create( "com.google.gson.JsonPrimitive" ).init( javaCast("int", arguments.integer) );
  }

  public any function long(numeric long) {
    return create( "com.google.gson.JsonPrimitive" ).init( javaCast("long", arguments.long) );
  }

  public any function short(numeric short) {
    return create( "com.google.gson.JsonPrimitive" ).init( javaCast("short", arguments.short) );
  }

  public any function string(string value) {
    return create( "com.google.gson.JsonPrimitive" ).init( javaCast("string", arguments.value) );
  }

  public any function primitive(any value) {
    return create( "com.google.gson.JsonPrimitive" ).init( arguments.value );
  }

  /**
   * Creates Java objects by using either createObject() or javaLoader.
   */
  private any function create( required string class ) {
    if (_instance.useJavaLoader) {
      return javaLoader.create( arguments.class );
    } else {
      return createObject("java", arguments.class);
    }
  }
}