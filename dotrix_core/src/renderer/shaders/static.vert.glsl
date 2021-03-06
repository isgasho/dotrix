#version 450

layout(location = 0) in vec3 a_Position;
layout(location = 1) in vec3 a_Normal;
layout(location = 2) in vec2 a_TexCoord;
layout(location = 0) out vec3 v_Position;
layout(location = 1) out vec3 v_Normal;
layout(location = 2) out vec2 v_TexCoord;

layout(set = 0, binding = 0) uniform Renderer {
    mat4 u_ProjView;
};

layout(set = 0, binding = 1) uniform Model {
    mat4 u_Model;
};

void main() {
    v_TexCoord = a_TexCoord;
    v_Normal = normalize(mat3(u_Model) * a_Normal);
    v_Position = (u_Model * vec4(a_Position, 1.0)).xyz;
    gl_Position = u_ProjView * vec4(v_Position, 1.0);
}
