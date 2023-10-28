#ifndef GD_METAGAME_GDEXAMPLE_H
#define GD_METAGAME_GDEXAMPLE_H

#include <godot_cpp/classes/sprite2d.hpp>
namespace godot {
    class GDExample: public Sprite2D {
        GDCLASS(GDExample, Sprite2D)

    private:
        float time_passed;
    };
}

#endif //GD_METAGAME_GDEXAMPLE_H
