Repozytorium na cele ćwiczeń na uniwersytecie WSB.

Opis programu
------------
To prosta aplikacja w Pythonie (biblioteka + skrypt CLI) do przechowywania i pobierania "motywujących" wiadomości. Główne możliwości:

- Przechowywanie listy wiadomości w pliku JSON.
- Dodawanie nowych wiadomości do zbioru.
- Pobieranie losowej wiadomości.

Struktura projektu
------------------

- `cli.py` — prosty interfejs linii poleceń (możesz go rozszerzyć).
- `motivator/` — moduł z logiką aplikacji.
	- `motivator/storage.py` — funkcje do odczytu/zapisu wiadomości.
- `tests/` — testy jednostkowe (pytest).
- `.github/workflows/ci.yml` — workflow GitHub Actions, uruchamia testy na push/PR.

Jak to działa
-------------

Plik z wiadomościami to zwykły plik JSON zawierający listę stringów. Jeśli plik nie istnieje lub jest uszkodzony, moduł tworzy/odtwarza go z zestawem wiadomości domyślnych.

Przykładowe funkcje publiczne w `motivator.storage`:

- `load_messages(path: str) -> List[str]` — wczytuje wiadomości z pliku.
- `save_messages(path: str, messages: List[str]) -> None` — zapisuje listę wiadomości.
- `add_message(path: str, message: str) -> None` — dopisuje wiadomość.
- `get_random_message(path: str) -> str` — zwraca losową wiadomość.

Instalacja i uruchomienie
-------------------------

Zalecane jest utworzenie wirtualnego środowiska. W PowerShell:

```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install -r requirements.txt
python -m pip install -r requirements-dev.txt
```

Uruchomienie testów:

```powershell
python -m pytest -q
```

Przykład użycia (skrypt/REPL):

```python
from motivator import storage
path = "messages.json"
storage.add_message(path, "Nowa inspirująca wiadomość")
print(storage.get_random_message(path))
```

CI / GitHub Actions
--------------------

W repozytorium znajduje się prosty workflow `.github/workflows/ci.yml`, który:

- uruchamia się przy push i pull_request na gałęziach `develop` i `main`,
- uruchamia testy na `ubuntu-latest` i `windows-latest` dla Pythona 3.11 i 3.10.

Możesz wymusić ręczne uruchomienie workflow z UI, albo dodać `workflow_dispatch` do pliku jeśli chcesz mieć przycisk "Run workflow".

Rozwój i wkład
-------------

Jeśli chcesz dodać funkcję lub poprawkę:

1. Utwórz gałąź feature/fix.
2. Dodaj testy dla nowej funkcjonalności.
3. Zrób pull request.

Licencja
--------

Brak wyraźnej licencji w repozytorium — jeśli chcesz udostępnić projekt publicznie, dodaj plik `LICENSE` z wybraną licencją.
