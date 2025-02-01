# Dolos Docker

A simple Docker container to run the [Dolos code similarity tool](https://github.com/dodona-edu/dolos).

Dolos already has an [official Docker image](https://github.com/dodona-edu/dolos/tree/main/docker).
For interactive use, we recommend that image.
This image is for non-interactive use (e.g., as part of a larger system).

## Running

When running the container, all options are passed to the Dolos CLI.
The `run` subcommand will always be used and the `--output-destination` will be set to `out`,
all other options are blindly passed along.

For example, you can get the help prompt with:
```sh
docker run --rm -it ghcr.io/edulinq/dolos-docker --help
```

You should mount your files in the `/dolos` directory.
A full invocation using source files `test1.py` and `test2.py` may look something like:
```sh
docker run --rm -it -v "$PWD:/dolos" ghcr.io/edulinq/dolos-docker --output-format csv --language python test1.py test2.py
```

See the [entrypoint.sh](./scripts/entrypoint.sh) script for exact details on how Dolos is invoked.

## Licensing

This repository is provided under the MIT licence (include in [LICENSE](./LICENSE).
Dolos is also covered by the [MIT License](https://github.com/dodona-edu/dolos/blob/main/LICENSE).
