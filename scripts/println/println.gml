gml_pragma("forceinline")
with terminal {
    for(var i = line_count; i >= 2; i--) {
        line[i] = line[i - 1];
    }
    line[1] = argument0;
}