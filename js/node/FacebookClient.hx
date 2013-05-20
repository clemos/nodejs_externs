package js.node;
import js.Node;

/**
 * ...
 * @author sledorze
 */

extern
class FacebookClient implements npm.Package.RequireNamespace<"facebook-client","latest"> {
	
	public function getSessionByAccessToken(access_token : Dynamic) : (FacebookSession -> Void) -> Void;
	
	public function new():Void; 
	
}

extern class FacebookSession {
	public function graphCall(path : String, ?params : Dynamic, ?method : String) : Dynamic -> Void;
	
	public function restCall (method : String, ?params : Dynamic) : Dynamic -> Void;
	
	public function getId() : Dynamic -> Void;
	
	public function isValid() : Bool -> Void;
	
	public function getMeta() : Dynamic -> Void;
	
	public function retrieveAccessToken(code : String, redirect_uri : String) : Void -> Void;
	
	public function injectAccessToken(access_token : String) : Void -> Void;
}