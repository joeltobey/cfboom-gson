/**
 * GsonService
 *
 * @author joeltobey
 * @date 2/28/17
 **/
component singleton
	extends="cfboom.lang.Object" displayname="Class GsonService"
	output=false
{
	property name="javaLoader" inject="loader@cbjavaloader";

	public cfboom.gson.models.GsonService function init() {
		return this;
	}

	public any function fromJson(required string json) {
		return javaLoader.create( "com.google.gson.Gson" ).init().fromJson( arguments.json );
	}

	public any function parse(required string json) {
		return javaLoader.create( "com.google.gson.JsonParser" ).init().parse( arguments.json );
	}

	public any function object() {
		return javaLoader.create( "com.google.gson.JsonObject" ).init();
	}

	public any function array() {
		return javaLoader.create( "com.google.gson.JsonArray" ).init();
	}

	public any function null() {
		return javaLoader.create( "com.google.gson.JsonNull" ).init();
	}

	public any function bigDecimal(numeric bigdecimal) {
		return javaLoader.create( "com.google.gson.JsonPrimitive" ).init( javaCast("bigdecimal", arguments.bigdecimal) );
	}

	public any function bigInteger(numeric biginteger) {
		return javaLoader.create( "com.google.gson.JsonPrimitive" ).init( javaCast("int", arguments.biginteger) );
	}

	public any function boolean(boolean bit) {
		return javaLoader.create( "com.google.gson.JsonPrimitive" ).init( javaCast("boolean", arguments.bit) );
	}

	public any function byte(any byte) {
		return javaLoader.create( "com.google.gson.JsonPrimitive" ).init( javaCast("byte", arguments.byte) );
	}

	public any function char(any char) {
		return javaLoader.create( "com.google.gson.JsonPrimitive" ).init( javaCast("char", arguments.char) );
	}

	public any function double(numeric double) {
		return javaLoader.create( "com.google.gson.JsonPrimitive" ).init( javaCast("double", arguments.double) );
	}

	public any function float(numeric float) {
		return javaLoader.create( "com.google.gson.JsonPrimitive" ).init( javaCast("float", arguments.float) );
	}

	public any function int(numeric integer) {
		return javaLoader.create( "com.google.gson.JsonPrimitive" ).init( javaCast("int", arguments.integer) );
	}

	public any function long(numeric long) {
		return javaLoader.create( "com.google.gson.JsonPrimitive" ).init( javaCast("long", arguments.long) );
	}

	public any function short(numeric short) {
		return javaLoader.create( "com.google.gson.JsonPrimitive" ).init( javaCast("short", arguments.short) );
	}

	public any function string(string value) {
		return javaLoader.create( "com.google.gson.JsonPrimitive" ).init( javaCast("string", arguments.value) );
	}

	public any function primitive(any value) {
		return javaLoader.create( "com.google.gson.JsonPrimitive" ).init( arguments.value );
	}
}