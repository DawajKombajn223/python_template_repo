import argparse
import sys
from motivator.storage import add_message, get_random_message, load_messages

DEFAULT_FILE = "messages.json"


def main(argv=None):
    parser = argparse.ArgumentParser(prog="motivator", description="Wyświetlacz motywacyjnych wiadomości")
    parser.add_argument("--file", "-f", default=DEFAULT_FILE, help="Ścieżka do pliku z wiadomościami (JSON)")

    sub = parser.add_subparsers(dest="command")

    sub.add_parser("random", help="Pokaż losową wiadomość (domyślnie)")
    sub.add_parser("list", help="Wypisz wszystkie wiadomości")

    add = sub.add_parser("add", help="Dodaj nową wiadomość")
    add.add_argument("-m", "--message", help="Treść wiadomości. Bez podania, program zapyta interaktywnie.")

    args = parser.parse_args(argv)

    if args.command is None:
        args.command = "random"

    if args.command == "random":
        print(get_random_message(args.file))
        return 0

    if args.command == "list":
        msgs = load_messages(args.file)
        for i, m in enumerate(msgs, 1):
            print(f"{i}. {m}")
        return 0

    if args.command == "add":
        if args.message:
            msg = args.message
        else:
            try:
                msg = input("Wpisz wiadomość do dodania: ")
            except EOFError:
                print("Brak wiadomości. Anulowano.")
                return 1
        if not msg.strip():
            print("Pusta wiadomość. Nic nie dodano.")
            return 1
        add_message(args.file, msg.strip())
        print("Dodano wiadomość.")
        return 0


if __name__ == "__main__":
    raise SystemExit(main())
