shader_type canvas_item;

uniform float progress : hint_range(0, 1);
uniform bool fill = true;

void fragment() {
	if (UV.y > progress) {
		if (fill) {
			discard;
		}
	} else if (!fill) {
		discard;
	}
}
