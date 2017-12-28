/*
 * Copyright 2017 the original author or authors and Joel Tobey <joeltobey@gmail.com>
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
  extends="coldbox.system.testing.BaseTestCase"
  appMapping="/root"
  displayname="Class JsonParserTests"
  output="false"
{
  // this will run once after initialization and before setUp()
  public void function beforeTests() {
    super.beforeTests();
    variables['JsonParser'] = getInstance( "JsonParser@cfboomGson" );
  }

  // this will run once after all tests have been run
  public void function afterTests() {
    structDelete( variables, "JsonParser" );
    super.afterTests();
  }

  /**
   * @Test
   */
  public void function testParse() {
    var element = JsonParser.parse( '{"name":"foo","age":5,"extra":null,"toys":["one","two","three"]}' );
    assertTrue( element.isJsonObject() );
    var name = element.get( "name" );
    assertEqualsCase( "foo", name.getAsString() );
    var age = element.get( "age" );
    assertEquals( 5, age.getAsInt() );
    var extra = element.get( "extra" );
    assertTrue( extra.isJsonNull() );
    var toys = element.get( "toys" );
    assertTrue( toys.isJsonArray() );
    var it = toys.iterator();
    var idx = 0;
    while ( it.hasNext() ) {
      idx++;
      var toy = it.next();
      if ( idx == 1 ) {
        assertEqualsCase( "one", toy.getAsString() );
      } else if ( idx == 2 ) {
        assertEqualsCase( "two", toy.getAsString() );
      } else if ( idx == 3 ) {
        assertEqualsCase( "three", toy.getAsString() );
      }
    }
  }

}