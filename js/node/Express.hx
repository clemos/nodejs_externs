package js.node;

import js.node.Connect;
import js.node.Http;
import js.node.EveryAuth;

/**
 * ...
 * @author sledorze
 */

typedef ExpressHttpServerReq = { > HttpServerReq,
	var session : Session;
}

typedef ExpressHttpServerResp = { > HttpServerResp,
	function render(name : String, params : Dynamic) : Void;
	function redirect(url : String) : Void;
  
  @:overload(function () : Void {})
  @:overload(function (value : String, code : Int) : Void {})
  @:overload(function (type : String, value : Dynamic, code : Int) : Void {})
  function send(value : Dynamic) : Void;
}


typedef AddressAndPort = {
  address : String,
  port : Int
}

private extern class ExpressServer {
	@:overload( function( middleware:Dynamic ) : ExpressServer {} )
	function use (?middlewareMountPoint :Dynamic = null, middleware :Dynamic) : ExpressServer;
	function get(path : String, f : ExpressHttpServerReq ->  ExpressHttpServerResp -> Void) : Void;
	function post(path : String, f : ExpressHttpServerReq ->  ExpressHttpServerResp -> Void) : Void;

	@:overload(function(port :Int, ready : Void -> Void):Void { } )
	function listen (port :Int, ?address :String) :Void;

  function address() : AddressAndPort;
}

extern
class Express 
extends ExpressServer #if !haxe3,#end 
implements npm.Package.Require<"express","latest"> {

	public function new() : Void;
	//public inline static function __call__() : Express return untyped Express();

	//public function createServer (a1 :Dynamic, ?a2 :Dynamic, ?a3 :Dynamic, ?a4 :Dynamic, ?a5 :Dynamic, ?a6 :Dynamic, ?a7 :Dynamic, ?a8 :Dynamic, ?a9 :Dynamic) :ExpressServer;

	public static function cookieParser() :MiddleWare;
	public static function bodyParser() :MiddleWare;
	public static function session(params :Dynamic) :Void;
	public static function router(routes :Dynamic->Void) :Void;
	public inline static function static_(path :String, ?options :Dynamic) :MiddleWare {
		return untyped Express["static"](path,options);
	}
	public static function errorHandler (options :Dynamic) :MiddleWare;

	public static function logger() : MiddleWare;


}
