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
  extends="cfboom.lang.Object"
  displayname="Class User"
  label="User"
  labelPlural="Users"
  entityname="User"
  table="User"
  persistent="true"
  batchsize="25"
  cachename="User"
  cacheuse="read-write"
  accessors="true"
  output="false"
{
  property name="GsonUtils" inject="GsonUtils@cfboomGson";

  /**
   * ID that identifies a record.
   */
  property name="id" label="Id" fieldType="id" generator="native" column="Id" type="numeric" sqlType="cf_sql_integer";

  /**
   * Indicates whether the record has been moved to the Recycle Bin (true) or not (false).
   */
  property name="isDeleted" label="IsDeleted" fieldType="column" column="IsDeleted" type="boolean" sqlType="cf_sql_bit";

  /**
   * ID of the User who created this record. CreatedById fields have Defaulted on create and Filter access.
   */
  property name="createdById" label="CreatedById" fieldType="column" column="CreatedById" type="numeric" sqlType="cf_sql_integer";

  /**
   * Date and time when this record was created. CreatedDate fields have Defaulted on create and Filter access.
   */
  property name="createdDate" label="CreatedDate" fieldType="timestamp" column="CreatedDate" type="date" sqlType="cf_sql_timestamp";

  /**
   * ID of the User who last updated this record. LastModifiedById fields have Defaulted on create and Filter access.
   */
  property name="lastModifiedById" label="LastModifiedById" fieldType="column" column="LastModifiedById" type="numeric" sqlType="cf_sql_integer";

  /**
   * Date and time when this record was last modified by a user. LastModifiedDate fields have Defaulted on create and Filter access.
   */
  property name="lastModifiedDate" label="LastModifiedDate" fieldType="timestamp" column="LastModifiedDate" type="date" sqlType="cf_sql_timestamp";

  /**
   * Date and time when this record was last modified by a user or by a workflow process (such as a trigger). SystemModstamp fields have Defaulted on create and Filter access.
   */
  property name="systemModstamp" label="SystemModstamp" fieldType="timestamp" column="SystemModstamp" type="date" sqlType="cf_sql_timestamp";

  /**
   * Required. The user's email address.
   */
  property name="email" label="Email" fieldType="column" column="Email" type="string" sqlType="cf_sql_varchar" length="128";

  /**
   * The user's first name.
   */
  property name="firstName" label="FirstName" fieldType="column" column="FirstName" type="string" sqlType="cf_sql_varchar" nillable="true" length="45";

  /**
   * The user's last name.
   */
  property name="lastName" label="LastName" fieldType="column" column="LastName" type="string" sqlType="cf_sql_varchar" nillable="true" length="45";

  /**
   * Indicates whether the user has access to log in (true) or not (false).
   */
  property name="isActive" label="IsActive" fieldType="column" column="IsActive" type="boolean" sqlType="cf_sql_bit" nillable="true";

  /**
   * The date and time when the user last logged in.
   */
  property name="lastLoginDate" label="LastLoginDate" fieldType="timestamp" column="LastLoginDate" type="date" sqlType="cf_sql_timestamp" nillable="true";

  /**
   * Required. ID of the user's Profile. Use this value to cache metadata based on profile.
   */
  property name="profileId" label="ProfileId" fieldType="column" column="ProfileId" type="numeric" sqlType="cf_sql_integer" nillable="true";

  /**
   * Required. Contains the name that a user enters to log into the API or the user interface. The value for this field must be in the form of an email address.
   */
  property name="username" label="Username" fieldType="column" column="Username" type="string" sqlType="cf_sql_varchar" length="128";

  /**
   * ID of the user's UserRole.
   */
  property name="userRoleId" label="UserRoleId" fieldType="column" column="UserRoleId" type="numeric" sqlType="cf_sql_integer" nillable="true";

  /**
   * ID of the user's UserType.
   */
  property name="userTypeId" label="UserTypeId" fieldType="column" column="UserTypeId" type="numeric" sqlType="cf_sql_integer" nillable="true";

  property name="permissions" label="Permissions" fieldType="none" type="array" arrayType="cfboom.gson.tests.mocks.Permission";

  public cfboom.gson.tests.mocks.UserGson function init() {
    return this;
  }

  public any function toGson() {
    var user = GsonUtils.object();
    if ( !isNull( getId() ) )
      user.add( "id", GsonUtils.long( getId() ) );
    if ( !isNull( getFirstName() ) )
      user.add( "firstName", GsonUtils.string( getFirstName() ) );
    if ( !isNull( getLastName() ) )
      user.add( "lastName", GsonUtils.string( getLastName() ) );
    return user;
  }

  public cfboom.gson.tests.mocks.UserGson function fromGson( required any gson ) {
    if ( gson.has( "id" ) )
      setId( gson.get( "id" ).getAsLong() );
    if ( gson.has( "firstName" ) )
      setFirstName( gson.get( "firstName" ).getAsString() );
    if ( gson.has( "lastName" ) )
      setLastName( gson.get( "lastName" ).getAsString() );
    return this;
  }
}
