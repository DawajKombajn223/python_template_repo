import json
import tempfile
import os
from motivator import storage


def test_add_and_load():
    tf = tempfile.NamedTemporaryFile(delete=False, suffix='.json')
    tf.close()
    try:
        # start with empty list
        with open(tf.name, 'w', encoding='utf-8') as f:
            json.dump([], f)
        storage.add_message(tf.name, "Testowa wiadomość")
        msgs = storage.load_messages(tf.name)
        assert "Testowa wiadomość" in msgs
    finally:
        try:
            os.remove(tf.name)
        except OSError:
            pass


def test_get_random_single():
    tf = tempfile.NamedTemporaryFile(delete=False, suffix='.json')
    tf.close()
    try:
        with open(tf.name, 'w', encoding='utf-8') as f:
            json.dump(["Tylko jedna"], f)
        msg = storage.get_random_message(tf.name)
        assert msg == "Tylko jedna"
    finally:
        try:
            os.remove(tf.name)
        except OSError:
            pass
