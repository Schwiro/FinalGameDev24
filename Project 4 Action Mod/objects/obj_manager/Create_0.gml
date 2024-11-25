/// @description Insert description here
// You can write your code in this editor
//function RandomSpawn(maxSpawnNum, gameObj, layerString) {
//	for (var i = 0; i < maxSpawnNum; i ++) {
//		var xMin, xMax, yMin, yMax 
//		xMin = 0 + 45;
//		yMin = 0 + 32;
//		xMax = 0 + room_width - 45;
//		yMax = 0 + room_height - 32;
		
		
//		for (var j = 0; j < 15; j++) {
//	 		var xPos = random_range(xMin, xMax)
//			var yPos = random_range(yMin, yMax)
			
//			var collide = collision_rectangle(xPos - 48, yPos - 48, xPos + 48, yPos + 48, obj_asteroid, false, false)
//			var starcollide = place_meeting(x,y,obj_star)
			
//			if(!collide) and !starcollide {
//				instance_create_layer(xPos, yPos, layerString, gameObj)
//				j = 15
//			}
//		}
//	}
//}




function RandomSpawn(maxSpawnNum, gameObj, layerString) {
	for (var i = 0; i < maxSpawnNum; i ++) {
		var orMin, orMax, angleMin, angleMax
		orMin = 100
		orMax = 400
		angleMin = 0
		angleMax = 360
		
		var star_x = obj_star.x;
		var star_y = obj_star.y;
		
		for (var j = 0; j < 15; j++) {
	 		var orPos = random_range(orMin, orMax)
			var aPos = random_range(angleMin, angleMax)
			
			var collide = collision_rectangle(orPos - 60, aPos - 60, orPos + 60, aPos + 60, obj_asteroid, false, false)
			var starcollide = place_meeting(x,y,obj_star)
			
			if(!collide) and !starcollide {
				instance_create_layer(star_x + orPos * cos(aPos), star_y + orPos * sin(aPos), layerString, gameObj)
				j = 15
			}
		}
	}
}