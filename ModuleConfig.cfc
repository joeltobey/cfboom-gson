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
 * @author Joel Tobey
 */
component
  output="false"
{
  // Module Properties
  this.title              = "cfboom gson";
  this.author             = "Joel Tobey";
  this.webURL             = "https://github.com/joeltobey/cfboom-gson";
  this.description        = "The cfboom-gson module provides a wrapper facade to the gson project (https://www.javadoc.io/doc/com.google.code.gson/gson/).";
  this.version            = "1.0.2";
  // If true, looks for views in the parent first, if not found, then in the module. Else vice-versa
  this.viewParentLookup   = true;
  // If true, looks for layouts in the parent first, if not found, then in module. Else vice-versa
  this.layoutParentLookup = true;
  // Module Entry Point
  this.entryPoint         = "cfboom/gson";
  // Model Namespace
  this.modelNamespace     = "cfboomGson";
  // CF Mapping
  this.cfmapping          = "cfboom/gson";
  // Auto-map models
  this.autoMapModels      = true;
  // Module Dependencies
  this.dependencies       = [ "cfboom-lang", "cfboom-util" ];

  function configure() {

    // module settings - stored in modules.name.settings
    settings = {
      "useJavaLoader" = false
    };

  }

  /**
   * Fired when the module is registered and activated.
   */
  function onLoad() {

    if ( !settings.useJavaLoader ) {

      // Double check if we need to use `cbjavaloader`
      try {
        createObject("java", "com.google.gson.JsonPrimitive");
      } catch ( any ex ) {
        settings.useJavaLoader = true;
        wirebox.getInstance( "loader@cbjavaloader" ).appendPaths( modulePath & "/lib" );
      }

    }

    // Map the GSON javaloader
    binder.map( "JavaLoader@cfboomGson" )
          .to( "cfboom.util.JavaLoader" )
          .initWith( useJavaLoader = settings.useJavaLoader )
          .asSingleton();

    // Map cfboom-gson classes
    binder.map("JsonParser@cfboomGson").to("cfboom.gson.JsonParser");
    binder.map("GsonUtils@cfboomGson").to("cfboom.gson.GsonUtils");
    binder.map("Gson@cfboomGson").to("cfboom.gson.Gson");

  }

  /**
   * Fired when the module is unregistered and unloaded
   */
  function onUnload(){}

}
