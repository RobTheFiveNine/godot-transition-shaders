shader_type canvas_item;

uniform float progress : hint_range(0, 1);
uniform bool fill = true;

void fragment() {
	if (UV.x > progress) {
		if (fill) {
			discard;
		}
	} else if (!fill) {
		discard;
	}
}
