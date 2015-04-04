package openfl._legacy.utils; #if openfl_legacy


import openfl.Lib;


class WeakRef<T> {
	
	
	private var hardRef:T;
	private var weakRef:Int;
	
	
	public function new (object:T, makeWeak:Bool = true) {
		
		if (makeWeak) {
			
			weakRef = openfl_legacy_weak_ref_create (this, object);
			hardRef = null;
			
		} else {
			
			weakRef = -1;
			hardRef = object;
			
		}
		
	}
	
	
	public function get ():T {
		
		if (hardRef != null) {
			
			return hardRef;
			
		}
		
		if (weakRef < 0) {
			
			return null;
			
		}
		
		var result = openfl_legacy_weak_ref_get (weakRef);
		if (result == null) {
			
			weakRef = -1;
			
		}
		
		return result;
		
	}
	
	
	public function toString ():String {
		
		if (hardRef == null) {
			
			return "" + hardRef;
			
		}
		
		return "WeakRef(" + weakRef + ")";
		
	}
	
	
	
	
	// Native Methods
	
	
	
	
	private static var openfl_legacy_weak_ref_create:Dynamic = Lib.load ("openfl-legacy", "openfl_legacy_weak_ref_create", 2);
	private static var openfl_legacy_weak_ref_get:Dynamic = Lib.load ("openfl-legacy", "openfl_legacy_weak_ref_get", 1);
	
	
}


#end