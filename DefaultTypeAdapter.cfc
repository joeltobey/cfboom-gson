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
 * Default implementation of TypeAdapter.
 *
 * @author Joel Tobey
 */
component singleton="true"
  extends="cfboom.gson.TypeAdapter"
  displayname="Class DefaultTypeAdapter"
  output="false"
{
  property name="wirebox" inject="wirebox";
  property name="log" inject="logbox:logger:{this}";

  /**
   * Constructor.
   */
  public cfboom.gson.DefaultTypeAdapter function init() {
    return this;
  }

  /**
   * Default implementation returns wirebox.getInstance( class );
   *
   * @return a wired up class from wirebox.
   */
  public any function createInstance( required string class ) {
    return wirebox.getInstance( class );
  }

  /**
   * Super basic implementation. Looks for toGson() method on src. Otherwise, it uses serializeJson().
   */
  public any function serialize( required any src, string typeOfSrc ) {
    if ( structKeyExists( src, "toGson" ) ) {
      return src.toGson();
    } else {
      return jsonParser.parse( serializeJson( src ) );
    }
  }
}
