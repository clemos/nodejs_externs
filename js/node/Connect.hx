package js.node;

import js.node.Http;

using StringTools;
using Lambda;

typedef RouterApp = {
	function get(path :String, onRequest :HttpServerReq->HttpServerResp->Dynamic->Void) :Void;
}

typedef OAuth2 = {
	function myHostname (arg :Dynamic) :OAuth2;
	function appId (arg :Dynamic) :OAuth2;
	function appSecret (arg :Dynamic) :OAuth2;
	function entryPath (arg :Dynamic) :OAuth2;
	function scope (arg :Dynamic) :OAuth2;
	function handleAuthCallbackError (arg :Dynamic) :OAuth2;
	function findOrCreateUser (arg :Dynamic) :OAuth2;
	function redirectPath (arg :Dynamic) :OAuth2;
	function apiHost (arg :Dynamic) :OAuth2;
	function configurable () :Dynamic;
}

typedef EveryAuth = {
	var facebook :OAuth2;
	var google :OAuth2;
	// function middleware() :MiddleWare;
	function middleware() :Dynamic;
}

extern class ConnectServer {
	public function use (?middlewareMountPoint :Dynamic, middleware :Dynamic) :ConnectServer;

	@:overload(function(port :Int, ready : Void -> Void):Void { } )
	public function listen (port :Int, ?address :String) :Void;
}

// typedef Next = Void->MiddleWare;
// typedef MiddleWare = ServerRequest->ServerResponse->Next->Void;
typedef MiddleWare = HttpServerReq->HttpServerResp->Dynamic->Void;

extern class Connect extends ConnectServer implements npm.Package.Require<"connect","*"> {
	public static function createServer (a1 :Dynamic, ?a2 :Dynamic, ?a3 :Dynamic, ?a4 :Dynamic, ?a5 :Dynamic, ?a6 :Dynamic, ?a7 :Dynamic, ?a8 :Dynamic, ?a9 :Dynamic) :ConnectServer;
	public static function cookieParser() :MiddleWare;
	public static function bodyParser() :MiddleWare;
	public static function logger() :MiddleWare;
	public static function session(params :Dynamic) :Void;
	public static function router(routes :Dynamic->Void) :Void;
	public static function errorHandler (options :Dynamic) :MiddleWare;
	public inline static function static_(root:String,?options:{}) :MiddleWare return untyped Connect["static"](root,options);
}
