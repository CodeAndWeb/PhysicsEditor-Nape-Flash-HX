package;

import nape.phys.Body;
import nape.phys.BodyType;
import nape.shape.Shape;
import nape.shape.Polygon;
import nape.shape.Circle;
import nape.geom.Vec2;
import nape.dynamics.InteractionFilter;
import nape.phys.Material;
import nape.phys.FluidProperties;
import nape.callbacks.CbType;
import nape.geom.AABB;

import flash.display.DisplayObject;

class PhysicsData {

	public static function createBody(name:String,?graphic:DisplayObject):Body {
		var xret = lookup(name);
		if(graphic==null) return xret.body.copy();

		var ret = xret.body.copy();
		graphic.x = graphic.y = 0;
		graphic.rotation = 0;
		var bounds = graphic.getBounds(graphic);
		var offset = Vec2.get(bounds.x-xret.anchor.x, bounds.y-xret.anchor.y);

		ret.graphic = graphic;
		ret.graphicUpdate = function(b:Body) {
			var gp = b.localToWorld(offset);
			graphic.x = gp.x;
			graphic.y = gp.y;
			graphic.rotation = (b.rotation*180/Math.PI)%360;
		}	

		return ret;
	}

	public static function registerMaterial(name:String,material:Material) {
		if(materials==null) materials = new Hash<Material>();
		materials.set(name,material);	
	}
	public static function registerFilter(name:String,filter:InteractionFilter) {
		if(filters==null) filters = new Hash<InteractionFilter>();
		filters.set(name,filter);
	}
	public static function registerFluidProperties(name:String,properties:FluidProperties) {
		if(fprops==null) fprops = new Hash<FluidProperties>();
		fprops.set(name,properties);
	}
	public static function registerCbType(name:String,cbType:CbType) {
		if(types==null) types = new Hash<CbType>();
		types.set(name,cbType);
	}

	//----------------------------------------------------------------------	

	static var bodies   :Hash<{body:Body,anchor:Vec2}>;
	static var materials:Hash<Material>;
	static var filters  :Hash<InteractionFilter>;
	static var fprops   :Hash<FluidProperties>;
	static var types    :Hash<CbType>;
	static inline function material(name:String):Material {
		if(name=="default") return new Material();
		else {
			if(materials==null || !materials.exists(name))
				throw "Error: Material with name '"+name+"' has not been registered";
			return materials.get(name);
		}
	}
	static inline function filter(name:String):InteractionFilter {
		if(name=="default") return new InteractionFilter();
		else {
			if(filters==null || !filters.exists(name))
				throw "Error: InteractionFilter with name '"+name+"' has not been registered";
			return filters.get(name);
		}
	}
	static inline function fprop(name:String):FluidProperties {
		if(name=="default") return new FluidProperties();
		else {
			if(fprops==null || !fprops.exists(name))
				throw "Error: FluidProperties with name '"+name+"' has not been registered";
			return fprops.get(name);
		}
	}
	static inline function cbtype(name:String):CbType {
		if(name=="null") return null;
		else {
			if(types==null || !types.exists(name))
				throw "Error: CbType with name '"+name+"' has not been registered";
			return types.get(name);
		}	
	}

	static inline function lookup(name:String) {
		if(bodies==null) init();
		if(!bodies.exists(name)) throw "Error: Body with name '"+name+"' does not exist";
		return bodies.get(name);
	}

	//----------------------------------------------------------------------	

	static function init() {
		bodies = new Hash<{body:Body,anchor:Vec2}>();

		
			var body = new Body();
			body.cbType = cbtype("null");

			
				var mat = material("bouncy");
				var filt = filter("default");
				var prop = fprop("default");
				var cbType = cbtype("null");

				
					
						var s = new Polygon(
							[   Vec2.weak(65.5,14)   ,  Vec2.weak(65.5,18)   ,  Vec2.weak(66.5,27)   ,  Vec2.weak(67.5,15)   ],
							mat,
							filt
						);
						s.body = body;
						s.fluidEnabled = false;
						s.fluidProperties = prop;
						s.cbType = cbType;
					
						var s = new Polygon(
							[   Vec2.weak(105.5,47)   ,  Vec2.weak(97.5,37)   ,  Vec2.weak(93,35.5)   ,  Vec2.weak(69,30.5)   ,  Vec2.weak(74,81.5)   ,  Vec2.weak(91,71.5)   ,  Vec2.weak(102.5,59)   ],
							mat,
							filt
						);
						s.body = body;
						s.fluidEnabled = false;
						s.fluidProperties = prop;
						s.cbType = cbType;
					
						var s = new Polygon(
							[   Vec2.weak(122,4.5)   ,  Vec2.weak(118,4.5)   ,  Vec2.weak(113,7.5)   ,  Vec2.weak(98,31.5)   ,  Vec2.weak(97.5,37)   ,  Vec2.weak(121.5,13)   ],
							mat,
							filt
						);
						s.body = body;
						s.fluidEnabled = false;
						s.fluidProperties = prop;
						s.cbType = cbType;
					
						var s = new Polygon(
							[   Vec2.weak(3.5,46)   ,  Vec2.weak(4.5,54)   ,  Vec2.weak(14,68.5)   ,  Vec2.weak(36,81.5)   ,  Vec2.weak(62,83.5)   ,  Vec2.weak(43,31.5)   ,  Vec2.weak(31,29.5)   ,  Vec2.weak(9,39.5)   ],
							mat,
							filt
						);
						s.body = body;
						s.fluidEnabled = false;
						s.fluidProperties = prop;
						s.cbType = cbType;
					
						var s = new Polygon(
							[   Vec2.weak(65.5,18)   ,  Vec2.weak(61,22.5)   ,  Vec2.weak(66.5,27)   ],
							mat,
							filt
						);
						s.body = body;
						s.fluidEnabled = false;
						s.fluidProperties = prop;
						s.cbType = cbType;
					
						var s = new Polygon(
							[   Vec2.weak(61,22.5)   ,  Vec2.weak(55,22.5)   ,  Vec2.weak(43,31.5)   ,  Vec2.weak(62,83.5)   ,  Vec2.weak(74,81.5)   ,  Vec2.weak(69,30.5)   ,  Vec2.weak(66.5,27)   ],
							mat,
							filt
						);
						s.body = body;
						s.fluidEnabled = false;
						s.fluidProperties = prop;
						s.cbType = cbType;
					
						var s = new Polygon(
							[   Vec2.weak(98,31.5)   ,  Vec2.weak(93,35.5)   ,  Vec2.weak(97.5,37)   ],
							mat,
							filt
						);
						s.body = body;
						s.fluidEnabled = false;
						s.fluidProperties = prop;
						s.cbType = cbType;
					
				
			

			var anchor = if(true) body.localCOM.copy() else Vec2.get(0,88);
			body.translateShapes(Vec2.weak(-anchor.x,-anchor.y));
			body.position.setxy(0,0);

			bodies.set("icecream",{body:body,anchor:anchor});
		
			var body = new Body();
			body.cbType = cbtype("null");

			
				var mat = material("default");
				var filt = filter("default");
				var prop = fprop("default");
				var cbType = cbtype("null");

				
					
						var s = new Polygon(
							[   Vec2.weak(99.5,26)   ,  Vec2.weak(96.5,18)   ,  Vec2.weak(89,10.5)   ,  Vec2.weak(75,5.5)   ,  Vec2.weak(43,5.5)   ,  Vec2.weak(90,31.5)   ,  Vec2.weak(94,31.5)   ],
							mat,
							filt
						);
						s.body = body;
						s.fluidEnabled = false;
						s.fluidProperties = prop;
						s.cbType = cbType;
					
						var s = new Polygon(
							[   Vec2.weak(6,54.5)   ,  Vec2.weak(13.5,58)   ,  Vec2.weak(8.5,51)   ],
							mat,
							filt
						);
						s.body = body;
						s.fluidEnabled = false;
						s.fluidProperties = prop;
						s.cbType = cbType;
					
						var s = new Polygon(
							[   Vec2.weak(16,66.5)   ,  Vec2.weak(24,68.5)   ,  Vec2.weak(98.5,52)   ,  Vec2.weak(90,31.5)   ,  Vec2.weak(43,5.5)   ,  Vec2.weak(9.5,37)   ,  Vec2.weak(13.5,58)   ],
							mat,
							filt
						);
						s.body = body;
						s.fluidEnabled = false;
						s.fluidProperties = prop;
						s.cbType = cbType;
					
						var s = new Polygon(
							[   Vec2.weak(92,67.5)   ,  Vec2.weak(98.5,52)   ,  Vec2.weak(24,68.5)   ,  Vec2.weak(72,70.5)   ],
							mat,
							filt
						);
						s.body = body;
						s.fluidEnabled = false;
						s.fluidProperties = prop;
						s.cbType = cbType;
					
						var s = new Polygon(
							[   Vec2.weak(3.5,32)   ,  Vec2.weak(9.5,37)   ,  Vec2.weak(43,5.5)   ,  Vec2.weak(27,8.5)   ,  Vec2.weak(10,18.5)   ],
							mat,
							filt
						);
						s.body = body;
						s.fluidEnabled = false;
						s.fluidProperties = prop;
						s.cbType = cbType;
					
						var s = new Polygon(
							[   Vec2.weak(6.5,43)   ,  Vec2.weak(8.5,51)   ,  Vec2.weak(13.5,58)   ,  Vec2.weak(9.5,37)   ],
							mat,
							filt
						);
						s.body = body;
						s.fluidEnabled = false;
						s.fluidProperties = prop;
						s.cbType = cbType;
					
						var s = new Polygon(
							[   Vec2.weak(97.5,42)   ,  Vec2.weak(90,31.5)   ,  Vec2.weak(98.5,52)   ],
							mat,
							filt
						);
						s.body = body;
						s.fluidEnabled = false;
						s.fluidProperties = prop;
						s.cbType = cbType;
					
				
			

			var anchor = if(true) body.localCOM.copy() else Vec2.get(0,73);
			body.translateShapes(Vec2.weak(-anchor.x,-anchor.y));
			body.position.setxy(0,0);

			bodies.set("hamburger",{body:body,anchor:anchor});
		
			var body = new Body();
			body.cbType = cbtype("null");

			
				var mat = material("default");
				var filt = filter("default");
				var prop = fprop("default");
				var cbType = cbtype("null");

				
					
						var s = new Polygon(
							[   Vec2.weak(76,65.5)   ,  Vec2.weak(70,62.5)   ,  Vec2.weak(48,61.5)   ,  Vec2.weak(74.5,81)   ,  Vec2.weak(77.5,74)   ],
							mat,
							filt
						);
						s.body = body;
						s.fluidEnabled = false;
						s.fluidProperties = prop;
						s.cbType = cbType;
					
						var s = new Polygon(
							[   Vec2.weak(12.5,66)   ,  Vec2.weak(11.5,74)   ,  Vec2.weak(21.5,164)   ,  Vec2.weak(35,171.5)   ,  Vec2.weak(61,170.5)   ,  Vec2.weak(66.5,167)   ,  Vec2.weak(40,61.5)   ,  Vec2.weak(26,61.5)   ],
							mat,
							filt
						);
						s.body = body;
						s.fluidEnabled = false;
						s.fluidProperties = prop;
						s.cbType = cbType;
					
						var s = new Polygon(
							[   Vec2.weak(23,168.5)   ,  Vec2.weak(35,171.5)   ,  Vec2.weak(21.5,164)   ],
							mat,
							filt
						);
						s.body = body;
						s.fluidEnabled = false;
						s.fluidProperties = prop;
						s.cbType = cbType;
					
						var s = new Polygon(
							[   Vec2.weak(74.5,81)   ,  Vec2.weak(48,61.5)   ,  Vec2.weak(40,59.5)   ,  Vec2.weak(40,61.5)   ,  Vec2.weak(66.5,167)   ],
							mat,
							filt
						);
						s.body = body;
						s.fluidEnabled = false;
						s.fluidProperties = prop;
						s.cbType = cbType;
					
						var s = new Polygon(
							[   Vec2.weak(7.5,9)   ,  Vec2.weak(33.5,31)   ,  Vec2.weak(41.5,30)   ,  Vec2.weak(10,5.5)   ],
							mat,
							filt
						);
						s.body = body;
						s.fluidEnabled = false;
						s.fluidProperties = prop;
						s.cbType = cbType;
					
						var s = new Polygon(
							[   Vec2.weak(33.5,31)   ,  Vec2.weak(40,59.5)   ,  Vec2.weak(48,61.5)   ,  Vec2.weak(41.5,30)   ],
							mat,
							filt
						);
						s.body = body;
						s.fluidEnabled = false;
						s.fluidProperties = prop;
						s.cbType = cbType;
					
				
			

			var anchor = if(true) body.localCOM.copy() else Vec2.get(0,188);
			body.translateShapes(Vec2.weak(-anchor.x,-anchor.y));
			body.position.setxy(0,0);

			bodies.set("drink",{body:body,anchor:anchor});
		
			var body = new Body();
			body.cbType = cbtype("null");

			
				var mat = material("bouncy");
				var filt = filter("default");
				var prop = fprop("default");
				var cbType = cbtype("null");

				
					var s = new Circle(
						28.0199920063936,
						Vec2.weak(28,30),
						mat,
						filt
					);
					s.body = body;
					s.fluidEnabled = false;
					s.fluidProperties = prop;
					s.cbType = cbType;
				
			

			var anchor = if(true) body.localCOM.copy() else Vec2.get(0,59);
			body.translateShapes(Vec2.weak(-anchor.x,-anchor.y));
			body.position.setxy(0,0);

			bodies.set("orange",{body:body,anchor:anchor});
		
	}
}
