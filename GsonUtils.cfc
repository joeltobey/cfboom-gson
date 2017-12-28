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
 * Utility class to create GSON elements (https://www.javadoc.io/doc/com.google.code.gson/gson/).
 *
 * @author Joel Tobey
 */
component singleton="true"
  extends="cfboom.lang.Object"
  displayname="Class GsonService"
  output="false"
{
  property name="loader" inject="javaLoader@cfboomGson";

  public cfboom.gson.GsonUtils function init() {
    return this;
  }

  public any function object() {
    return loader.create( "com.google.gson.JsonObject" ).init();
  }

  public any function array() {
    return loader.create( "com.google.gson.JsonArray" ).init();
  }

  public any function null() {
    return loader.create( "com.google.gson.JsonNull" ).init();
  }

  public any function bigDecimal( required numeric bigdecimal ) {
    return loader.create( "com.google.gson.JsonPrimitive" ).init( javaCast("bigdecimal", arguments.bigdecimal) );
  }

  public any function bigInteger( required numeric biginteger ) {
    return loader.create( "com.google.gson.JsonPrimitive" ).init( javaCast("int", arguments.biginteger) );
  }

  public any function boolean( required boolean bit ) {
    return loader.create( "com.google.gson.JsonPrimitive" ).init( javaCast("boolean", arguments.bit) );
  }

  public any function byte( required any byte ) {
    return loader.create( "com.google.gson.JsonPrimitive" ).init( javaCast("byte", arguments.byte) );
  }

  public any function char( required any char ) {
    return loader.create( "com.google.gson.JsonPrimitive" ).init( javaCast("char", arguments.char) );
  }

  public any function double( required numeric double ) {
    return loader.create( "com.google.gson.JsonPrimitive" ).init( javaCast("double", arguments.double) );
  }

  public any function float( required numeric float ) {
    return loader.create( "com.google.gson.JsonPrimitive" ).init( javaCast("float", arguments.float) );
  }

  public any function int( required numeric integer ) {
    return loader.create( "com.google.gson.JsonPrimitive" ).init( javaCast("int", arguments.integer) );
  }

  public any function long( required numeric long ) {
    return loader.create( "com.google.gson.JsonPrimitive" ).init( javaCast("long", arguments.long) );
  }

  public any function short( required numeric short ) {
    return loader.create( "com.google.gson.JsonPrimitive" ).init( javaCast("short", arguments.short) );
  }

  public any function string( required string value ) {
    return loader.create( "com.google.gson.JsonPrimitive" ).init( javaCast("string", arguments.value) );
  }

  public any function primitive( required any value ) {
    return loader.create( "com.google.gson.JsonPrimitive" ).init( arguments.value );
  }

}
