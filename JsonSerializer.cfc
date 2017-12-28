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
 * Interface representing a serializer for Json.
 *
 * @author Joel Tobey
 */
interface {

  /**
   * Gson invokes this call-back method during serialization when
   * it encounters a field of the specified type.
   *
   * @src.hint the object that needs to be converted to Json.
   * @typeOfSrc.hint the actual type of the source object.
   * @return a JsonElement corresponding to the specified object.
   */
  public any function serialize( required any src, string typeOfSrc );

}
