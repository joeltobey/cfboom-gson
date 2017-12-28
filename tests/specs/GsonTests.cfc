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
  displayname="Class GsonTests"
  output="false"
{
  // this will run once after initialization and before setUp()
  public void function beforeTests() {
    super.beforeTests();
    variables['gson'] = getInstance( "Gson@cfboomGson" );
  }

  // this will run once after all tests have been run
  public void function afterTests() {
    structDelete( variables, "gson" );
    super.afterTests();
  }

  /**
   * @Test
   */
  public void function testFromJsonWithGson() {
    var json = '{"id":2,"firstName":"John","lastName":"Doe"}';
    var user = gson.fromJson( json, "cfboom.gson.tests.mocks.UserGson" );
    assertTrue( isInstanceOf( user, "cfboom.gson.tests.mocks.UserGson" ) );
    assertEquals( 2, user.getId() );
    assertEqualsCase( "John", user.getFirstName() );
    assertEqualsCase( "Doe", user.getLastName() );
  }

  /**
   * @Test
   */
  public void function testFromJsonWithOutGson() {
    var json = '{"id":2,"firstName":"John","lastName":"Doe"}';
    var user = gson.fromJson( json, "cfboom.gson.tests.mocks.User" );
    assertTrue( isInstanceOf( user, "cfboom.gson.tests.mocks.User" ) );
    assertEquals( 2, user.getId() );
    assertEqualsCase( "John", user.getFirstName() );
    assertEqualsCase( "Doe", user.getLastName() );
  }

  /**
   * @Test
   */
  public void function testFromJsonNull() {
    var json1 = '';
    var json2 = '{}';
    $assert.null( gson.fromJson( json1, "cfboom.gson.tests.mocks.User" ) );
    $assert.null( gson.fromJson( json2, "cfboom.gson.tests.mocks.User" ) );
  }

  /**
   * @Test
   */
  public void function testToJsonWithGson() {
    var expected = '{"id":2,"firstName":"John","lastName":"Doe"}';
    var user = getInstance( "cfboom.gson.tests.mocks.UserGson" );
    user.setId( 2 );
    user.setFirstName( "John" );
    user.setLastName( "Doe" );
    assertEqualsCase( expected, gson.toJson( user ) );
  }

  /**
   * @Test
   */
  public void function testToJsonWithOutGson() {
    var expected = '{"$MIXED":true,"id":2,"firstName":"John","lastName":"Doe"}';
    var user = getInstance( "cfboom.gson.tests.mocks.User" );
    user.setId( 2 );
    user.setFirstName( "John" );
    user.setLastName( "Doe" );
    assertEqualsCase( expected, gson.toJson( user ) );
  }

}