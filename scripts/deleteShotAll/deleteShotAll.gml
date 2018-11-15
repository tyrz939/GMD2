/// @function deleteShotAll
/// @description deleteShotAll
/// @param {real} DeleteType

// TODO delete type

var deleteType = argument0

//with obj_bulletParent {instance_destroy()}
with obj_delayLaser {instance_destroy()}

var d = deleteShotRectangle(-128, -128, global.playAreaWidth + 128, global.playAreaHeight + 128, 30, deleteType)
deleteShotSetResist(d, 100)

return d