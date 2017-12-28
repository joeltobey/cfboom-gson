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
 * A parser to parse Json into a parse tree of JsonElements. A wrapper facade to the JsonParser object (http://static.javadoc.io/com.google.code.gson/gson/2.8.2/com/google/gson/JsonParser.html).
 *
 * @author Joel Tobey
 */
component singleton="true"
  extends="cfboom.lang.Object"
  displayname="Class JsonParser"
  output="false"
{
  property name="loader" inject="javaLoader@cfboomGson";
  property name="log" inject="logbox:logger:{this}";

  public cfboom.gson.JsonParser function init() {
    return this;
  }

  public void function onDIComplete() {
    if ( loader.isUsingJavaLoader() ) {
      log.info("Configuring " & this.toString() & " with `cbjavaloader`");
    } else {
      log.info("Configuring " & this.toString() & " with createObject()");
    }
    _instance['parser'] = loader.create( "com.google.gson.JsonParser" ).init();
  }

  public any function parse( required any json ) {
    return _instance.parser.parse( arguments.json );
  }

}