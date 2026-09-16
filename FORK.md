# pdf-cover-calibre (terje1965 fork)

Fork av [CaptainLexington/pdf-cover-calibre](https://github.com/CaptainLexington/pdf-cover-calibre) — en Calibre-plugin som setter Calibre-coveret inn som side 1 i selve PDF-filen.

## Hvorfor denne forkene finnes

Upstreams eneste release (**0.1.0**) mangler krasj-fiksen fra [PR #1](https://github.com/CaptainLexington/pdf-cover-calibre/pull/1) (unntak på PDF-er uten metadata), og det er ikke kommet en ny release — [issue #3](https://github.com/CaptainLexington/pdf-cover-calibre/issues/3) påpeker det samme. Denne forkens `main` inkluderer fiksen.

## Bygge installbar zip

```bash
./build.sh              # → dist/pdf_cover_<versjon>.zip
./build.sh --install    # bygg og installer direkte i Calibre
```

Installer i Calibre: Preferences → Plugins → «Load plugin from file», eller:
```bash
/Applications/calibre.app/Contents/MacOS/calibre-customize -a dist/pdf_cover_<versjon>.zip
```

## Bruk

Merk én eller flere bøker i Calibre → høyreklikk → **Insert PDF Cover**. Coveret fra Calibre-metadata settes inn som ny side 1. Kjøres det på nytt, byttes side 1 ut (vannmerket `/HasPDFCustomCover` i PDF-metadata hindrer stablede covers).

## Synk med upstream

```bash
git fetch upstream && git merge upstream/main && git push origin main
```
