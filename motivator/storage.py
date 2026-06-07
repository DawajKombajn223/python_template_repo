import json
import os
import random
from typing import List

DEFAULT_MESSAGES = [
    "Zrób dziś mały krok – jutro będzie łatwiej!",
    "Nie czekaj na idealny moment. Zacznij teraz.",
    "Każde działanie przybliża Cię do celu.",
    "Błąd to informacja, nie wyrok. Ucz się i idź dalej.",
    "Małe zwycięstwa codziennie tworzą wielki sukces.",
    "Zaufaj sobie — masz więcej siły niż myślisz.",
    "Planuj, wykonuj, poprawiaj. Powtarzaj.",
]


def _ensure_file(path: str) -> None:
    """Ensure the messages file exists; if not, create with defaults."""
    dirpath = os.path.dirname(path)
    if dirpath and not os.path.exists(dirpath):
        os.makedirs(dirpath, exist_ok=True)
    if not os.path.exists(path):
        save_messages(path, DEFAULT_MESSAGES)


def load_messages(path: str) -> List[str]:
    """Load messages from a JSON file and return a list of strings."""
    try:
        _ensure_file(path)
        with open(path, "r", encoding="utf-8") as f:
            data = json.load(f)
        if isinstance(data, list):
            return [str(x) for x in data]
        # If data is corrupted or wrong type, reset to defaults
        save_messages(path, DEFAULT_MESSAGES)
        return list(DEFAULT_MESSAGES)
    except (json.JSONDecodeError, IOError):
        # Backup corrupted file and reset
        try:
            os.rename(path, path + ".bak")
        except Exception:
            pass
        save_messages(path, DEFAULT_MESSAGES)
        return list(DEFAULT_MESSAGES)


def save_messages(path: str, messages: List[str]) -> None:
    """Save the list of messages to path as JSON."""
    dirpath = os.path.dirname(path)
    if dirpath and not os.path.exists(dirpath):
        os.makedirs(dirpath, exist_ok=True)
    with open(path, "w", encoding="utf-8") as f:
        json.dump(messages, f, indent=2, ensure_ascii=False)


def add_message(path: str, message: str) -> None:
    """Append a new message to the store."""
    messages = load_messages(path)
    messages.append(message)
    save_messages(path, messages)


def get_random_message(path: str) -> str:
    """Return a random message from the store."""
    messages = load_messages(path)
    if not messages:
        return "Nie ma żadnych wiadomości. Dodaj kilka!"
    return random.choice(messages)
