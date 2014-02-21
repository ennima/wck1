﻿package {		import Box2DAS.*;	import Box2DAS.Collision.*;	import Box2DAS.Collision.Shapes.*;	import Box2DAS.Common.*;	import Box2DAS.Dynamics.*;	import Box2DAS.Dynamics.Contacts.*;	import Box2DAS.Dynamics.Joints.*;	import flash.display.*;	import flash.events.*;	import flash.text.*;	import misc.*;		public class Main extends MovieClip { 				public static var tests:Array = [Ragdoll, TheoJansen, Buoyancy, Edges, Edges1, Edges2, Decompose, Decompose2, Wave, Filter, Contact, Impulse, Memory, Raycast, Bullet];		public static var current:int = 0;		public static var test:Test = null;		public static var debug:b2DebugDraw;		public static var fps:FPS;		public static var txt:TextField;						public function Main() {			b2Base.initialize();			Input.initialize(stage);			debug = new b2DebugDraw();			addChild(debug);									txt = new TextField();			var fmt:TextFormat = new TextFormat("Verdana", 12, 0, false, false, false);						txt.defaultTextFormat = fmt;			txt.x = 10;			txt.y = 10;			txt.width = 600;			txt.height = 100;			txt.text = "Left / Right Arrows: Navigate Demos, R Key: Reset Demo";			txt.mouseEnabled = false;			addChild(txt);						txt = new TextField();			txt.defaultTextFormat = fmt;			fps = new FPS();			fps.startCalc(stage);			fps.display = txt;			txt.x = 650;			txt.y = 10;			addChild(txt);						txt = new TextField();			txt.defaultTextFormat = fmt;			txt.x = 10;			txt.y = 30;			txt.width = 600;			txt.height = 100;			txt.mouseEnabled = false;			addChild(txt);						stage.addEventListener(Event.ENTER_FRAME, handleEnterFrame);		}				public static function handleEnterFrame(e:Event):void {			if(Input.kp('RIGHT')) {				++current;				test.destroy();				test = null;			}			else if(Input.kp('LEFT')) {				--current;				test.destroy();				test = null;			}			else if(Input.kp('R')) {				test.destroy();				test = null;			}			if(!test) {				current = (current + tests.length) % tests.length;				test = new tests[current]();				debug.graphics.clear();				debug.world = test;				debug.scale = test.scale;			}			test.EnterFrame();			debug.Draw();		}	}}