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
 * Converts Java objects to and from JSON.
 *
 * @author Joel Tobey
 */
component abstract="true"
  extends="cfboom.lang.Object"
  implements="cfboom.gson.InstanceCreator,cfboom.gson.JsonDeserializer,cfboom.gson.JsonSerializer"
  displayname="Abstract Class TypeAdapter"
  output="false"
{
  property name="jsonParser" inject="JsonParser@cfboomGson";

  /**
   * Constructor.
   */
  public cfboom.gson.TypeAdapter function init() {
    return this;
  }

  /**
   * @abstract
   */
  public any function createInstance( required string class ) {
    throw( "Abstract method. Need to implement." );
  }

  /**
   * Default deserializer using the gson JsonParser.
   */
  public any function deserialize( required string json, string typeOfJson ) {
    return jsonParser.parse( json );
  }

  /**
   * @abstract
   */
  public any function serialize( required any src, string typeOfSrc ) {
    throw( "Abstract method. Need to implement." );
  }
}
