extends CanvasLayer

func setHealth(health : int):
    for child in $HBoxContainer.get_children():
        child.queue_free()
    for i in health:
        var text_rect = TextureRect.new()
        text_rect.texture = load("res://assets/godotLogo.png")
        text_rect.expand_mode = TextureRect.EXPAND_FIT_WIDTH_PROPORTIONAL
        $HBoxContainer.add_child(text_rect)