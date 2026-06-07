import json
import tempfile
import os
from motivator import storage


def test_add_and_load():
    with tempfile.NamedTemporaryFile(delete=False, suffix=".json") as tf:
        name = tf.name
    try:
        # start with empty list
        with open(name, "w", encoding="utf-8") as f:
            json.dump([], f)
        storage.add_message(name, "Testowa wiadomość")
        msgs = storage.load_messages(name)
        assert "Testowa wiadomość" in msgs
    finally:
        try:
            os.remove(name)
        except OSError:
            pass


def test_get_random_single():
    with tempfile.NamedTemporaryFile(delete=False, suffix=".json") as tf:
        name = tf.name
    try:
        with open(name, "w", encoding="utf-8") as f:
            json.dump(["Tylko jedna"], f)
        msg = storage.get_random_message(name)
        assert msg == "Tylko jedna"
    finally:
        try:
            os.remove(name)
        except OSError:
            pass
