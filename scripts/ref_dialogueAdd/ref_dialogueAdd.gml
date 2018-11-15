/// @function dialogueAdd
/// @description dialogueAdd
/// @param {real} instance
/// @param {real} string
/// @param {real} speed

if (argument_count != 3)  return lua_show_error("DialogueAdd: Expected 3 arguments, got " + string(argument_count));

return dialogueAdd(argument0, argument1, argument2)